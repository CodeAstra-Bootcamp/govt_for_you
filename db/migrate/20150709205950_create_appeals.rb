class CreateAppeals < ActiveRecord::Migration
  def change
    create_table :appeals do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :appeal_type
      t.integer :department
      t.string :subject
      t.text :description
      t.boolean :private, default: true

      t.timestamps null: false
    end
  end
end
