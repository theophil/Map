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


  # test "the truth" do
  #   assert true
  # end
end
