-- Nomor 1
WITH user_subs AS (
    select user_id, count(user_id) from subscriptions group by user_id 
), user_likes AS (
    select user_id, count(user_id) from likes group by user_id 
), user_comment AS (
    select user_id, count(user_id) from comments group by user_id 
)
select 
    users.id_user, users.name_user, users.email_user,
    user_subs.count as subscribes,
    user_likes.count as likes,
    user_comment.count as comments
from users
left join user_subs on user_subs.user_id = users.id_user
left join user_likes on user_likes.user_id = users.id_user
left join user_comment on user_comment.user_id = users.id_user
order by id_user;

---------+-----------+--------------------+------------+-------+----------
 id_user | name_user |     email_user     | subscribes | likes | comments
---------+-----------+--------------------+------------+-------+----------
       1 | bagus     | bagus@gmail.com    |          1 |     7 |        9
       2 | dewangga  | dewangga@gmail.com |          2 |    11 |        8
       3 | rama      | rama@gmail.com     |          2 |     7 |        7
       4 | balya     | balya@gmail.com    |          2 |     9 |        6
       5 | faiq      | faiq@gmail.com     |          1 |     4 |        9
       6 | regis     | regis@gmail.com    |          1 |     7 |        6


-- Nomor 2
WITH channel_subs AS (
    select channel_id, count(channel_id) from subscriptions group by channel_id 
), channel_videos AS (
    select channel_id, count(channel_id) from videos group by channel_id 
)
select 
    channels.id_channel, channels.name_channel, 
    channels.description, 
    users.name_user as owner,
    channel_subs.count as subscribes,
    channel_videos.count as videos
from channels
left join users on channels.user_id = users.id_user
left join channel_subs on channel_subs.channel_id = channels.id_channel
left join channel_videos on channel_videos.channel_id = channels.id_channel
order by id_channel;

------------+-----------------+-------------------------+----------+------------+--------
 id_channel |  name_channel   |       description       |  owner   | subscribes | videos
------------+-----------------+-------------------------+----------+------------+--------
          1 | Bagus Moto Vlog | Ayo riding bareng gweh! | bagus    |          2 |      5
          2 | Dewangga Gaming | By one headshot         | dewangga |          4 |      5
          3 | Rama            | Channel paling biasa    | rama     |          3 |      5


-- Nomor 3
WITH video_likes AS (
    select video_id, count(video_id) from likes group by video_id 
), video_comments AS (
    select video_id, count(video_id) from comments group by video_id 
)
select
    videos.id_video, videos.title, videos.description,
    video_likes.count as likes,
    video_comments.count as comments
from videos
left join video_likes on video_likes.video_id = videos.id_video
left join video_comments on video_comments.video_id = videos.id_video
order by id_video;

----------+------------------------------------------+-------------+-------+----------
 id_video |                  title                   | description | likes | comments
----------+------------------------------------------+-------------+-------+----------
        1 | senggolan bareng angkot                  |             |     4 |        4
        2 | sunmori bareng ke bali                   |             |     3 |        3
        3 | nabrak atap rumah                        |             |     1 |        2
        4 | disalip truk sedot wc                    |             |     4 |        3
        5 | Unboxing scoopy                          |             |     4 |        4
        6 | Road to radiant #1 - Valorant            |             |     3 |        2
        7 | Mabar epep                               |             |     2 |        1
        8 | bocil kematian                           |             |     2 |        3
        9 | by one alok menang give diamond          |             |     3 |        3
       10 | gift alok                                |             |     1 |        3
       11 | 3 Jam Ga Ngapa-ngapain                   |             |     4 |        3
       12 | tutorial memotong kuku pakai tangan kiri |             |     4 |        3
       13 | ojol game                                |             |     4 |        4
       14 | tutorial bernafas                        |             |     4 |        4
       15 | cara restart komputer                    |             |     2 |        3