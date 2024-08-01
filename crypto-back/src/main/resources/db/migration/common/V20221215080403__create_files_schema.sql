CREATE TABLE files (
  id bigint AUTO_INCREMENT NOT NULL,
  created_by_user_id bigint,
  last_modified_by_user_id bigint,
  created_at datetime,
  updated_at datetime,
  name varchar(255) NOT NULL,
  path varchar(255) NOT NULL,
  content_type varchar(255) NOT NULL,
  user_id bigint NOT NULL,
  CONSTRAINT pk_files PRIMARY KEY (id)
);

ALTER TABLE files ADD CONSTRAINT uc_files_name UNIQUE (name);
ALTER TABLE files ADD CONSTRAINT uc_files_path UNIQUE (path);
ALTER TABLE files ADD CONSTRAINT FK_FILES_ON_CREATED_BY_USER FOREIGN KEY (created_by_user_id) REFERENCES users (id);
ALTER TABLE files ADD CONSTRAINT FK_FILES_ON_LAST_MODIFIED_BY_USER FOREIGN KEY (last_modified_by_user_id) REFERENCES users (id);
ALTER TABLE files ADD CONSTRAINT FK_FILES_ON_USER FOREIGN KEY (user_id) REFERENCES users (id);
