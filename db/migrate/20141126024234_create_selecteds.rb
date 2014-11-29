class CreateSelecteds < ActiveRecord::Migration
  def change
    create_table :selecteds do |t|
      t.references :RaterGroup, index: true
      t.references :Developer, index: true

      t.timestamps
    end
  end
end
