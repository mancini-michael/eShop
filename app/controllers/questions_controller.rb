class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ edit update destroy ]

  def reply
    question = Question.find(params[:id])
    question.update(reply: params[:reply])

    redirect_to show_insertion_path(question.insertion_id) 
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def create
    @question = Question.create(question_params)
       
    if @question.valid?
      redirect_to "/insertion/"+@question.insertion_id.to_s
    else
      redirect_to insertion_path(@question.insertion_id), alert: "Domanda non valida" 
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to "/insertion/"+$insertion_id.to_s, notice: "Domanda eliminata con successo" }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:insertion_id, :user_id, :question)
    end
end
