class RemoveBodyFromResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :body, :text
  end
end
