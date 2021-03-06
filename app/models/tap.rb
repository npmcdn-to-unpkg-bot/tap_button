# == Schema Information
#
# Table name: taps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar     :string
#  score      :float
#

require 'net/http'
require 'json'

class Tap < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :patient
  before_create :persist_happiness_score
  def persist_happiness_score
    self.score = rand()
  end

  # def persist_happiness_score
  #   unless self.score
  #     emotion_path = 'https://api.projectoxford.ai/emotion/v1.0/recognize'
  #     api_key = '668e7673e9ad459b98396035d7c81832'
  #     params = {'url'=> avatar.url}.to_json
  #     headers = {'Content-Type' => 'application/json', 'Ocp-Apim-Subscription-Key'=>api_key, 'Accept' => 'application/json'}
  #     rest = RestClient.post emotion_path, params, headers
  #     self.score = JSON.parse(rest.body)[0]['scores']['happiness']
  #     # self.save!
  #   end
  # end 
end
