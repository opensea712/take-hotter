# == Schema Information
#
# Table name: requirements
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Requirement < ActiveRecord::Base
end
