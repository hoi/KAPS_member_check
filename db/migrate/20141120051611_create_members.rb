class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :paypal_email
      t.date :membership_start
      t.date :membership_end

      t.timestamps
    end
  end
end
