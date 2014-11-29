class CreateRateeGroups < ActiveRecord::Migration
  def change
    create_table :ratee_groups do |t|
    	t.references :evaluation, index: true, null: false
    end
  end
end
