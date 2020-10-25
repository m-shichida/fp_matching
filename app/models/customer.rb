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

class Customer < User
  validates :nick_name, presence: true
  validates :job_name, presence: true
  validates :dependent_count, presence: true
  validates :housemate_count, presence: true
end
