class TodoItem < ApplicationRecord
  belongs_to :todo_list

  scope :complete_count, -> { where("completed == true").count.to_f}
  scope :total_count, -> { self.count.to_f}
end
