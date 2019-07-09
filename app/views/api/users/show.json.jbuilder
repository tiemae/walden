json.partial! "user.json.jbuilder", user: @user

json.posts do
  json.array! @user.posts, partial:'api/posts/post', as: :post
end 

json.tag do
  json.partial! @user.tag, partial:'api/tags/tag', as: :tag
end 


# @user.posts #this is an array of posts that 

#--this calls the partial for the posts---
# json.posts do 
#   json.array!

#this allows us to display posts by the user on the front end 
