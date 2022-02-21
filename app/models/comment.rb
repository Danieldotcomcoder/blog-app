class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def updateCommentsCounter
        post.increment!(:CommentsCounter)
    end
end
