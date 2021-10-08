class QuestionsController < ApplicationController
  
  def my_questions
    @answers_from_user = Answer.where('user_id' => current_user)
    @question_ids = @answers_from_user.map{ |answer| answer.question_id }
    @answered_questions = Question.where(id: @question_ids)    
    @questions = Question.where('end_at >= ? and start_at <= ?', Time.now, Time.now) - @answered_questions
    # for now display only 1 question
    if @questions.count > 0
      @questions = [@questions.first]
    end
    
    @questions_map = []
    @answered_questions.each do |q|
      @questions_map[q.id] = q
    end

    if @questions.count > 0
      @timeout = @questions.first.durationLeft + 1
    else
      @timeout = 3
    end
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
    question.start_at = Time.now + 30
    question.end_at = question.start_at + 15
    question.pointssystem = 1 # 1: normal (1P for correct answer) 2: set points
    question.save
    
    question = Question.new
    question.info = 'Will this corner result in a goal?'
    question.questiontype = 1
    question.response = 1
    question.start_at = Time.now + 125
    question.end_at = question.start_at + 15
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Which team will substitute first?'
    question.questiontype = 3
    question.response = 1
    question.start_at = Time.now
    question.end_at = question.start_at + 600
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Who has more ball possession?'
    question.questiontype = 3
    question.response = 0
    question.start_at = Time.now + 40
    question.end_at = question.start_at + 6300
    question.pointssystem = 2
    question.save

    question = Question.new
    question.info = 'Will this penalty be successful?'
    question.questiontype = 1
    question.response = 0
    question.start_at = Time.now + 80
    question.end_at = question.start_at + 15
    question.pointssystem = 1
    question.save

    question = Question.new
    question.info = 'Which team will get the first card?'
    question.questiontype = 3
    question.response = 1
    question.start_at = Time.now + 105
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
    question.start_at = Time.now + 60
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

    question = Question.new
    question.info = 'Are more than 25''000 spectators here?'
    question.questiontype = 1
    question.response = 1
    question.start_at = Time.now + 110
    question.end_at = question.start_at + 500
    question.pointssystem = 2
    question.save
    
    question = Question.new
    question.info = 'Will there be a red card tonight?'
    question.questiontype = 1
    question.response = 1
    question.start_at = Time.now + 115
    question.end_at = question.start_at + 500
    question.pointssystem = 2
    question.save

    question = Question.new
    question.info = 'Will WorkFoodBalance win the Hackathon 2021?'
    question.questiontype = 1
    question.response = 1
    question.start_at = Time.now + 130
    question.end_at = question.start_at + 5000
    question.pointssystem = 2
    question.save

    question = Question.new
    question.info = 'How many yellow cards will be handed out at this game?'
    question.questiontype = 2
    question.response = 6
    question.start_at = Time.now + 50
    question.end_at = question.start_at + 5000
    question.pointssystem = 1
    question.save


    redirect_back(fallback_location: root_path)
  end

  private

    def question_params
      params.require(:question).permit(:info, :questiontype, :response, :start_at, :end_at, :pointssystem)    
    end
    
end
