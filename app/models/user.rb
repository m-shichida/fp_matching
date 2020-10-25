# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  first_name        :string(255)      not null              # 姓
#  last_name         :string(255)      not null              # 名
#  email             :string(255)      not null              # メールアドレス
#  gender            :integer          not null              # 性別
#  age               :integer          not null              # 年齢
#  image             :string(255)                            # 顔写真
#  type              :string(255)      not null              # customerもしくはfinancial_planer
#  nick_name         :string(255)      not null              # ニックネーム
#  job_name          :string(255)      not null              # 職業
#  household_income  :integer                                # 世帯年収
#  savings           :integer                                # 貯蓄額
#  married           :boolean          not null              # 結婚しているか
#  dependent_count   :integer          not null              # 扶養人数
#  housemate_count   :integer          not null              # 同居人数
#  self_introduction :text(65535)      not null              # 自己紹介文
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :type, presence: true, inclusion: { in: [Customer.to_s, FinancialPlanner.to_s] }

  enum gender: { male: 0, female: 1 }

  def full_name
    "#{ first_name }#{ last_name }"
  end

  def customer?
    type == Customer.to_s
  end

  def financial_planner?
    type == FinancialPlanner.to_s
  end
end
