# == Schema Information
#
# Table name: appeals
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  appeal_type :integer
#  department  :integer
#  subject     :string
#  description :text
#  private     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AppealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
