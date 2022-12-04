json.extract! @campaign, :id, :title, :goal, :completion_date, :fundraising_goal, :how, :end_date, :amount_raised,
              :charity_id

# json.comments @charity.comments do |comment|
#   json.extract! comment, :id, :content
# end
