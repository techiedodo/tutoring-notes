# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  summary        :text
#  achievement    :text
#  next_sess      :text
#  recommendation :text
#  trip_dist      :integer
#  rate           :integer
#  add_rate       :string
#  t_start        :time
#  t_finish       :time
#  sess_date      :date
#  tut_session_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :tut_session
end
