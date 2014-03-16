require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:village_activities)
  should have_many(:villages).through(:village_activities)

  #test validations
  should validate_presence_of(:name)
end
