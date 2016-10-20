# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
end
