require "test_helper"

class ContactsTest < ActionDispatch::IntegrationTest
  test "GET /contacts returns contacts" do
    get contacts_url, as: :json

    assert_response :success
    assert_match "data", @response.body
  end

  test "GET /contacts/id returns a contact" do
    contact = Contact.first
    get contact_url(contact), as: :json

    assert_response :success
    assert_includes @response.body, contact.email
  end

  test "GET /contacts/tag/:tag returns tagged contacts" do
    search_tag = "churned"
    get "/contacts/tag/#{search_tag}", as: :json

    assert_response :success
    assert_match "data", @response.body
  end
end
