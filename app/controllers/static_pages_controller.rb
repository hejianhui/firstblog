class StaticPagesController < ApplicationController
  def Home
  end

  def Articles
  end

  def AboutMe
  end

  def user
      @users = User.all
  end
end
