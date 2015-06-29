module FeatureHelper

  def set_programmer
    programmer = Programmer.create(first_name: 'Master',
        last_name: 'Blaster', email: 'blast@master.com',
        password: 'seekrit')
    return programmer
  end

  def set_project
    project = Project.create(name: "Build Skynet", time_limit: 3000)
    return project
  end

  def within_row(text, &block)
    within :xpath, "//table//tr[td[contains(.,\"#{text}\")]]" do
      yield
    end
  end

end
