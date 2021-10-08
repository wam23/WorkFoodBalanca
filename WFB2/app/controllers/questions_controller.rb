class QuestionsController < ApplicationController
  
  def my_questions
    @answers_from_user = Answer.where('user_id' => current_user)
    @question_ids = @answers_from_user.map{ |answer| answer.question_id }
    @answered_questions = Question.where(id: @question_ids)    
    @questions = Question.where('end_at >= ?', Time.now) - @answered_questions
    @points = verifyAnswers(@answers_from_user)
    
    @questions_map = []
    @answered_questions.each do |q|
      @questions_map[q.id] = q
    end
  end

  def verifyAnswers(answers)
    points = 0

    answers.each { |answer|
      question = Question.find(answer.question_id)
      if !answer.response.nil? && question.response == answer.response
        points = points + 1
      end
    }

    return points
  end

  def new
    @question = Question.new
  end
  
  def index
    @questions = Question.paginate(page: params[:page])
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    duration = params[:id]
    @question.start_at = Time.now
    duration = params[:question][:duration].to_i
    if duration == 0
      duration = 24 * 3600
    end
    @question.end_at = @question.start_at + duration
    if @question.save
      redirect_to questions_url
    else
      render 'new'
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end
  
  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to questions_url
  end
  
  private

    def question_params
      params.require(:question).permit(:info, :questiontype, :response, :start_at, :end_at, :pointssystem)    
    end
    
end
