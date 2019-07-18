class Api::RepliesController < ApplicationController
    before_action :authenticate_user, except: [:show]

  def create
    @reply = Reply.new(
       text: params[:text],
       comment_id: params[:comment_id],
       user_id: current_user.id #changed to current_user.id - this is a backend method, not params (this takes care of it for me so I don't need to pass on front end once logged in)
      )
     if @reply.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @reply.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @reply = Reply.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update #this should only allow an user to change the text and nothing else
    @reply = Reply.find(params[:id])
    @reply.text = params[:text] || @reply.text
    if @reply.save
        render 'show.json.jbuilder'
    else 
        render json: {errors: @reply.errors.full_messages}, status: :unprocessable_entity
    end
  
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    render json: {message: "Your comment has been successfully deleted!"}
  end
end
