require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
 @volunteers = Volunteer.all()
 @projects = Project.all()
 erb(:index)
end

get("/volunteers") do
 @volunteers = Volunteer.all()
 erb(:volunteers)
end

get("/projects") do
 @projects = Project.all()
 erb(:projects)
end
