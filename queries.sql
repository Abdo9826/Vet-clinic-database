/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal where date_of_birth BETWEEN 'Jan 01 2016' AND ' Dec 31 2019';
SELECT * FROM animal WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name='Pikachu' OR name='Agumon';
SELECT name, escape_attempts FROM animal WHERE weight_kg >10.5;
SELECT * FROM animal WHERE neutered=true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3;