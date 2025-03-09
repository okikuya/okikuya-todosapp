# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :datetime
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Task < ApplicationRecord
    belongs_to :user
    belongs_to :board
    has_one_attached :eyecatch

    validates :title, presence: true, length: { minimum: 3, maximum: 10 }
    validates :content, presence: true, length: { minimum: 20, maximum: 300 }
    validates :deadline, presence: true
end
