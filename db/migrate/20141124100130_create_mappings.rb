class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings, id: false do |t|
      t.references :RateeGroup, index: true, null: false
      t.references :RaterGroup, index: true, null: false
      t.references :Evaluation, index: true, null: false
    end
    add_index :mappings, [:RateeGroup_id, :RaterGroup_id], unique: true
  end
end
