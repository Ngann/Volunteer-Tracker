require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")
require("pry")



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

get("/projects/:id/edit") do
  @project = Project.find(params[:id].to_i)
  erb(:project_edit)
end

patch("/projects/:id/edit") do
  title = params.fetch("title")
  @project = Project.find(params[:id].to_i)
  @project.update({:title => title})
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:project_info)
end

delete("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end

delete("/projects/:id/add") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end


# post("/volunteers/:id/edit") do
#   @project_id = Project.find(params[:id].to_i)
#   @volunteer = Volunteer.find(params[:id].to_i)
#   @volunteer.update({:project_id => @project_id})
#   binding.pry
#   @project_volunteers = @project.volunteers
#   @projects = Project.all()
#   @volunteers = Volunteer.all()
#   erb(:project_edit)
# end

patch("/volunteers/:id/edit") do
  name = params.fetch("name")
  project_id = params.fetch("project_id")
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.update({:project_id => project_id, :name => name})
  @volunteers = Volunteer.all()
  @project = Project.find(params[:id].to_i)
  @projects = Project.all()
  erb(:index)
end
