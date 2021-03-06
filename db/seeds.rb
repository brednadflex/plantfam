########################################################################
# Empty Database
########################################################################
puts "Destroying all users and profiles"
Availability.destroy_all
Message.destroy_all
ChatRoom.destroy_all
Review.destroy_all
Booking.destroy_all
Profile.destroy_all
Post.destroy_all
User.destroy_all
Notification.destroy_all


########################################################################
# Users - Contributers
########################################################################
# Jal
jal = User.create!(email: "plantfamuser+jal@gmail.com", password: "jal123")
profile_jal= jal.profile.update!(
  first_name: "Jal",
  last_name: "Ridley",
  description: "I take care of my plants as if they were my own children. I have a beautiful 17 year old Madacascar often with babies up for grabs. My friends say I have too many plants but I don't believe that is possiblte. Let's connect and have a plant chat!",
  experience: "Moss Person",
  avg_rating: 4.6,
  address: "Pariser Platz, 10117, Berlin",
  sitter: true,
  advisor: true,
  sitter_price: "10€/pw",
  advisor_price: "swap"
)
jal.profile.add_profile_img!("https://avatars.githubusercontent.com/u/72085091?v=4", {overwrite: true, ext_id: 3})
jal.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: 3})
if jal.profile.sitter
  Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: jal.profile)
end
puts "Jal's profile was created..."

# David

david = User.create!(email: "plantfamuser+david@gmail.com", password: "david123")
profile_jal= jal.profile.update!(
  first_name: "Jal",
  last_name: "Ridley",
  description: "I take care of my plants as if they were my own children. I have a beautiful 17 year old Madacascar often with babies up for grabs. My friends say I have too many plants but I don't believe that is possiblte. Let's connect and have a plant chat!",
  experience: "Moss Person",
  avg_rating: 4.6,
  address: "Pariser Platz, 10117, Berlin",
  sitter: true,
  advisor: true,
  sitter_price: "10€/pw",
  advisor_price: "50€/pw"
)
david.profile.add_profile_img!("https://avatars.githubusercontent.com/u/72085091?v=4", {overwrite: true, ext_id: 3})
david.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: 3})
if david.profile.sitter
  Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: david.profile)
end
puts "David's profile was created..."

# Claudiu
puts 'Creating users...'
claudiu = User.create!(email: "plantfamuser+claudiu@gmail.com", password: "claudiu123")
profile_claudiu = claudiu.profile.update!(
  first_name: "Claudiu",
  last_name: "Florin Popa",
  description: "I'm in love with plants and enjoy taking care of them. I joined PlantFam to pass on my knowledge and to help others be worry free while they are on vacation. Plants are our babies! I specialize in desert fauna, if you have any questions!",
  experience:  "Plant Friend",
  avg_rating: 4.8,
  address: "An der Urania 5, 10787 Berlin",
  sitter: true,
  advisor: true,
  sitter_price: "5€/pd",
  advisor_price: "free"
)
claudiu.profile.add_profile_img!("https://avatars.githubusercontent.com/u/81229662?v=4", {overwrite: true, ext_id: 1})
claudiu.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: 1})
if claudiu.profile.sitter
  Availability.create(start_date: "2021-08-01" , end_date: "2021-08-31" , profile: claudiu.profile)
end
puts "Claudiu's profile was created..."

# Barney
barney = User.create!(email: "plantfamuser+barney@gmail.com", password: "barney123")
profile_barney = barney.profile.update!(
  first_name: "Barney",
  last_name: "Haas",
  description: "I've been getting in to plants more and more during the pandemic. You can book me as a sitter or advisor. Although I'm not an expert, I'll do my best!",
  experience: "Plant Whisperer",
  avg_rating: 4.5,
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  sitter: true,
  advisor: true,
  sitter_price: "donation",
  advisor_price: "swap"
)
barney.profile.add_profile_img!("https://avatars.githubusercontent.com/u/77109548?v=4", {overwrite: true, ext_id: 2})
barney.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: 2})
if barney.profile.sitter
  Availability.create(start_date: "2021-08-01" , end_date: "2021-08-31" , profile: barney.profile)
end
puts "Barney's profile was created..."


