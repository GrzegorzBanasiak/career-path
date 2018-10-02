class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :firstname, null: false
      t.string :secondname, null: false
      t.string :email, null: false
      t.string :phonenumber, null: false
      t.string :city, null: false 
      t.boolean :is_readed, null: false, default: false
      t.boolean :is_consant, null: false
      t.references :form, foreign_key: true, null: false

      t.timestamps
    end
  end
end
