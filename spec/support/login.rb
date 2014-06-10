def login(user = nil)
  user_to_login = user || create(:user)
  ApplicationController.any_instance.stub(:current_user).and_return(user_to_login)
  user_to_login
end