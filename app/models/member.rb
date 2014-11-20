class Member < ActiveRecord::Base
  attr_accessible :email, :membership_end, :membership_start, :name, :paypal_email
end
