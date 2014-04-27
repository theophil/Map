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
  
  should allow_value(nil).for(:end_date)
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

    # Unsure how to define model's method thus not using this test
    should "not allow the same activity to be assigned twice to the same village" do
      bad_assignment = FactoryGirl.build(:village_activity, village: @juvadi, activity: @agdev)
      deny bad_assignment.valid?
    end

    should "check to make sure the end date is on or after the start date" do
      bad_village_activity = FactoryGirl.build(:village_activity,village: @juvadi, activity: @agdev ,start_date: Date.yesterday, end_date: 2.days.ago.to_date)
      deny bad_village_activity.valid?
      okay_village_activity = FactoryGirl.build(:village_activity, village: @juvadi, activity: @self_help, start_date: Date.today, end_date: 3.days.from_now.to_date)
      assert okay_village_activity.valid?
    end

    should "not allow an activity to be assigned an inactive village" do
      bad_assignment = FactoryGirl.build(:village_activity, village: @ridhora, activity: @agdev)
      deny bad_assignment.valid?
    end

    should "not allow a village to be assigned an inactive activity" do
      bad_assignment = FactoryGirl.build(:village_activity, village: @juvadi, activity: @waterdev)
      deny bad_assignment.valid?
    end

    # should "show village alphabetical scope works" do
    #   assert_equal ["Juvadi","Ridhora"], @va1.alphabetical_by_village.all.map { |v| v.name }
    # end

    # should "show activity alphabetical scope works" do
    #   assert_equal ["Self Help Group", "Water Development"], @va1.alphabetical_by_activity.all.map(&:name)
    # end

    should "show village_name method works" do
      assert_equal "Juvadi", @va1.village_name
    end

    should "show activity_name works" do
      assert_equal "Agricultural Development", @va1.activity_name
    end

  end # Contexts
end # Class
