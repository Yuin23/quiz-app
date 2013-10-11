require 'spec_helper'

describe "questions" do 

	before(:all) do
		# CREATE QUESTION with text 'What is the capital of China?' here
		@quiz = Quiz.create(title: 'My quiz')		
		@quiz.questions << Question.create(query: 'What is the country with population of 64 million')
	end


 	describe "new question form" do 
		it 'creates new questions' do 
			# visit "/quizzes/#{@quiz.id}/questions/new/"
			visit new_quiz_question_path(@quiz)

			fill_in 'question[query]', with: 'What is the country that raises pandas'
			click_button 'Create Question'
			expect(page).to have_content('What is the country that raises pandas')
		end 
	end


	describe "question page" do 

		it 'can delete a question' do 
			visit quiz_path(@quiz)
			expect(page).to have_content('What is the country with population of 64 million')
			click_link 'Delete'
			expect(page).not_to have_content('What is the country with population of 64 million')

		end 
	end 

end 