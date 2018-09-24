class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.boolean :is_closed, null: false, default: false
      t.references :form, foreign_key: true, null: false

      t.timestamps
    end
  end
end
