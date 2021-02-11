class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.text :comment, null: false
      t.integer :rate, null: false

      t.timestamps
    end
  end
end
