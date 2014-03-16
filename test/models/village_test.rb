require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  #test relationships
  should have_many(:village_activities)
  should have_many(:activities).through(:village_activities)
  
  #test validations
  should validate_presence_of(:name)
  should validate_presence_of(:state)
  should validate_presence_of(:district)
  should validate_presence_of(:taluka)

  #set up context
  include Contexts
  context "Creating a village context" do
    setup do 
      create_villages
    end
    
    teardown do
      destroy_villages
    end

    should "show that def find_coordinates works" do
      assert_equal [20.8365072, 78.7093556], @juvadi.find_coordinates 
    end

    should "shows that SAVED village can (and should) have decimal coordinates" do
      # village one is in factories
      @juvadi.update_attribute(:latitude, 23.4)
      @juvadi.update_attribute(:longitude, 23.5)
      @juvadi.save #got rid of the bang
      @juvadi.reload # reload again from the database
      assert @juvadi.valid?
    end

  end

end
