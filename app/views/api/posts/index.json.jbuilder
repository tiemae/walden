json.array! @posts.each do |post|
  json.partial! "post.json.jbuilder", post: post
  json.author post.user.full_name
end