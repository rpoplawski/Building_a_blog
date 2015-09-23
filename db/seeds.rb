Post.create(title: "Hangin' out -James Leaps",
  body: "We were just chillin' at the park when the rain came! What a treat!", published: false)
Post.create(title: "Camping with kids - Miles Robins",
  body: "A great experience was had by all. First time for the little ones.", published: false)
Post.create(title: "Sagas of the South -Winston Blithe",
 body: "Today's journey over the pass was difficult.
 We encountered many obstacles along our way.", published: false)
Post.create(title: "Reference guides -Patrick Chilton",
 body: "Online reference quide for Ruby on Rails are an excellent source
  when devleoping code or trying to understand a topic.", published: false)

post_ids = [1,2,3,4]

20.times do Comment.create({
  message: Faker::Lorem.sentence,
  post_id: post_ids.sample
  })
end
