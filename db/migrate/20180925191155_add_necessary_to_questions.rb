class AddNecessaryToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :necessary, :boolean, null: false, default: false
  end
end
