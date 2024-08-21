PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20240812040635');
INSERT INTO schema_migrations VALUES('20240812040807');
INSERT INTO schema_migrations VALUES('20240812041810');
INSERT INTO schema_migrations VALUES('20240812073035');
INSERT INTO schema_migrations VALUES('20240812131237');
INSERT INTO schema_migrations VALUES('20240812131623');
INSERT INTO schema_migrations VALUES('20240812132050');
INSERT INTO schema_migrations VALUES('20240812133111');
INSERT INTO schema_migrations VALUES('20240813050855');
INSERT INTO schema_migrations VALUES('20240813084651');
INSERT INTO schema_migrations VALUES('20240814014344');
INSERT INTO schema_migrations VALUES('20240814025142');
INSERT INTO schema_migrations VALUES('20240815025348');
INSERT INTO schema_migrations VALUES('20240815032814');
INSERT INTO schema_migrations VALUES('20240816020834');
INSERT INTO schema_migrations VALUES('20240818034756');
INSERT INTO schema_migrations VALUES('20240818040414');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2024-08-12 04:03:42.075346','2024-08-12 04:03:42.075346');
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE TABLE IF NOT EXISTS "users" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "email" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "password_digest" varchar DEFAULT NULL);
INSERT INTO users VALUES(1,'山田温貴','yamadaharuki1212@icloud.com','2024-08-20 11:12:37.229942','2024-08-20 11:12:37.229942','$2a$12$ztr5.x2bvvQUnbnKlIssOuUEMgYLd1vA8zNueGYifCzv4cnqqiBUO');
INSERT INTO users VALUES(2,'鈴木誠也','suzukiseiya@gmail.com','2024-08-20 11:43:45.443612','2024-08-20 11:43:45.443612','$2a$12$fqdCkQ0MclqqIaNMM71QKOhT5mgh8DamF.iQE/aUpaJONdwpo9l5a');
INSERT INTO users VALUES(3,'トラウト','torauto@gmail.com','2024-08-20 11:52:40.243154','2024-08-20 11:52:40.243154','$2a$12$sdpgjeJSFsFMP/NTlng2vO2hFyWd.u9R9cuorXyi3d5.jDSMWQMM.');
CREATE TABLE IF NOT EXISTS "reviews" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "post_id" integer, "point" integer, "comment" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO reviews VALUES(39,3,1,5,'面白かった','2024-08-20 11:55:17.931109','2024-08-20 11:55:17.931109');
INSERT INTO reviews VALUES(40,1,3,5,'面白かった','2024-08-21 05:27:31.303345','2024-08-21 05:27:31.303345');
INSERT INTO reviews VALUES(42,1,3,3,'あまり面白くなかった','2024-08-21 05:27:57.756392','2024-08-21 05:27:57.756392');
CREATE TABLE IF NOT EXISTS "likes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "post_id" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO likes VALUES(40,3,1,'2024-08-20 11:55:37.977023','2024-08-20 11:55:37.977023');
INSERT INTO likes VALUES(41,3,2,'2024-08-20 11:55:40.455825','2024-08-20 11:55:40.455825');
INSERT INTO likes VALUES(42,2,1,'2024-08-20 11:57:36.770247','2024-08-20 11:57:36.770247');
INSERT INTO likes VALUES(43,2,5,'2024-08-20 11:58:19.670067','2024-08-20 11:58:19.670067');
INSERT INTO likes VALUES(44,1,3,'2024-08-21 05:26:57.895750','2024-08-21 05:26:57.895750');
INSERT INTO likes VALUES(45,1,4,'2024-08-21 05:27:02.068372','2024-08-21 05:27:02.068372');
INSERT INTO likes VALUES(46,1,5,'2024-08-21 05:28:15.966144','2024-08-21 05:28:15.966144');
CREATE TABLE IF NOT EXISTS "posts" ("id" integer NOT NULL PRIMARY KEY, "content" text DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "user_id" integer DEFAULT NULL, "title" varchar DEFAULT NULL, "genre" varchar DEFAULT NULL, "image" varchar DEFAULT NULL, "point" integer DEFAULT NULL);
INSERT INTO posts VALUES(1,replace(replace('天人(宇宙人)が来襲して、価値観が変わってしまった町、江戸。宇宙人や高層ビル、バイクなど何でもありの世界で変わらない“魂”を持った最後のサムライがいた。男の名は坂田銀時。いい加減で無鉄砲、でもキメるところはさりげなくキメたりして…。笑えて、泣けて、心温まる、銀さんと仲間たちの生き様、得とご覧あれ！\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:41:24.658378','2024-08-20 11:41:24.658378',1,'銀魂','コメディー','image/upload/v1724154088/pjicv2navtvxo5a6fnfa.png',99);
INSERT INTO posts VALUES(2,replace(replace('家柄も人柄も良し!!将来を期待された秀才が集う秀知院学園!!その生徒会で出会った、副会長・四宮かぐやと会長・白銀御行は互いに惹かれているはずだが…何もないまま半年が経過!!プライドが高く素直になれない2人は、面倒臭いことに“如何に相手に告白させるか”ばかりを考えるようになってしまった!?恋愛は成就するまでが楽しい!!新感覚“頭脳戦”ラブコメ、開戦!!\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:42:36.025061','2024-08-20 11:42:36.025061',1,'かぐや様は告らせたい～天才たちの恋愛頭脳戦～','コメディー','image/upload/v1724154158/dxnboipf7ssv8hm2scl9.png',78);
INSERT INTO posts VALUES(3,replace(replace('サラリーマン三上悟は通り魔に刺され死亡し、気がつくと異世界に転生していた。ただし、その姿はスライムだった！リムルという新しいスライム人生を得て、さまざまな種族がうごめくこの世界に放り出され、「種族問わず楽しく暮らせる国作り」を目指すことになる――！\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:45:40.469426','2024-08-20 11:45:40.469426',2,'転生したらスライムだった件','アクション','image/upload/v1724154342/anuuptyyl3d4ks2ydr27.png',89);
INSERT INTO posts VALUES(4,replace(replace('時は大正、日本。炭を売る心優しき少年・炭治郎は、ある日鬼に家族を皆殺しにされてしまう。さらに唯一生き残った妹の襧豆子は鬼に変貌してしまった。絶望的な現実に打ちのめされる炭治郎だったが、妹を人間に戻し、家族を殺した鬼を討つため、“鬼狩り”の道を進む決意をする。人と鬼とが織りなす哀しき兄妹の物語が、今、始まる――！　※2019年放送のテレビシリーズになります。\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:46:30.207160','2024-08-20 11:46:30.207160',2,'鬼滅の刃','アクション','image/upload/v1724154392/ctcr501b5idpe1fo9eyv.png',67);
INSERT INTO posts VALUES(5,replace(replace('人気のVRMMO「NewWorld Online」に超大型新人現る⁉あらゆる攻撃を無効化し、致死毒スキルでモンスターもプレイヤーも徹底蹂躙！異常な戦いぶりから「歩く要塞」とも「ラスボス」とも呼ばれるそのプレイヤーの正体は、ただの美少女初心者だった！何を隠そうこのメイプルは、友人のサリーに勧められてゲームをスタートさせたばかり。ゲーム知識に乏しく、ステータスポイントをVIT（防御力）に極振りしてしまい、最初はザコモンスターにすら翻弄される始末だったが……。痛っ......くない!?モンスターにどつき回されてもダメージゼロ、さらには運良く一撃必殺のカウンタースキルまで手に入れてしまう！ひと癖もふた癖もある仲間たちも加わり、ますます成長していくメイプル。ノーダメージな大冒険が幕を開ける！\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:53:45.099120','2024-08-20 11:53:45.099120',3,'痛いのは嫌なので防御力に極振りしたいと思います。','SF','image/upload/v1724154828/tuhhl2h2e17cldsm9gny.png',78);
INSERT INTO posts VALUES(6,replace(replace('全人類が、謎の現象により一瞬で石化して数千年――。超人的な頭脳を持つ、根っからの科学少年・千空が目覚めた。文明が滅んだ石の世界(ストーンワールド)を前に、千空は、科学の力で世界を取り戻すことを決意。時を同じくしてよみがえった、体力自慢の幼馴染・大木大樹はじめ、仲間たちと、ゼロから文明を作り出していく――石器時代から現代文明まで、科学史200万年を駆け上がる！前代未聞のクラフト冒険譚(アドベンチャー)、ここに開幕！\r\n\r\n','\r',char(13)),'\n',char(10)),'2024-08-20 11:54:50.322809','2024-08-20 11:54:50.322809',3,'Ｄｒ．ＳＴＯＮＥ','SF','image/upload/v1724154893/gh1t6x0v0hwalivvbytm.png',87);
CREATE TABLE IF NOT EXISTS "helps" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "review_id" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "post_id" integer);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('reviews',42);
INSERT INTO sqlite_sequence VALUES('likes',46);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
COMMIT;
