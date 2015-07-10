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

class Appeal < ActiveRecord::Base
  module AppealType
    REQUEST   = {code: 1, text: "Request"}
    COMPLAINT = {code: 2, text: "Complaint"}
    FEEDBACK  = {code: 3, text: "Feedback"}

    def self.all
      [REQUEST, COMPLAINT, FEEDBACK].collect{|opt| OpenStruct.new opt}
    end

    def self.all_codes
      self.all.collect(&:code)
    end
  end

  module Department
    AGRICULTURE = {code: 1, text: "Agriculture"}
    ENERGY      = {code: 2, text: "Energy"}
    EDUCATION   = {code: 3, text: "Education"}
    FINANCE     = {code: 4, text: "Finance"}
    PLANNING    = {code: 5, text: "Planning"}
    REVENUE     = {code: 6, text: "Revenue"}

    def self.all
      [AGRICULTURE, ENERGY, EDUCATION, FINANCE, PLANNING, REVENUE].collect{|opt| OpenStruct.new opt}
    end

    def self.all_codes
      self.all.collect(&:code)
    end
  end

  attr_accessor :agree_terms

  belongs_to :user
end
