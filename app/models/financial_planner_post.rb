# == Schema Information
#
# Table name: financial_planner_posts
#
#  id                   :bigint           not null, primary key
#  description          :text(65535)      not null              # 説明文
#  interview_method     :integer          not null              # 希望面談方法
#  place                :string(255)                            # 場所
#  title                :string(255)      not null              # タイトル
#  url                  :string(255)                            # URL
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  financial_planner_id :bigint           not null              # ユーザー(ファイナンシャルプランナー)ID
#
# Indexes
#
#  index_financial_planner_posts_on_financial_planner_id  (financial_planner_id)
#
class FinancialPlannerPost < ApplicationRecord
  has_many :specialties, class_name: 'FinancialPlannerSpecialty', dependent: :destroy
  has_many :appointment_possibles, dependent: :destroy

  belongs_to :financial_planner

  accepts_nested_attributes_for :specialties, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :appointment_possibles, allow_destroy: true, reject_if: :all_blank

  validates :financial_planner_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :interview_method, presence: true

  # TODO: before_validationですでに一つ作成してある場合は弾く処理を使う

  enum interview_method: { face_to_face: 0, video_chat: 1 }
end
