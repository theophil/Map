module Contexts
	def create_villages
		@juvadi = FactoryGirl.create(:village)
	end

	def destroy_villages
		@juvadi.destroy
	end

	def create_activities
		@activity1 = FactoryGirl.create(:activity)
	end

	def destroy_activities
		@activity1.destroy
	end

	def create_village_activities
		@va1 = FactoryGirl.create(:village_actvity, village: @village1, activity: @activity1)
	end

	def destroy_village_activities
		@va1.destroy
	end

	
end