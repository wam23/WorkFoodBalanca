class AnswersController < ApplicationController
  
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end
  
  def answer_value
    @answer = Answer.new(answer_params)
    if @answer.save
      question = Question.find(@answer.question_id)
      if !@answer.response.nil? && question.response == @answer.response
        current_user.points = current_user.points + @answer.points
        current_user.save
      end
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  private

    def answer_params
      params.permit(:question_id, :user_id, :response, :points)    
    end

end
