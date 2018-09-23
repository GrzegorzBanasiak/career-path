class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :position
      t.string :description
      t.string :location
      t.string :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
