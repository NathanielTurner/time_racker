class Programmer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries

  def full_name
    first = self.first_name
    last = self.last_name
    return "#{first} #{last}"
  end
end
