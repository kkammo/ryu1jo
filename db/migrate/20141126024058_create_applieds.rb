class CreateApplieds < ActiveRecord::Migration
  def change
    create_table :applieds do |t|
      t.references :ratee_group, index: true
      t.references :developer, index: true, null: false
      t.references :evaluation, index: true, null: false

      t.timestamps
    end
  end
end
