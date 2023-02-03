# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
user = User.create(name: 'Nahnah', photo: 'https://www.pexels.com/photo/man-in-blue-top-819530/', bio: 'I love to code', email: 'nahnah@gmail.com', password: '123456', password_confirmation: '123456', jti: '1234567890')
user2 = User.create(name: 'Hans', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Im the CEO of Event Trust INc.', email: 'hans@gmail.com', password: '123456', password_confirmation: '123456', jti: '1234567891')
user3 = User.create(name: 'Salvador', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I love to ride bikes and drive fancy cars', email: 'salvador@gmail.com', password: '123456', password_confirmation: '123456', jti: '1234567892')

# posts for user
post = Post.create(title:'Dane daye', text: 'Tomoor is to try again', author_id: 1)
post2 = Post.create(title:'Tomorrows Passage', text: 'Whoever can tell a spicy tale wins', author_id: 2)
first_post = Post.create(author_id: 3, title: 'Hello Today', text: 'This is another post')
last_post = Post.create(author_id: 3, title: 'Hey! Inspire Today', text: 'This is the hidden post')

# comments for post
# comment1 = Comment.create(text: "I love this story everything was perfect", post_id: 1, author_id: 1)
# comment2 = Comment.create(text: "I dont like it so much I believe you can do much better", post: post, author_id: 1)
# comment3 = Comment.create(text: "I dont like it. Hate it, Learn from me", post: post2, author_id: 2)
# comment4 = Comment.create(text: "You can equally reach out I dont mind helping out", post: post, author_id: 2)
# comment5 = Comment.create(text: "Great job bud", post: post2, author_id: 3)
# comment6 = Comment.create(text: "When is our next hangout?", post: post2, author_id: 3)
# comment7 = Comment.create(text: "Nahnah contradicting herself. hahahaha", post: post1, author_id: 3)
