class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post


    def updateLikesCounter
        post.increment!(:LikesCounter)
    end
end
