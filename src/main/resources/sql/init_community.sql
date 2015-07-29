-- Make the admin user visible in User Administration
UPDATE `principal` SET `is_displayed`='1' WHERE `uid`='admin';

-- Delete plugin definitions as plugins are not part of the Community version
SET SQL_SAFE_UPDATES = 0;
TRUNCATE `plugin_definition`;
SET SQL_SAFE_UPDATES = 1;
