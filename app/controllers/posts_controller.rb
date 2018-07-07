class PostsController < ApplicationController
  # Devise Authentication for admin page
  protect_from_forgery
  before_action :authenticate_user!, only: [:admin]

  def home
    @projects = Project.all
    @stories = Story.all
    @recent = Post.all.last(3)
  end

  def bio
  end

  def admin
    @project = Project.new()
    @story = Story.new()
  end
end
