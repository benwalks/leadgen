# Helper methods defined here can be accessed in any controller or view in the application
require 'yaml'

module Leadgen
  class App
    module QuestionsHelper
      def answers
        YAML.load_file(File.join('./app/', 'results.yml'))
      end

      def question_one_results(answer)
        answers = YAML.load_file(File.join('./app/', 'results.yml'))

        case answer
        when 1
          content_tag(:p, answers['question_1']['one'])
        when 2
          content_tag(:p, answers['question_1']['two'])
        when 3
          content_tag(:p, answers['question_1']['three'])
        when 4
          content_tag(:p, answers['question_1']['four'])
        end
      end
    end
    helpers QuestionsHelper
  end
end
