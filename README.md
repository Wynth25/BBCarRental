# 🚗 BB Car Rental
A simple Ruby on Rails CRUD application for managing a car rental service. The project allows creating/editing users and reservations.

## 📝 Project Description
The application serves as a basic management system for a car rental business. It consists of three associated models:
* Users: Customer management (Name, Email).
* Cars: A database of vehicles available for rent.
* Reservations: Connects a user to a car with a defined timeframe (From–To).
The application includes validations for required fields and logical date checks (the end date must be after the start date). It also features dynamic sorting in tables and the ability to filter reservations.

## 🛠 Tech Stack
* Ruby: 3.3.6
* Database: MySQL (```mysql2``` adapter)
* Styling: Vanilla CSS without external frameworks

## 🚀 Quick Start
* ```bundle install```
* Set up MySQL access in ```config/database.yml```.
* ```rails db:setup```
* ```rails server```
