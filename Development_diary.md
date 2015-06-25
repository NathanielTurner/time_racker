#Time Tracker Development Diary

## Pieces and Components
### Big Picture Pieces
* Organization
* Developer
* Time Entry
* Project
* Sessions
* login/out
* Test suite

### In Depth for Each Components

##### Organization
* Fields: {:Name, :Description, :company_email, :admin_password}
* Has Many :developers
* Has Many :projects
* Has Many :time_entries

##### Developer
* Fields: {:first_name, :last_name, :email, :password, :organization_id}
* Belongs to Organization
* Has Many :projects, through: :organization
* Has Many :time_entries
* Validates :first_name, :last_name, :email(form, uniqueness), :password
##### Time Entry
* Fields: {:organization_id, :developer_id, :project_id, :duration}
* Belongs to :company, :developer, :project
##### Project
* Fields: {:title, :description, :company_id, :developer_id, :max_hours}
* Belongs to :company, :developer
* Has Many :time_entries
##### Sessions


##### login/out


##### Test suite


## Log
(1.outline) I can create and view a time_entry table and enter a duration
* requires a database table and model for time_entry with a field :duration
* requires a controller with new, index and show actions
* requires a new.html.erb view
* requires a _new_form.html.erb partial
* requires a show.html.erb view
* Requires a show.html.erb view
* requires a 'time_entry/new' route

(1.test_setup)

## Current Issues or Problems
