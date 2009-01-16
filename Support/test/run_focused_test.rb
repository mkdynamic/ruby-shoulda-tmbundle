require 'rubygems'
require 'test/unit'
require 'shoulda'

=begin

This is an example Shoulda/Test::Unit file, to demonstrate which
tests can be identified by the print_should_test_name.rb script.

=end
class RunFocusedTest < Test::Unit::TestCase
  
  # works, although the class name MUST match the file name
  should "work without any nesting" do
    assert true
  end
  
  context "testing" do
    should "work" do
      assert true
    end
  
    context "nested contexts" do
      should "work too" do
        assert true
      end
      
      should "work with multiple tests" do
        assert true
      end
      
      context "with more nesting" do
        should "still work" do
          assert true
        end
      end
    end
    
    context "with multiple nested contexts" do
      should "additionally work" do
        assert true
      end
    end
  end
  
  # doesn't work.
  should "work here too" do
    assert true
  end
  
end