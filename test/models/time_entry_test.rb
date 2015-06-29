require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  setup do
    @programmer = programmers(:john)
    @project = projects(:one)
  end
  test "time entry associations" do
  entry_one = TimeEntry.create(duration: 12,
      programmer_id: @programmer.id, project_id: @project.id )
  entry_two = TimeEntry.create(duration: 15,
      programmer_id: @programmer.id, project_id: @project.id )
  assert_equal 2, @programmer.time_entries.count
  assert_equal 2, @project.time_entries.count
end
end
