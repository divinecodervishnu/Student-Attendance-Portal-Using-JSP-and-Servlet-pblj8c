CREATE DATABASE school;
USE school;

CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_name VARCHAR(50),
  date DATE,
  status VARCHAR(10)
);