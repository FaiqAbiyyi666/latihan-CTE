-- Nomor 1
WITH user_subs AS (
    select user_id,
        count(user_id)
    from subscriptions
    group by user_id
),
user_likes AS (
    select user_id,
        count(user_id)
    from likes
    group by user_id
),
user_comment AS (
    select user_id,
        count(user_id)
    from comments
    group by user_id
)
select users.id_user,
    users.name_user,
    users.email_user,
    user_subs.count as subscribes,
    user_likes.count as likes,
    user_comment.count as comments
from users
    left join user_subs on user_subs.user_id = users.id_user
    left join user_likes on user_likes.user_id = users.id_user
    left join user_comment on user_comment.user_id = users.id_user
order by id_user;
-- Nomor 2
WITH channel_subs AS (
    select channel_id,
        count(channel_id)
    from subscriptions
    group by channel_id
),
channel_videos AS (
    select channel_id,
        count(channel_id)
    from videos
    group by channel_id
)
select channels.id_channel,
    channels.name_channel,
    channels.description,
    users.name_user as owner,
    channel_subs.count as subscribes,
    channel_videos.count as videos
from channels
    left join users on channels.user_id = users.id_user
    left join channel_subs on channel_subs.channel_id = channels.id_channel
    left join channel_videos on channel_videos.channel_id = channels.id_channel
order by id_channel;
-- Nomor 3
WITH video_likes AS (
    select video_id,
        count(video_id)
    from likes
    group by video_id
),
video_comments AS (
    select video_id,
        count(video_id)
    from comments
    group by video_id
)
select videos.id_video,
    videos.title,
    videos.description,
    video_likes.count as likes,
    video_comments.count as comments
from videos
    left join video_likes on video_likes.video_id = videos.id_video
    left join video_comments on video_comments.video_id = videos.id_video
order by id_video;