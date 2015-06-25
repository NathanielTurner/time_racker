require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  test "Time_entries have been created from fixtures" do
    assert time_entries(:one).duration == 1500
    assert time_entries(:two).duration == 2000
#   "I want to count total fixtures, how"  
  end
end
