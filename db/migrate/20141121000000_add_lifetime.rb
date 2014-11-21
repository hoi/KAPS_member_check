class AddLifeTimeToMember < ActiveRecord::Migration
  def change
    add_column :members, :lifetime, :boolean
  end
end
