class Project < ActiveRecord::Base
  has_many :time_entries

  def full_name
    first = self.first_name
    last = self.last_name
    return "#{first} #{last}"
  end
end
