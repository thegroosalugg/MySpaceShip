# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

# user = User.create(
#   email: "bla@blah.com",
#   password: "123456"
# )

User.destroy_all
Spaceship.destroy_all

12.times do
  User.create(
  email: Faker::Internet.email,
  password: "123456"
)
end

spaceship_urls = [
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-eros-12_sowms5.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-vixen-dynamics-shot07_hd1ov7.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-vixen-dynamics-shot11_bsxshz.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-gulf-06_zyzahc.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-vixen-dynamics-shot06_sn0aod.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700094/Spaceships/thomas-woodward-eros-indoor-06_zljft8.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-03_yzxne7.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-31_zy9yuv.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-5_j9pdbq.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-02_jewtp3.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-11_svq5ld.jpg",
  "https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/dwight-mann-tillen-soskil-3_yka8hq.jpg"
]

spaceship_urls.each do |url|
  new_spaceship = Spaceship.create(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),
    # creates an array of all the IDs of the users
    user_id: User.all.pluck(:id).sample
  )

  file = URI.open(url)
  new_spaceship.photo.attach(io: file, filename: "#{new_spaceship.name}.jpg", content_type: "image/jpg")
  new_spaceship.save
end
