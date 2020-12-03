FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"00000a"}
    password_confirmation {password}
    last_name             {"あべ"}
    first_name            {"けん"}
    last_name_kana        {"アベ"}
    first_name_kana       {"ケン"}
    birthday              {"2020/12/03"}
  end
end