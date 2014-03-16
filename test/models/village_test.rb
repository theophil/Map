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

end
