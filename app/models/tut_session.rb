# == Schema Information
#
# Table name: tut_sessions
#
#  id           :integer          not null, primary key
#  session_name :text
#  student_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TutSession < ApplicationRecord
  validates :session_name, presence: true
  belongs_to :student

  default_scope { order('created_at Desc')}
end
