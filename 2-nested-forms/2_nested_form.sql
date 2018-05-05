/*
 Navicat Premium Data Transfer

 Source Server         : Laragon ALL PGSQL(Dani Gunawan)
 Source Server Type    : PostgreSQL
 Source Server Version : 90602
 Source Host           : localhost:5432
 Source Catalog        : triple_nested_forms
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90602
 File Encoding         : 65001

 Date: 05/05/2018 20:02:22
*/


-- ----------------------------
-- Sequence structure for seasons_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seasons_id_seq";
CREATE SEQUENCE "public"."seasons_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for shows_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."shows_id_seq";
CREATE SEQUENCE "public"."shows_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for ar_internal_metadata
-- ----------------------------
DROP TABLE IF EXISTS "public"."ar_internal_metadata";
CREATE TABLE "public"."ar_internal_metadata" (
  "key" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of ar_internal_metadata
-- ----------------------------
INSERT INTO "public"."ar_internal_metadata" VALUES ('environment', 'development', '2018-05-05 12:59:37.383859', '2018-05-05 12:59:37.383859');

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."schema_migrations";
CREATE TABLE "public"."schema_migrations" (
  "version" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO "public"."schema_migrations" VALUES ('20180505122648');
INSERT INTO "public"."schema_migrations" VALUES ('20180505122711');

-- ----------------------------
-- Table structure for seasons
-- ----------------------------
DROP TABLE IF EXISTS "public"."seasons";
CREATE TABLE "public"."seasons" (
  "id" int8 NOT NULL DEFAULT nextval('seasons_id_seq'::regclass),
  "number" int4,
  "show_id" int8,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of seasons
-- ----------------------------
INSERT INTO "public"."seasons" VALUES (1, 1, 1, '2018-05-05 13:01:02.420723', '2018-05-05 13:01:02.420723');
INSERT INTO "public"."seasons" VALUES (2, 1, 1, '2018-05-05 13:01:05.624906', '2018-05-05 13:01:05.624906');
INSERT INTO "public"."seasons" VALUES (3, 1, 1, '2018-05-05 13:01:34.409553', '2018-05-05 13:01:34.409553');
INSERT INTO "public"."seasons" VALUES (4, 1, 1, '2018-05-05 13:01:34.411553', '2018-05-05 13:01:34.411553');
INSERT INTO "public"."seasons" VALUES (5, 1, 1, '2018-05-05 13:01:38.39478', '2018-05-05 13:01:38.39478');
INSERT INTO "public"."seasons" VALUES (6, 1, 1, '2018-05-05 13:01:38.396781', '2018-05-05 13:01:38.396781');
INSERT INTO "public"."seasons" VALUES (7, 1, 1, '2018-05-05 13:01:38.398781', '2018-05-05 13:01:38.398781');
INSERT INTO "public"."seasons" VALUES (8, 1, 1, '2018-05-05 13:01:38.400781', '2018-05-05 13:01:38.400781');

-- ----------------------------
-- Table structure for shows
-- ----------------------------
DROP TABLE IF EXISTS "public"."shows";
CREATE TABLE "public"."shows" (
  "id" int8 NOT NULL DEFAULT nextval('shows_id_seq'::regclass),
  "name" varchar COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of shows
-- ----------------------------
INSERT INTO "public"."shows" VALUES (1, NULL, '2018-05-05 13:01:02.416723', '2018-05-05 13:01:02.416723');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."seasons_id_seq"
OWNED BY "public"."seasons"."id";
SELECT setval('"public"."seasons_id_seq"', 9, true);
ALTER SEQUENCE "public"."shows_id_seq"
OWNED BY "public"."shows"."id";
SELECT setval('"public"."shows_id_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table ar_internal_metadata
-- ----------------------------
ALTER TABLE "public"."ar_internal_metadata" ADD CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table schema_migrations
-- ----------------------------
ALTER TABLE "public"."schema_migrations" ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

-- ----------------------------
-- Indexes structure for table seasons
-- ----------------------------
CREATE INDEX "index_seasons_on_show_id" ON "public"."seasons" USING btree (
  "show_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table seasons
-- ----------------------------
ALTER TABLE "public"."seasons" ADD CONSTRAINT "seasons_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shows
-- ----------------------------
ALTER TABLE "public"."shows" ADD CONSTRAINT "shows_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table seasons
-- ----------------------------
ALTER TABLE "public"."seasons" ADD CONSTRAINT "fk_rails_477f73852f" FOREIGN KEY ("show_id") REFERENCES "shows" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
