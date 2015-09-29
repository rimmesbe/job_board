class AddUserIdToJobs < ActiveRecord::Migration
  def change
      add_column :jobs, :references, :user
  end
end
