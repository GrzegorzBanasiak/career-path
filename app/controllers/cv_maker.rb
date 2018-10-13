class CvMaker < ApplicationController

  attr_accessor :is_all_ok
  attr_accessor :answer

  def initialize(params)
    ActiveRecord::Base.transaction do
      make_answer(params)
    end
  end

  private
    def make_answer(params)

      @form = Form.find(params[:form_id])
      @answer = @form.answers.build

      answer_params = params[:answer]
      @answer.set_params(answer_params)

      if @answer.save
        self.is_all_ok = true
        answer_params[:questions].each do |question|
          # I do this because i had a problem with convert string json object to hash
          question_item =  question[1]
          question_item_question_id = question_item[0]
          question_item_is_closed = question_item[2]

          quest = @form.questions.find(question_item_question_id)
          answer_question = @answer.answer_questions.build
          answer_question.question_id = quest.id

          if question_item_is_closed == "open"
            # set content if question is open
            answer_question.content = question_item[1]
          else
            # set question_option for answer_question if question is closed
            answer_question.question_option_id = question_item[1]
          end

          if answer_question.save
            puts "zapisano"
          else
            raise ActiveRecord::Rollback
          end
          puts answer_question.inspect
        end
      else
        self.is_all_ok = false
      end
    end


end
