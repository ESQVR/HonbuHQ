class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
    @first = Project.order(:id).first
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @projects = Project.all
  end

  def create
    @projects = Project.all
    @project = Project.new(permitted_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @projects = Project.all
    @project = Project.find(params[:id])
    if @project.update(permitted_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to home_path, status: :see_other
  end

  private

  def permitted_params
    params.require(:project).permit(:name, :description)
  end
end
