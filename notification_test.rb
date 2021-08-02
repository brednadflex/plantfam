CommentNotification.with({ message: Message.find(1) }).deliver(User.find(4))
# CommentNotification.with({post: Post.last}).deliver(User.last)
# CommentNotification.with({post: Post.last}).deliver(User.last)
