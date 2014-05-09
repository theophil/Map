FactoryGirl.define do

	factory :activity do
		name "Agricultural Development"
    association :user
    active true
	end

	factory :village_activity do
		association :village
		association :activity
    association :user
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
    association :user
    active true
  end

  factory :user do
    username "eddieG"
    first_name "Ed"
    last_name "Gruberman"
    password "secret"
    password_confirmation "secret"
    active true
  end

end

