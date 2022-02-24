require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(Name: 'Useradada', Photo:'https://unsplash.com/photos/F_-0BxGuVvo', Bio:'Software developer from lebanon') 
    post1 = Post.new(user: user1 , Title: 'post', Text:'This is my rocking post') 
    c1 = Comment.new(user: user1, post: post1, Text:'Comment1')
    c1.update_comments_counter

    it 'check if it comments counter works' do
      current = post1.comments_counter
      c2 = Comment.new(user: user1, post: post1, Text:'Comment2')
      c2.update_comments_counter
      expect(post1.comments_counter).to eq(current + 1)
    end
  end
end
