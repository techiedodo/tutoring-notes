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
  validates :name, presence: true
  has_many :tut_sessions, dependent: :destroy

  default_scope { order('students.name ASC')}
end
