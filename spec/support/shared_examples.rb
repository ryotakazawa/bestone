#users#new
#view test
shared_examples_for "signup-form have right css" do
  it { expect(page).to have_css('label', text: 'Name') }
  it { expect(page).to have_css('label', text: 'Email') }
  it { expect(page).to have_css('label', text: 'Password') }
  it { expect(page).to have_css('label', text: 'Confirmation') }
  it { expect(page).to have_css('input#user_name') }
  it { expect(page).to have_css('input#user_email') }
  it { expect(page).to have_css('input#user_password') }
  it { expect(page).to have_css('input#user_password_confirmation') }
  it { expect(page).to have_button('Create my account') }
end


# signup
# users#create
# success
shared_examples_for "success create user" do
  scenario "user increment 1" do
    expect {
      visit signup_path
      fill_in_signup_form(:user) # => SupportModule を使用
      click_button "Create my account"
    }.to change(User, :count).by(1)
    #メッセージ
    expect(page).to have_css("div.alert.alert-success", text: "Welcome to the BESTONE!")
    # ユーザープロフィールへredirect
    expect(page).to have_current_path(user_path(User.last))
    expect(current_path).to eq user_path(User.last)
  end
end
# failed
shared_examples_for "fail create user" do
  scenario "user increment 0" do
    expect {
      visit signup_path
      fill_in_signup_form(:user, invalid: true) # => SupportModule を使用
      click_button "Create my account"
    }.to change(User, :count).by(0)
    # メッセージ
    expect(page).to have_css('div.alert.alert-danger', text: "errors")
    # サインアップページがrender
    expect(page).to have_title("Sign up")
    expect(page).to have_css("h1", text: "Sign up")
  end
end