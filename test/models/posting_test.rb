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

require 'test_helper'

class PostingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
