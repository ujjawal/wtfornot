class WtfornotUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :hailwtfornot, :class_name => 'Hailwtfornot', :foreign_key => :wtfornot_id

end
