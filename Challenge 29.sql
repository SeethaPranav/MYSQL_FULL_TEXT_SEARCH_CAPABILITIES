CREATE DATABASE challenge29;
USE challenge29;

CREATE TABLE articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    content TEXT,
    FULLTEXT(content) -- Creating a full-text index on the content column
);

INSERT INTO articles (title, content) VALUES
('Understanding MySQL', 'MySQL is an open-source relational database management system. It is widely used for web applications.'),
('Getting Started with Full-Text Search', 'Full-text search in MySQL allows you to perform searches on text columns. It provides more powerful searching capabilities than LIKE.'),
('Database Optimization Techniques', 'Optimizing your database can significantly improve application performance. Regularly update statistics and use indexing.'),
('Learning SQL', 'Structured Query Language (SQL) is the standard language for managing and manipulating databases.'),
('Exploring Data Analysis', 'Data analysis involves inspecting, cleansing, transforming, and modeling data to discover useful information.');

SELECT * FROM articles;

#Basic Full-Text Search
#To search for articles containing the word "MySQL":
SELECT *
FROM articles
WHERE MATCH(content) AGAINST('MySQL');

#Searching for Multiple Words
#To search for articles containing both "data" and "analysis":
SELECT *
FROM articles
WHERE MATCH(content) AGAINST('data analysis');

#Searching with Boolean Operators
#To find articles that contain "database" but not "performance":
SELECT *
FROM articles
WHERE MATCH(content) AGAINST('+database -performance' IN BOOLEAN MODE);

#Ranking Search Results
SELECT *, MATCH(content) AGAINST('MySQL') AS relevance
FROM articles
WHERE MATCH(content) AGAINST('MySQL')
ORDER BY relevance DESC;
