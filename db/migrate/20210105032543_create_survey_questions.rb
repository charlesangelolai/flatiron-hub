class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :design_question
      t.string :navigation_question
      t.string :content_question
      t.string :performance_question
      t.integer :phase_num

      t.timestamps null: false
    end
  end
end
