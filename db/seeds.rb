# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing records
User.delete_all
CastMember.delete_all
Production.delete_all
Ticket.delete_all

# Create Productions
p1 = Production.create!(
  title: "The Phantom of the Opera",
  genre: "Musical",
  description: "A disfigured musical genius lives in the sewers beneath a Paris opera house.",
  budget: 2000000.0,
  image: "phantom.jpg",
  director: "Andrew Lloyd Webber",
  ongoing: true
)

p2 = Production.create!(
  title: "Romeo and Juliet",
  genre: "Drama",
  description: "A tragic love story between two young lovers from feuding families.",
  budget: 1500000.0,
  image: "romeo_and_juliet.jpg",
  director: "William Shakespeare",
  ongoing: false
)

p3 = Production.create!(
  title: "Hamilton",
  genre: "Historical Musical",
  description: "The life and times of Alexander Hamilton told through rap and musical theater.",
  budget: 3000000.0,
  image: "hamilton.jpg",
  director: "Lin-Manuel Miranda",
  ongoing: true
)

puts "#{Production.count} productions created successfully."

# Create Users
u1 = User.create!(username: "john_doe", email: "john@example.com", password: "password1")
u2 = User.create!(username: "jane_smith", email: "jane@example.com", password: "password2")
u3 = User.create!(username: "alice_wonder", email: "alice@example.com", password: "password3")

puts "#{User.count} users created successfully."

# Create Cast Members
CastMember.create!(name: "Christine Daaé", role: "Soprano", production_id: p1.id)
CastMember.create!(name: "The Phantom", role: "Baritone", production_id: p1.id)
CastMember.create!(name: "Raoul", role: "Tenor", production_id: p1.id)

CastMember.create!(name: "Romeo", role: "Lead", production_id: p2.id)
CastMember.create!(name: "Juliet", role: "Lead", production_id: p2.id)
CastMember.create!(name: "Mercutio", role: "Supporting", production_id: p2.id)

CastMember.create!(name: "Alexander Hamilton", role: "Lead", production_id: p3.id)
CastMember.create!(name: "Aaron Burr", role: "Supporting", production_id: p3.id)
CastMember.create!(name: "Eliza Hamilton", role: "Supporting", production_id: p3.id)

puts "#{CastMember.count} cast members created successfully."

# Create Tickets
Ticket.create!(production_id: p1.id, user_id: u1.id, price: 100.0)
Ticket.create!(production_id: p1.id, user_id: u2.id, price: 120.0)
Ticket.create!(production_id: p1.id, user_id: u3.id, price: 110.0)

Ticket.create!(production_id: p2.id, user_id: u1.id, price: 80.0)
Ticket.create!(production_id: p2.id, user_id: u2.id, price: 90.0)
Ticket.create!(production_id: p2.id, user_id: u3.id, price: 85.0)

Ticket.create!(production_id: p3.id, user_id: u1.id, price: 150.0)
Ticket.create!(production_id: p3.id, user_id: u2.id, price: 160.0)
Ticket.create!(production_id: p3.id, user_id: u3.id, price: 155.0)

puts "#{Ticket.count} tickets created successfully."
