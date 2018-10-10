class CreateAnswerQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_questions do |t|
      t.references :answer, foreign_key: true
      t.references :question_option, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
