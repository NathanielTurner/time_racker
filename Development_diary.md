#Time Tracker Development Diary
##### Time Log
No initial time estimate, I plan on spending all the time I can on this every single day.
Thursday - 7.5 Hours
Friday - 10 hours
Saturday -
Sunday -  
## Pieces and Components
### Big Picture Pieces
* Organization
* programmer
* Time Entry
* Project
* Sessions
* login/out
* Test suite

### In Depth for Each Components

##### Organization
* Fields: {:Name, :Description, :company_email, :admin_password}
* Has Many :programmers
* Has Many :projects
* Has Many :time_entries

##### programmer
* Fields: {:first_name, :last_name, :email, :password, :organization_id}
* Belongs to Organization
* Has Many :projects, through: :organization
* Has Many :time_entries
* Validates :first_name, :last_name, :email(form, uniqueness), :password
##### Time Entry
* Fields: {:organization_id, :programmer_id, :project_id, :duration}
* Belongs to :company, :programmer, :project
##### Project
* Fields: {:title, :description, :company_id, :programmer_id, :max_hours}
* Belongs to :company, :programmer
* Has Many :time_entries
##### Sessions


##### login/out


##### Test suite


## Log
Logs process during production of features. Numbers mark individual features.
##### (1.outline) can create and view a time_entry table and enter a duration
* requires a database table and model for time_entry with a field :duration
* requires a controller with new, create, and index
* requires a new.html.erb view
* requires a _new_form.html.erb partial
* requires a index.html.erb view
* requires get 'time_entries/new', get 'time_entries/index' get  'time_entries/create' routes and resources :time_entries

##### (1.build)

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

#### (1.build.is_complete 06/25/2015 PM 6:30)

##### (2.outline)

I can create and view programmers
* requires a database migration and model for programmer with field :first_name, :last_name, :email, :password:digest. model has_secure_password
* requires a controller with new, create, and index actions
* requires a new.html.erb view
* requires a _new_form.html.erb partial
* requires a index.html.erb view
* requires get 'programmers/new', get 'programmers/index', get 'programmers/create' routes and resources :programmers
#### (2.build.is_complete 06/26/2015 PM 5:00)
#####(3.outline) Can create and view projects


##### (3.build)
migration
* projects table with fields: :name:string, :time_limit:integer

model
*empty

controller
* actions
 * new
  * assignment @project = Project.new
 * index
  * assignment @projects = Project.all
 * create
  * assignment @project = Project.new(project_params)
  * if it saves render index with a notice of success.
  * if it fails render new with a notice of failure.

views
* _form.html.erb
  * two input fields for name and time_limit
  * basic form nothing special
* index
 * given all projects as param and loops over them and renders the name and time limit of each.
* create
no view but enables creating using strong params.

#### (3.build.complete 06/26/2015)

#### (4.outline) Programmers can log in and out.

* requires a session controller with actions new, create and destroy
* new action render a view partial with a form named sign-in that allows entering password and email.
* create action reads the form partial params looks for a programmer in the database by email param.
* if author is found it authenticates the passed password with found programmers password.
* if successful, it makes a session with user_id equal to the found authors id. it then redirects to projects_path.
* if it fails it flashes Login failed
* destroy action makes the values stored in the session for user_id nil than redirects to sessions_new_path
* requires route get '/signin' => 'sessions/new'
               signin_path
* requires route delete '/signout' => 'sessions/destroy'
               signout_path
* requires route post '/sessions'
               sessions/path
* requires a view for new which render a -form partial
* the form partial requires form_for to be (:session, :url => sessions_path) since there is no model for rails to infer the path via.
* _form partial requires two field inputs, email and password.
* new view requires a new user link_to that redirects to programmers_new_path.

#### (4.build.complete 06/29/2015 PM 10:50)

#### (5.outline) time_entry index page will show the project its entered for, and the programmer who entered it.
##### (5.build)
* TimeEntry needs project_id column and programmer_id column.
* TimeEntry model need Belongs to project, and belongs_to programmer.
* project model needs has_many programmers,  and has_many time entries
* time entry _form needs a input field for project_id, but an upcoming feature will include having a button on projects to enter a time entry which will pass new action the project_id for the project it was clicked on, which the action will use to set the project_id.
* The programer id will be set by the new action using the session[_user_id] implemented in the last feature.
* The time entry index view will need a module that has defs programer, and project. these defs are called in the _form partial
for each time_entry and return the names of the projects and programs linked to the time entry.

#####(5.test setup)
* time entry controller test needs
* feature test will login and create time entry and his id should match time entries.
* models will test now test for associations.
#### (5.build.complete 06/29/2015 PM 9:10)
## Current Issues or Problems
