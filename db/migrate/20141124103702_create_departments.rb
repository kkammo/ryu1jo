class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, id: false do |t|
      t.string :dname, null: false
      t.string :cname, index: true, null: false
    end
    add_index :departments, [:dname, :cname], unique: true
  end
end
