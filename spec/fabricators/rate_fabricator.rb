Fabricator :rate do
  book
  user
  text { Faker::Lorem.characters(number: 1000) }
  score { 1 }
end
