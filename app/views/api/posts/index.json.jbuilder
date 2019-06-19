json.array! @posts.each do |post|
  json.partial! "post.json.jbuilder", post: post
end