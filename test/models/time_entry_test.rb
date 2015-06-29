require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  entry_one = TmeEntry.create(duration: 12, developer_id: 1,
      project_id: 1 )
  entry_two = TimeEntry.create(duration: 15, developer_id: 1,
      project_id: 1 )
  assert_equal 2, Developer.find_by_id(1).time_entries.count
  assert_equal 2, Project.find_by_id(1).time_entries.count
end
