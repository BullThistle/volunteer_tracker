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
        id: project['id'].to_i
        })
    end
  end

  def self.find(id)
    Project.all.each do |project|
      if project.id == id
        return id
      end
    end
  end
end
