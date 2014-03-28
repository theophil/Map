FactoryGirl.define do

	factory :activity do
		name "Agricultural Development"
    active true
	end

	factory :village_activity do
		association :village
		association :activity
    start_date 2.days.ago.to_date
    end_date Date.yesterday
	end

  factory :village do
  	name "Juvadi"
  	longitude nil
  	latitude nil
  	state "Maharashtra"
  	district "Wardha"
  	taluka "Seloo"
    active true
  end

end

