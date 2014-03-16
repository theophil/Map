FactoryGirl.define do

	factory :activity do
		name "Agricultural Development"
	end

	factory :village_activities do
		association :village
		association :activity
	end

  factory :village do
  	name "Juvadi"
  	longitude nil
  	latitude nil
  	state "Maharashtra"
  	district "Wardha"
  	taluka "Seloo"
  end

end

