# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  age              :integer          not null              # 年齢
#  career           :text(65535)                            # 経歴
#  dependent_count  :integer                                # 扶養人数
#  email            :string(255)      not null              # メールアドレス
#  first_name       :string(255)      not null              # 姓
#  gender           :integer          not null              # 性別
#  household_income :integer                                # 世帯年収
#  housemate_count  :integer                                # 同居人数
#  image            :string(255)                            # 顔写真
#  job_name         :string(255)                            # 職業
#  last_name        :string(255)      not null              # 名
#  married          :boolean          default(FALSE)        # 結婚しているか
#  nick_name        :string(255)                            # ニックネーム
#  savings          :integer                                # 貯蓄額
#  type             :string(255)      not null              # customerもしくはfinancial_planer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class Customer < User
  validates :nick_name, presence: true
  validates :job_name, presence: true
  validates :dependent_count, presence: true
  validates :housemate_count, presence: true
end
