class AddQuestionIdToAnswerQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_questions, :question, foreign_key: true
  end
end
