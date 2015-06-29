module TimeEntriesHelper
  def project_name(id)
    return Project.find_by_id(id).name
  end

  def programmer_name(id)
    return Programmer.find_by_id(id).full_name
  end
end
