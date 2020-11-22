/* Exceptions */
CREATE OR ALTER EXCEPTION EXCEPT_CANT_DELETE 'Can''t delete record.';

/* Domains */
CREATE DOMAIN CAPTION AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN CATEGORY_NAME AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN CONTENT_BODY AS
  BLOB SUB_TYPE TEXT
  CHARACTER SET UTF8;
CREATE DOMAIN COUNTER AS
  BIGINT
  NOT NULL;
CREATE DOMAIN CSSCLASS AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN DESCR AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN DISPLAY_NAME AS
  VARCHAR(80)
  CHARACTER SET UTF8;
CREATE DOMAIN EMAIL_ADDR AS
  VARCHAR(256)
  CHARACTER SET UTF8;
CREATE DOMAIN FILENAME AS
  VARCHAR(256)
  CHARACTER SET UTF8;
CREATE DOMAIN FILESIZE AS
  BIGINT;
CREATE DOMAIN FNAME AS
  VARCHAR(30)
  CHARACTER SET UTF8;
CREATE DOMAIN GRP_NAME AS
  VARCHAR(60)
  CHARACTER SET UTF8;
CREATE DOMAIN IMAGE AS
  BLOB SUB_TYPE BINARY;
CREATE DOMAIN KEY_NAME AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN KEY_VALUE AS
  BLOB SUB_TYPE BINARY SEGMENT SIZE 10;
CREATE DOMAIN LNAME AS
  VARCHAR(40)
  CHARACTER SET UTF8;
CREATE DOMAIN MEDIA AS
  BLOB SUB_TYPE BINARY;
CREATE DOMAIN MEMO AS
  BLOB SUB_TYPE TEXT
  CHARACTER SET UTF8;
CREATE DOMAIN MIMETYPE AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN "PASSWORD" AS
  BLOB SUB_TYPE BINARY SEGMENT SIZE 20;
CREATE DOMAIN PERMISSION AS
  VARCHAR(80)
  CHARACTER SET UTF8;
CREATE DOMAIN SECTION_NAME AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN SEO_DESCR AS
  VARCHAR(1024)
  CHARACTER SET UTF8;
CREATE DOMAIN SEO_KEYWORDS AS
  VARCHAR(1024)
  CHARACTER SET UTF8;
CREATE DOMAIN SEO_TITLE AS
  VARCHAR(256)
  CHARACTER SET UTF8;
CREATE DOMAIN SLUG AS
  VARCHAR(128)
  CHARACTER SET UTF8;
CREATE DOMAIN SORTORDER AS
  SMALLINT
  NOT NULL;
CREATE DOMAIN TOOLTIP AS
  VARCHAR(256)
  CHARACTER SET UTF8;
CREATE DOMAIN URL AS
  VARCHAR(1024)
  CHARACTER SET UTF8;
CREATE DOMAIN USER_NAME AS
  VARCHAR(40)
  CHARACTER SET UTF8;
CREATE DOMAIN UUID AS
  CHAR(16)
  CHARACTER SET OCTETS;
CREATE DOMAIN UUIDSTR AS
  CHAR(36);

/* Tables */
CREATE TABLE APPLICATIONS (
  ID          UUID NOT NULL,
  APP_NAME    DESCR NOT NULL,
  APP_SECRET  UUID NOT NULL,
  "ACTIVE"    BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT    TIMESTAMP NOT NULL,
  LASTMODDT   TIMESTAMP NOT NULL
) ;

CREATE TABLE BLOG_CATEGORIES (
  ID         UUID NOT NULL,
  PARENT_ID  UUID,
  SLUG       SLUG NOT NULL,
  NAME       CATEGORY_NAME NOT NULL,
  CREATEDT   TIMESTAMP NOT NULL,
  LASTMODDT  TIMESTAMP NOT NULL
) ;

