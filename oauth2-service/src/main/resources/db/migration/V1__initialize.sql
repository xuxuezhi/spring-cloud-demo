CREATE DATABASE IF NOT EXISTS `SCHEMA_AUTHORIZATION` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SCHEMA_AUTHORIZATION`;

DROP TABLE IF EXISTS `OAUTH_ACCESS_TOKEN`;
CREATE TABLE `OAUTH_ACCESS_TOKEN` (
  `TOKEN_ID`          VARCHAR(256) DEFAULT NULL,
  `TOKEN`             BLOB,
  `AUTHENTICATION_ID` VARCHAR(256) DEFAULT NULL,
  `USER_NAME`         VARCHAR(256) DEFAULT NULL,
  `CLIENT_ID`         VARCHAR(256) DEFAULT NULL,
  `AUTHENTICATION`    BLOB,
  `REFRESH_TOKEN`     VARCHAR(256) DEFAULT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `OAUTH_REFRESH_TOKEN`;
CREATE TABLE `OAUTH_REFRESH_TOKEN` (
  `TOKEN_ID`       VARCHAR(256) DEFAULT NULL,
  `TOKEN`          BLOB,
  `AUTHENTICATION` BLOB
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `OAUTH_APPROVALS`;
CREATE TABLE `OAUTH_APPROVALS` (
  `USERID`         VARCHAR(256)   DEFAULT NULL,
  `CLIENTID`       VARCHAR(256)   DEFAULT NULL,
  `SCOPE`          VARCHAR(256)   DEFAULT NULL,
  `STATUS`         VARCHAR(10)    DEFAULT NULL,
  `EXPIRESAT`      TIMESTAMP NULL DEFAULT NULL,
  `LASTMODIFIEDAT` TIMESTAMP NULL DEFAULT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `OAUTH_CODE`;
CREATE TABLE `OAUTH_CODE` (
  `CODE`           VARCHAR(256) DEFAULT NULL,
  `AUTHENTICATION` BLOB
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `OAUTH_CLIENT_DETAILS`;
CREATE TABLE `OAUTH_CLIENT_DETAILS` (
  `CLIENT_ID`               VARCHAR(255) NOT NULL,
  `RESOURCE_IDS`            VARCHAR(256)  DEFAULT NULL,
  `CLIENT_SECRET`           VARCHAR(256)  DEFAULT NULL,
  `SCOPE`                   VARCHAR(256)  DEFAULT NULL,
  `AUTHORIZED_GRANT_TYPES`  VARCHAR(256)  DEFAULT NULL,
  `WEB_SERVER_REDIRECT_URI` VARCHAR(256)  DEFAULT NULL,
  `AUTHORITIES`             VARCHAR(256)  DEFAULT NULL,
  `ACCESS_TOKEN_VALIDITY`   INT(11)       DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY`  INT(11)       DEFAULT NULL,
  `ADDITIONAL_INFORMATION`  VARCHAR(4096) DEFAULT NULL,
  `AUTOAPPROVE`             VARCHAR(45)   DEFAULT 'true',
  PRIMARY KEY (`CLIENT_ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('user-service', 'user-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL, NULL,
                        NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('account-service', 'account-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL,
                           NULL,
                           NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('address-service', 'address-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL,
                           NULL,
                           NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES
  ('point-service', 'point-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL, NULL,
                    NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('product-service', 'product-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL,
                           NULL,
                           NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES
  ('order-service', 'order-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL, NULL,
                    NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('payment-service', 'payment-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL,
                           NULL,
                           NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES
  ('delivery-service', 'delivery-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT', NULL,
                       NULL,
                       NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES
  ('notification-service', 'notification-service', 'secret', 'server-scope', 'client_credentials', NULL, 'ROLE_CLIENT',
                           NULL,
                           NULL,
                           NULL, 'true');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES
  ('ui', NULL, 'secret', 'ui-scope', 'password,authorization_code,refresh_token,implicit,client_credentials', '',
         'ROLE_CLIENT, ROLE_TRUSTED_CLIENT', '30000', '30000', NULL, 'false');
INSERT INTO OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('tonr', 'sparklr', 'secret', 'read,write', 'authorization_code,implicit,refresh_token,password', NULL,
                'ROLE_CLIENT, ROLE_TRUSTED_CLIENT', NULL, NULL, NULL, 'false');