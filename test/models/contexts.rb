module Contexts
	def create_villages
		@juvadi = FactoryGirl.create(:village)
		sleep 1
		@ridhora = FactoryGirl.create(:village, name: "Ridhora", active: false)
		sleep 1
	end

	def destroy_villages
		@juvadi.destroy
		@ridhora.destroy
	end

	def create_activities
		@agdev = FactoryGirl.create(:activity)
		@waterdev = FactoryGirl.create(:activity, name: "Water Development", active: false)
		@self_help = FactoryGirl.create(:activity, name: "Self Help Group")
	end

	def destroy_activities
		@agdev.destroy
		@waterdev.destroy
		@self_help.destroy
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
