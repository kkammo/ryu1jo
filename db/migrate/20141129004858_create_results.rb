class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :value, default: 0
      t.references :RaterGroup, index: true, null: false
      t.references :RateeGroup, index: true, null: false
      t.references :Evaluation, index: true, null: false
      t.references :Material, null: false

      t.timestamps
    end
  end
end
