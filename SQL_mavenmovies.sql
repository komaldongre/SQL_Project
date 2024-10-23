/*write a sql query to count the number of characters except for the
spaces for each actor.Return the first 10 actors name
 lengths along with their names*/

SELECT CONCAT(A.FIRST_NAME,SPACE(1),A.LAST_NAME) AS FULL_NAME,
LENGTH(CONCAT(A.FIRST_NAME,A.LAST_NAME)) AS LENTH_OF_CHARACTER,
ACTOR_ID 
FROM ACTOR A LIMIT 10;                        /*1*/

/*list all the oscar awardees with their 
fullname and the length of their names*/

SELECT CONCAT(AA.FIRST_NAME,SPACE(1),AA.LAST_NAME) FULLNAME,
LENGTH(CONCAT(AA.FIRST_NAME,SPACE(1),AA.LAST_NAME))
AS LENGTH_OF_NAME,ACTOR_ID,AWARDS
FROM ACTOR_AWARD AA WHERE AWARDS='OSCAR';     /*2*/

/*find the actors who have worked in the film frost head */

SELECT CONCAT(A.FIRST_NAME,SPACE(1),A.LAST_NAME) FULL_NAME,
F.TITLE,A.ACTOR_ID,F.FILM_ID FROM ACTOR A
INNER JOIN FILM_ACTOR FA ON A.ACTOR_ID= FA.ACTOR_ID
INNER JOIN FILM F ON FA.FILM_ID= F.FILM_ID
WHERE F.TITLE='FROST HEAD';            /*3*/  

/*pull all the film acted by the actor will wilson*/

SELECT F.TITLE,F.FILM_ID,A.ACTOR_ID,
concat(A.FIRST_NAME,space(1),A.LAST_NAME)
FROM ACTOR A INNER JOIN FILM_ACTOR FA
ON FA.ACTOR_ID=A.ACTOR_ID
INNER JOIN FILM F ON
F.FILM_ID=FA.FILM_ID
WHERE A.FIRST_NAME='WILL'AND A.LAST_NAME='WILSON';    /*4*/

/*pull all the film which were rented and return them in the month of may*/

SELECT F.TITLE,R.RENTAL_ID,R.RETURN_DATE,F.film_id
FROM FILM F INNER JOIN INVENTORY I 
ON F.FILM_ID= I.FILM_ID
INNER JOIN RENTAL R 
ON R.INVENTORY_ID= I.INVENTORY_ID
where monthname(return_date)='May';       /* 5 */

/*pull all the films with comedy category*/

SELECT F.TITLE,F.FILM_ID,CA.CATEGORY_ID,CA.NAME
FROM FILM F INNER JOIN FILM_CATEGORY FC
ON F.FILM_ID= FC.FILM_ID 
INNER JOIN CATEGORY CA ON
CA.CATEGORY_ID=FC.CATEGORY_ID
WHERE CA.NAME='COMEDY';                /* 6 */

									

