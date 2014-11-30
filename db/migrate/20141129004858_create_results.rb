class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.float :value, default: 0.0
      t.integer :ratee_id, index: true, null: false
      t.integer :rater_id, index: true, null: false
      t.references :evaluation, index: true, null: false
      t.references :material, null: false

      t.timestamps
    end
  end
end
