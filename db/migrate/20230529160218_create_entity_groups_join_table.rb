class CreateEntityGroupsJoinTable < ActiveRecord::Migration[7.0]
def change
    create_table :entity_groups do |t|
      t.references :entity, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end

    add_index :entity_groups, [:entity_id, :group_id], unique: true
  end
end
