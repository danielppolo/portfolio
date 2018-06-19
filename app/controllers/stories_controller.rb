class StoriesController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @stories = Story.all
    #Add recent stories
  end

  def show
    @story = Story.find_by(title: params[:title])
    @title = @story.title
    @author = @story.author
    @reading_time = @story.reading_time
    @categories = @story.categories.split(",").map { |c| "##{c}" }
    @content = @story.content
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
    @story.cover.attach(params[:story][:cover]) if params[:story][:cover]
    @story.images.attach(params[:story][:images]) if params[:story][:images]
    redirect_to admin_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :categories, :author, :images, :cover)
  end
end
