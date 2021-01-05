class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :phase_num
      t.string :web_link
      t.string :blog_link
      t.string :video_link
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
