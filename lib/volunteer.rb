class Volunteer
  attr_reader :name, :project_id, :id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@title}', #{@project_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(other_volunteer)
    @name == other_volunteer.name
  end

end
