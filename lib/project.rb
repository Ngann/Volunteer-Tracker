class Project
  attr_accessor(:title)
  attr_reader(:id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    returned_projects = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    returned_projects.each do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      return Project.new({:title => title, :id => id})
    end
  end

  def update(attributes)
    @title = attributes.fetch(:title, @title)
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")

      attributes.fetch(:volunteer_ids, []).each() do |volunteer_id|
      DB.exec("INSERT INTO volunteers_projects (volunteer_id, project_id) VALUES (#{volunteer_id}, #{@id});")
    end
  end

  # def volunteers
  # project_volunteers = []
  # results = DB.exec("SELECT volunteer_id FROM volunteers_projects WHERE project_id = #{self.id()};")
  #   results.each() do |result|
  #     volunteer_id = result.fetch("volunteer_id").to_i()
  #     volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{volunteer_id};")
  #     name = volunteer.first().fetch("name")
  #     project_volunteers.push(Volunteer.new({:name => name, :id => volunteer_id}))
  #   end
  #   project_volunteers
  # end

  def volunteers
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    volunteers = []
    results.each do |result|
      name = result.fetch('name')
      project_id = result.fetch('project_id').to_i()
      id = result.fetch('id').to_i()
      volunteers.push(Volunteer.new({:name => name , :project_id => project_id, :id => id}))
    end
    volunteers
  end


  def delete
    returned_projects = DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

end
