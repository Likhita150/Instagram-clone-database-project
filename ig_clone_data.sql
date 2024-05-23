-- We want to reward the user who has been around the longest, Find the 5 oldest users. 
select * from users 
order by created_at limit 5; 
-- To target inactive users in an email ad campaign, find the users who have never posted a photo. 
 SELECT * FROM  users
LEFT JOIN  photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
SELECT username,count(photo_id) as total_likes
FROM photos
INNER JOIN users ON photos.user_id = users.id
INNER JOIN likes ON photos.id = likes.photo_id
GROUP BY username
ORDER BY total_likes DESC
LIMIT 1;

-- The investors want to know how many times does the average user post. 
select (select count(*) from photos) / (select count(*) from users) as avg_posts_by_users;

-- A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
SELECT tag_name,count(*) as total_tags from tags
INNER JOIN photo_tags ON tags.id  = photo_tags.tag_id
GROUP BY tag_name
ORDER BY total_tags DESC
LIMIT 5;

-- To find out if there are bots, find users who have liked every single photo on the site.
select username, count(*) as total_likes from users inner join likes on likes.user_id = users.id 
group by username having  total_likes = (select count(*) from photos) 
order by total_likes desc;

-- Find the users who have created instagramid in may and select top 5 newest joinees from it?
select username from users where month(created_at) = 5 order by created_at limit 5;

-- Can you help me find the users whose name starts with c and ends with any number and have posted the photos as well as liked the photos? 
SELECT username,count(*) AS total FROM users
INNER JOIN photos ON users.id = photos.user_id
INNER JOIN likes ON users.id=likes.user_id
GROUP BY  username
HAVING  username REGEXP '^C.*$'; 

-- Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5.
SELECT username,count(user_id) AS total
FROM users
INNER JOIN photos  ON users.id = photos.user_id
GROUP BY username
HAVING total BETWEEN 3 And 5
ORDER BY total asc
LIMIT 30;

































