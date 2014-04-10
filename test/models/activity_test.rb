require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:village_activities)
  should have_many(:villages).through(:village_activities)

  #test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  #set up context
  include Contexts
  context "Creating a activity context" do
    setup do 
      create_activities
    end
    
    teardown do
      destroy_activities
    end

    should "Show that that activity's active scope works" do
    	assert_equal 2, Activity.active.size
    	assert_equal ["Agricultural Development", "Self Help Group"], Activity.active.all.map{|a| a.name}
    end

    should "show that activity's inactive scope works" do
    	assert_equal 1, Activity.inactive.size
    	assert_equal ["Water Development"], Activity.inactive.all.map{|a| a.name}
    end

    should "show that activity's alphabetical scope works correctly" do
    	assert_equal ["Agricultural Development", "Self Help Group", "Water Development"], Activity.alphabetical.all.map { |a| a.name }
    end

  end # contexts
end #class
