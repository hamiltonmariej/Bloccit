include RandomData


1.times do
  Post.find_or_create_by!(title: "Unique title", body: "Lots of random sentences that are unique. Iljljljlj cljjdfljd eorieo cljljdf ereou oeurou.")
end
posts = Post.all

1.times do
  Comment.find_or_create_by!(
    post: posts.sample,
    body: "This is my unique comment today. It's awesome."
  )
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
