

tags = Tag.create([
  {
    name: "Stage 1" ,
    image_url: FFaker::Image.url
  },
  {
    name: "Stage 2" , 
    image_url: FFaker::Image.url
  },
  {
    name: "Stage 3" , 
    image_url: FFaker::Image.url
  }, 
  {
    name: "Stage 4", 
    image_url: FFaker::Image.url
  }, 
  {
    name: "Stage 5", 
    image_url: FFaker::Image.url
  },
  {
    name: "Stage 6",
    image_url: FFaker::Image.url
  }, 
  {
    name: "Stage 7", 
    image_url: FFaker::Image.url
  }
])


users = User.create([
  {
    first_name: "Alex", 
    last_name: "Therrien", 
    email: "alex.therrien@gmail.com", 
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL4BIyhdT7ehb1rnsVUjFiVuRvQKW1UmhPd4DMZa7Az1qMiCwmMw",
    tag_id: 2,
    password_digest: "password"
  },
  {
    first_name: "Barrett", 
    last_name: "Swanson", 
    email: "barrett.swanson@gmail.com", 
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuVHY_X4qABP2M7rVq_vlqK9hWsVj0RlDRDgrhXfPHq5ClGL5UyQ", 
    tag_id: 3,
    password_digest: "password"
  }
])

posts = Post.create([
  {
    title: FFaker::CheesyLingo.title,
    text: FFaker::CheesyLingo.paragraph,
    image_url: FFaker::Image.url,
    user_id: 1
  },
  {
    title: FFaker::CheesyLingo.title,
    text: FFaker::CheesyLingo.paragraph,
    image_url: FFaker::Image.url,
    user_id: 2
  },
  {
    title: FFaker::CheesyLingo.title,
    text: FFaker::CheesyLingo.paragraph,
    image_url: FFaker::Image.url,
    user_id: 1
  },
  {
    title: FFaker::CheesyLingo.title,
    text: FFaker::CheesyLingo.paragraph,
    image_url: FFaker::Image.url,
    user_id: 2
  }

])

comments = Comment.create([
  {
    text: "bounty coffer main sheet blow the man down red ensign parrel scallywag gangway Jolly Roger aft haul wind take a caulk loaded to the gunwalls avast aye Blimey lateen sail grapple dance the hempen jig Jack Ketch.",
    post_id: 1,
    user_id: 1
  },
  {
    text: "bounty coffer main sheet blow the man down red ensign parrel scallywag gangway Jolly Roger aft haul wind take a caulk loaded to the gunwalls avast aye Blimey lateen sail grapple dance the hempen jig Jack Ketch.",
    post_id: 2,
    user_id: 1
  },
  {
    text: "bounty coffer main sheet blow the man down red ensign parrel scallywag gangway Jolly Roger aft haul wind take a caulk loaded to the gunwalls avast aye Blimey lateen sail grapple dance the hempen jig Jack Ketch.",
    post_id: 2,
    user_id: 2
  }
])

post_tags=PostTag.create([
  {
    post_id: 1,
    tag_id: 2
  },
  {
    post_id: 1,
    tag_id: 3
  },
  {
    post_id: 1,
    tag_id: 5
  },
  {
    post_id: 1,
    tag_id: 7
  },
  {
    post_id: 2,
    tag_id: 3
  },
  {
    post_id: 2,
    tag_id: 5
  }
])











# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
