class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :title,       null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
