FactoryGirl.define do

	factory :activity do
		name "Agricultural Development"
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
    active true
  end

  factory :user do
    first_name "Ed"
    last_name "Gruberman"
    password "secret"
    password_confirmation "secret"
    # email { |u| "#{u.first_name[0]}#{u.last_name}#{(1..99).to_a.sample}@example.com".downcase }
    email "ed@example.com"
    role "admin"
    active true
  end

end

