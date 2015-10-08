include RandomData


50.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 1
  )
end
advertisements = Advertisement.all

puts "Seed finished"
puts "#{Advertisement.count} advertisements created"
