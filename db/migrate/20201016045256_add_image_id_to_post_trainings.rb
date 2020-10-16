class AddImageIdToPostTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :post_trainings, :image_id, :string
  end
end
