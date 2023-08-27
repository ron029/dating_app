# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      mobile_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      birthdate: Faker::Date.between(from: 40.years.ago, to: 18.years.ago),
      gender: ['male','female'].sample,
      sexual_orientation: ['male','female'].sample,
      country: Faker::Address.country,
      state_region: Faker::Address.state,
      city: Faker::Address.city,
      school: Faker::University.name,
      bio: Faker::Lorem.paragraph,
      admin: 0, # For regular users
      password: 'password', # You might want to hash passwords in a real scenario
      password_confirmation: 'password'
    )
  end

  # Create some likes and dislikes
  # User.all.each do |user|
  #   other_users = User.where.not(id: user.id).sample(100) # Choose 100 random users to like/dislike
  #   other_users.each do |other_user|
  #     if [true, false].sample # Simulate random likes and dislikes
  #       # Like.create(liking_user: user, liked_user: other_user)
  #     else
  #       Dislike.create(disliking_user_id: user, disliked_user_id: other_user)
  #     end
  #   end
  # end
  

# User.all.each do |user|
#   user.update(sexual_orientation: user.gender)
# end

# Like.all.each do |like|
#   # Check if there is a mutual like (both users liked each other)
#   mutual_like = Like.find_by(
#     liking_user_id: like.liked_user.id,
#     liked_user_id: like.liker.id
#   )

#   if mutual_like
#     Match.create!(
#       liking_user_id: like.liker.id,
#       liked_user_id: like.liked_user.id
#     )
#   end
# end