puts "Seeding Authors ..."

Author.create!(name: "Jaryl Sim")
Author.create!(name: "Ted Johansson")
Author.create!(name: "Matthew Yeow")

puts "Seeding Posts ..."

Post.create(title: "Disciplined Rails", publication_date: Date.today - 1.day, body: "# Disciplined Rails", slug: "disciplined-rails", authors: [Author.first])
Post.create(title: "Good Cop, Bad Cop", publication_date: Date.today - 2.weeks, body: "# Good Cop, Bad Cop", slug: "good-cop-bad-cop", authors: [Author.second])
Post.create(title: "Tinkerbox Value Objects", publication_date: Date.today - 2.months, body: "# Tinkerbox Value Objects", slug: "tinkerbox-value-objects", authors: Author.all)