# Julian
julian = User.create!(email: "plantfamuser+julian@gmail.com", password: "julian123")
profile_julian = julian.profile.update!(
  first_name: "Julian",
  last_name: "Thompson",
  description: "A plant? What the hell is that? I am a plant newbie looking for inspiration and chats about how to not kill all plants I own. I am an apartment dweller with no balcony and want to get some life into it.  I have a green heart but a black thumb! I would love to hit you up for a chat! ",
  experience: "Seedling",
  avg_rating: 4.2,
  address: "Platz der Republik 1, 11011, Berlin",
  sitter: true,
  advisor: false,
  sitter_price: "20€/pw",
  advisor_price: "1€"
)
julian.profile.add_profile_img!("https://avatars.githubusercontent.com/u/80887245?s=400&u=a2a1d4d27a7a628a5eebb5fa888fe55fbaa6dd00&v=4", {overwrite: true, ext_id: 4})
julian.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: 4})
if julian.profile.sitter
  Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: julian.profile)
end
puts "Julian's profile was created..."


########################################################################
# Users - Random
########################################################################
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

# cloudinary upload public_ids are derived directly from the users email
# Keep the same list of emails, so images can be overwritten with each seed command
emails = [
  "elenora@reilly.co",
  "dean_maggio@jacobs-batz.com",
  "nathan_dickens@botsford.info",
  "maxine@leffler-kling.co",
  "shakita@hagenes.net",
  "emanuel@herzog.io",
  "graham@spinka-wilkinson.net",
  "wally.gislason@robel.net",
  "francis@feest.name",
  "lili_bergnaum@kub.info",
  "rosette@goldner.com",
  "damon_bruen@paucek-stehr.org",
  "tasia@pfeffer.name",
  "lindsay@fadel.biz",
  "aldo@kessler.co",
  "jackie@franecki.info",
  "patience_sanford@turcotte.name",
  "libbie@stiedemann.co",
]

addresses = [
  "Bodestraße 1-3, 10178 Berlin",
  "Bernauer Straße 111, 13355 Berlin",
  "Unter den Linden 2, 10117 Berlin",
  "Panoramastraße 1 A, 10178 Berlin",
  "Friedrichstraße 43-45, 10969 Berlin",
  "Spandauer Damm 10, 14059 Berlin",
  "Gendarmenmarkt, 10117 Berlin",
  "Lindenstraße 9-14, 10969 Berlin",
  "Trebbiner Straße 9, D-10963 Berlin-Kreuzberg",
  "Cora-Berliner-Straße 1, 10117 Berlin",
  "Str. des 17. Juni, 10785 Berlin",
  "Bodestraße 1-3, 10178 Berlin",
  "Am Lustgarten, 10178 Berlin",
  "Niederkirchnerstraße 8, 10963 Berlin",
  "Hardenbergplatz 8, 10787 Berlin",
  "Königin-Luise-Strasse 6-8, 14195 Berlin",
  "Nikolaikirchplatz, 10178 Berlin",
  "Breitscheidplatz, 10789 Berlin"
]

# Random users

puts "Creating 30 sample users with profiles..."
addresses.count.times do |index|
  # create a user according to an ordered email list
  new_user = User.create!(
    email: "plantfamuser+#{index}@gmail.com",
    password: "new123"
  )
  # create random profiles for users
  profile_new_user = new_user.profile.update!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  description: Faker::ChuckNorris.fact,
  experience: ["Seedling", "Plant Friend", "Moss Person", "Plant Whisperer"].sample,
  avg_rating: (3..4).to_a.sample + [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].sample,
  address: addresses[index],
  sitter: [true, false].sample,
  advisor: [true, false].sample,
  sitter_price: "negotiable",
  advisor_price: "free"
  )
  # upload random images. However, the image names (public_id) have a fixed order based on user's email and iteration index
  new_user.profile.add_profile_img!(user_images.sample, {overwrite: true, ext_id: index})
  new_user.profile.add_banner_img!("https://source.unsplash.com/random/900×250/?plants", {overwrite: true, ext_id: index})
  # setup user's availability
  if new_user.profile.sitter
    Availability.create(start_date: "2021-07-01" , end_date: "2021-07-31" , profile: new_user.profile)
  end
end
puts "30 sample users were created."

########################################################################
# Bookings + Reviews
########################################################################
puts "creating bookings"

# barney books jal as a sitter from June 6th til July 1st.
booking1 = Booking.new
booking1.client = barney
booking1.provider = jal
booking1.service_type = "sitter"
booking1.start_date = "2020-01-01"
booking1.end_date = "2021-01-10"
booking1.confirmed = "accepted"
booking1.completed = true
booking1.comment = "Hey would you mind taking care of my plants?"
booking1.save!

Review.create!(
  booking: booking1,
  user: barney,
  profile: jal.profile,
  content: "Jal did a great job! So great, my plants now lover her more than me!",
  rating: 4,
  recommended: true
)

