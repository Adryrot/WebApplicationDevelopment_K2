-- DriveSmart Integrated Academy - Database Setup (MySQL)
-- Creates database and table for Training Sessions

CREATE DATABASE IF NOT EXISTS drivesmart_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE drivesmart_db;

CREATE TABLE IF NOT EXISTS Training_Sessions (
  session_id INT NOT NULL AUTO_INCREMENT,
  student_name VARCHAR(255) NOT NULL,
  branch_location VARCHAR(255) NOT NULL,
  lesson_type VARCHAR(255) NOT NULL,
  status VARCHAR(50) NOT NULL,
  PRIMARY KEY (session_id)
) ENGINE=InnoDB;

-- Optional seed data
-- INSERT INTO Training_Sessions (student_name, branch_location, lesson_type, status)
-- VALUES ('Ali Bin Ahmad', 'Kuala Lumpur', 'Manual Car', 'Booked');

