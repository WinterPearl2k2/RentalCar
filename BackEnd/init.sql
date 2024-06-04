CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."users" (
    "id_user" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "email_user" varchar(255) NOT NULL,
    "phone_user" varchar(255) NOT NULL,
    "name_user" varchar(255) NOT NULL,
    "password_user" varchar(255) NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id_user")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."device_tokens" (
    "device_token" text,
    "user_id" uuid NOT NULL,
    CONSTRAINT "fk_users_device_tokens" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id_user")
);

-- Indices
CREATE UNIQUE INDEX idx_users_phone_user ON public.users USING btree (phone_user);
CREATE UNIQUE INDEX idx_users_email_user ON public.users USING btree (email_user);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."verifications" (
    "email" text NOT NULL,
    "code" varchar(255) NOT NULL,
    "expiration" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("email")
);

-- Table Definition
CREATE TABLE "public"."cetizen_ids" (
    "id_cetizen" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "no" varchar(255) NOT NULL,
    "fullname" varchar(255) NOT NULL,
    "date_of_birth" timestamptz NOT NULL,
    "sex" varchar(255) NOT NULL,
    "nationality" varchar(255) NOT NULL,
    "place_of_origin" varchar(255) NOT NULL,
    "user_id" uuid NOT NULL,
    CONSTRAINT "fk_cetizen_ids_user" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id_user"),
    PRIMARY KEY ("id_cetizen","no")
);

-- Indices
CREATE UNIQUE INDEX idx_cetizen_ids_no ON public.cetizen_ids USING btree (no);
CREATE UNIQUE INDEX idx_verifications_code ON public.verifications USING btree (code);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."cars" (
    "id_car" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "name_car" varchar(255) NOT NULL,
    "price_car" float8 NOT NULL,
    "fuel_type_car" text NOT NULL,
    "brand_car" text NOT NULL,
    "color_car" varchar(255),
    "description_car" text,
    "kilometers_car" float8,
    "seats_car" int8,
    "transmission_car" text,
    "address_car" text NOT NULL,
    "lat_car" float8 NOT NULL,
    "long_car" float8 NOT NULL,
    "images_car" text,
    "status_car" text,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" uuid NOT NULL,
    CONSTRAINT "fk_users_cars" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id_user"),
    PRIMARY KEY ("id_car")
);

