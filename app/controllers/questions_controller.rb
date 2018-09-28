class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)

    if @question.save
      render json:{
          html_data: render_to_string(partial: 'forms/question', locals: {question: @question})
        }
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def add_option
    @questionOption = QuestionOption.new(option_params)
    if @questionOption.save
      render json:{
          html_data: render_to_string(partial: 'forms/option', locals: {option: @questionOption})
        }
    else
      puts option_params
    end
  end

  def remove_option
    @questionOption = QuestionOption.find(params[:option_id])
    @questionOption.destroy
  end

  private

    def option_params
      params.require(:question_option).permit(:content, :question_id)
    end

    def question_params
      params.require(:question).permit(:content, :form_id, :necessary, :is_closed)
    end

end
