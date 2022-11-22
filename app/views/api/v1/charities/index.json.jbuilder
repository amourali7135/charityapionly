json.array! @charities do |charity|
    json.extract! charity, :id, :name, :aged, :instagram, :facebook, :website, :city, :country, :income, :country_focus, :size, :program_percentage, :cost_to_100, :fiveohone, :phone, :email, :mission, :goal, :age, :issues, :photo
  end