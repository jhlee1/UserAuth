class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.text :body
      t.integer :employee_id

      t.timestamps
    end
  end
end
