#Most of this code was created using LLM to avoid the tedium of creating seed data by hand. I then edited it to add more realistic data and to ensure it worked with the associations in the models.
puts "Cleaning database..."
Reservation.destroy_all
Car.destroy_all
User.destroy_all
 
puts "Creating users..."
walter = User.create!(name: "Bryan Cranston", email: "heisenberg@savewalterwhite.com")
jesse  = User.create!(name: "Aaron Paul", email: "capn_cook@yo.com")
saul   = User.create!(name: "Bob Odenkirk", email: "saul@bettercallsaul.com")
gus    = User.create!(name: "Giancarlo Esposito", email: "gus@lospolloshermanos.com")
kim    = User.create!(name: "Rhea Seehorn", email: "kim@wexler-mcgill.com")
skyler = User.create!(name: "Anna Gunn", email: "skyler@whitewash.com")
hank   = User.create!(name: "Dean Norris", email: "asac_schrader@dea.gov")
marie  = User.create!(name: "Betsy Brandt", email: "marie@purple-everything.com")
mike   = User.create!(name: "Jonathan Banks", email: "mike@madrigalelectromotive.com")
flynn  = User.create!(name: "RJ Mitte", email: "flynn@savewalterwhite.com")
lalo   = User.create!(name: "Tony Dalton", email: "lalo@salamanca.mx")
nacho  = User.create!(name: "Michael Mando", email: "ignacio@varga.com")

puts "Creating cars..."

# --- Walter White (The iconic starter SUV) ---
aztek = Car.create!(brand: "Pontiac", name: "Aztek", year: 2004, price_per_day: 35)

# --- Jesse Pinkman (His second, much more subtle ride) ---
tercel = Car.create!(brand: "Toyota", name: "Tercel", year: 1986, price_per_day: 20)

# --- Jimmy McGill / Saul Goodman (The infamous beater with the yellow door) ---
esteem = Car.create!(brand: "Suzuki", name: "Esteem", year: 1998, price_per_day: 25)

# --- Gustavo Fring (The sensible, blend-in-with-the-crowd manager wagon) ---
v70 = Car.create!(brand: "Volvo", name: "V70", year: 1998, price_per_day: 40)

# --- A common Albuquerque Street Car ---
eclipse = Car.create!(brand: "Mitsubishi", name: "Eclipse", year: 1995, price_per_day: 45)

# --- Walter White (The "Heisenberg" performance upgrade) ---
chrysler = Car.create!(brand: "Chrysler", name: "300 SRT8", year: 2012, price_per_day: 120) 

# --- A common Albuquerque Economy Rental ---
yaris = Car.create!(brand: "Toyota", name: "Yaris", year: 2007, price_per_day: 30)

# --- Jesse Pinkman ("THE CAPN" red lowrider with hydraulics) ---
monte_carlo = Car.create!(brand: "Chevrolet", name: "Monte Carlo", year: 1982, price_per_day: 80) 

# --- Todd Alquist / Jesse Pinkman (The titular car from the movie) ---
el_camino = Car.create!(brand: "Chevrolet", name: "El Camino", year: 1978, price_per_day: 75)

# --- Skyler White ---
grand_wagoneer = Car.create!(brand: "Jeep", name: "Grand Wagoneer", year: 1991, price_per_day: 55)

# --- Hank Schrader ---
commander = Car.create!(brand: "Jeep", name: "Commander", year: 2006, price_per_day: 65)

# --- Saul Goodman ---
deville = Car.create!(brand: "Cadillac", name: "DeVille", year: 1997, price_per_day: 75)

# --- Mike Ehrmantraut ---
fifth_avenue = Car.create!(brand: "Chrysler", name: "Fifth Avenue", year: 1988, price_per_day: 35)

# --- Walter Jr. (Flynn) ---
challenger = Car.create!(brand: "Dodge", name: "Challenger SRT8", year: 2012, price_per_day: 120)

