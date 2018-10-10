class ApplicationCv

  def initialize(params)
    make_answer(params)
  end

  private

    def make_answer(params)


      @form = Form.find(params[:form_id])
      @answer = @form.answers.build

      answer_params = params[:answer]

      @answer.firstname     = answer_params[:firstname]
      @answer.secondname    = answer_params[:secondname]
      @answer.email         = answer_params[:email]
      @answer.phonenumber   = answer_params[:phonenumber]
      @answer.city          = answer_params[:city]
      @answer.is_consant    = answer_params[:is_consant] == "true"

      puts @answer.valid?

      @answer.save


      answer_params[:questions].each do |question|

        # I do this becouse i had a problem with convert string json object to hash
        question_item =  question[1]
        question_item_id = question_item[0]
        question_item_is_closed = question_item[2]

        question = @form.questions.find(question_item_id)

        answer_question = @answer.answer_questions.build

        if question_item_is_closed == "open"
          answer_question.content = question_item[1]
        else
          answer_question.question_option_id = question_item[1]
        end

        
        puts answer_question.inspect

      end
    end
end
