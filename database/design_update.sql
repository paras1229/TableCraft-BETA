-- Run ONCE in phpMyAdmin (select your TableCraft database first -> SQL tab).
-- Makes the default table color navy (#080E53) so old and new tables start with the same default design.
ALTER TABLE data_tables ALTER COLUMN accent_color SET DEFAULT '#080E53';
UPDATE data_tables SET accent_color = '#080E53' WHERE accent_color = '#1F50FF';
