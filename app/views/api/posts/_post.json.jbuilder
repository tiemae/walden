  json.id post.id 
  json.title post.title
  json.text post.text
  json.image_url post.image_url
  json.author post.user.full_name
  json.created_at post.created_at.strftime("%b %d, %Y")