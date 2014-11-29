class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
    	t.boolean :appliable, default: true
    	t.boolean :processed, default: false
      t.timestamps
    end
  end
end
