class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies, id: false do |t|
    	t.string :name, null: false
    end

    add_index :companies, :name,	unique: true
  end
end
