# == Schema Information
#
# Table name: financial_planner_posts
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null              # ユーザー(ファイナンシャルプランナー)ID
#  title            :string(255)      not null              # タイトル
#  description      :text(65535)      not null              # 説明文
#  interview_method :integer          not null              # 希望面談方法
#  place            :string(255)                            # 場所
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class FinancialPlannerPost < ApplicationRecord
  belongs_to :financial_planner

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :interview_method, presence: true

  enum :interview_method, { face_to_face: 0, video_chat: 1 }
end
