module Contexts
	def create_villages
		@village1 = FactoryGirl.create(:village)
	end

	def create_village_activities
		@va1 = FactoryGirl.create(:village_actvity, village: @village1, activity: @activity1)
	end

	def create_activities
		@activity1 = FactoryGirl.create(:activity)
	end
end