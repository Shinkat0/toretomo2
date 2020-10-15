class RemoveDefaultRestrictionFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :name, from: "太郎", to: nil
  end
end
