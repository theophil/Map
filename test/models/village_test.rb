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
  #should validate_uniqueness_of(:name).case_insensitive

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
      assert_in_delta(20.8365072, @juvadi.latitude, 0.00001)
      assert_in_delta(78.7093556, @juvadi.longitude, 0.00001)
    end

    should "Show that that village's active scope works" do
      assert_equal 1, Village.active.size
      assert_equal ["Juvadi"], Village.active.all.map{|a| a.name}
    end

    should "show that village's inactive scope works" do
      assert_equal 1, Village.inactive.size
      assert_equal ["Ridhora"], Village.inactive.all.map{|a| a.name}
    end

    should "show that village's alphabetical scope works correctly" do
      assert_equal ["Juvadi", "Ridhora"], Village.alphabetical.all.map { |a| a.name }
    end
    # should "shows that SAVED village can (and should) have decimal coordinates" do
    #   # village one is in factories
    #   @juvadi.update_attribute(:latitude, 23.4)
    #   @juvadi.update_attribute(:longitude, 23.5)
    #   @juvadi.save #got rid of the bang
    #   @juvadi.reload # reload again from the database
    #   assert_equal 23.4, @juvadi.latitude
    #   assert @juvadi.valid?
    # end

  end

end
