class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url],
      tag_id: params[:tag_id]
    )
    if @user.save
       render 'show.json.jbuilder'
    else
       render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def profile
    @user = current_user
    render 'show.json.jbuilder'   
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    render 'show.json.jbuilder'  
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.image_url = params[:image_url] || @user.image_url
    @user.tag_id = params[:tag_id] || @user.tag_id

    if @user.save
        render 'show.json.jbuilder'
    else 
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "This user has been successfully deleted!"}
  end

end
