class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post_training, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
