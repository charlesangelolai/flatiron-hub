class CreateSurveyData < ActiveRecord::Migration
  def change
    create_table :survey_data do |t|
      t.string :design_data
      t.string :navigation_data
      t.string :content_data
      t.integer :user_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
