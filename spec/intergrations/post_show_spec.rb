require 'rails_helper'

RSpec.describe 'On Post Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @Leo= User.create!(Name: 'Leonardo',
      email: 'leo12345@gmail.com',
      Bio: 'My bio',
      password: 'password',
      password_confirmation: 'password',
      posts_counter: 0,
      confirmed_at: Time.now)
      
    within('#new_user') do
      fill_in 'Email', with: 'leo12345@gmail.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @post1 = @Leo.posts.create!(Title: 'post 1', Text: 'My post 1', user_id: @Leo.id, comments_counter: 0,
      likes_counter: 0)
  
    @Fred = User.create!(
      Name: 'Fred', Bio: 'my bio', email: 'Fred@gmail.com',
      password: 'fred1234',password_confirmation: 'fred1234', confirmed_at: Time.now
    )
    @Fred.comments.create!(Text: 'Nice', post: @post1)
    @Fred.comments.create!(Text: 'Very good', post: @post1)
   
   
    visit user_posts_path(@Leo, @post1)
  end

  describe 'post' do
  
    it 'post title ' do
      expect(page).to have_content 'post 1'
    end

    it 'test who wrote the post.' do
        expect(page).to have_content 'Leo'
      end

    it 'test how many comments it has.' do
       expect(page).to have_content 'Comments: 2'
    end

    it 'test how many likes it has.' do
        expect(page).to have_content 'Likes: 0'
    end

    it 'test the post body.' do
        expect(page).to have_content 'My post 1'
    end

    it 'test the username of commentor.' do
        expect(page).to have_content 'Fred'
    end
    

  end
end
