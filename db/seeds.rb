# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
user = User.create(name: 'Nahnah', photo: 'https://images.pexels.com/photos/819530/pexels-photo-819530.jpeg', bio: 'I love to code', email: 'nahnah@gmail.com', password: '123456', password_confirmation: '123456')
user2 = User.create(name: 'Hans', photo: 'https://images.pexels.com/photos/3785077/pexels-photo-3785077.jpeg', bio: 'Im the CEO of Event Trust INc.', email: 'hans@gmail.com', password: '123456', password_confirmation: '123456')
user3 = User.create(name: 'Salvador', photo: 'https://images.pexels.com/photos/1851253/pexels-photo-1851253.jpeg', bio: 'I love to ride bikes and drive fancy cars', email: 'salvador@gmail.com', password: '123456', password_confirmation: '123456')

# posts for user
post = Post.create(title:'Dane daye', text: 'Tomoor is to try again', author: user)
post2 = Post.create(title:'Tomorrows Passage', text: 'Whoever can tell a spicy tale wins', author: user2)
post3 = Post.create(author: user3, title: 'Hello Today', text: 'This is another post')
post4 = Post.create(author: user3, title: 'Hey! Inspire Today', text: 'This is the hidden post')

# comments for post
comment1 = Comment.create(text: "I love this story everything was perfect", post: post, author: user)
comment2 = Comment.create(text: "I dont like it so much I believe you can do much better", post: post, author: user)
comment3 = Comment.create(text: "I dont like it. Hate it, Learn from me", post: post2, author: user2)
comment4 = Comment.create(text: "You can equally reach out I dont mind helping out", post: post2, author: user2)
comment5 = Comment.create(text: "Great job bud", post: post3, author: user3)
comment6 = Comment.create(text: "When is our next hangout?", post: post3, author: user3)
comment7 = Comment.create(text: "Nahnah contradicting herself. hahahaha3", post: post, author: user3)
