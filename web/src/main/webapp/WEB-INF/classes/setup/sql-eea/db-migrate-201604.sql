CREATE TABLE metadataidentifiertemplate
(
  id integer NOT NULL,
  name character varying(32) NOT NULL,
  isprovided character(1) NOT NULL DEFAULT 'n'::bpchar,
  template character varying(255) NOT NULL,
  CONSTRAINT metadataidentifiertemplate_pkey PRIMARY KEY (id)
);

INSERT INTO MetadataIdentifierTemplate (id, name, template, isprovided) VALUES  (0, 'Custom URN', '', 'y');
INSERT INTO MetadataIdentifierTemplate (id, name, template, isprovided) VALUES  (1, 'Autogenerated URN', '', 'y');

DELETE FROM Settings WHERE name LIKE 'system/shib/%';

INSERT INTO Settings (name, value, datatype, position, internal) VALUES ('system/metadatacreate/generateUuid', 'true', 2, 9100, 'n');


ALTER TABLE Users Add enabled boolean;
UPDATE Users SET enabled = true;

INSERT INTO Settings (name, value, datatype, position, internal) VALUES ('system/feedback/mailServer/tls', 'false', 2, 644, 'y');
INSERT INTO Settings (name, value, datatype, position, internal) VALUES ('system/xlinkResolver/ignore', 'operatesOn,featureCatalogueCitation,Anchor,source', 0, 2312, 'n');


UPDATE Settings SET value='3.1.0' WHERE name='system/platform/version';
UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';