/* We want to reward the user who has been around the longest,Find the 5 oldest user */
SELECT USERNAME,DATE(CREATED_AT) FROM USERS ORDER BY 2 LIMIT 5;  /*TASK2*/

/*To target the inactive users in an email ad campaign,find the users who has never posted the photos  T3 */ 
SELECT U.USERNAME,U.ID FROM USERS U WHERE U.ID NOT IN (SELECT DISTINCT P.USER_ID FROM PHOTOS P);


/*Suppose you are running a contest to find out who got the most like on a photo.Find out who won     T4 */
SELECT COUNT(L.PHOTO_ID),U.USERNAME FROM LIKES L 
INNER JOIN USERS U GROUP BY L.USER_ID,U.USERNAME ORDER BY 1 DESC LIMIT 1;  /*TASK4*/

/*The investor wants to know how many time the average user post                                       T5 */
SELECT AVG(P.ID) FROM PHOTOS P ;    

/*A brand wants to know which hashtag to use on a post and find the 5 top most use hashtags              T6    */
SELECT COUNT(PT.TAG_ID),PT.TAG_ID,T.TAG_NAME FROM PHOTO_TAGS PT INNER JOIN TAGS T ON PT.TAG_ID=T.ID
 GROUP BY PT.TAG_ID ORDER BY 1 DESC LIMIT 5; 

/*To find out if there are bots,find users who have liked every single photo on the site                  T7  */
SELECT DISTINCT U.ID  FROM USERS U WHERE U.ID <> ALL (SELECT L.USER_ID FROM LIKES L  
  INNER JOIN PHOTOS P ON L.USER_ID=P.ID);

/*Find the users who have created instagramid in the month of may and select top 5 newest joinees from it   T8  */
CREATE VIEW V_UINSTA AS
(SELECT U.USERNAME FROM USERS U WHERE MONTHNAME(DATE(U.CREATED_AT))='MAY')
 UNION 
 (SELECT U.USERNAME FROM USERS U WHERE DATE(U.CREATED_AT) ORDER BY DATE(U.CREATED_AT) DESC LIMIT 5); 
SELECT V.* FROM V_UINSTA V;

/* Can you help me find users whose name starts with c and ends with any number 
and have posted the photos as well as liked the photos?                                                T9*/  
CREATE VIEW V_U_POSTED_LIKED AS
SELECT COUNT(P.USER_ID) AS NUM_USER,P.USER_ID  FROM PHOTOS P INNER JOIN LIKES L 
ON P.USER_ID=L.USER_ID GROUP BY P.USER_ID; SELECT V.* FROM V_U_POSTED_LIKED V;
SELECT V.USER_ID,U.USERNAME FROM V_U_POSTED_LIKED V INNER JOIN USERS U ON U.ID=V.USER_ID WHERE U.USERNAME REGEXP '^C.*[0-9]$';
   
/*Demonstrates the top 30 usernmae of the company who have posted photos in the range of 3 to 5             T10 */
SELECT P.USER_ID,U.USERNAME,COUNT(P.ID) FROM PHOTOS P
INNER JOIN USERS U ON U.ID=P.USER_ID 
GROUP BY P.USER_ID HAVING COUNT(P.ID) IN (3,4,5) LIMIT 30;