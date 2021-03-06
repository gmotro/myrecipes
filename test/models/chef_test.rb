require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "john", email: "joht@example.com")
  end
  
  test "chef name should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
      @chef.chefname= " "
      assert_not @chef.valid?
  end
  
  test "chefname lenght should not be too long" do
    @chef.chefname= "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname length should not be too short"  do
    @chef.chefname= "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
      @chef.email = " "
      assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email=@chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses=%w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @chef.email=va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresess = %w[user@example,com user_at_eee.org user.name@examplem ]
    invalid_addresess.each do |va|
      @chef.email=va
      assert_not @chef.valid?, '#{va.inspect} should be invalid'
    end
  end  
  
end