CREATE TABLE BLOG_POSTS (
  ID           UUID NOT NULL,
  SLUG         SLUG NOT NULL,
  TITLE        SEO_TITLE NOT NULL,
  DESCRIPTION  SEO_DESCR,
  KEYWORDS     SEO_KEYWORDS,
  CONTENT      CONTENT_BODY,
  "ACTIVE"     BOOLEAN DEFAULT TRUE NOT NULL,
  AUTHOR_ID    UUID NOT NULL,
  POST_TS      TIMESTAMP NOT NULL,
  CREATEDT     TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP NOT NULL
) ;

CREATE TABLE BLOG_POST_CAT_MAP (
  ID         UUID NOT NULL,
  POST_ID    UUID NOT NULL,
  CAT_ID     UUID NOT NULL,
  CREATEDT   TIMESTAMP NOT NULL,
  LASTMODDT  TIMESTAMP NOT NULL
) ;

CREATE TABLE CONFIG_OPTIONS (
  ID           UUID NOT NULL,
  SECTIONNAME  SECTION_NAME NOT NULL,
  KEYNAME      KEY_NAME NOT NULL,
  KEYVALUE     KEY_VALUE,
  CREATEDT     TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP NOT NULL
) ;

CREATE TABLE GROUPS (
  ID           UUID NOT NULL,
  GROUP_NAME   GRP_NAME NOT NULL,
  DESCRIPTION  DESCR,
  "ACTIVE"     BOOLEAN DEFAULT TRUE NOT NULL,
  SUPER_GROUP  BOOLEAN DEFAULT FALSE NOT NULL,
  CAN_DELETE   BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT     TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP NOT NULL
) ;

CREATE TABLE GROUP_PERMISSIONS (
  ID          UUID NOT NULL,
  GROUP_NAME  GRP_NAME NOT NULL,
  PERMISSION  PERMISSION NOT NULL,
  CAN_DELETE  BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT    TIMESTAMP NOT NULL,
  LASTMODDT   TIMESTAMP NOT NULL
) ;

CREATE TABLE GROUP_USERS (
  ID          UUID NOT NULL,
  GROUP_NAME  GRP_NAME NOT NULL,
  USER_NAME   USER_NAME NOT NULL,
  CAN_DELETE  BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT    TIMESTAMP NOT NULL,
  LASTMODDT   TIMESTAMP NOT NULL
) ;

CREATE TABLE MEDIA_DATA (
  ID           UUID NOT NULL,
  SLUG         SLUG NOT NULL,
  FILENAME     FILENAME NOT NULL,
  MIMETYPE_ID  UUID NOT NULL,
  CONTENT      MEDIA NOT NULL,
  FILESIZE     FILESIZE NOT NULL,
  FILE_TS      TIMESTAMP NOT NULL,
  CREATEDT     TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP NOT NULL
) ;

