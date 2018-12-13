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
  @projects = Project.all()
  erb(:volunteers)
end

post ("/volunteers") do
  name = params.fetch("name")
  volunteer = Volunteer.new({:name => name, :project_id => nil, :id => nil})
  volunteer.save()
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:index)
end

get("/volunteers/:id") do
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:volunteer_info)
end

get("/projects") do
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:projects)
end

post("/projects") do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save()
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:index)
end

get("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:project_info)
end

post("/volunteers/:id/edit") do
  project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.update(project)
  @add_volunteer =
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:project_edit)
end
