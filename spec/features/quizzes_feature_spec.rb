require 'spec_helper'


describe 'quizzes' do

	before(:all) do
		Quiz.create(title: 'Some quiz title')
		Quiz.create(title: 'Another quiz title')
	end


	describe 'the quizzes page' do
		it 'should show the title of a quiz' do
			visit '/quizzes'

			expect(page).to have_content 'Some quiz title'
		end

		it 'shows a list of quizzes' do
			visit '/quizzes'

			expect(page).to have_css 'ol li', text: 'Some quiz title'
			expect(page).to have_css 'ol li', text: 'Another quiz title'
		end


	end

	describe 'an individual quiz page' do
		it 'has the title of the quiz' do
			visit '/quizzes'

			click_link 'Some quiz title'

			expect(page).to have_css 'h1', text: 'Some quiz title'
		end
	end

	describe 'the new quiz form' do

		it 'creates new quizzes' do
			visit '/quizzes/new'

			fill_in 'Title', with: 'New quiz title'
			click_button 'Create Quiz'

			expect(page).to have_content 'New quiz title'
		end
	end


	describe "an individual quiz page" do 
		it 'should have a list of questions' do 
			@quiz = Quiz.create(title: 'My quiz')		
			@quiz.questions << Question.create(query: 'What is the country with population of 64 million')
			visit quiz_path(@quiz)
			expect(page).to have_content('What is the country with population of 64 million')
		end
	end 


end