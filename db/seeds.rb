puts "Destroying all users and profiles"
Availability.destroy_all
Message.destroy_all
ChatRoom.destroy_all
Booking.destroy_all
Profile.destroy_all
User.destroy_all


user_images = [
  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1592124549776-a7f0cc973b24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1557296387-5358ad7997bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1554384645-13eab165c24b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1593529467220-9d721ceb9a78?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1545996124-0501ebae84d0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1560787313-5dff3307e257?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1571816119607-57e48af1caa9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1552058544-f2b08422138a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"
]

# Claudiu
puts 'Creating users...'
claudiu = User.create!(email: "claudiu@claudiu.com", password: "claudiu123")
profile_claudiu = claudiu.profile.update!(
  first_name: "Claudiu",
  last_name: "Florin Popa",
  profile_img: "https://avatars.githubusercontent.com/u/81229662?v=4",
  description: "I'm in love with plants and enjoy taking care of them.",
  experience: "Plant Whisperer",
  avg_rating: 4.8,
  address: "An der Urania 5, 10787 Berlin",
  sitter: true,
  advisor: true
)
if claudiu.profile.sitter
  Availability.create(start_date: "2021-08-01" , end_date: "2021-08-31" , profile: claudiu.profile)
end
puts "Claudiu's profile was created..."

# Barney
barney = User.create!(email: "barney@barney.com", password: "barney123")
profile_barney = barney.profile.update!(
  first_name: "Barney",
  last_name: "Haas",
  description: "Plants are just the best and I just can't hide it.",
  profile_img: "https://avatars.githubusercontent.com/u/77109548?v=4",
  experience: "Plant Whisperer",
  avg_rating: 4.5,
  address: Faker::Address.street_address,
  sitter: true,
  advisor: true
)
if barney.profile.sitter
  Availability.create(start_date: "2021-08-01" , end_date: "2021-08-31" , profile: barney.profile)
end
puts "Barney's profile was created..."

# Jal
jal = User.create!(email: "jal@jal.com", password: "jal123")
profile_jal= jal.profile.update!(
  first_name: "Jalynn",
  last_name: "Ridley",
  description: "I take care of my plants as if they were my own children. Let's have a plant chat!",
  profile_img: "https://avatars.githubusercontent.com/u/72085091?v=4",
  experience: "Seedling",
  avg_rating: 4.6,
  address: Faker::Address.street_address,
  sitter: true,
  advisor: true
)
if jal.profile.sitter
  Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: jal.profile)
end
puts "Jal's profile was created..."

# Julian
julian = User.create!(email: "julian@julian.com", password: "julian123")
profile_julian = julian.profile.update!(
  first_name: "Julian",
  last_name: "Thompson",
  description: "A plant? What the hell is even that?",
  profile_img: "https://avatars.githubusercontent.com/u/80887245?s=400&u=a2a1d4d27a7a628a5eebb5fa888fe55fbaa6dd00&v=4",
  experience: "Seedling",
  avg_rating: 4.2,
  address: Faker::Address.street_address,
  sitter: true,
  advisor: true
)
if julian.profile.sitter
  Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: julian.profile)
end
puts "Julian's profile was created..."

# Random users
puts "Creating 30 sample users with profiles..."
30.times do
  new_user = User.create!(
    email: Faker::Internet.email,
    password: "new123"
  )
  profile_new_user = new_user.profile.update!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  profile_img: user_images.sample,
  description: Faker::ChuckNorris.fact,
  experience: ["Seedling", "Plant Friend", "Moss Person", "Plant Whisperer"].sample,
  avg_rating: (3..4).to_a.sample + [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].sample,
  address: Faker::Address.full_address,
  sitter: [true, false].sample,
  advisor: [true, false].sample
  )
  if new_user.profile.sitter
    Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: new_user.profile)
  end
end
puts "30 sample users were created."

puts "Creating even more sample users with profiles..."
30.times do
  new_user = User.create!(
    email: Faker::Internet.email,
    password: "new123"
  )
  profile_new_user = new_user.profile.update!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  profile_img: user_images.sample,
  description: Faker::ChuckNorris.fact,
  experience: ["Seedling", "Plant Friend", "Moss Person", "Plant Whisperer"].sample,
  avg_rating: (3..4).to_a.sample + [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].sample,
  address: Faker::Address.full_address,
  sitter: [true, false].sample,
  advisor: [true, false].sample
  )
  if new_user.profile.sitter
    Availability.create(start_date: "2021-08-01" , end_date: "2021-08-31" , profile: new_user.profile)
  end
end
puts "30 additional sample users were created."
