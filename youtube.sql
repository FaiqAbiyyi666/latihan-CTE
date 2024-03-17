-- Membuat database youtube

create database youtube;

-- Membuat table users
create table users (
id bigserial primary key, 
name varchar(255) not null, 
email varchar(255) not null);

-- Membuat table channels
create table channels (
id bigserial primary key, 
name varchar(255) not null, 
description text, 
id_user int not null);

-- Membuat table subscriptions
create table subscriptions (
id bigserial primary key,
id_user int not null,
id_channel int not null);

-- Membuat table likes
create table likes (
id_like bigserial primary key,
id_user int not null,
id_video int not null);

-- Membuat table videos
create table videos (
id bigserial primary key,
title varchar(255) not null,
description text,
channel_id int not null);

-- Membuat table comments
create table comments (
id bigserial primary key,
user_id int not null,
video_id int not null,
comment varchar(255) not null);

-- membuat data channels
INSERT INTO channels (name_channel, description, user_id) VALUES
    ('Bagus Moto Vlog', 'Ayo riding bareng gweh!', 1),
    ('Dewangga Gaming', 'By one headshot', 2),
    ('Rama', 'Channel paling biasa', 3);

-- membuat data videos
INSERT INTO videos (title, channel_id) VALUES
    ('senggolan bareng angkot', 1),
    ('sunmori bareng ke bali', 1),
    ('nabrak atap rumah', 1),
    ('disalip truk sedot wc', 1),
    ('Unboxing scoopy', 1),
    ('Road to radiant #1 - Valorant', 2),
    ('Mabar epep', 2),
    ('bocil kematian', 2),
    ('by one alok menang give diamond', 2),
    ('gift alok', 2),
    ('3 Jam Ga Ngapa-ngapain', 3),
    ('tutorial memotong kuku pakai tangan kiri', 3),
    ('ojol game ', 3),
    ('tutorial bernafas', 3),
    ('cara restart komputer', 3);

-- subscription
INSERT INTO subscriptions (channel_id, user_id) VALUES
    (2, 1),
    (1, 2),
    (1, 3),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 2),
    (3, 4),
    (3, 6);

-- membuat data likes
INSERT INTO likes (video_id, user_id) VALUES
    (13, 6),
    (2, 3),
    (13, 1),
    (10, 2),
    (4, 1),
    (7, 1),
    (11, 1),
    (11, 4),
    (12, 1),
    (9, 4),
    (5, 2),
    (1, 1),
    (11, 2),
    (6, 5),
    (1, 3),
    (15, 4),
    (1, 6),
    (4, 2),
    (13, 2),
    (3, 6),
    (2, 2),
    (14, 6),
    (15, 2),
    (4, 3),
    (12, 4),
    (11, 6),
    (5, 4),
    (14, 4),
    (8, 4),
    (5, 3),
    (4, 4),
    (12, 2),
    (13, 3),
    (9, 6),
    (6, 4),
    (6, 3),
    (8, 2),
    (9, 5),
    (2, 5),
    (14, 1),
    (5, 6),
    (12, 3),
    (1, 2),
    (7, 5),
    (14, 2);

-- membuat data comments
INSERT INTO comments (video_id, user_id, comment) VALUES
    (15, 5, 'amazing content!'),
    (4, 4, 'love this video!'),
    (11, 3, 'great job, keep it up!'),
    (10, 6, 'awesome video, thank you!'),
    (2, 1, 'this is fantastic, wow!'),
    (1, 2, 'impressive work, well done!'),
    (4, 1, 'incredible content as always.'),
    (13, 1, 'you''re killing it, so good!'),
    (14, 2, 'loved every second of it.'),
    (14, 6, 'absolutely brilliant, loved it!'),
    (10, 5, 'you never disappoint, amazing!'),
    (3, 4, 'this made my day, thanks!'),
    (9, 4, 'so entertaining, loved watching!'),
    (1, 1, 'can''t stop watching, it''s addicting!'),
    (5, 4, 'you''re so talented, great job!'),
    (8, 4, 'this deserves more views, amazing!'),
    (15, 4, 'just subscribed, love your content!'),
    (8, 3, 'keep making more, i''m hooked!'),
    (5, 2, 'you''re so creative, love it!'),
    (1, 5, 'instantly liked and subscribed!'),
    (13, 6, 'speechless, this is incredible!'),
    (5, 5, 'mind blown, that was amazing!'),
    (11, 5, 'you''re so underrated, great work!'),
    (2, 3, 'this deserves to go viral!'),
    (8, 5, 'so entertaining, loved every second!'),
    (13, 3, 'so much talent, keep it up!'),
    (5, 1, 'can''t wait for the next one!'),
    (12, 3, 'this was so much fun to watch!'),
    (9, 5, 'best video i''ve seen today!'),
    (2, 6, 'you''re a natural, great job!'),
    (1, 3, 'you''re going places, amazing!'),
    (13, 2, 'so impressive, well done!'),
    (7, 6, 'so good, watched it twice!'),
    (9, 1, 'this made me smile, thank you!'),
    (6, 5, 'you''re so creative and talented!'),
    (14, 1, 'this is gold, loved it!'),
    (3, 1, 'so relatable, great content!'),
    (6, 2, 'so entertaining, loved every moment!'),
    (11, 2, 'you''re such an inspiration, keep it up!'),
    (10, 2, 'can''t get enough of your videos!'),
    (12, 6, 'this brightened my day, thank you!'),
    (12, 2, 'this deserves all the love!'),
    (4, 5, 'you''re doing amazing, keep it up!'),
    (15, 1, 'i''m obsessed with your content!'),
    (14, 3, 'this is the content i needed!');