CREATE TABLE MENUS (
  ID           UUID NOT NULL,
  DESCRIPTION  DESCR NOT NULL,
  SLUG         SLUG NOT NULL,
  "ACTIVE"     BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;

CREATE TABLE MENU_ITEMS (
  ID             UUID NOT NULL,
  MENU_ID        UUID NOT NULL,
  PARENT_ID      UUID,
  SORTORDER      SORTORDER DEFAULT 0 NOT NULL,
  CAPTION        CAPTION NOT NULL,
  TOOLTIP        TOOLTIP,
  NAVIGATE_URL   URL,
  CSSCLASS       CSSCLASS,
  ICON_CSSCLASS  CSSCLASS,
  VISIBLE        BOOLEAN DEFAULT TRUE NOT NULL,
  BEGIN_GROUP    BOOLEAN DEFAULT FALSE NOT NULL,
  CREATEDT       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LASTMODDT      TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;

CREATE TABLE MIMETYPES (
  ID         UUID NOT NULL,
  MIMETYPE   MIMETYPE NOT NULL,
  CREATEDT   TIMESTAMP NOT NULL,
  LASTMODDT  TIMESTAMP NOT NULL
) ;

CREATE TABLE "PAGES" (
  ID              UUID NOT NULL,
  PARENT_ID       UUID,
  SLUG            SLUG NOT NULL,
  TITLE           SEO_TITLE NOT NULL,
  DESCRIPTION     SEO_DESCR,
  KEYWORDS        SEO_KEYWORDS,
  SORTORDER       SORTORDER DEFAULT 0 NOT NULL,
  CONTENT         CONTENT_BODY,
  "ACTIVE"        BOOLEAN DEFAULT TRUE NOT NULL,
  FEATURE_IMG_ID  UUID,
  CREATEDT        TIMESTAMP NOT NULL,
  LASTMODDT       TIMESTAMP NOT NULL
) ;

CREATE TABLE PERMISSIONS (
  ID           UUID NOT NULL,
  PERMISSION   PERMISSION NOT NULL,
  DESCRIPTION  DESCR,
  CAN_DELETE   BOOLEAN DEFAULT TRUE NOT NULL,
  ITEMS        MEMO,
  "ACTION"     INTEGER,
  FORMNAME     DESCR,
  CREATEDT     TIMESTAMP NOT NULL,
  LASTMODDT    TIMESTAMP NOT NULL
) ;

CREATE TABLE USERS (
  ID               UUID NOT NULL,
  USER_NAME        USER_NAME NOT NULL,
  "PASSWORD"       "PASSWORD" NOT NULL,
  FNAME            FNAME,
  LNAME            LNAME,
  DISPLAY_NAME     DISPLAY_NAME,
  ACCESS_COUNT     COUNTER DEFAULT 0 NOT NULL,
  LASTACCESS_DATE  DATE,
  LASTACCESS_TIME  TIME,
  CREATED_DATE     DATE,
  CREATED_TIME     TIME,
  "ACTIVE"         BOOLEAN DEFAULT TRUE NOT NULL,
  SUPER_USER       BOOLEAN DEFAULT FALSE NOT NULL,
  CAN_DELETE       BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT         TIMESTAMP NOT NULL,
  LASTMODDT        TIMESTAMP NOT NULL
) ;

CREATE TABLE USER_PERMISSIONS (
  ID          UUID NOT NULL,
  USER_NAME   USER_NAME NOT NULL,
  PERMISSION  PERMISSION NOT NULL,
  CAN_DELETE  BOOLEAN DEFAULT TRUE NOT NULL,
  CREATEDT    TIMESTAMP NOT NULL,
  LASTMODDT   TIMESTAMP NOT NULL
) ;
COMMIT;

/* Indexes */
CREATE UNIQUE INDEX UQ_APPS_APP_NAME
  ON APPLICATIONS
  (APP_NAME);
CREATE INDEX IDX_BLOG_CATS_NAME
  ON BLOG_CATEGORIES
  (NAME);
CREATE UNIQUE INDEX UQ_BLOG_CATS_SLUG
  ON BLOG_CATEGORIES
  (SLUG);
CREATE UNIQUE INDEX UQ_BLOG_POSTS_SLUG
  ON BLOG_POSTS
  (SLUG);
CREATE UNIQUE INDEX UQ_BLOG_POST_CAT_MAP
  ON BLOG_POST_CAT_MAP
  (POST_ID, CAT_ID);
CREATE UNIQUE INDEX UQ_GROUPS_GRPNAME
  ON GROUPS
  (GROUP_NAME);
CREATE UNIQUE INDEX UQ_GROUP_PERMS
  ON GROUP_PERMISSIONS
  (GROUP_NAME, PERMISSION);
CREATE UNIQUE INDEX UQ_GRPUSERS
  ON GROUP_USERS
  (GROUP_NAME, USER_NAME);
CREATE UNIQUE INDEX UQ_MEDIA_SLUG
  ON MEDIA_DATA
  (SLUG);
CREATE UNIQUE INDEX UQ_MENUS_DESCR
  ON MENUS
  (DESCRIPTION);
CREATE UNIQUE INDEX UQ_MENUS_SLUG
  ON MENUS
  (SLUG);
CREATE INDEX IDX_MENU_ITEMS_SO_CAP
  ON MENU_ITEMS
  (SORTORDER, CAPTION);
CREATE UNIQUE INDEX UQ_MIMETYPES_MIMETYPE
  ON MIMETYPES
  (MIMETYPE);
CREATE UNIQUE INDEX UQ_PAGES_SLUG
  ON "PAGES"
  (SLUG);
CREATE UNIQUE INDEX UQ_PERMISSIONS_PERMISSION
  ON PERMISSIONS
  (PERMISSION);
CREATE UNIQUE INDEX UQ_USERS_USERNAME
  ON USERS
  (USER_NAME);
CREATE UNIQUE INDEX UQ_USER_PERMS
  ON USER_PERMISSIONS
  (USER_NAME, PERMISSION);

/* Constraints */
ALTER TABLE APPLICATIONS
  ADD PRIMARY KEY (ID);

ALTER TABLE BLOG_CATEGORIES
  ADD PRIMARY KEY (ID);

ALTER TABLE BLOG_POSTS
  ADD PRIMARY KEY (ID);

ALTER TABLE BLOG_POST_CAT_MAP
  ADD PRIMARY KEY (ID);

ALTER TABLE CONFIG_OPTIONS
  ADD PRIMARY KEY (ID);

ALTER TABLE GROUPS
  ADD PRIMARY KEY (ID);

ALTER TABLE GROUPS
  ADD CONSTRAINT UQ_GROUPS_NAME
  UNIQUE (GROUP_NAME);

ALTER TABLE GROUP_PERMISSIONS
  ADD PRIMARY KEY (ID);

ALTER TABLE GROUP_USERS
  ADD PRIMARY KEY (ID);

ALTER TABLE MEDIA_DATA
  ADD PRIMARY KEY (ID);

ALTER TABLE MENUS
  ADD PRIMARY KEY (ID);

ALTER TABLE MENU_ITEMS
  ADD PRIMARY KEY (ID);

ALTER TABLE MIMETYPES
  ADD PRIMARY KEY (ID);

ALTER TABLE "PAGES"
  ADD PRIMARY KEY (ID);

ALTER TABLE PERMISSIONS
  ADD PRIMARY KEY (ID);

ALTER TABLE PERMISSIONS
  ADD CONSTRAINT UQ_PERMISSIONS_PERM
  UNIQUE (PERMISSION);

ALTER TABLE USERS
  ADD PRIMARY KEY (ID);

ALTER TABLE USERS
  ADD CONSTRAINT UQ_USERS_USER_NAME
  UNIQUE (USER_NAME);

ALTER TABLE USER_PERMISSIONS
  ADD PRIMARY KEY (ID);

COMMIT;
/* Foreign Keys */
ALTER TABLE BLOG_CATEGORIES
  ADD CONSTRAINT FK_BLOG_CATS_PARENTID
  FOREIGN KEY (PARENT_ID)
    REFERENCES BLOG_CATEGORIES(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE BLOG_POSTS
  ADD CONSTRAINT FK_BLOG_POSTS_AUTHORID
  FOREIGN KEY (AUTHOR_ID)
    REFERENCES USERS(ID)
    ON UPDATE CASCADE;

ALTER TABLE BLOG_POST_CAT_MAP
  ADD CONSTRAINT FK_BLOG_POSTCATMAP_CATID
  FOREIGN KEY (CAT_ID)
    REFERENCES BLOG_CATEGORIES(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE BLOG_POST_CAT_MAP
  ADD CONSTRAINT FK_BLOG_POSTCATMAP_POSTID
  FOREIGN KEY (POST_ID)
    REFERENCES BLOG_POSTS(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE GROUP_PERMISSIONS
  ADD CONSTRAINT FK_GROUPPERMS_GROUP
  FOREIGN KEY (GROUP_NAME)
    REFERENCES GROUPS(GROUP_NAME)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE GROUP_PERMISSIONS
  ADD CONSTRAINT FK_GROUPPERMS_PERM
  FOREIGN KEY (PERMISSION)
    REFERENCES PERMISSIONS(PERMISSION)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE GROUP_USERS
  ADD CONSTRAINT FK_GRPUSERS_GRP
  FOREIGN KEY (GROUP_NAME)
    REFERENCES GROUPS(GROUP_NAME)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE GROUP_USERS
  ADD CONSTRAINT FK_GRPUSERS_USER
  FOREIGN KEY (USER_NAME)
    REFERENCES USERS(USER_NAME)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE MEDIA_DATA
  ADD CONSTRAINT FK_MEDIA_MIMETYPEID
  FOREIGN KEY (MIMETYPE_ID)
    REFERENCES MIMETYPES(ID)
    ON UPDATE CASCADE;

ALTER TABLE MENU_ITEMS
  ADD CONSTRAINT FK_MENU_ITEMS_MENUID
  FOREIGN KEY (MENU_ID)
    REFERENCES MENUS(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE MENU_ITEMS
  ADD CONSTRAINT FK_MENU_ITEMS_PARENTID
  FOREIGN KEY (PARENT_ID)
    REFERENCES MENU_ITEMS(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE "PAGES"
  ADD CONSTRAINT FK_PAGES_FEATUREIMGID
  FOREIGN KEY (FEATURE_IMG_ID)
    REFERENCES MEDIA_DATA(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE "PAGES"
  ADD CONSTRAINT FK_PAGES_PARENTID
  FOREIGN KEY (PARENT_ID)
    REFERENCES "PAGES"(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE USER_PERMISSIONS
  ADD CONSTRAINT FK_USERPERMS_PERM
  FOREIGN KEY (PERMISSION)
    REFERENCES PERMISSIONS(PERMISSION)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    USING INDEX USER_PERMISSIONS_FOREIGN_KEY01;

ALTER TABLE USER_PERMISSIONS
  ADD CONSTRAINT FK_USERPERMS_USER_NAME
  FOREIGN KEY (USER_NAME)
    REFERENCES USERS(USER_NAME)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

/* Triggers */
SET TERM ^ ;
CREATE TRIGGER BIU_APPLICATIONS FOR APPLICATIONS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_BLOG_CATS FOR BLOG_CATEGORIES
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_BLOG_POSTS FOR BLOG_POSTS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_BLOG_POST_CAT_MAP FOR BLOG_POST_CAT_MAP
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_CONFIG_OPTIONS FOR CONFIG_OPTIONS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_GROUPS FOR GROUPS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove group.'; 
END^

CREATE TRIGGER BIU_GROUPS FOR GROUPS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_GROUP_PERMS FOR GROUP_PERMISSIONS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove permission from group.'; 
END^

CREATE TRIGGER BIU_GROUP_PERMISSIONS FOR GROUP_PERMISSIONS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_GROUP_USERS FOR GROUP_USERS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove user from group.'; 
END^

CREATE TRIGGER BIU_GROUP_USERS FOR GROUP_USERS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_MEDIA_DATA FOR MEDIA_DATA
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_MENUS FOR MENUS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_MENU_ITEMS FOR MENU_ITEMS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_MIMETYPES FOR MIMETYPES
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BIU_PAGES FOR "PAGES"
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_PERMISSIONS FOR PERMISSIONS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove permission.'; 
END^

CREATE TRIGGER BIU_PERMISSIONS FOR PERMISSIONS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_USERS FOR USERS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove user.'; 
END^

CREATE TRIGGER BIU_USERS FOR USERS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^

CREATE TRIGGER BDEL_USER_PERMS FOR USER_PERMISSIONS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD.CAN_DELETE = FALSE) THEN
     EXCEPTION EXCEPT_CANT_DELETE 'Cannot remove permission from user.'; 
END^

CREATE TRIGGER BIU_USER_PERMISSIONS FOR USER_PERMISSIONS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
BEGIN
  IF (INSERTING) THEN
    BEGIN
      IF (NEW.ID IS NULL) THEN
        NEW.ID = NEW_UUID();
        
      NEW.CREATEDT = CURRENT_TIMESTAMP;
    END
  ELSE
    BEGIN
      NEW.ID = OLD.ID;
      NEW.CREATEDT = OLD.CREATEDT;
    END
  
  NEW.LASTMODDT = CURRENT_TIMESTAMP;
END^
SET TERM ; ^

/* Data for table "APPLICATIONS" */

/* Data for table "BLOG_CATEGORIES" */

/* Data for table "BLOG_POSTS" */

/* Data for table "BLOG_POST_CAT_MAP" */

/* Data for table "CONFIG_OPTIONS" */

/* Data for table "GROUPS" */
INSERT INTO GROUPS (ID, GROUP_NAME, DESCRIPTION, "ACTIVE", SUPER_GROUP, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('ò¨»—ÖáJ¹±Â"ŸQ=&', 'Administrators', 'System Administrators', TRUE, TRUE, FALSE, '2020-10-06 00:40:56', '2020-10-06 00:41:45');
INSERT INTO GROUPS (ID, GROUP_NAME, DESCRIPTION, "ACTIVE", SUPER_GROUP, CAN_DELETE, CREATEDT, LASTMODDT) VALUES (' 7ó´?ÇNb£ž)Šæé"', 'SecurityAdmin', 'Security Administrator', TRUE, FALSE, TRUE, '2020-10-06 02:03:36', '2020-10-06 02:03:36');
INSERT INTO GROUPS (ID, GROUP_NAME, DESCRIPTION, "ACTIVE", SUPER_GROUP, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('o7?K2ƒL¨äÀ=GL', 'DBA', 'Database Administration', TRUE, FALSE, TRUE, '2020-10-06 02:03:51', '2020-10-06 02:03:51');
COMMIT;

/* Data for table "GROUP_PERMISSIONS" */
INSERT INTO GROUP_PERMISSIONS (ID, GROUP_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('zHÖwõH(’°™Y!ª·', 'Administrators', 'SuperUser', FALSE, '2020-10-06 00:41:04', '2020-10-06 00:41:53');
INSERT INTO GROUP_PERMISSIONS (ID, GROUP_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('}Q†É7ZLÛ²»‡´möqz', 'SecurityAdmin', 'SecurityAdmin', TRUE, '2020-10-06 02:03:39', '2020-10-06 02:03:39');
INSERT INTO GROUP_PERMISSIONS (ID, GROUP_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('•Í`‹Ú9CG¤8z&ú8', 'DBA', 'BackupDB', TRUE, '2020-10-06 02:03:55', '2020-10-06 02:03:55');
INSERT INTO GROUP_PERMISSIONS (ID, GROUP_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('øJZ“B°ƒÁË·-J\•', 'DBA', 'OptimizeDB', TRUE, '2020-10-06 02:03:57', '2020-10-06 02:03:57');
INSERT INTO GROUP_PERMISSIONS (ID, GROUP_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('_l_îK,?glðå|Ú', 'DBA', 'ResoreDB', TRUE, '2020-10-06 02:03:58', '2020-10-06 02:03:58');
COMMIT;

/* Data for table "GROUP_USERS" */
INSERT INTO GROUP_USERS (ID, GROUP_NAME, USER_NAME, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('´D`qsM·ŽwûDE)Ýª', 'SecurityAdmin', 'msv', TRUE, '2020-10-06 02:04:37', '2020-10-06 02:04:37');
INSERT INTO GROUP_USERS (ID, GROUP_NAME, USER_NAME, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('s–"n÷ÉOÍª´¼CÇÓÜ', 'DBA', 'msv', TRUE, '2020-10-06 02:04:45', '2020-10-06 02:04:45');
INSERT INTO GROUP_USERS (ID, GROUP_NAME, USER_NAME, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('uÅ\jGg»V#µ~à,Q', 'Administrators', 'Admin', FALSE, '2020-10-06 00:58:51', '2020-10-06 00:59:20');
COMMIT;

/* Data for table "MEDIA_DATA" */

/* Data for table "MENUS" */

/* Data for table "MENU_ITEMS" */

/* Data for table "MIMETYPES" */

/* Data for table "PAGES" */

/* Data for table "PERMISSIONS" */
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('ÙŸ>„JË£6Z7ÎNËÂ', 'SuperUser', 'Super User', FALSE, NULL, NULL, NULL, '2020-10-05 23:53:29', '2020-10-06 01:55:59');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('Z´><?J³¤˜kðë', 'SecurityAdmin', 'Security Admin', FALSE, NULL, NULL, NULL, '2020-10-05 23:54:46', '2020-10-06 01:56:06');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('ª—ŽŠN<™''Ùî¿Ù', 'BackupDB', 'Database Backup', FALSE, NULL, NULL, NULL, '2020-10-05 23:56:05', '2020-10-05 23:56:05');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('	:kSHò«ó×''ùx5¡', 'OptimizeDB', 'Database Optimization', FALSE, NULL, NULL, NULL, '2020-10-05 23:56:26', '2020-10-05 23:56:26');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('¦°—_pâK©˜i’”ŒÖiì', 'ResoreDB', 'Database Restore', FALSE, NULL, NULL, NULL, '2020-10-05 23:56:44', '2020-10-05 23:56:44');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('9Dq°¢Ck‡<€ãnW#', 'AddPosts', 'Add Blog Posts', FALSE, NULL, NULL, NULL, '2020-10-05 23:57:06', '2020-10-05 23:57:06');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('
Ý ½ÄDº¬pyšD9', 'EditPosts', 'Edit Blog Posts', FALSE, NULL, NULL, NULL, '2020-10-05 23:57:23', '2020-10-05 23:57:23');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('&fqÜOá‡½ÇKnÅ', 'DeletePosts', 'Delete Blog Posts', FALSE, NULL, NULL, NULL, '2020-10-05 23:57:55', '2020-10-05 23:57:55');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('rWùõ/GGÐµ¿Ì2>þ“', 'AddPages', 'Add Pages', FALSE, NULL, NULL, NULL, '2020-10-05 23:58:12', '2020-10-05 23:58:12');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('fuè"K‹®%Éž?£0', 'EditPages', 'Edit Pages', FALSE, NULL, NULL, NULL, '2020-10-05 23:58:29', '2020-10-05 23:58:29');
INSERT INTO PERMISSIONS (ID, PERMISSION, DESCRIPTION, CAN_DELETE, ITEMS, "ACTION", FORMNAME, CREATEDT, LASTMODDT) VALUES ('è:ÃE
A
—{ÍªttP', 'DeletePages', 'Delete Pages', FALSE, NULL, NULL, NULL, '2020-10-05 23:58:41', '2020-10-05 23:58:41');
COMMIT;

/* Data for table "USERS" */
INSERT INTO USERS (ID, USER_NAME, "PASSWORD", FNAME, LNAME, DISPLAY_NAME, ACCESS_COUNT, LASTACCESS_DATE, LASTACCESS_TIME, CREATED_DATE, CREATED_TIME, "ACTIVE", SUPER_USER, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('é‡¡î’CÀ¤Ðò»æ4', 'Admin', x'C544E5292C9C42A5B94FE2791270290191E5C519AEF41518290A35F01D91945EF8D0FE059761CD32643B61548BE3C943B1609FFFBFC51AAD666D0A04ADF83C9D', NULL, NULL, 'System Administrator', 12, '2020-10-06', '10:55:27', '2020-10-06', '00:40:09', TRUE, TRUE, FALSE, '2020-10-06 00:40:36', '2020-11-21 22:51:23');


COMMIT;

/* Data for table "USER_PERMISSIONS" */
INSERT INTO USER_PERMISSIONS (ID, USER_NAME, PERMISSION, CAN_DELETE, CREATEDT, LASTMODDT) VALUES ('D.¡°.L.¡oæÅy÷#Ô', 'Admin', 'SuperUser', FALSE, '2020-10-06 00:41:07', '2020-10-06 00:42:22');
COMMIT;
