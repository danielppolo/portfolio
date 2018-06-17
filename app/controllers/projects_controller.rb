class ProjectsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @projects = Project.all
    # Add recent projects
  end

  def show
    @project = Project.find_by(title: params[:title])
    @title = @project.title
    @year = @project.year
    @status = @project.status
    @author = @project.author
    @collaborators = @project.collaborators
    @software = @project.software.split(",").map{|w| w.capitalize.strip }.join(", ")
    @reading_time = @project.reading_time
    @categories = @project.categories.split(",").map{ |c| "##{c.strip}" }
    @content = @project.content
    @likes = @project.likes
    @comments = @project.comments
    @comment = Comment.new()
  end

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to new_project_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :year, :software, :status, :content, :categories, :collaborators, :author, :images)
  end
end
