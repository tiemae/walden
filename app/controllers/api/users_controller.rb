class Api::UsersController < ApplicationController
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password_digest: params[:password_digest],
      image_url: params[:image_url],
      tag_id: params[:tag_id]
    )
    if @user.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity 
    end  
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
    @user.password_digest = params[:password_digest] || @user.password_digest
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
