class Api::TagsController < ApplicationController
  
  def index 
    @tags = Tag.all.order(:id)
    render 'index.json.jbuilder'
  end

  def show
    @tag = Tag.find(params[:id])
    render 'show.json.jbuilder'
  end

end
