class CreateQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_options do |t|
      t.string :content, null: false
      t.references :question, foreign_key: true, null: false 

      t.timestamps
    end
  end
end
