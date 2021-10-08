class QuestionsController < ApplicationController
  
  def my_questions
    @answers_from_user = Answer.where('user_id' => current_user)
    @question_ids = @answers_from_user.map{ |answer| answer.question_id }
    @answered_questions = Question.where(id: @question_ids)    
    @questions = Question.where('end_at >= ? and start_at <= ?', Time.now, Time.now) - @answered_questions
    #@points = verifyAnswers(@answers_from_user)
    
    @questions_map = []
    @answered_questions.each do |q|
      @questions_map[q.id] = q
    end

    if @questions.count > 0
      @timeout = @questions.first.durationLeft + 1
    else
      @timeout = 2
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
  
  def start_simulation
    question = Question.new
    question.info = 'Will this free kick result in a goal?'
    question.questiontype = 1 # 1: yes/no 2: value 3: YB/guest
    question.response = 1
    question.start_at = Time.now
    question.end_at = question.start_at + 15
    question.pointssystem = 1 # 1: normal (1P for correct answer) 2: set points
    question.save
    
    question = Question.new
    question.info = 'Will this penalty result in a goal?'
    question.questiontype = 1
    question.response = 1
    question.start_at = Time.now + 30
    question.end_at = question.start_at + 15
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Which team will substitute first?'
    question.questiontype = 3
    question.response = 1
    question.start_at = Time.now + 30
    question.end_at = question.start_at + 600
    question.pointssystem = 1
    question.save
    
    question = Question.new
    question.info = 'Who is the best player?'
    question.questiontype = 2
    question.response = 'Nsame'
    question.start_at = Time.now
    question.end_at = question.start_at + 600
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Who has more ball possession?'
    question.questiontype = 3
    question.response = 0
    question.start_at = Time.now
    question.end_at = question.start_at + 6300
    question.pointssystem = 2
    question.save

    question = Question.new
    question.info = 'How many beers will be sold tonight?'
    question.questiontype = 2
    question.response = 85673
    question.start_at = Time.now
    question.end_at = question.start_at + 600
    question.pointssystem = 1
    question.save
    
    question = Question.new
    question.info = 'Will this penalty be successful?'
    question.questiontype = 1
    question.response = 0
    question.start_at = Time.now
    question.end_at = question.start_at + 15
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Which team will get the first card?'
    question.questiontype = 3
    question.response = 1
    question.start_at = Time.now + 180
    question.end_at = question.start_at + 600
    question.pointssystem = 2
    question.save


    question = Question.new
    question.info = 'Who will lead at half time?'
    question.questiontype = 3
    question.response = 0
    question.start_at = Time.now
    question.end_at = question.start_at + 2700
    question.pointssystem = 1
    question.save

	question = Question.new
    question.info = 'Which team will score the first goal?'
    question.questiontype = 3
    question.response = 1
    question.start_at = Time.now
    question.end_at = question.start_at + 2700
    question.pointssystem = 2
    question.save

    question = Question.new
    question.info = 'Who wins the face-off?'
    question.questiontype = 3
    question.response = 0
    question.start_at = Time.now
    question.end_at = question.start_at + 300
    question.pointssystem = 2
    question.save
    



    redirect_back(fallback_location: root_path)
  end

  private

    def question_params
      params.require(:question).permit(:info, :questiontype, :response, :start_at, :end_at, :pointssystem)    
    end
    
end
