class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings, id: false do |t|
      t.references :ratee_group, index: true, null: false
      t.references :rater_group, index: true, null: false
      t.references :evaluation, index: true, null: false
    end
    add_index :mappings, [:ratee_group_id, :rater_group_id], unique: true
  end
end