# barney books claudiu as a sitter from July 2nd til July 15th.
booking2 = Booking.new
booking2.client = barney
booking2.provider = claudiu
booking2.service_type = "sitter"
booking2.start_date = "2020-02-01"
booking2.end_date = "2020-02-10"
booking2.confirmed = "accepted"
booking2.completed = true
booking2.comment = "Hey would you mind taking care of my plants?"
booking2.save

Review.create!(
  booking: booking2,
  user: barney,
  profile: claudiu.profile,
  content: "Claudiu kept my plants well watered and alive while I was on vacation.",
  rating: 3.5,
  recommended: true
)

# barney books julian as a sitter from July 15th until July 29th.
booking3 = Booking.new
booking3.client = barney
booking3.provider = julian
booking3.service_type = "sitter"
booking3.start_date = "2020-03-01"
booking3.end_date = "2020-03-10"
booking3.confirmed = "accepted"
booking3.completed = true
booking3.comment = "Hey would you mind taking care of my plants?"
booking3.save


Review.create!(
  booking: booking3,
  user: barney,
  profile: julian.profile,
  content: "For being a new plant caregiver with a seedling experience level, I am happy with Julian.",
  rating: 3.5,
  recommended: true
)

# barney has been booked by julian as a plant advisor from August 8th until August 9th
booking4 = Booking.new
booking4.client = julian
booking4.provider = barney
booking4.service_type = "advisor"
booking4.start_date = "2020-04-01"
booking4.end_date = "2020-04-10"
booking4.confirmed = "accepted"
booking4.completed = true
booking4.comment = "Hey barney, could you help me with my plants?"
booking4.save

Review.create!(
  booking: booking4,
  user: julian,
  profile: barney.profile,
  content: "Barney really is a plant whisperer! My tropicals are thriving since his advice.",
  rating: 4.5,
  recommended: true
)

# barney has been booked by jal as a plant advisor from August 9th til August 10th
booking5 = Booking.new
booking5.client = jal
booking5.provider = barney
booking5.service_type = "advisor"
booking5.start_date = "2020-05-01"
booking5.end_date = "2020-05-10"
booking5.confirmed = "accepted"
booking5.completed = true
booking5.comment = "hey barney, I really need help with this new plant I bought"
booking5.save

Review.create!(
  booking: booking5,
  user: jal,
  profile: barney.profile,
  content: "I asked Barney for advice about mites on my chilli plants and he knew right away what the problem was.",
  rating: 4,
  recommended: true
)


# claudiu has requested to book barney as a sitter from June 19th until June 29th
booking7 = Booking.new
booking7.client = claudiu
booking7.provider = jal
booking7.service_type = "sitter"
booking7.start_date = "2020-06-01"
booking7.end_date = "2020-06-10"
booking7.confirmed = "accepted"
booking7.completed = true
booking7.comment = "could you watch my plants for 10 days?"
booking7.save

Review.create!(
  booking: booking7,
  user: claudiu,
  profile: jal.profile,
  content: "I have very easy to care for plants. but Jal did a good job!",
  rating: 3,
  recommended: true
)

# jal has requested to book barney as a sitter from June 19th until June 29th
booking8 = Booking.new
booking8.client = jal
booking8.provider = julian
booking8.service_type = "sitter"
booking8.start_date = "2020-07-01"
booking8.end_date = "2020-07-10"
booking8.confirmed = "accepted"
booking8.completed = true
booking8.comment = "could you watch my plants for 10 days?"
booking8.save

Review.create!(
  booking: booking8,
  user: jal,
  profile: julian.profile,
  content: "Julian did a good job sitting and is very trustworthy.",
  rating: 4,
  recommended: true
)

# julian has requested to book barney as a sitter from June 19th until June 29th

booking9 = Booking.new
booking9.client = jal
booking9.provider = claudiu
booking9.service_type = "sitter"
booking9.start_date = "2020-08-01"
booking9.end_date = "2020-08-10"
booking9.confirmed = "accepted"
booking9.completed = true
booking9.comment = "could you watch my plants for 10 days?"
booking9.save

Review.create!(
  booking: booking9,
  user: jal,
  profile: claudiu.profile,
  content: "Claudiu kept my plants alive!  that is all I wanted",
  rating: 3.5,
  recommended: true
)

# barney has requested claudiu as a plant advisor from August 10th til Aug 11th
booking10 = Booking.new
booking10.client = julian
booking10.provider = claudiu
booking10.service_type = "advisor"
booking10.start_date = "2020-09-01"
booking10.end_date = "2020-09-10"
booking10.confirmed = "accepted"
booking10.completed = true
booking10.comment = "could you advise me on this problem with my plants?"
booking10.save

