# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# user = User.create(
#   email: "bla@blah.com",
#   password: "123456"
# )

# 12.times do
#   User.create(
#   email: Faker::Internet.email,
#   password: "123456"
# )
# end

# User.destroy_all
Spaceship.destroy_all


spaceship_image_paths = [
  "app/assets/images/spaceships/spaceship_01.jpg",
  "app/assets/images/spaceships/spaceship_02.jpg",
  "app/assets/images/spaceships/spaceship_03.jpg",
  "app/assets/images/spaceships/spaceship_04.jpg",
  "app/assets/images/spaceships/spaceship_05.jpg",
  "app/assets/images/spaceships/spaceship_06.jpg",
  "app/assets/images/spaceships/spaceship_07.jpg",
  "app/assets/images/spaceships/spaceship_08.jpg",
  "app/assets/images/spaceships/spaceship_09.jpg",
  "app/assets/images/spaceships/spaceship_10.jpg",
  "app/assets/images/spaceships/spaceship_11.jpg",
  "app/assets/images/spaceships/spaceship_12.jpg"
]

spaceship_image_paths.each do |image_path|
  new_spaceship = Spaceship.create(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),
    # Assign a user_id to the spaceship, adjust as needed
    user_id: User.all.pluck(:id).sample
  )

  # Attach the local image to the spaceship
  File.open(image_path, 'rb') do |file|
    new_spaceship.photo.attach(io: file, filename: File.basename(image_path), content_type: "image/jpg")
  end

  new_spaceship.save
end
