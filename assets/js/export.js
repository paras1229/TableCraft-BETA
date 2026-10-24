/* =====================================================================
   TableCraft — Multi-format Export (PDF / DOC / PNG)
   Requires (loaded via CDN in table_view.php):
     - jsPDF + jspdf-autotable  -> PDF export
     - html2canvas              -> PNG export
   Export buttons live in the Export popup (#exportModal in table_view.php),
   together with the table design (color / font) controls.
   DOC export uses a browser-native "HTML to Word" blob (no library needed),
   which Microsoft Word / WPS / LibreOffice all open correctly.
   ===================================================================== */

function tcGetTableTitle() {
  const t = document.getElementById('tcTitleInput');
  return (t ? t.textContent.trim() : 'TableCraft-Export') || 'TableCraft-Export';
}

function tcSafeFileName(str) {
  return str.replace(/[^a-z0-9\-_ ]/gi, '').trim().replace(/\s+/g, '-') || 'tablecraft-table';
}

/* jsPDF only ships helvetica / times / courier, so the chosen font is mapped to the closest one */
function tcPdfFont(fontName) {
  if (fontName === 'Merriweather') return 'times';
  if (fontName === 'Courier Prime') return 'courier';
  return 'helvetica';
}

/* ---------------------------- PDF EXPORT -------------------------------- */
function exportTableToPDF() {
  const engine = window.TC_TableEngine;
  const state = engine.state;
  const rgb = engine.hexToRgb(state.accent_color);                       // table color
  const headText = engine.contrastText(state.accent_color) === '#FFFFFF' ? 255 : 26;
  const pdfFont = tcPdfFont(state.font_family);                          // title + data font
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF({ orientation: state.columns.length > 6 ? 'landscape' : 'portrait', unit: 'pt' });

  const head = [state.columns.map((c) => c.column_name)];
  const body = state.rows.map((row) =>
    state.columns.map((col) => {
      const cell = row.cells.find((c) => c.column_id === col.id);
      return cell ? cell.value : '';
    })
  );

  doc.setFont(pdfFont, 'bold');
  doc.setFontSize(16);
  doc.setTextColor(8, 14, 83);
  doc.text(tcGetTableTitle(), 40, 40);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(10);
  doc.setTextColor(90, 95, 138);
  doc.text('Generated with TableCraft', 40, 56);

  doc.autoTable({
    head, body,
    startY: 72,
    theme: 'grid',
    headStyles: { font: 'helvetica', fillColor: [rgb.r, rgb.g, rgb.b], textColor: headText, fontStyle: 'bold' },
    styles: { font: pdfFont, fontSize: 9, cellPadding: 6 },
    alternateRowStyles: { fillColor: [247, 247, 247] }
  });

  doc.save(tcSafeFileName(tcGetTableTitle()) + '.pdf');
  tcToast('PDF downloaded');
}

/* ---------------------------- PNG EXPORT -------------------------------- */
function exportTableToPNG() {
  const area = document.getElementById('tcTableExportArea');
  tcToast('Rendering image…');
  html2canvas(area, { backgroundColor: getComputedStyle(document.documentElement).getPropertyValue('--surface') || '#ffffff', scale: 2 })
    .then((canvas) => {
      const link = document.createElement('a');
      link.download = tcSafeFileName(tcGetTableTitle()) + '.png';
      link.href = canvas.toDataURL('image/png');
      link.click();
      tcToast('PNG downloaded');
    })
    .catch(() => tcToast('Could not generate image', 'error'));
}

/* ---------------------------- DOC EXPORT -------------------------------- */
function exportTableToDOC() {
  const engine = window.TC_TableEngine;
  const state = engine.state;
  const title = tcGetTableTitle();
  const color = state.accent_color;                                      // table color
  const headText = engine.contrastText(color);
  const fontCss = "font-family:'" + state.font_family + "', Calibri, Arial, sans-serif;"; // title + data font

  let rowsHtml = '<tr>' + state.columns.map((c) => '<th style="background:' + color + ';color:' + headText + ';padding:8px;border:1px solid #ccc;">' + c.column_name + '</th>').join('') + '</tr>';
  state.rows.forEach((row) => {
    rowsHtml += '<tr>' + state.columns.map((col) => {
      const cell = row.cells.find((c) => c.column_id === col.id);
      return '<td style="' + fontCss + 'padding:8px;border:1px solid #ccc;">' + (cell ? cell.value : '') + '</td>';
    }).join('') + '</tr>';
  });

  const html = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">' +
    '<head><meta charset="utf-8"><title>' + title + '</title></head>' +
    '<body style="font-family:Calibri, Arial, sans-serif;">' +
    '<h2 style="color:#080E53;' + fontCss + '">' + title + '</h2>' +
    '<table style="border-collapse:collapse;width:100%;">' + rowsHtml + '</table>' +
    '<p style="color:#5A5F8A;font-size:11px;margin-top:16px;">Generated with TableCraft</p>' +
    '</body></html>';

  const blob = new Blob(['\ufeff', html], { type: 'application/msword' });
  const link = document.createElement('a');
  link.href = URL.createObjectURL(blob);
  link.download = tcSafeFileName(title) + '.doc';
  link.click();
  tcToast('DOC downloaded');
}

/* ------------------- EXPORT POPUP (design + export) ---------------------- */
document.addEventListener('DOMContentLoaded', function () {
  const modalEl = document.getElementById('exportModal');
  if (!modalEl || !window.TC_TableEngine) return;

  const engine = window.TC_TableEngine;
  const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
  const swatches = Array.from(modalEl.querySelectorAll('.swatch'));
  const fonts = Array.from(modalEl.querySelectorAll('.font-thumb'));

  // The user's current (not yet applied) choice inside the popup
  let pending = { color: engine.state.accent_color, font: engine.state.font_family };

  function highlight() {
    swatches.forEach((s) => s.classList.toggle('active', s.dataset.color.toLowerCase() === String(pending.color).toLowerCase()));
    fonts.forEach((f) => f.classList.toggle('active', f.dataset.font === pending.font));
  }

  // Every time the popup opens, start from the design that is currently on the table
  modalEl.addEventListener('show.bs.modal', function () {
    pending = { color: engine.state.accent_color, font: engine.state.font_family };
    highlight();
  });

  swatches.forEach((s) => s.addEventListener('click', function () { pending.color = s.dataset.color; highlight(); }));
  fonts.forEach((f) => f.addEventListener('click', function () { pending.font = f.dataset.font; highlight(); }));

  // APPLY -> design goes to the table, popup closes
  document.getElementById('designApplyBtn').addEventListener('click', function () {
    engine.setDesign(pending.color, pending.font);
    modal.hide();
  });

  // CLEAR -> default design goes back to the table, popup closes
  document.getElementById('designClearBtn').addEventListener('click', function () {
    engine.setDesign(engine.DEFAULT_DESIGN.color, engine.DEFAULT_DESIGN.font);
    modal.hide();
  });

  // EXPORT buttons -> apply the selected design, close popup, then download the file
  function bindExport(id, exportFn) {
    const btn = document.getElementById(id);
    if (!btn) return;
    btn.addEventListener('click', function () {
      engine.setDesign(pending.color, pending.font);
      modalEl.addEventListener('hidden.bs.modal', exportFn, { once: true });
      modal.hide();
    });
  }
  bindExport('exportPdfBtn', exportTableToPDF);
  bindExport('exportDocBtn', exportTableToDOC);
  bindExport('exportPngBtn', exportTableToPNG);
});