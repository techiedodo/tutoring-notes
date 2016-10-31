# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tutor_id   :integer
#

class Student < ApplicationRecord
  validates :name, presence: true
  has_many :tut_sessions, dependent: :destroy
  has_many :notes, :through => :tut_sessions
  belongs_to :tutor

  default_scope { order('students.name ASC')}
end
