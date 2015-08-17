require 'spec_helper'

describe 'answering the questionairre', :type => :feature do
  it 'starts with the right question' do
    visit '/questions'
    expect(page).to have_content('Hey there')
  end
  it 'quesitonnaire index accepts a valid name and redirects to the next page' do
    visit '/questions'
    fill_in 'name-field', with: 'Ben Walker'
    click_button "Let's Start"
    expect(page).to have_content 'Q1'
    expect(current_path).to eql '/questions/one'
  end
  # it won't accept an invalid name
  it 'accepts a valid answer for question 1 and redirects to the next page' do
    user = User.new(id: 1, name: 'Ben')
    user.save

    visit '/questions/one?id=1'
    expect(page).to have_content "Alright #{user.name}, why build the dream at all?"
    choose 'radio-4'
    click_button 'Next Question!'
    expect(page).to have_content 'Q2'
    expect(current_path).to eql '/questions/two'
  end
  # it must have a selection before continuing
  it 'accepts a valid answer for question 2 and redirects to the next page' do
    user = User.new(id: 1, name: 'Ben', q1: 2)
    user.save

    visit '/questions/two?id=1'
    expect(page).to have_content 'What is your dream product?'
    choose 'radio-2'
    click_button 'Onto Question Three!'
    expect(page).to have_content 'Q3'
    expect(current_path).to eql '/questions/three'
  end
  # must have a selection before continuing
  it 'accepts a valid answer for question 3 and redirects to the next page' do
    user = User.new(id: 1, name: 'Ben', q1: 2, q2: 4)
    user.save

    visit '/questions/three?id=1'
    expect(page).to have_content 'Will you need funding?'
    choose 'radio-1'
    click_button 'Almost done...'
    expect(page).to have_content 'Q4'
    expect(current_path).to eql '/questions/four'
  end
  it 'accepts a valid answer for question 4 and redirects to the next page' do
    user = User.new(id: 1, name: 'Ben', q1: 2, q2: 4, q3: 1)
    user.save

    visit '/questions/four?id=1'
    expect(page).to have_content "What's the biggest risk for your project?"
    choose 'radio-3'
    click_button 'Onto the last question'
    expect(page).to have_content 'Q5'
    expect(current_path).to eql '/questions/five'
  end
  it 'accepts a valid answer for question 5 and redirects to the next page' do
    user = User.new(id: 1, name: 'Ben', q1: 2, q2: 4, q3: 1, q4: 3)
    user.save

    visit '/questions/five?id=1'
    expect(page).to have_content "What's next on your journey?"
    choose 'radio-4'
    click_button 'Show me my guide'
    expect(page).to have_content "Nice work #{user.name}!"
    expect(current_path).to eql '/questions/result'
  end
  it 'shows the correct information based on user answers' do
    user = User.new(id: 1, name: 'Ben', q1: 2, q2: 4, q3: 1, q4: 3, q5: 2)
    user.save

    visit '/questions/result?id=1'
    expect(page).to have_content("Nice work #{user.name}! " \
                                 " Let's discuss how you can move forward.")
    expect(page).to have_content("You probably haven't heard of them")
  end
end
