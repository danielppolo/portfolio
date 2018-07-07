class ProjectsController < ApplicationController
  #Securing the creation of models only with authentication of the admin w/Devise
  protect_from_forgery
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @projects = Project.all
    # Add recent projects
  end

  def show
    @project = Project.find_by(title: params[:title])
    @title = @project.title
    @content = @project.content.split("\n")
    @year = @project.year
    @status = @project.status
    @author = @project.author
    @collaborators = @project.collaborators
    @software = @project.software.split(",").map{|w| w.capitalize.strip }.join(", ")
    @reading_time = @project.reading_time
    @categories = @project.categories.split(",").map{ |c| "##{c.strip}" }
    @likes = @project.likes
    @comments = @project.comments
    @comment = Comment.new()
    @post = @project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    @project.cover.attach(params[:project][:cover]) if params[:project][:cover]
    @project.images.attach(params[:project][:images]) if params[:project][:images]
    redirect_to admin_path
  end

  def edit
    @project = Project.find_by(title: params[:title])
  end

  def update
    @project = Project.find_by(title: params[:title])
    @project.update(project_params)
    redirect_to admin_path
  end

  def destroy
    @project = Project.find_by(title: params[:title])
    @project.destroy
    redirect_to admin_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :year, :software, :status, :content, :categories, :collaborators, :author, :images, :cover)
  end
end
