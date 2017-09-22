class Project
  attr_reader :title, :id
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(other_project)
    @title == other_project.title
  end

  def self.all
    projects_out = DB.exec("SELECT * FROM projects;")
    projects_out.map do |project|
      Project.new({
        title: project['title'],
        id: project['id'].to_i,
        })
    end
  end

  def self.find(id_find)
    Project.all.each do |project|
      if project.id == id_find
        return project
      end
    end
  end

  def volunteers
    volunteers_list = []
    volunteers_in = DB.exec("SELECT * FROM volunteers WHERE project_id = '#{@id}';")
    volunteers_in.each do |volunteer|
      vol = Volunteer.new({
        name: volunteer['name'],
        id: volunteer['id'].to_i,
        project_id: volunteer[project_id].to_i
      })
      volunteers_list.push(vol)
    end
  end

  def update(attributes)
    @title = attributes[:title]
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = '#{@id}';")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = '#{@id}';")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{@id};")
  end
end
