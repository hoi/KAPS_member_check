class AddLifetimeToMember < ActiveRecord::Migration
  def change
    add_column :members, :lifetime, :boolean, :default => false
  end
end
