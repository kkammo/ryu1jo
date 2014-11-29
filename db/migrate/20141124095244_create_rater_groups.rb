class CreateRaterGroups < ActiveRecord::Migration
  def change
    create_table :rater_groups do |t|
    	t.references :evaluation, index: true, null: false
    end
  end
end