Review.create!(
  booking: booking10,
  user: julian,
  profile: claudiu.profile,
  content: "Claudiu gave good advice about a minor but irritating soil problem.",
  rating: 3.5,
  recommended: true
)

# barney booked jal the first 10 days of january 2021.
booking11 = Booking.new
booking11.client = julian
booking11.provider = jal
booking11.service_type = "sitter"
booking11.start_date = "2020-10-01"
booking11.end_date = "2020-10-10"
booking11.confirmed = "accepted"
booking11.completed = true
booking11.comment = "I like your plant set up"
booking11.save

Review.create!(
  booking: booking11,
  user: julian,
  profile: jal.profile,
  content: "Jal took good care of my babies like they were her own.",
  rating: 3.5,
  recommended: true
)

# barney booked julian the first 10 days of february 2021.
booking12 = Booking.new
booking12.client = claudiu
booking12.provider = julian
booking12.service_type = "sitter"
booking12.start_date = "2020-11-01"
booking12.end_date = "2020-11-10"
booking12.confirmed = "accepted"
booking12.completed = true
booking12.comment = "look how big that Madagascar is!"
booking12.save


Review.create!(
  booking: booking12,
  user: claudiu,
  profile: julian.profile,
  content: "My plants survived. Julian should upgrade his level from seedling!",
  rating: 3.5,
  recommended: true
)

# barney booked clauriu the first 10 days of march 2021.
booking13 = Booking.new
booking13.client = claudiu
booking13.provider = barney
booking13.service_type = "advisor"
booking13.start_date = "2020-12-01"
booking13.end_date = "2020-12-10"
booking13.confirmed = "accepted"
booking13.completed = true
booking13.comment = "wow! wanna sell that plant?"
booking13.save

Review.create!(
  booking: booking13,
  user: claudiu,
  profile: barney.profile,
  content: "Barney is the best! lots of new growth! I will definitely rebook him.",
  rating: 4.5,
  recommended: true
)

booking14 = Booking.new
booking14.client = barney
booking14.provider = jal
booking14.service_type = "advisor"
booking14.start_date = "2021-01-01"
booking14.end_date = "2021-01-10"
booking14.confirmed = "accepted"
booking14.completed = true
booking14.comment = "wow! wanna sell that plant?"
booking14.save

puts "booking created with new review"
puts "booking created with new seeds"

puts "creating newsfeeds"

post1 = Post.new
post1.title = "New Calathea"
post1.content = "Saw this one at the plant store and couldn’t resist getting it! This is my first Calathea!!..I don’t wanna mess it up this time..Can anyone recommend a good plant advice person?? my hands look so manly..."
post1.posted_on = "5 minutes ago"
post1.user = User.first
post1.image_url = "https://images.unsplash.com/photo-1622560622893-7751a59db7f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1247&q=80"
post1.save

post2 = Post.new
post2.title = "What’s wrong with my ficus?!"
post2.content = "I don’t know, it just kind looks like it’s not adjusting to its new environment. Anyone?!"
post2.posted_on = "45 minutes ago"
post2.user = User.second
post2.image_url = "https://images.unsplash.com/photo-1617281608168-f23112b319c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"
post2.save

post3 = Post.new
post3.title = "Looking for a sitter"
post3.content = "Ok so I’m gonna be gone for a while starting June 19th, and was wondering whether anyone here has any recommendations for plant carers on PF?? "
post3.posted_on = "1 hour ago"
post3.user = User.third
post3.image_url = "https://images.unsplash.com/photo-1598838073192-05c942ede858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=668&q=80"
post3.save

post4 = Post.new
post4.title = "Hoya Undulata!!!"
post4.content = "It’s taken me ages to track this one down! Anyone else have one or ever had one? It’s really beautiful. I’ll be making cuttings soon, follow me to make sure you stay in the loop! They’ll be going fast..."
post4.posted_on = "2 hours ago"
post4.user = User.fourth
post4.image_url = "https://images.unsplash.com/photo-1591340120182-1dc91d56ea9f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"
post4.save

post5 = Post.new
post5.title = "Dracaena Fragrans"
post5.content = "I bough this one back in december and it was only about 20cm tall... now, look at it!!! I’m wondering how to go about making cuttings from this?! Can anyone recommend a plant whisperer here on PF??"
post5.posted_on = "5 hours ago"
post5.user = User.fifth
post5.image_url = "https://images.unsplash.com/photo-1588745574159-93b469d48d78?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"
post5.save

puts "newsfeeds created"



