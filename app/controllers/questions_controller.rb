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

  private
    def question_params
      params.require(:question).permit(:content, :form_id, :necessary, :is_closed)
    end

end
