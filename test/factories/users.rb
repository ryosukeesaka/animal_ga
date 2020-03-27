FactoryBot.define do
	factory :user do
   		last_name             {"taro"}
   		first_name			  {"yamada"}
   		last_name_kana		  {"タロウ"}
   		first_name_kana       {"ヤマダ"}
   		prefectures           {"滋賀県"}
   		Image.id                {"00000"}
   		phone_number          {"11111111111"}

   		email                 {"b@b"}
   		password              {"00000000"}
   		password_confirmation {"00000000"}
 	end
end
