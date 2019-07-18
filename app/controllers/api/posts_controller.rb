class Api::PostsController < ApplicationController

# shouldn't be able to change user in posts in the update section - they won't be able to update a user id 
  before_action :authenticate_user, except: [:index, :show]

  def index 
    @posts = Post.all.order(created_at: :desc)
    render 'index.json.jbuilder'
  end

   def create 
    @post = Post.new(
        title: params[:title],
        text: params[:text],
        user_id: current_user.id, #changes to current_user.id
        image_url: params[:image_url]
    )
    if @post.save
      #params[:tag_ids]=[2,7] => since this is getting passed from the front end as a strong, versus an array we need to destringify it

      # eval is what turns front end info into a string (it destringifies the array)

      params[:tag_ids].each do |tag_id|
          PostTag.create(
          tag_id: tag_id,
          post_id: @post.id
        )
      end

      render 'show.json.jbuilder'
    else 
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity    
    end
  end

  #we don't really need the show route, but we need the show view
  def show
    @post = Post.find(params[:id])
    render 'show.json.jbuilder'  
  end

  def update
    @post = Post.find(params[:id])
      @post.title = params[:title] || @post.title
      @post.text = params[:text] || @post.text
      # @post.user_id = params[:user_id] || @post.user_id
      @post.image_url = params[:image_url] || @post.image_url

    if @post.save
        render 'show.json.jbuilder'
    
    #would like to add code to update tags (perhaps I need to delete all of them and require a user to start over)  

    else 
        render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {message: "Your post has been successfully deleted!"}
  end

end
