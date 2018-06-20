class PostsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, only: [:admin]
  def home
    @projects = Project.all
    @stories = Story.all
    @featured = [Project.last, Story.last]
  end

  def bio
  end

  def admin
    @project = Project.new()
    @story = Story.new()
  end
end
