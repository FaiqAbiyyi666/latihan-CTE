WITH subs_cnt AS (
    select user_id, count(user_id) from subscriptions group by user_id 
), likes_cnt AS (
    select user_id, count(user_id) from likes group by user_id 
), comments_cnt AS (
    select user_id, count(user_id) from comments group by user_id 
)

select 
    users.id_user, users.name_user, users.email_user,
    subs_cnt.count as subscribes,
    likes_cnt.count as likes, 
    comments_cnt.count as comments
from users
left join subs_cnt on subs_cnt.user_id = users.id_user
left join likes_cnt on likes_cnt.user_id = users.id_user
left join comments_cnt on comments_cnt.user_id = users.id_user
order by id_user;

-- Nomor 2
WITH subs_channel AS (
    select channel_id, count(channel_id) from subscriptions group by channel_id order by channel_id
), videos_channel AS (
    select channel_id, count(channel_id) from videos group by channel_id order by channel_id
)
select 
    channels.id_channel, channels.name_channel, channels.description,
    users.name_user as owner,
    subs_channel.count as subscribers,
    videos_channel.count as videos
from channels
left join users on users.id_user = channels.id_channel
left join subs_channel on subs_channel.channel_id = channels.id_channel
left join videos_channel on videos_channel.channel_id = channels.id_channel;