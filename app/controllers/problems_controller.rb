class ProblemsController < ApplicationController
  def index
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new problem_params
    @problem.save
    render 'index'
  end

  private
  def problem_params
    params.require(:problem).permit(:name, :link)
  end
end
