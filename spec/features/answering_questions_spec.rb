require 'spec_helper'

describe 'answering the questionairre', :type => :feature do
  it 'starts with the right question' do
    visit '/questions'
    expect(page).to have_content('Hey there')
  end
  it 'accepts a valid name on the questions index' do
    visit '/questions'
    fill_in 'name-field', with: 'Ben Walker'
    click_button "Let's Start"
    expect(page).to have_content('Q1')
    expect(current_path).to eql('/questions/one')
  end
  # it won't accept an invalid name
  it 'accepts a valid answer for question 1' do
    user = User.new(id: 1, name: 'Ben')
    user.save

    visit '/questions/one?id=1'
    choose 'radio-4'
    click_button 'Next Question!'
    expect(page).to have_content('Q2')
    expect(current_path).to eql('/questions/two')
  end
  # it must have a selection before continuing
  it 'accepts a valid answer for question 2' do
    user = User.new(id: 1, name: 'Ben', q1: 2)
    user.save

    visit '/questions/two?id=1'
    choose 'radio-2'
    click_button 'Onto Question Three!'
    expect(page).to have_content('Q3')
    expect(current_path).to eql('/questions/three')
  end
end