-- Table Definition
CREATE TABLE "public"."car_rentails" (
    "transaction" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "status_car" int8,
    "rental_price" float8 NOT NULL,
    "rental_days" int8,
    "is_readed" bool DEFAULT true,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "start_date" timestamptz NOT NULL,
    "end_date" timestamptz NOT NULL,
    "user_id" uuid NOT NULL,
    "car_id" uuid NOT NULL,
    CONSTRAINT "fk_cars_car_rentails" FOREIGN KEY ("car_id") REFERENCES "public"."cars"("id_car"),
    CONSTRAINT "fk_users_car_rentails" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id_user"),
    PRIMARY KEY ("transaction")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."car_reviews" (
    "rate_review" float8 NOT NULL,
    "comment_review" text,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" uuid NOT NULL,
    "car_id" uuid NOT NULL,
    CONSTRAINT "fk_car_reviews_car" FOREIGN KEY ("car_id") REFERENCES "public"."cars"("id_car"),
    CONSTRAINT "fk_car_reviews_user" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id_user"),
    PRIMARY KEY ("user_id","car_id")
);

INSERT INTO "public"."users" ("id_user", "email_user", "phone_user", "name_user", "password_user", "created_at", "updated_at") VALUES
('d7ed153f-f7b9-494e-b38f-299adf1139b8', 'quan@gmail.com', '123123123', 'Quan', '$2a$10$hroHtU.Tl.5bPbK5w6XkaOZ62CU.ad5L18lCQX169w1rXEv2sVDjG', '2024-05-24 04:28:57.774621+00', '2024-05-28 02:24:26.320176+00');
INSERT INTO "public"."users" ("id_user", "email_user", "phone_user", "name_user", "password_user", "created_at", "updated_at") VALUES
('afc5b2f5-245c-4355-9699-fa88c43e7336', '1@gmail.com', '0909129472', 'quaaan', '$2a$10$6XYq3j9pSYcyaWS3ua5Bt.JqZRK4dMHJ3IXIqNiUsZX4VaEGZSRQC', '2024-05-24 06:47:29.969849+00', '2024-05-30 07:10:55.953043+00');
INSERT INTO "public"."users" ("id_user", "email_user", "phone_user", "name_user", "password_user", "created_at", "updated_at") VALUES
('e532fac5-3afb-41e1-aaf5-faa22b9ff83d', 'long@gmail.com', '090123801', 'long', '$2a$10$w1QnV40L20kV6ZiLOnHV4udSiBbN/Knx5oSsFZuaH0Opipp9wwHK.', '2024-05-24 06:59:58.859215+00', '2024-05-24 07:32:11.070485+00');
INSERT INTO "public"."users" ("id_user", "email_user", "phone_user", "name_user", "password_user", "created_at", "updated_at") VALUES
('df5ce570-c288-474b-9c22-789c79960721', 'dongle1712002@gmail.com', '0121500400', 'Ngoc Dong', '$2a$10$Syxfzjs5XtY3m9DmgrVyB.KMZmXmBI7X2XjCrtUVGXMe9/9rV0OQC', '2024-05-27 07:08:45.931318+00', '2024-05-27 07:09:57.528471+00'),
('99d9a49a-717f-4917-af2a-1fdcf14a69ae', 'dong@gmail.com', '089764381085', 'Dong', '$2a$10$Bf6zebUU3Ka4zirqDkleke.GKGOUARG0gSM5a6Cw7wJfODy7nvynm', '2024-05-24 07:08:14.994325+00', '2024-05-28 02:12:17.085329+00'),
('f66262ce-a691-458d-bd1c-f9a6a77ad71b', 'hung123@g.com', '0905512324', 'hung', '$2a$10$YB8ygxpg6gIkeSZsrYcOAOexURetkdEW7EI5aGQ7E.RK.OZUN20hK', '2024-05-28 02:13:03.947924+00', '2024-05-28 02:14:20.278021+00'),
('a3c98c64-9be9-4737-96b9-eb4080d8bce7', 'test@gmail.com', '09050008885', 'test', '$2a$10$2MZef6Pn7sEWD/fW7ur8OeXoOJy/Alx8vHiarzqk0/TPPYESEjsD2', '2024-05-28 02:13:39.674774+00', '2024-05-28 02:18:19.243091+00'),
('08399f78-857f-4c39-a8d0-ec31edb288c3', 'trieunvd@rikkeisoft.com', '0123456789', 'TrieuNVD', '$2a$10$hfdFBWlm7JF0sRqryteEDul9Y7nVkFfCCXbjhUPt/Rbu3SeRBiNJu', '2024-05-24 04:37:28.737339+00', '2024-05-28 02:19:51.2831+00');

INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3');
INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3');
INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3');
INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('dlY0HPztT_SyFkq81ocGkP:APA91bFgl_04HjN2yE5noTUopgKwe44kGTuf1_wHfHDVkj5OEaChx8h8zee3rRpX2lfvbsFK6PIIxo7U76vNnzNkASFkA9MA_-f2y_Wm0KJ-B5VJaE8x9DFWuhqfXPP8fnrkVpDYQmle', 'e532fac5-3afb-41e1-aaf5-faa22b9ff83d'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eZ8csc5vRpG65Jb6QR25a-:APA91bGbQNAdkPVtzSqAqcmLx8FbccRcYXaErXPwL_yzazZu1IPZsh6oy5q84GdorJsqu9i4YuaI2ivJstxDfLAkpjCBZTebN3opGaZP5jbbuO72cuaRplqnknqC--aQCoDxBngWsIhD', '08399f78-857f-4c39-a8d0-ec31edb288c3'),
('eIfolyDMoZ76VmMnchqFTL:APA91bFj0RmgIgIK72Lg8oAOCd4IbC5fPYi81r-92Fex86xsEEvbPYZlbTtBnJ8YdvhZ_BJ7pLEkIEXXWBncI-3o0A02D6J-moSic_X9zo4SKbfpSh7Hl_S1SWg-TYHYH5-q7GKyQsuQ', '99d9a49a-717f-4917-af2a-1fdcf14a69ae'),
('dFd3xCDeRGGFDgask-Jhlq:APA91bGNLUZY09jaHIBIhRvts1S27Q1Z7EDN_tbM3BNWToFhiIh8IIQbfM8uGb_EgWYBEGo07PqBhmpgD_iX9qtBq9MJdOVgOVe57vASnLLN6iqjXrrjddzkmgM_V9gxpP1EnjvYu8lI', '99d9a49a-717f-4917-af2a-1fdcf14a69ae'),
('dNFWNI6XTPOFoJYezULcnI:APA91bHeVGVWV6GYrNc7lPfmaEzIBqsTEjaDIzQoxe8JLSC76-8CPXjpBtLQSB1YH7CmeqLHyFtii83QsDLSxe2I1DWOFccecLNIYmiOHGMKihzvWt_HvQePRDkrVWnBlViWPZlJcToO', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dNFWNI6XTPOFoJYezULcnI:APA91bHeVGVWV6GYrNc7lPfmaEzIBqsTEjaDIzQoxe8JLSC76-8CPXjpBtLQSB1YH7CmeqLHyFtii83QsDLSxe2I1DWOFccecLNIYmiOHGMKihzvWt_HvQePRDkrVWnBlViWPZlJcToO', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dNFWNI6XTPOFoJYezULcnI:APA91bHeVGVWV6GYrNc7lPfmaEzIBqsTEjaDIzQoxe8JLSC76-8CPXjpBtLQSB1YH7CmeqLHyFtii83QsDLSxe2I1DWOFccecLNIYmiOHGMKihzvWt_HvQePRDkrVWnBlViWPZlJcToO', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dNFWNI6XTPOFoJYezULcnI:APA91bHeVGVWV6GYrNc7lPfmaEzIBqsTEjaDIzQoxe8JLSC76-8CPXjpBtLQSB1YH7CmeqLHyFtii83QsDLSxe2I1DWOFccecLNIYmiOHGMKihzvWt_HvQePRDkrVWnBlViWPZlJcToO', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dNFWNI6XTPOFoJYezULcnI:APA91bHeVGVWV6GYrNc7lPfmaEzIBqsTEjaDIzQoxe8JLSC76-8CPXjpBtLQSB1YH7CmeqLHyFtii83QsDLSxe2I1DWOFccecLNIYmiOHGMKihzvWt_HvQePRDkrVWnBlViWPZlJcToO', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cX7Qzc8LRbSU3JtywxH9L-:APA91bHYqHK9gzqTGkL5_Opv-y8nQPp9IW40CjOFXeTZPwBup7N__GG9c_zrYUn2PNisd5N4p1SFz0eDsMXzoyn07sGvzHyCd0fiZnRjoMDX6RIQRJW-xbMmTFkARxcPgKHhBIXtK_Te', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('cX7Qzc8LRbSU3JtywxH9L-:APA91bHYqHK9gzqTGkL5_Opv-y8nQPp9IW40CjOFXeTZPwBup7N__GG9c_zrYUn2PNisd5N4p1SFz0eDsMXzoyn07sGvzHyCd0fiZnRjoMDX6RIQRJW-xbMmTFkARxcPgKHhBIXtK_Te', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('fQ9NI2J3RAesQddJS15lz5:APA91bFxVyERZ7TT7KLXoLAH96mof0EyCGhzPmIdBHvxHsB1_Dmsvn757Gj7wKKs9XvBRFQYSDoUAF98ZK3-fiZt6_3Zh8PatxArzx0Us_o69GlwTdSBNFGlWPDMynPUkyZdkqeopBOc', '99d9a49a-717f-4917-af2a-1fdcf14a69ae'),
('fKnHwN20T5-rlEQFU9UEr-:APA91bEDgceSx5J9Zk5jbjiLzNxLNmkc7vEIkaAxUD4Anh_dp3gt6XPf_6GARUt3iPq0-RJGCgyP0TXkb5HjK8U8l18e2gp1aYfx344m_qK0q1Dl-fi_x-7p9cq8YAvktu5TUPtHrNx2', '99d9a49a-717f-4917-af2a-1fdcf14a69ae'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336');
INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336');
INSERT INTO "public"."device_tokens" ("device_token", "user_id") VALUES
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dGII6voyRrmy8kQjjFb39S:APA91bHqeShzs7QnRpZRK16wcLTycJ7iv5E0HQr2wEpLGO5pL84XCkxe7-GbF9mATcb3NopPeNWvLLiqJmmUrWWkzIV7yAF9i4lHEDY_4K4_PK5PvNIiGgF1RGeqv55vV2-s1v1c56xd', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dPFku4dmSwyb8NohDdZDKu:APA91bH2yUs1KrTeku4-HQaqAmAPF0_4Mh4YogOpGCIUize1_8UgMJ7tq64y0sQtByk8890CoS70DcBkeWOLb_HGvcqfKhkuDwmT32SY74WgXNpvlpCyt86qwiDWmK0cLPTXgFJm1SHr', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('dPFku4dmSwyb8NohDdZDKu:APA91bH2yUs1KrTeku4-HQaqAmAPF0_4Mh4YogOpGCIUize1_8UgMJ7tq64y0sQtByk8890CoS70DcBkeWOLb_HGvcqfKhkuDwmT32SY74WgXNpvlpCyt86qwiDWmK0cLPTXgFJm1SHr', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('ceGyDN8DRbmynjh0sx1R3J:APA91bFaEjs2EZzyCmTzTWrL3FHt4IBbrtpoE7FftYVbl5SXghRXlJEc_sVti4Lw0ANWFOYLwLu1tBVsIz0bpJ1egJBJFzGRan18mN0sFU_t5_5PVEE7saMix3OZgXWqUe7bTtuvv9Oi', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('fjHLP86iTRaTwP3zY0rVjR:APA91bGeub9o0bgC635cdbSsX6tZbpO_HFG6GX6_VEtbDVu5Y2JIVj7cCgrJnk4E6Mx9F-pbTkrvg5sfGBDkqNCcvgKQvN_W01QJHOWC1UcQBYNDwuZW0UBHxySQW89z5fV-rjpipF3M', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('fjHLP86iTRaTwP3zY0rVjR:APA91bGeub9o0bgC635cdbSsX6tZbpO_HFG6GX6_VEtbDVu5Y2JIVj7cCgrJnk4E6Mx9F-pbTkrvg5sfGBDkqNCcvgKQvN_W01QJHOWC1UcQBYNDwuZW0UBHxySQW89z5fV-rjpipF3M', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('cDmAA8JMTzyDFM-9Z2M0RW:APA91bFaH1oHf9Ewn1SunM_iQXTKa-XLmgkaDdbxdr0ZsC4-oFAYzltgQ5bb9NPa-gMVOnvRhq6r34RrUPKucclmw8IxrWaJ48DM6UjwntxSIylcSAQjEZeohuFtJL5qIMkUsr5j54aT', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('cDmAA8JMTzyDFM-9Z2M0RW:APA91bFaH1oHf9Ewn1SunM_iQXTKa-XLmgkaDdbxdr0ZsC4-oFAYzltgQ5bb9NPa-gMVOnvRhq6r34RrUPKucclmw8IxrWaJ48DM6UjwntxSIylcSAQjEZeohuFtJL5qIMkUsr5j54aT', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('cUASHk5GRE2p8rFGWB4avc:APA91bFheRBPwovfsen-aUUviGLtmlXYRd4dnpNdRL0rr3zzlbkgmOgdkAEn4bdhNYfMGjrBqbypB7JPSUTj5JkfMhGzbese69mCTuqf_5Z4wvXDsWC8PGQ2UD4Ejpbc7TjfkOtcyTI3', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('fPNdUz9nQZ2fKMW912Jo9i:APA91bFHnf7BQjNcvg6Bi2wfaYGprGsuo-omf7mFFShDsWtyvh04Pm5CTOemMJadHVGlwFLHq0zwNiTVhUj8R6WYd3E8izf06C31TdrxODzr7UgsRfZ3MXZHbto7ZwkpCgwdy322Fh1k', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('fPNdUz9nQZ2fKMW912Jo9i:APA91bFHnf7BQjNcvg6Bi2wfaYGprGsuo-omf7mFFShDsWtyvh04Pm5CTOemMJadHVGlwFLHq0zwNiTVhUj8R6WYd3E8izf06C31TdrxODzr7UgsRfZ3MXZHbto7ZwkpCgwdy322Fh1k', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('c8L9y6p9TXCZDWsM4Gl7Bq:APA91bGrmGbCQ3I_Jie3y9b86s6cEPQcLNXgO9PXdBBeM0PT1Gdhf2W-aVl6RReWo2gO_gHG-ta504T_RY-Bf0fMZSJ6hpl3IunhR92qrJik09Yf7XbZYoZzSwSBk60N5W9pDOv4tONs', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('c8L9y6p9TXCZDWsM4Gl7Bq:APA91bGrmGbCQ3I_Jie3y9b86s6cEPQcLNXgO9PXdBBeM0PT1Gdhf2W-aVl6RReWo2gO_gHG-ta504T_RY-Bf0fMZSJ6hpl3IunhR92qrJik09Yf7XbZYoZzSwSBk60N5W9pDOv4tONs', 'afc5b2f5-245c-4355-9699-fa88c43e7336'),
('eqqOmjPWTQ-hWkObClB099:APA91bFo6AcVUqztmtoc4k15BhwE1cgbzcphD2ZI9dWG3Ptrp7lm9TSQWashfFn_GfoY-wRblTSlD0evuqhcGU-u7QdIPg4IjomnwullyuSsvQcpHrJ-AJo6bBYDC4humh54qNfbdjh5', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('eqqOmjPWTQ-hWkObClB099:APA91bFo6AcVUqztmtoc4k15BhwE1cgbzcphD2ZI9dWG3Ptrp7lm9TSQWashfFn_GfoY-wRblTSlD0evuqhcGU-u7QdIPg4IjomnwullyuSsvQcpHrJ-AJo6bBYDC4humh54qNfbdjh5', 'd7ed153f-f7b9-494e-b38f-299adf1139b8');

INSERT INTO "public"."cetizen_ids" ("id_cetizen", "no", "fullname", "date_of_birth", "sex", "nationality", "place_of_origin", "user_id") VALUES
('874889fb-ed07-4ffb-80ae-c64ffc13417c', '045201006233', 'TRAN ANH QUAN', '0001-01-01 00:00:00+00', 'NAM', 'VIET NAM', 'TRIEU THUAN, TRIEU PHONG, QUANG TRI', 'd7ed153f-f7b9-494e-b38f-299adf1139b8');
INSERT INTO "public"."cetizen_ids" ("id_cetizen", "no", "fullname", "date_of_birth", "sex", "nationality", "place_of_origin", "user_id") VALUES
('b4a1e081-e384-4a6e-a100-e7e48bc24d75', '045203004714', 'NGO XUAN LONG', '0001-01-01 00:00:00+00', 'NAM', 'VIET NAM', 'VINH LONG, VINH LINH, QUANG TRI', 'e532fac5-3afb-41e1-aaf5-faa22b9ff83d');
INSERT INTO "public"."cetizen_ids" ("id_cetizen", "no", "fullname", "date_of_birth", "sex", "nationality", "place_of_origin", "user_id") VALUES
('aae59caf-82ff-428d-b7d8-f2d15f3da9f3', '048202006587', 'LE NGUYEN NGOC DONG', '0001-01-01 00:00:00+00', 'NAM', 'VIET NAM', 'HOA HIEP NAM, LIEN CHIEU, DA NANG', '99d9a49a-717f-4917-af2a-1fdcf14a69ae');

INSERT INTO "public"."cars" ("id_car", "name_car", "price_car", "fuel_type_car", "brand_car", "color_car", "description_car", "kilometers_car", "seats_car", "transmission_car", "address_car", "lat_car", "long_car", "images_car", "status_car", "created_at", "updated_at", "user_id") VALUES
('c5e842f0-8fbf-4bc6-88b9-64910035908c', 'xe moi mua', 464, 'Diesel', 'Toyota', 'red', 'heheee', 116446, 1, 'Automatic', '200 Hải Phòng, Tam Thuận, Q. Thanh Khê, Đà Nẵng', 16.072077574841458, 108.20983744723134, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FlrxKwoMxHP.jpg?alt=media&token=vOTtwffirw', 'available', '2024-05-24 04:41:47.348134+00', '2024-05-24 04:41:47.348134+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8');
INSERT INTO "public"."cars" ("id_car", "name_car", "price_car", "fuel_type_car", "brand_car", "color_car", "description_car", "kilometers_car", "seats_car", "transmission_car", "address_car", "lat_car", "long_car", "images_car", "status_car", "created_at", "updated_at", "user_id") VALUES
('9fcc96d7-98d0-4365-8755-de137558e1b0', 'xe oottto1', 16, 'Diesel', 'Other', 'red', 'mo tqq', 15161, 1, 'Automatic', '22 Hẻm 196/32 Trần Cao Vân, Tam Thuận, Thanh Khê, Đà Nẵng', 16.07379744431681, 108.20719749529627, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FXnMYymKlXz.jpg?alt=media&token=FsaJzSmgnA', 'available', '2024-05-24 04:43:37.753918+00', '2024-05-24 04:43:37.753918+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8');
INSERT INTO "public"."cars" ("id_car", "name_car", "price_car", "fuel_type_car", "brand_car", "color_car", "description_car", "kilometers_car", "seats_car", "transmission_car", "address_car", "lat_car", "long_car", "images_car", "status_car", "created_at", "updated_at", "user_id") VALUES
('a4de9de7-aade-4523-a03c-d517c88ed3a8', 'oto xinh ', 123, 'Diesel', 'Toyota', 'red ', '123213', 12111, 2, 'Automatic', 'Tòa nhà Thông Tấn Xã Việt Nam chi nhánh Miền Trung -Tây Nguyên, Hải Châu 1, Hải Châu, Đà Nẵng', 16.0741834, 108.2186528, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FjjGKzBEeWf.jpg?alt=media&token=AcdnVuFfKF', 'available', '2024-05-24 06:36:57.164659+00', '2024-05-24 06:36:57.164659+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8');
INSERT INTO "public"."cars" ("id_car", "name_car", "price_car", "fuel_type_car", "brand_car", "color_car", "description_car", "kilometers_car", "seats_car", "transmission_car", "address_car", "lat_car", "long_car", "images_car", "status_car", "created_at", "updated_at", "user_id") VALUES
('173f4148-9728-40b1-985f-a89635085652', 'carr2', 123, 'Diesel', 'Toyota', 'red', 'xe sang xin min', 1232, 1, 'Automatic', 'Điểm bus Đối Diện Số 4 Nguyễn Thị Minh Khai, Nguyễn Thị Minh Khai, Thạch Thang, Hải Châu, Đà Nẵng', 16.07624499557079, 108.21773954797175, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FmcLzvreGTN.jpg?alt=media&token=KZFUUrXeSo', 'available', '2024-05-24 06:38:16.525291+00', '2024-05-24 06:38:16.525291+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('d79b42d5-be9e-4bc7-95b3-9a2b78b58d11', 'xe oto1', 123213, 'Diesel', 'Toyota', 'red', 'red ne', 123213, 12, 'Automatic', 'Tổ dân phố 2, Chính Gián, Thanh Khê, Đà Nẵng', 16.0675644991571, 108.20646261733032, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FJkAtBpWLOA.jpg?alt=media&token=RJLOPxXXIs', 'available', '2024-05-24 06:40:11.508127+00', '2024-05-24 06:40:11.508127+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('4a2c9629-9603-44e5-85e0-caf77a665f07', 'xe oto', 50, 'Diesel', 'Toyota', 'red', 'xe nay moi khall', 12285, 1, 'Automatic', 'Tòa nhà Thông Tấn Xã Việt Nam chi nhánh Miền Trung -Tây Nguyên, Hải Châu 1, Hải Châu, Đà Nẵng', 16.0741667, 108.2186414, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FKCERUUFvma.jpg?alt=media&token=tcnnpIBlpb', 'available', '2024-05-24 04:39:39.257546+00', '2024-05-24 06:40:56.07422+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('86021634-819e-42bd-9fbe-743de13a61b3', 'Xe G63', 100, 'Diesel', 'Other', 'den', 'Xe moi mua', 1100, 4, 'Automatic', 'Ngô Gia Tự, Thạch Thang, Hải Châu, Đà Nẵng, ', 16.071797580969232, 108.21676676811751, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FVvGmLLahPo.jpg?alt=media&token=PTgjeVyoMl', 'available', '2024-05-24 07:06:13.23997+00', '2024-05-24 07:06:13.23997+00', 'e532fac5-3afb-41e1-aaf5-faa22b9ff83d'),
('04915edf-d3ce-4aee-9678-c2d8dc3df13c', '2', 1, 'Diesel', 'Toyota', 'red', '11', 1212, 1, 'Automatic', 'Hải Hà - Lốp ô tô, Vá vỏ Lưu động, 147 Đống Đa, Thạch Thang, Hải Châu, Đà Nẵng', 16.077916786805375, 108.21685180321163, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FUlVvEnNMFQ.jpg?alt=media&token=WmjAzsXpUZ', 'available', '2024-05-24 08:48:45.207783+00', '2024-05-24 08:48:45.207783+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('2df8d91b-f106-4e41-8a42-29161ddcbaa7', 'xe oottoo', 58, 'Diesel', 'Toyota', 'red', 'mô hình này có chi nhánh tại cùng mua chi phí cho các em nhỏ ở giữa có chi nhánh của m mấy ngày nay ', 1811, 2, 'Manual', '2 Kiệt 191 Ông Ích Khiêm, Thạch Thang, Hải Châu, Đà Nẵng', 16.0707096362421, 108.21359598663764, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FxObQrciLPP.jpg?alt=media&token=TvTteznJQW', 'available', '2024-05-27 03:36:08.782828+00', '2024-05-27 03:36:08.782828+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8'),
('a57b8815-e9ef-470b-b0d6-0908e58d733b', 'Lamborghini ', 1500, 'Hybrid', 'Other', 'Do', 'Xe dep moi xuat xuong', 1500, 2, 'Manual', '34 Ông Ích Khiêm, Hải Châu, Đà Nẵng', 16.07814173763171, 108.21201362081109, 'https://firebasestorage.googleapis.com/v0/b/rentalcar-e3d6b.appspot.com/o/images%2FFjJkeXYtxa.jpg?alt=media&token=gpOBlYaFuc', 'available', '2024-05-27 07:11:41.635268+00', '2024-05-28 02:22:50.90633+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae');

INSERT INTO "public"."car_rentails" ("transaction", "status_car", "rental_price", "rental_days", "is_readed", "created_at", "start_date", "end_date", "user_id", "car_id") VALUES
('3d7cbe06-527f-4a4b-8b99-85553670dbee', 0, 1500, 1, 'f', '2024-05-28 02:15:40.536991+00', '2024-06-01 00:00:00+00', '2024-06-01 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b');
INSERT INTO "public"."car_rentails" ("transaction", "status_car", "rental_price", "rental_days", "is_readed", "created_at", "start_date", "end_date", "user_id", "car_id") VALUES
('8e7cf4af-6c40-4ffb-bf4e-4d150ffe4404', 1, 1500, 1, 'f', '2024-05-28 02:27:02.100212+00', '2024-06-06 00:00:00+00', '2024-06-06 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b');
INSERT INTO "public"."car_rentails" ("transaction", "status_car", "rental_price", "rental_days", "is_readed", "created_at", "start_date", "end_date", "user_id", "car_id") VALUES
('9bbb0998-92c2-4b4d-96cf-bba67d588dc7', 1, 6000, 4, 'f', '2024-05-27 07:13:50.685801+00', '2024-05-28 00:00:00+00', '2024-05-31 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b');
INSERT INTO "public"."car_rentails" ("transaction", "status_car", "rental_price", "rental_days", "is_readed", "created_at", "start_date", "end_date", "user_id", "car_id") VALUES
('fd6c8490-800b-44b4-9e7c-9a5fc91e4910', 3, 1500, 1, 'f', '2024-05-27 07:12:58.152728+00', '2024-05-26 00:00:00+00', '2024-05-26 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b'),
('f3faebf0-fe79-446c-91a6-6765247f1edb', 1, 1500, 1, 'f', '2024-05-28 02:20:22.989745+00', '2024-06-01 00:00:00+00', '2024-06-01 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b'),
('de77c46f-e05d-4a83-beae-58b1143b2711', 2, 464, 1, 't', '2024-05-28 02:16:20.908234+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', 'e532fac5-3afb-41e1-aaf5-faa22b9ff83d', 'c5e842f0-8fbf-4bc6-88b9-64910035908c'),
('7c4a53ca-4b24-4d75-91bf-4db0304a2997', 3, 100, 1, 'f', '2024-05-24 07:48:14.412322+00', '2024-05-25 00:00:00+00', '2024-05-25 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357204', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357205', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357206', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357207', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357208', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357209', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357210', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357211', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357212', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357213', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357214', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357215', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357216', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357217', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357223', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357224', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357225', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357226', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357227', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357228', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357229', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357230', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357218', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357219', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357220', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357221', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357222', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357231', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357232', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357233', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('cc603f68-f1fe-4cd2-93d1-53b7024187f3', 1, 7500, 5, 'f', '2024-05-28 02:24:00.547012+00', '2024-06-01 00:00:00+00', '2024-06-05 00:00:00+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b'),
('0fd278f8-66c7-4604-abe4-fdb0f9357239', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357240', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357241', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357242', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357243', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357244', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357245', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357234', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357235', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357236', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357237', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357238', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357248', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357249', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357250', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357251', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357252', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357253', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357254', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357255', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357256', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357257', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357246', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3'),
('0fd278f8-66c7-4604-abe4-fdb0f9357247', 3, 100, 1, 'f', '2024-05-24 07:29:09.243926+00', '2024-05-24 00:00:00+00', '2024-05-24 00:00:00+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3');

INSERT INTO "public"."car_reviews" ("rate_review", "comment_review", "created_at", "user_id", "car_id") VALUES
(5, 'ngon', '2024-05-28 02:22:04.961987+00', '99d9a49a-717f-4917-af2a-1fdcf14a69ae', '86021634-819e-42bd-9fbe-743de13a61b3');
INSERT INTO "public"."car_reviews" ("rate_review", "comment_review", "created_at", "user_id", "car_id") VALUES
(3, 'Day la mot chiec xe manh me nx BBC HD jj DJs SS shsjajs ss sh sh sh kej jjijjj HD jj đưaj điện đh sh js DJ nj diddjjjbje rjjhjknnssdkdkjjjn jdd edddccieddfjjjjjjjjjdijdf fjijjjjnnjjjjjjki jdd jj đhd ionic j để n jj xanh xẹ để xe để khi hì hì hì nói nó để hị chủ hì hì nói nói nó device j để i đẹp đị kêj ed', '2024-05-27 07:22:49.637161+00', 'd7ed153f-f7b9-494e-b38f-299adf1139b8', 'a57b8815-e9ef-470b-b0d6-0908e58d733b');



