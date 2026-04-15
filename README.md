# BBCarRental

## 🚗 BB Car Rental
Jednoduchá CRUD aplikace v Ruby on Rails pro správu pronájmu aut. Projekt umožňuje evidovat uživatele, vozový park a vytvářet rezervace.

## 📝 Popis projektu
Aplikace slouží k základní správě autopůjčovny. Obsahuje tři propojené modely:
* Uživatelé: Správa zákazníků (Jméno, Email).
* Auta: Databáze vozidel dostupných k pronájmu.
* Rezervace: Propojení uživatele a auta s definovaným termínem (Od–Do).
Aplikace obsahuje validace pro povinná pole a logickou kontrolu termínů (datum ukončení musí být po datu začátku). Součástí je také dynamické řazení v tabulkách a možnost filtrování rezervací.

## 🛠 Tech Stack
* Ruby: 3.3.6
* Databáze: MySQL (adapter mysql2)
* Styling: Čisté CSS bez externích frameworků

## 🚀 Rychlý start
* ```bundle install```
* Nastavit přístup k MySQL v ```config/database.yml```.
* ```rails db:setup``` (vytvoří DB, spustí migrace a nahraje vzorová data).
* ```rails server```
