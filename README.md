# MYSQL_FULL_TEXT_SEARCH_CAPABILITIES
Exploring full-text search capabilities in MySQL to enhance text searching and retrieval in database applications.

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

![articles](https://github.com/user-attachments/assets/d32ac0d8-3436-4e57-868b-9a6fc371e590)

#Basic Full-Text Search

#To search for articles containing the word "MySQL":

SELECT *
FROM articles
WHERE MATCH(content) AGAINST('MySQL');

![q1](https://github.com/user-attachments/assets/06e638f3-6c6d-4f80-bc12-b9e706377dfd)

#Searching for Multiple Words

#To search for articles containing both "data" and "analysis":

SELECT *
FROM articles
WHERE MATCH(content) AGAINST('data analysis');

![q2](https://github.com/user-attachments/assets/a0449fdd-75a0-4946-a0f5-65a15659a073)

#Searching with Boolean Operators

#To find articles that contain "database" but not "performance":

SELECT *
FROM articles
WHERE MATCH(content) AGAINST('+database -performance' IN BOOLEAN MODE);

![q3](https://github.com/user-attachments/assets/80fc95c9-41ee-4952-a70b-d58d803b32a3)

#Ranking Search Results

SELECT *, MATCH(content) AGAINST('MySQL') AS relevance
FROM articles
WHERE MATCH(content) AGAINST('MySQL')
ORDER BY relevance DESC;

![q4](https://github.com/user-attachments/assets/bbdaba7c-aa12-4130-b38b-09f6f1b15599)

