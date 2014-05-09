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
		@waterdev = FactoryGirl.create(:activity,  name: "Water Development", active: false)
		@self_help = FactoryGirl.create(:activity,  name: "Self Help Group")
	end

	def destroy_activities
		@agdev.destroy
		@waterdev.destroy
		@self_help.destroy
	end

	def create_village_activities
		@va1 = FactoryGirl.create(:village_activity, user: @ed, village: @juvadi, activity: @agdev)
	end

	def destroy_village_activities
		@va1.destroy
	end

# Context for users
    def create_users
      @ed   = FactoryGirl.create(:user)
      @ted  = FactoryGirl.create(:user, first_name: "Ted")
      @fred = FactoryGirl.create(:user, first_name: "Fred", email: "fred@example.com")
      @ned  = FactoryGirl.create(:user, first_name: "Ned", active: false)
    end
    
    def destroy_users
      @ed.destroy
      @ted.destroy
      @fred.destroy
      @ned.destroy
    end

	
end
