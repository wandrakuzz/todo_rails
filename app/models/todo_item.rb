class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def percentage_of(n)
		self.tof / n.to_f * 100.0
	end
end
