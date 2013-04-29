class CreateUserForms < ActiveRecord::Migration
  def change
    create_table :user_forms do |t|
      t.string :fname
      t.string :lname
      t.date :birthday
      t.string :country
      t.string :state
      t.string :city
      t.string :gender

      t.timestamps
    end
  end
end
