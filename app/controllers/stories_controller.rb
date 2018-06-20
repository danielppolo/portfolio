class StoriesController < ApplicationController
  #Securing the creation of models only with authentication of the admin w/Devise
  protect_from_forgery
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @stories = Story.all
    #Add recent stories
  end

  def show
    @story = Story.find_by(title: params[:title])
    @title = @story.title
    @content = @story.content
    @author = @story.author
    @reading_time = @story.reading_time
    @categories = @story.categories.split(",").map { |c| "##{c}" }
    @likes = @story.likes
    @comments = @story.comments
    @comment = Comment.new()
    @post = @story
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.save
    #Saving images with Active Storage
    @story.cover.attach(params[:story][:cover]) if params[:story][:cover]
    @story.images.attach(params[:story][:images]) if params[:story][:images]
    redirect_to admin_path
  end

  private

  #Method that secures the params got in the form
  def story_params
    params.require(:story).permit(:title, :content, :categories, :author, :images, :cover)
  end
end
