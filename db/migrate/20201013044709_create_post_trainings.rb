class CreatePostTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :post_trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :note
      t.string :exercise
      t.integer :weight
      t.integer :rep
      t.integer :bodyweight

      t.timestamps
    end
  end
end
