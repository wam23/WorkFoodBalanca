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
      if @answer.created_at >= question.start_at && @answer.created_at <= question.end_at
        if !@answer.response.nil? && question.response == @answer.response
          current_user.points = current_user.points + @answer.points
        elsif question.pointssystem == 2
          current_user.points = current_user.points - @answer.points
          if current_user.points < 0
            current_user.points = 0
          end
        end
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
