class Api::CommentsController < ApplicationController

  before_action :authenticate_user, except: [:show]

  def create
    @comment = Comment.new(
       text: params[:text],
       post_id: params[:post_id],
       user_id: current_user.id #changed to current_user.id - this is a backend method, not params (this takes care of it for me so I don't need to pass on front end once logged in)
      )
     if @comment.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update #this should only allow an user to change the text and nothing else
    @comment = Comment.find(params[:id])
    @comment.text = params[:text] || @comment.text
    if @comment.save
        render 'show.json.jbuilder'
    else 
        render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {message: "Your comment has been successfully deleted!"}
  end


end
