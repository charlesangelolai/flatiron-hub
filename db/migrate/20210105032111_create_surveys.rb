class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :design_question
      t.string :navigation_question
      t.string :content_question
      t.string :performance_question
      t.integer :phase_num
      t.integer :rating
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
