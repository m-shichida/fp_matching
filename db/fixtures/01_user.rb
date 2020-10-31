Customer.seed(:id,
              {
                id: 1,
                first_name: '佐藤',
                last_name: '太郎',
                email: 'customer@example.com',
                gender: User.genders[:male],
                age: Random.rand(20..65),
                nick_name: '佐藤さん',
                job_name: '公務員',
                household_income: Random.rand(350..600),
                savings: Random.rand(350..600),
                married: [true, false].sample,
                dependent_count: Random.rand(0..5),
                housemate_count: Random.rand(0..5)
              })

2.times do |t|
  Customer.seed(:id,
                {
                  id: t + 2,
                  first_name: Faker::Name.last_name,
                  last_name: Faker::Name.first_name,
                  email: "customer_#{ t + 2 }@example.com",
                  gender: Random.rand(0..1),
                  age: Random.rand(20..65),
                  nick_name: 'ニックネーム',
                  job_name: Faker::Job.title,
                  household_income: Random.rand(350..600),
                  savings: Random.rand(350..600),
                  married: [true, false].sample,
                  dependent_count: Random.rand(0..5),
                  housemate_count: Random.rand(0..5)
                })
end

FinancialPlanner.seed(:id,
                      {
                        id: 5,
                        first_name: '田中',
                        last_name: '次郎',
                        email: 'fp@example.com',
                        gender: User.genders[:male],
                        age: Random.rand(20..65),
                        career: 'ここに経歴が入ります。'
                      },
                      {
                        id: 6,
                        first_name: Faker::Name.last_name,
                        last_name: Faker::Name.first_name,
                        email: 'fp_2@example.com',
                        gender: Random.rand(0..1),
                        age: Random.rand(20..65),
                        career: 'ここに経歴が入ります。'
                      },
                      {
                        id: 7,
                        first_name: Faker::Name.last_name,
                        last_name: Faker::Name.first_name,
                        email: 'fp_3@example.com',
                        gender: Random.rand(0..1),
                        age: Random.rand(20..65),
                        career: 'ここに経歴が入ります。'
                      })
