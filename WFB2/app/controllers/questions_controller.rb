class QuestionsController < ApplicationController
  def my_questions
    @answers = Answer.all
    @answers_from_user = Answer.where("user_id" => 1)
    @question_ids = @answers_from_user.map { |answer| answer.question_id }
    @answered_questions = Question.where(id: @question_ids)

    @questions = Question.all - @answered_questions
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
    if @question.save
      redirect_to questions_url
    else
      render "new"
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
      render "edit"
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to questions_url
  end

  private

  def question_params
    params.require(:question).permit(:info, :questiontype, :response)
  end
end
