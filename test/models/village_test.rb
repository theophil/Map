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
    end

    should "shows that SAVED village should have decimal coordinates" do
      # village one is in factories
      @village1.longitude = 7.0
      @village1.latitude = 23.4
      @village1.save #got rid of the bang
      @village1.reload # reload again from the database
      assert @village1.valid?
    end

  end

end
