# What's the proper way for this one?!?
json.array! @campaigns do |campaign|
  json.extract! campaign, :id, :title, :goal, :completion_date, :fundraising_goal, :how, :end_date, :amount_raised,
                :charity_id
end
