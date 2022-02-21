class Post < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :comments

    def updatePostsCounter
        post.increment!(:PostsCounter)
    end

    def five_recent_comments
        comments.order(created_at: :desc).limit(5)
    end
end
