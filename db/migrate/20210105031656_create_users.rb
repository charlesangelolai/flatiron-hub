class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :pssword_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :class

      t.timestamps null: false
    end
  end
end
