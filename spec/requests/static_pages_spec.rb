require 'spec_helper'
describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/Home'
      expect(page).to have_content('老兵不死')
    end
    it "should have the title 'Home'" do
      visit '/static_pages/Home'
      expect(page).to have_title("firstblog")
    end
  end
  describe "AboutMe page" do
    it "should have the content 'ruby'" do
      visit '/static_pages/AboutMe'
      expect(page).to have_content('ruby')
    end
    it "should have the title 'firstblog'" do
      visit '/static_pages/AboutMe'
      expect(page).to have_title("firstblog")
    end
  end
  describe "user page" do
    it "should have the content 'users'" do
      visit '/static_pages/user'
      expect(page).to have_content('已经注册的用户列表')
    end
    it "should have the title 'firstblog'" do
      visit '/static_pages/user'
      expect(page).to have_title("firstblog")
    end
  end
end

