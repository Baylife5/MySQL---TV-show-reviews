SELECT genre, 
       
       ROUND(avg(rating),2) as "average genre review"

    FROM series
    
    INNER JOIN reviews ON  series.id = reviews.series_id 
    
    GROUP BY genre 
    
    ORDER BY avg(rating) desc; 


SELECT title,

        ROUND(AVG(rating),2) AS "average show review"

    FROM series INNER JOIN reviews ON series.id = reviews.series_id

    GROUP BY title;



SELECT CONCAT(f_name, " ", l_name) AS reviewer,

        IFNULL(COUNT(reviews.reviewer_id),0) as Count,

        IFNULL(MIN(rating),0.00) as Min, 

        IFNULL(MAX(rating),0.00)as Max, 
        
        IFNULL(ROUND(AVG(rating)),0.00) as Average,

    CASE
    
        WHEN count(reviews.reviewer_id) < 1 THEN 'INACTIVE'
        
        ELSE 'ACTIVE'
        
    END AS 'STATUE'

FROM  reviewer

LEFT JOIN reviews ON reviewer.id = reviews.reviewer_id
    
GROUP BY l_name, f_name
    
ORDER BY l_name DESC;


SELECT title, 
       rating,
       concat(f_name,' ',l_name) AS reviewer

    FROM reviews
    
    INNER JOIN reviewer ON reviews.reviewer_id = reviewer.id
    
    INNER JOIN series ON reviews.series_id = series.id
    
    ORDER BY title, rating DESC;



SELECT CONCAT(f_name, " ", l_name) AS "reviewer",

       IFNULL(rating, "NO REVIEW") AS "NO REVIEW GIVEN"

    FROM reviewer

    LEFT JOIN reviews ON reviewer.id = reviews.reviewer_id

    WHERE rating IS NULL;



SELECT genre,

       ROUND(AVG(rating),2) AS "rating by genre"

    FROM series 

    INNER JOIN reviews ON series.id = reviews.series_id
    
    GROUP BY genre;







