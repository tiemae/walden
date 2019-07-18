json.id comment.id
json.text comment.text
json.author comment.user.full_name
json.post_id comment.post_id
json.user_id comment.user_id
json.user comment.user
json.created_at comment.created_at.strftime("%b %d, %Y")
json.replies do
  json.array! comment.replies, partial:'api/replies/reply', as: :reply
end 