# --- Marie Schrader ---
beetle = Car.create!(brand: "Volkswagen", name: "Beetle", year: 2006, price_per_day: 30)

# --- Tuco Salamanca ---
escalade = Car.create!(brand: "Cadillac", name: "Escalade EXT", year: 2008, price_per_day: 95)

# --- The Mobile Meth Lab ---
bounder = Car.create!(brand: "Fleetwood", name: "Bounder RV", year: 1986, price_per_day: 150)


puts "Creating reservations..."
Reservation.create!(
  user: walter, 
  car: aztek, 
  start_date: Date.today, 
  end_date: Date.today + 7.days
)

Reservation.create!(
  user: jesse, 
  car: tercel, 
  start_date: Date.today + 1.day, 
  end_date: Date.today + 5.days
)

Reservation.create!(
  user: saul, 
  car: esteem, 
  start_date: Date.today - 10.days, 
  end_date: Date.today - 2.days
)

Reservation.create!(
  user: walter, 
  car: chrysler, 
  start_date: Date.today + 15.days, 
  end_date: Date.today + 30.days
)

Reservation.create!(
  user: jesse, 
  car: monte_carlo, 
  start_date: Date.today - 30.days, 
  end_date: Date.today - 20.days
)
Reservation.create!(
  user: flynn, 
  car: aztek, 
  start_date: Date.today - 15.days, 
  end_date: Date.today - 8.days
)

Reservation.create!(
  user: jesse, 
  car: tercel, 
  start_date: Date.today + 10.days, 
  end_date: Date.today + 14.days
)

Reservation.create!(
  user: kim, 
  car: esteem, 
  start_date: Date.today + 5.days, 
  end_date: Date.today + 10.days
)

Reservation.create!(
  user: nacho, 
  car: monte_carlo, 
  start_date: Date.today - 10.days, 
  end_date: Date.today - 5.days
)

Reservation.create!(
  user: skyler, 
  car: grand_wagoneer, 
  start_date: Date.today - 5.days, 
  end_date: Date.today + 5.days
)

Reservation.create!(
  user: skyler, 
  car: grand_wagoneer, 
  start_date: Date.today + 15.days, 
  end_date: Date.today + 20.days
)

Reservation.create!(
  user: hank, 
  car: commander, 
  start_date: Date.today - 10.days, 
  end_date: Date.today - 2.days
)

Reservation.create!(
  user: hank, 
  car: commander, 
  start_date: Date.today + 2.days, 
  end_date: Date.today + 12.days
)

Reservation.create!(
  user: saul, 
  car: deville, 
  start_date: Date.today - 50.days, 
  end_date: Date.today - 40.days
)

Reservation.create!(
  user: mike, 
  car: fifth_avenue, 
  start_date: Date.today - 10.days, 
  end_date: Date.today + 10.days
)

Reservation.create!(
  user: flynn, 
  car: challenger, 
  start_date: Date.today + 5.days, 
  end_date: Date.today + 8.days
)

Reservation.create!(
  user: marie, 
  car: beetle, 
  start_date: Date.today - 20.days, 
  end_date: Date.today - 15.days
)

Reservation.create!(
  user: lalo, 
  car: escalade, 
  start_date: Date.today, 
  end_date: Date.today + 3.days
)

# The Mobile Meth Lab gets passed around
Reservation.create!(
  user: walter, 
  car: bounder, 
  start_date: Date.today - 60.days, 
  end_date: Date.today - 55.days
)

Reservation.create!(
  user: jesse, 
  car: bounder, 
  start_date: Date.today - 40.days, 
  end_date: Date.today - 30.days
)

# Gus plays the long game
Reservation.create!(
  user: gus, 
  car: v70, 
  start_date: Date.today - 100.days, 
  end_date: Date.today - 5.days
)

puts "Seeds created successfully! Total: #{User.count} users, #{Car.count} cars, #{Reservation.count} reservations."