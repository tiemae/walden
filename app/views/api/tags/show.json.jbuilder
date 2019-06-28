json.partial! "tag.json.jbuilder", tag: @tag

json.posts do
  json.array! @tag.posts, partial:'api/posts/post', as: :post
end 