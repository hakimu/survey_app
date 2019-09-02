class RemoveSelectedFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :selected, :boolean
  end
end
