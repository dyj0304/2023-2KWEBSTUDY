CREATE TABLE `student` (
    `name` VARCHAR(20) NOT NULL,
    `year` INT NOT NULL,
    `major` INT NOT NULL,
    `id` INT NOT NULL,
    `department` INT NOT NULL,
    `phone_num` VARCHAR(11) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `credit` INT NOT NULL DEFAULT 0,
    `grade` DOUBLE NOT NULL DEFAULT 0.0,
    `status` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(`id`)
)