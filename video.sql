
drop table IF EXISTS v_user;
CREATE TABLE `v_user` (
`id` int NOT NULL AUTO_INCREMENT,
`nickname` varchar(200) NOT NULL,
`avatar` varchar(200) NOT NULL,
`mobile` varchar(200) NOT NULL,
`username` varchar(200) NOT NULL,
`password` varchar(200) NOT NULL,
`last_login` datetime(6) NOT NULL,
`is_superuser` int DEFAULT NULL,
`gender` int DEFAULT NULL,
`subscribe` int DEFAULT NULL,
`first_name` varchar(200) NOT NULL,
`last_name` varchar(200) NOT NULL,
`email` varchar(200) NOT NULL,
`is_staff` int DEFAULT NULL,
`is_active` int DEFAULT NULL,
`date_joined` datetime(6) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


alter table v_user modify column `last_login` datetime(6) ;
alter table v_user modify column `nickname` varchar(200) ;
alter table v_user modify column `mobile` varchar(200) ;

show create table v_user;

drop table IF EXISTS v_classification;
CREATE TABLE `v_classification` (
`id` int NOT NULL AUTO_INCREMENT,
`title` varchar(200) NOT NULL,
`status` int DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


drop table IF EXISTS v_video;
CREATE TABLE `v_video` (
`id` int NOT NULL AUTO_INCREMENT,
`title` varchar(200) NOT NULL,
`desc` varchar(200) NOT NULL,
`classification` varchar(200) NOT NULL,
`classification_id` varchar(200) DEFAULT NULL,
`file` varchar(200) NOT NULL,
`cover` varchar(200) NOT NULL,
`status` int DEFAULT NULL,
`view_count` int DEFAULT NULL,
`liked` int DEFAULT NULL,
`collected` int DEFAULT NULL,
`create_time` datetime(6) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

  INSERT INTO v_video(title, `desc`, classification, file, cover) VALUES ("1", "1", "1", "1", "1");


drop table IF EXISTS myadmin_mychunkedupload;
 CREATE TABLE `myadmin_mychunkedupload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `upload_id` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `offset` varchar(200) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `completed_on` datetime(6) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
  INSERT INTO myadmin_mychunkedupload(upload_id, `user_id`, file, filename) VALUES ("1", "admin123", "/upload/chunked_uploads/2023/06/13/", "5c931a6b4f9c47928b5cf96800ae5536.mp4");

CREATE USER 'goldenli'@'%' IDENTIFIED BY 'goldenli';
GRANT ALL PRIVILEGES ON *.* TO 'goldenli'@'%' IDENTIFIED BY 'goldenli' WITH GRANT OPTION;

drop table IF EXISTS v_feedback;
CREATE TABLE `v_feedback` (
`id` int NOT NULL AUTO_INCREMENT,
`contact` varchar(200) NOT NULL,
`content` varchar(200) NOT NULL,
`timestamp` varchar(200) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

drop table IF EXISTS v_comment;
CREATE TABLE `v_comment` (
`id` int NOT NULL AUTO_INCREMENT,
`user` varchar(200) NOT NULL,
`nickname` varchar(200) NOT NULL,
`avatar` varchar(200) NOT NULL,
`video` varchar(200) NOT NULL,
`content` varchar(200) NOT NULL,
`timestamp` varchar(200) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

drop table IF EXISTS django_admin_log;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_v_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_v_user_id` FOREIGN KEY (`user_id`) REFERENCES `v_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
