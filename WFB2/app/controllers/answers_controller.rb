class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to root_url
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  private

    def answer_params
      params.permit(:question_id, :user_id, :response)    
    end

end
