CREATE TABLE user(
   username	VARCHAR(20) PRIMARY KEY NOT NULL,
   password	VARCHAR(100) NOT NULL,
   name	VARCHAR(20)
);

INSERT INTO user(username, password, name) VALUES('test1', '?', 'test1');
INSERT INTO user(username, password, name) VALUES('test1', '?', 'test1');
INSERT INTO user(username, password, name) VALUES('test2', '?', 'test2');
INSERT INTO user(username, password, name) VALUES('test2', '?', 'test2');


CREATE TABLE restaurant(
   id	BIGINT PRIMARY KEY AUTO_INCREMENT,
   name	VARCHAR(50) NOT NULL,
   phone	VARCHAR(20),
   address	VARCHAR(255),
   time	VARCHAR(255),
   explanation	VARCHAR(255),
   imgurl	VARCHAR(255)
);

INSERT INTO restaurant(id, name, phone, address, time, explanation, imgurl) VALUES(1, '손가명가', '02-777-1013', '서울특별시 중구 다동길 13', '10:00 ~ 22:00', '손가명가 식당입니다.', 's.jpeg');
INSERT INTO restaurant(id, name, phone, address, time, explanation, imgurl) VALUES(2, '용금옥', '02-777-1689', '서울특별시 중구 다동길 24-2', '11:00 ~ 22:00', '용금옥 식당입니다.', 'y.jpeg');


CREATE TABLE menu(
   id	BIGINT PRIMARY KEY AUTO_INCREMENT,
   name	VARCHAR(20) NOT NULL,
   price	INTEGER,
   importance	INTEGER,
   explanation	VARCHAR(255),
   imgurl	VARCHAR(255),
   resId	BIGINT NOT NULL,
   FOREIGN KEY (resId) REFERENCES restaurant (id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO menu(id, name, price, importance, explanation, imgurl, resId) VALUES(1, '생오겹살', 15000, 1, '생오겹살 입니다.', NULL, 1);
INSERT INTO menu(id, name, price, importance, explanation, imgurl, resId) VALUES(2, '생 목살', 15000, 0, '생 목살 입니다.', NULL, 1);
INSERT INTO menu(id, name, price, importance, explanation, imgurl, resId) VALUES(3, '서울추탕', 12000, 1, '서울추탕 입니다.', NULL, 2);
INSERT INTO menu(id, name, price, importance, explanation, imgurl, resId) VALUES(4, '남도추탕', 12000, 0, '남도추탕 입니다.', NULL, 2);


CREATE TABLE scoreinfo(
   username	VARCHAR(20) NOT NULL,
   resId	BIGINT NOT NULL,
   score	INTEGER NOT NULL,
   PRIMARY KEY (username, resId),
   FOREIGN KEY (username) REFERENCES user (username) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (resId) REFERENCES restaurant (id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO scoreinfo(username, resId, score) VALUES('test1', 1, 5);
INSERT INTO scoreinfo(username, resId, score) VALUES('test1', 2, 4);
INSERT INTO scoreinfo(username, resId, score) VALUES('test2', 1, 3);
INSERT INTO scoreinfo(username, resId, score) VALUES('test2', 2, 2);


CREATE TABLE bucket(
   username	VARCHAR(20) NOT NULL,
   menuId	BIGINT NOT NULL,
   PRIMARY KEY (username, menuId),
   FOREIGN KEY (username) REFERENCES user (username) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (menuId) REFERENCES menu (id) ON UPDATE CASCADE ON DELETE CASCADE
);