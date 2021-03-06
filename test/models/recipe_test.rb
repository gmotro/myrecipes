require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "chicken parm", summary: "this is the best chicken parm",
                          description: "heat oil, add onions, add chicken,  cook 20 minutes")
  end
  
  test "recipe should be valid"  do 
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name= " "
    assert_not @recipe.valid?
    #assert @recipe.valid?
  end
  
  test "name lenght should not be too long" do
    @recipe.name= "a" * 101
    assert_not @recipe.valid?
    #assert @recipe.valid?
  end
  
  test "name length should not be too short"  do
    @recipe.name= "aaaa"
    assert_not @recipe.valid?
    
  end
  
  test "summary should be present" do 
    @recipe.summary= " "
    assert_not @recipe.valid?
  end
  
  test "summary lenght should not be too long" do 
        @recipe.summary= "a" * 151
        assert_not @recipe.valid?
  end
  
  test "summary lenght should not be too short" do 
        @recipe.summary= "aaaa"
        assert_not @recipe.valid?
  end
  
    test "description should be present" do 
        @recipe.description= " "
        assert_not @recipe.valid?
  end
  
    test "description lenght should not be too long" do 
            @recipe.description= "a" * 501
            assert_not @recipe.valid?
  end
  
  test "description lenght should not be too short" do 
            @recipe.description= "aaaa"
            assert_not @recipe.valid?
  end
  
end