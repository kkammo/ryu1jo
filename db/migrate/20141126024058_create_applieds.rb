class CreateApplieds < ActiveRecord::Migration
  def change
    create_table :applieds do |t|
      t.references :RateeGroup, index: true
      t.references :Developer, index: true

      t.timestamps
    end
  end
end
