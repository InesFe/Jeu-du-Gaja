class QuizController < ApplicationController
  
    def index
      
      @arrets = Arret.all.shuffle
      @questions = []
      question_type = rand(1..3)
     
      case question_type
          
          when 1
          arret = @arrets.pop
          options = Arret.where.not(id: arret.id).sample(2)
          options << arret
          options.shuffle!
          correct_answer_id = arret.id 
          @questions << {
              type: question_type,
              question: "Quel est le nom de l'arrêt rendu en #{arret.year} dont l'apport est le suivant: #{arret.apport}",
              options: options.map { |option| [option.name, option.id] },
              correct_answer: correct_answer_id.to_i
          }
          
          when 2
          arret = @arrets.pop
          options = Arret.where.not(id: arret.id).sample(2)
          options << arret
          options.shuffle!
          correct_answer_id = arret.id 
          @questions << {
              type: question_type,
              question: "En quelle année a été rendu l'arrêt #{arret.name} dont l'apport est le suivant: #{arret.apport}?",
              options: options.map { |option| [option.year, option.id] },
              correct_answer: correct_answer_id
          }
      
          when 3
          arret = @arrets.pop
          options = Arret.where.not(id: arret.id).sample(2)
          options << arret
          options.shuffle!
          correct_answer_id = arret.id 
          @questions << {
              type: question_type,
              question: "Quel est l'apport de l'arrêt #{arret.name} rendu en  #{arret.year}?",
              options: options.map { |option| [option.apport, option.id] },
              correct_answer: correct_answer_id
          }
          end
  
          session[:correct_answer_ids] = []
          session[:correct_answer_ids] << correct_answer_id.to_s
          @current_question = @questions.first
          session[:questions] = @questions
          session[:current_question_index] = 0
      end
    
      def submit
        # Retrieve questions and current_question_index from session
        @questions = session[:questions]
        @current_question_index = session[:current_question_index] || 0
        @current_question = @questions[@current_question_index]

        correct_answer_id = session[:correct_answer_ids][@current_question_index].to_i
        score = 0
        # Check if the user has submitted an answer
        if params[:question].present? && params[:question][:answer_id].present?
          # Convert the submitted answer ID to an integer for comparison
          submitted_answer_id = params[:question][:answer_id].to_i
        
          # Check if the submitted answer ID matches the correct answer ID
          if submitted_answer_id == correct_answer_id
            redirect_to correct_answer_path
          
          else
            #correct_arret = Arret.find(correct_answer_id)
            #flash[:error] = "Mauvaise réponse LA BONNE RÉPONSE ÉTAIT #{correct_answer_id}   📚"
            #redirect_to wrong_answer_path(correct_arret: correct_arret)
            # Find the correct Arret record
            correct_arret = Arret.find(correct_answer_id)

            # Pass the correct Arret to the wrong_answer page
            redirect_to wrong_answer_path(correct_arret: correct_arret)
          end

          #display the logs
          Rails.logger.info("Correct answer ID: ")
          Rails.logger.info("Submitted answer ID: #{submitted_answer_id}")
      
          # Move to the next question
          session[:current_question_index] += 1
        
        else
          #Handle case when no answer is submitted
          flash[:error] = 'Merci de choisir une réponse'
          redirect_to quiz_index_path
        end
      end
        
      def correct_answer
        
      end

      def wrong_answer
        @correct_arret = Arret.find(params[:correct_arret]) if params[:correct_arret]
      end
end