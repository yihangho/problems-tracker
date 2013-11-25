class TagsController < ApplicationController
  def index
    @tags = Tag.paginate(page: params[:page])
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end

  def search
    query = params[:query]
    @results = Tag.search_by_name query
    respond_to do |format|
      format.html
      format.json { render json: @results }
    end
  end
end
