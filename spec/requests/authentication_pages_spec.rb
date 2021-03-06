require 'spec_helper'
describe "Authentication" do
  subject { page }
  describe "signin page" do
    before { visit signin_path }
    it { should have_content('Sign in') }
    it { should have_title('firstblog') }
  end

  describe "signin" do
    before { visit signin_path }
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",
          with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      it { should have_title(user.name) }
      it { should have_link('Profile',href: user_path(user)) }
      it { should have_link('Sign out',href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end


  describe "with invalid information" do
    before { click_button "Sign in" }
    it { should have_title('firstblog') }
    it { should have_selector('div.alert.alert-error', text: 'Invalid') }
  end
  describe "authorization" do 
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }
      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_title(full_title('Edit user')) }
      end
      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end
  end
end

