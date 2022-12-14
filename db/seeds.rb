require 'faker'
require "open-uri"

# clever
# urls = [1, 2, 3, etc.]
# urls.each do |url|
#   uri = URI.open(url)
#   model = Model.new(attributes...)
#   model.photo.attach(io: uri, filename: "whatever.png", content_type: 'image/png')
# end

#I had to nest it according to Rayhan because of ID issues.
puts "Destroy everything"
Charity.destroy_all
Campaign.destroy_all
User.destroy_all

stupid_booleans = ["True", "False"]
issues = ["Poverty", "Housing", "Social Justice", "Food", "LGBQT", "Children", "Animals", "International Housing", "Immigration", "Environmental", "Education", "Medical"]

puts 'Creating 5 fake users/charities...'
5.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 'password'
  )
  user.save!

  charity = Charity.new(
    name:  Faker::Name.name,
    aged:  Faker::Number.between(from: 0, to: 150),
    income: Faker::Number.between(from: 0, to: 100000000),
    size:  Faker::Number.between(from: 1, to: 100),
    # country:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
    # country_focus:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
    city:  Faker::Address.city,
    program_percentage:  Faker::Number.between(from: 1, to: 100),
    cost_to_100:  Faker::Number.between(from: 1, to: 100),
    fiveohone: stupid_booleans.sample,
    phone:  Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.safe_email,
    mission: Faker::Quote.most_interesting_man_in_the_world,
    goal: Faker::Quote.most_interesting_man_in_the_world,
    issues: issues.sample(2),
    instagram:  Faker::Internet.domain_name,
    facebook:  Faker::Internet.domain_name,
    website:  Faker::Internet.domain_name,
    user_id: User.pluck(:id).sample,
    # tag_list: Inquiry.tags.sample(3),
  )

charity.photo.attach(
    io: File.open('app/assets/images/bourdain.jpg'),
    filename: 'bourdain.jpg',
    content_type: 'image/jpg',
)
#   charity.user = User.pluck(:id).sample
  charity.save!

  puts 'Creating 10 fake campaigns...'
  2.times do
    campaign = Campaign.new(
      title: Faker::Lorem.sentences(number: 1),
      goal: Faker::Quote.most_interesting_man_in_the_world,
      how: Faker::Lorem.sentences(number: 2),
      completion_date: Faker::Date.forward(days: 25),
      fundraising_goal: Faker::Number.between(from: 1, to: 100000),
      amount_raised: Faker::Number.between(from: 0, to: 25000),
      end_date: Faker::Date.forward(days: 30),
      # photo: Faker::Avatar.image,
      # tag_list: Inquiry.tags.sample(3),
      charity_id: Charity.pluck(:id).sample
    #   campaign.photo.attach(io: file, filename: 'charity.png', content_type: 'charity/png')
    )
    campaign.photo.attach(
        io: File.open('app/assets/images/moneysign.jpeg'),
        filename: 'moneysign.jpeg',
        content_type: 'image/jpg',
    )
    campaign.save!
  end
  puts 'Finished!'
end
puts 'Finished!'
