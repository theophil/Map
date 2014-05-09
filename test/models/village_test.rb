require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  #test relationships
  should have_many(:village_activities)
  should have_many(:activities).through(:village_activities)
  should belong_to(:user)
  
  #test validations
  should validate_presence_of(:name)
  should validate_presence_of(:state)
  should validate_uniqueness_of(:name).case_insensitive

  #set up context
  include Contexts
  context "Creating a village context" do
    setup do
      create_users
      create_villages
    end
    
    teardown do
      destroy_villages
      destroy_users
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

  end

end
