# == Schema Information
#
# Table name: postings
#
#  id         :integer          not null, primary key
#  title      :text
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Posting < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :title,:body, presence: true, on: :create
	validates :title, length:{maximum:60}
	validates :body,  length:{minimum:250}
end
