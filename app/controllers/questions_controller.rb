class QuestionsController < ApplicationController

	def new
		@quiz = Quiz.find(params[:quiz_id])
		@question = Question.new
	end 

	def create
		@quiz = Quiz.find(params[:quiz_id])
		@quiz.questions << Question.create(params[:question].permit(:query))
		redirect_to quiz_path(@quiz)
		# redirect_to "/quizzes/#{@quiz.id}/questions" #enter index page route here.
	end

end
