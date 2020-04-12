
alter table book add amount_borrow int

ALTER TABLE `book_management`.`book` 
CHANGE COLUMN `amount_borrow` `amount_borrow` INT(11) NULL DEFAULT 0 ;