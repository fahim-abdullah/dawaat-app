PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20191106185632');
INSERT INTO schema_migrations VALUES('20191106204352');
INSERT INTO schema_migrations VALUES('20191106234448');
INSERT INTO schema_migrations VALUES('20191107000447');
INSERT INTO schema_migrations VALUES('20191107001947');
INSERT INTO schema_migrations VALUES('20191107232918');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2019-11-07 08:03:03.258024','2019-11-07 08:03:03.258024');
CREATE TABLE IF NOT EXISTS "products" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "price" varchar, "old_price" varchar, "status" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO products VALUES(1,'Signature Tehari','100',NULL,'Available','','');
INSERT INTO products VALUES(2,'Chicken Tehari','200','','Available','','');
INSERT INTO products VALUES(3,'Polao & Roast','100','','Available','','');
INSERT INTO products VALUES(4,'Firni (Regular)','100',NULL,'Available','','');
INSERT INTO products VALUES(5,'Firni (Large)','150',NULL,'Available','','');
CREATE TABLE IF NOT EXISTS "orders" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "fullname" varchar, "phone" varchar, "address" varchar, "flathouse" varchar, "road" varchar, "latlng" varchar, "subtotal" varchar, "itemquantity" varchar, "existing" varchar, "status" varchar, "ontheway_time" datetime, "delivery_time" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "instructions" text);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('products',5);
COMMIT;
