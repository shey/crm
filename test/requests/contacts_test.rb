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

  test "DELETE contact/id delets a contact" do
    contact = Contact.create!(
      name: "Delete Me",
      email: "delete@example.com",
      tags: ["hi"]
    )

    assert_difference "Contact.count", -1 do
      delete contact_url(contact), as: :json
    end

    assert_response :no_content
  end

  test "POST contact/ creates a contact" do
    assert_difference "Contact.count", 1 do
      post contacts_url, params: {
        contact: {
          name: "New",
          email: "new@example.com",
          tags: ["test", "urgent"]
        }
      }, as: :json
    end

    assert_response :created
    assert_match "new@example.com", @response.body
  end

  test "PATCH /contacts/id updates a contact" do
    contact = Contact.first
    patch contact_url(contact), params: {
      contact: {
        tags: contact.tags + ["zzzzz"]
      }
    }, as: :json

    assert_response :success
    assert_includes Contact.find(contact.id).tags, "zzzzz"
  end
end
