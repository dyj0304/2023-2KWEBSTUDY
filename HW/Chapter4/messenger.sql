CREATE TABLE users (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(15) NOT NULL, 
    `password` VARCHAR(15) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `profile_link` VARCHAR(50) NOT NULL,
    `profile_message` VARCHAR(100) NOT NULL,
    `unregister` TINYINT(1) NOT NULL DEFAULT 0,
    `sub_date` DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `create_user` INT NOT NULL,
    `link` VARCHAR(50) NOT NULL,
    `maximum_user` INT NOT NULL,
    `unregister` TINYINT(1) NOT NULL DEFAULT 0,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (create_user) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
    `id` INT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(200) NOT NULL,
    `writer` INT NOT NULL, 
    `channel` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (writer) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (channel) REFERENCES channels(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker` INT NOT NULL,
    `blocked` INT NOT NULL,
    `blocked_date` DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (blocker) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follwers` INT NOT NULL,
    `follwees` INT NOT NULL,
    `following_date` DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (follwers) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (follwees) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

