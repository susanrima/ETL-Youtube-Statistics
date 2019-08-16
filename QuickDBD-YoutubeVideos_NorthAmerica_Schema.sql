-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LHP3ZS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "videos" (
    "video_id" VARCHAR NOT NULL  ,
    "title" VARCHAR   ,
    "publish_date_formatted" DATE   ,
    CONSTRAINT "pk_videos" PRIMARY KEY (
        "video_id"
     )
);

CREATE TABLE "country" (
    "country_id" VARCHAR(5) NOT NULL  ,
    "country" VARCHAR(25)   ,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "popularity" (
    "id" INTEGER  NOT NULL ,
    "country_id" VARCHAR(25) NOT NULL  ,
    "video_id" VARCHAR NOT NULL  ,
    "trending_date_formatted" DATE   ,
    "category_id" INTEGER NOT NULL  ,
    "views" INTEGER   ,
    "likes" INTEGER   ,
    "dislikes" INTEGER   ,
    "comment_count" INTEGER   ,
    "comments_disabled" BOOLEAN   ,
    "ratings_disabled" BOOLEAN   ,
    "description" VARCHAR   ,
    CONSTRAINT "pk_popularity" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "category" (
    "category_id" INTEGER NOT NULL  ,
    "category_name" VARCHAR   ,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

ALTER TABLE "popularity" ADD CONSTRAINT "fk_popularity_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "popularity" ADD CONSTRAINT "fk_popularity_video_id" FOREIGN KEY("video_id")
REFERENCES "videos" ("video_id");

ALTER TABLE "popularity" ADD CONSTRAINT "fk_popularity_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

