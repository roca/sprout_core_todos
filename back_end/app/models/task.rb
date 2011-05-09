class Task < ActiveRecord::Base
  
  def as_json(options = {})
  ret = {
  :guid => "/tasks/#{self.id}",
  :id => self.id,
  :description => self.description,
  :isDone => self.isDone
  }
  end
end
