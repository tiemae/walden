json.partial! "post.json.jbuilder", post: @post

json.user do 
  json.partial! @post.user, partial: "api/users/user", as: :user 
end

json.comments do
  json.array! @post.comments, partial:'api/comments/comment', as: :comment
end 

json.tags do
  json.array! @post.tags, partial:'api/tags/tag', as: :tag
end 
# we want to do this so we have an id to call more info 