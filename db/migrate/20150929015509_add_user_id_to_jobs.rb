class AddUserIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :user, index: true
    add_foreign_key :jobs, :users
  end
end
