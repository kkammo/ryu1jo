class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.references :developer, index: true
      t.string :prev
      t.string :current

      t.timestamps
    end
  end
end
