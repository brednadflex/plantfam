puts "Destroying all users and profiles"
Profile.destroy_all
User.destroy_all

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
  address: Faker::Address.street_address,
  sitter: true,
  advisor: true
)
puts "Claudiu's profile was created..."

# Barney
barney = User.create(email: "barney@barney.com", password: "barney123")
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
puts "Barney's profile was created..."

# Jal
jal = User.create(email: "jal@jal.com", password: "jal123")
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
puts "Jal's profile was created..."

# Julian
julian = User.create(email: "julian@julian.com", password: "julian123")
profile_julian = julian.profile.update!(
  first_name: "Julian",
  last_name: "Thompson",
  description: "A plant? What the hell is even that?",
  profile_img: "https://avatars.githubusercontent.com/u/80887245?s=400&u=a2a1d4d27a7a628a5eebb5fa888fe55fbaa6dd00&v=4",
  experience: "Seedling",
  avg_rating: 3.9,
  address: Faker::Address.street_address,
  sitter: true,
  advisor: true
)
puts "Julian's profile was created..."

# Random users
puts "Creating 50 sample users with profiles..."
50.times do
  new_user = User.create!(
    email: Faker::Internet.email,
    password: "new123"
  )
  profile_new_user = new_user.profile.update!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  profile_img: Faker::Avatar.image,
  description: Faker::ChuckNorris.fact,
  experience: ["Seedling", "Plant Friend", "Moss Person", "Plant Whisperer"].sample,
  avg_rating: (1..4).to_a.sample + [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].sample,
  address: Faker::Address.full_address,
  sitter: [true, false].sample,
  advisor: [true, false].sample
  )
end
puts "50 sample users were created."
