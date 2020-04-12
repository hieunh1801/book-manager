ALTER TABLE `book_management`.`user` 
ADD COLUMN `roles` VARCHAR(500) NULL AFTER `role_id`,
CHANGE COLUMN `email` `email` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL ;

ALTER TABLE `book_management`.`user` 
DROP COLUMN `role_id`;