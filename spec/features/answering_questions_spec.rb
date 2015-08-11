require 'spec_helper'

describe 'answering the questionairre', :type => :feature do
  it 'starts with the right question' do
    visit '/questions'
    expect(page).to have_content('Hey there')
  end
  it 'will continue after entering a valid name on index' do
    visit '/questions'
    # find('name-field').set 'Ben Walker'
    fill_in 'name-field', with: 'Ben Walker'
    click_button "Let's Start"
    expect(page).to have_content('Question 1')
    expect(current_path).to eql('question_one')
  end
end
