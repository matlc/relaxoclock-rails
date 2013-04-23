describe User do
  before { @user = User.new(email: "user@example.com") }

  it "should have an email" do
    @user.should respond_to(:email)
  end

  it "should validate" do
    @user.should be_valid
  end

  it "should not validate when email is empty or blank" do
    # before { @user.name = " " }
    @user.email = " "
    @user.should_not be_valid
  end

  it "should not be valid when email format is invalid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.should_not be_valid
    end
  end

  it "should be valid when email format is valid" do
    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
      @user.email = valid_address
      @user.should be_valid
    end
  end

  it "should not be valid if the email address it not unique" do
    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email.upcase
    user_with_same_email.save

    @user.should_not be_valid
  end
end
