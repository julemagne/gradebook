require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  
  test "login page works" do
    get teachers_path #request sent without logging in
    # assert_response :success false because we were redirected

    assert_equal response.code, "302"
    assert_redirected_to login_path #test you got redirected to the right place

    follow_redirect!
    assert response.body.include?("Password") #not a good test because you could change the HTML

    assert_template "new" #test that you are in the right view

    #We tested you get redirected to new view without correct login information.
    post login_path, session: {email: "dafsdf@example.com", password: "sdfsadfa"}
    assert_redirected_to login_path
    post login_path, session: {email: "mason@example.com", password: "catsdrool"}
    assert_redirected_to teachers_path

    follow_redirect!
    #You can use assert_select to search the CSS selectors (HTML elements) on the page.
    assert_select "tr", 2 # putting 1 makes it expect EXACTLY 1
  end

  test "can create student" do
    post login_path, session: {email: "mason@example.com", password: "catsdrool"}
    # Above line to get logged in to use for this test.
    post students_path, student: {email: "", password: "", teacher_id: ""}
    get teachers_path
    assert_select "tr", 3 # 3 tr because there are 3 students in the teachers' tables.
  end

end
