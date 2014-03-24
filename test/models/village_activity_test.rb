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

  should allow_value(Date.today).for(:start_date)
  should allow_value(1.day.ago.to_date).for(:start_date)
  should_not allow_value(1.day.from_now.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(2).for(:start_date)
  should_not allow_value(3.14159).for(:start_date)
  
  should_not allow_value("bad").for(:end_date)
  should_not allow_value(2).for(:end_date)
  should_not allow_value(3.14159).for(:end_date) 

  # set up context
  include Contexts
  context "Creating a village_activity context" do
    setup do
      create_village_activities
    end
    
    teardown do
      destroy_village_activities
    end

    should "not allow the same activity to be assigned twice to the same village" do
      bad_assignment = FactoryGirl.build(:village_activity, village: @juvadi, activity: @activity1)
      deny bad_assignment.valid?
    end

    should "check to make sure the end date is on or after the start date" do
      @bad_village_activity = FactoryGirl.build(:village_activity, village: @juvadi, activity: @activity1, start_date: Date.yesterday, end_date: 2.days.ago.to_date)
      deny @bad_village_activity.valid?
      @okay_village_activity = FactoryGirl.build(:village_activity, village: @juvadi, activity: @activity1, start_date: 2.days.ago.to_date, end_date: Date.yesterday)
      assert @okay_village_activity.valid?
    end

    # Commented because I have not yet decided how to do use active
    # should "not allow an activity to be assigned an inactive village" do
    #   bad_assignment = FactoryGirl.build(:village_activity, instructor: @mark, village_activity: @village_activity3)
    #   deny bad_assignment.valid?
    # end

  end # Contexts
end # Class
