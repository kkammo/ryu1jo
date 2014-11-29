class CreateSelecteds < ActiveRecord::Migration
  def change
    create_table :selecteds do |t|
      t.references :rater_group, index: true
      t.references :developer, index: true, null: false
      t.references :evaluation, index: true, null: false

      t.timestamps
    end
  end
end
