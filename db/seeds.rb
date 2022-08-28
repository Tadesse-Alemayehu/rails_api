first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/id/1/200/300',
    bio: 'Teacher from Mexico.', postCount: 0, email: 'firstuser@gmail.com')
admin = User.create(name: 'admin', photo: 'https://picsum.photos/id/1/200/300',
    bio: 'system admin.', postCount: 0, role: 'admin',  email: 'amin@gmail.com')
second_user = User.create(name: 'Lilly', photo: 'https://picsum.photos/id/2/200/300',
    bio: 'Teacher from Poland.', postCount: 0,  email: 'aseconduser@gmail.com')
(1..4).each do |i|
    Post.create(user: first_user, title: "Hello ##{i}", text: "This is my post #{i}",commentsCount: 0,likesCount: 0)
end
first_post = Post.first
(1..6).each do |i|
    Comment.create(post: first_post, user: second_user, text: "comment #{i}" )
end
