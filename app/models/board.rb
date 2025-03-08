# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: { minimum: 3, maximum: 20 }
    validates :description, length: { minimum: 20, maximum: 500 }
end
