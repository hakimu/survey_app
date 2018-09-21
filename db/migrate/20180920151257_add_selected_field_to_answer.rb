class AddSelectedFieldToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :selected, :boolean
  end
end
