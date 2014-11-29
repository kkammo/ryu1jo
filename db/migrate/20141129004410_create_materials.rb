class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :subject, null: false
      t.text :content, null: false
      t.integer :field, null: false
      t.references :developer, index: true, null: false
      t.integer :prate, null: false

      t.timestamps
    end
  end
end
