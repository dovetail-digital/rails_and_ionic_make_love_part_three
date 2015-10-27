require "test_helper"

class BlogEntriesTest < ActionDispatch::IntegrationTest
  include IonicHelper

  test "create blog entry" do
    Capybara.current_driver = Capybara.javascript_driver
    visit '/'
    click_link 'New Blog entry'
    within('#new_blog_entry') do
      fill_in 'blog_entry_title', with: 'My blog title'
      fill_in 'blog_entry_content', with: 'My blog description'
    end
    click_button 'Create Blog entry'

    on_ionic_app do
      assert page.has_content?('My blog title')
      assert page.has_content?('My blog description')
    end
  end
end
