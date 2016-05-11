require 'spec_helper'

describe StaticPagesController do

  describe "GET 'Home'" do
    it "returns http success" do
      get 'Home'
      response.should be_success
    end
  end

  describe "GET 'Articles'" do
    it "returns http success" do
      get 'Articles'
      response.should be_success
    end
  end

  describe "GET 'AboutMe'" do
    it "returns http success" do
      get 'AboutMe'
      response.should be_success
    end
  end

end
