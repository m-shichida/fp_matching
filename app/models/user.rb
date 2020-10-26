# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  age               :integer          not null              # 年齢
#  dependent_count   :integer                                # 扶養人数
#  email             :string(255)      not null              # メールアドレス
#  first_name        :string(255)      not null              # 姓
#  gender            :integer          not null              # 性別
#  household_income  :integer                                # 世帯年収
#  housemate_count   :integer                                # 同居人数
#  image             :string(255)                            # 顔写真
#  job_name          :string(255)                            # 職業
#  last_name         :string(255)      not null              # 名
#  married           :boolean          default(FALSE)        # 結婚しているか
#  nick_name         :string(255)                            # ニックネーム
#  savings           :integer                                # 貯蓄額
#  self_introduction :text(65535)                            # 自己紹介文
#  type              :string(255)      not null              # customerもしくはfinancial_planer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
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
