# Helper methods defined here can be accessed in any controller or view in the application

module Leadgen
  class App
    module QuestionsHelper
      def question_one_results(answer)
        case answer
        when 1
          render 'answers/question_1_1'
        when 2
          render 'answers/question_1_2'
        when 3
          render 'answers/question_1_3'
        when 4
          render 'answers/question_1_4'
        end
      end
    end
    helpers QuestionsHelper
  end
end
