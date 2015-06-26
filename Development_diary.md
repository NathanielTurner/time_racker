#Time Tracker Development Diary
##### Time Log
No initial time estimate, I plan on spending all the time I can on this every single day.
Thursday - 7.5 Hours
Friday -
Saturday -
Sunday -  
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
(1.outline)

I can create and view a time_entry table and enter a duration
* requires a database table and model for time_entry with a field :duration
* requires a controller with new, create, and index
* requires a new.html.erb view
* requires a _new_form.html.erb partial
* requires a index.html.erb view
* requires get 'time_entries/new', get 'time_entries/index' get  'time_entries/create' routes and resources :time_entries

(1.test_setup)

* controller test: test for new, index, create, show
* fixture: populate with two time_entries one: duration: 1500, two: duration: 2000
* model test: test fixtures are created correctly.

(1.build)

migration
* time_entries table with field: duration:integer

model
*empty

controller
* actions
 * new
  * assignment @time_entry = TimeEntry.new
 * index
  * assignment @time_entries = TimeEntry.all
 * create
  * assignment @time_entry = TimeEntry.new(time_entry_params)
  * if it saves render index with a flash of successfully created.
  * if it fails render new with a flash of error creating.

views
* _form.html.erb
  * one input field for duration
  * basic form nothing special
* index
 * given all time_entries as param and loops over them and renders the duration field of each.
* create
no view but enables creating using strong params.

(1.build.is_complete 06/25/2015 PM 6:30)
(2.outline)

I can create and view developers
* requires a database migration and model for developer with field :first_name, :last_name, :email, :password:digest. model has_secure_password
* requires a controller with new, create, and index actions
* requires a new.html.erb view
* requires a _new_form.html.erb partial
* requires a index.html.erb view
* requires get 'programmers/new', get 'programmers/index', get 'programmers/create' routes and resources :programmers
(2.test_setup)
(2.build)


## Current Issues or Problems
