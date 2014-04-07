module Contexts
	def create_villages
		@juvadi = FactoryGirl.create(:village)
		@ridhora = FactoryGirl.create(:village, name: "Ridhora", active: false)
	end

	def destroy_villages
		@juvadi.destroy
		@ridhora.destroy
	end

	def create_activities
		@agdev = FactoryGirl.create(:activity)
		@waterdev = FactoryGirl.create(:activity, name: "Water Development", active: false)
	end

	def destroy_activities
		@agdev.destroy
		@waterdev.destroy
	end

	def create_village_activities
		create_villages
		create_activities
		@va1 = FactoryGirl.create(:village_activity, village: @juvadi, activity: @agdev)
	end

	def destroy_village_activities
		destroy_villages
		destroy_activities
		@va1.destroy
	end

	
end
