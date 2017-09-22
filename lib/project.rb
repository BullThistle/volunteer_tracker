class Project
  attr_reader :title, :id
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
end

def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
  @id = result.first.fetch('id').to_i
end
def method_name

end
