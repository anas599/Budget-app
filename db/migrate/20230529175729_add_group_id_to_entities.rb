class AddGroupIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, foreign_key: true, null: true
  end
end
