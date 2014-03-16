require 'test_helper'

class VillageActivityTest < ActiveSupport::TestCase
#test relationships
  should belong_to(:village)
  should belong_to(:activity)

# test validations
  should validate_presence_of(:village_id)
  should validate_presence_of(:activity_id)
  should validate_numericality_of(:village_id)
  should validate_numericality_of(:activity_id)
  should_not allow_value(-1).for(:village_id)
  should_not allow_value(0).for(:village_id)
  should_not allow_value(50.50).for(:village_id)
  should_not allow_value(-1).for(:activity_id)
  should_not allow_value(0).for(:activity_id)
  should_not allow_value(50.50).for(:activity_id)

  # set up context
  include Contexts
  context "Creating a camp instructor context" do
    setup do 
      create_village_activities
    end
    
    teardown do
      destroy_village_activities
    end

    should "not allow the same activity to be assigned twice to the same village" do
      bad_assignment = FactoryGirl.build(:village_activity, instructor: @mark, camp: @camp4)
      deny bad_assignment.valid?
    end

    should "not allow an activity to be assigned an inactive village" do
      bad_assignment = FactoryGirl.build(:village_activity, instructor: @mark, camp: @camp3)
      deny bad_assignment.valid?
    end

  end # Contexts
end # Class
