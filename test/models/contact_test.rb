require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "email address is unique to a contact" do
    Contact.create!(
      name: "First",
      email: "hi@localhost.local"
    )

    duplicate = Contact.new(
      name: "Second",
      email: "hi@localhost.local"
    )

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "should normalize tags before save" do
    contact = Contact.create!(
      name: "Test User",
      email: "hi@localhost.local",
      tags: [" Lead ", "lead", "FINALIZED", nil]
    )
    assert_equal ["finalized", "lead"], contact.tags
  end

  test "should find contacts by tag" do
    contacts = Contact.with_tag("finalized")

    assert_equal 2, contacts.count
    assert_includes contacts, contacts(:cathy)
    assert_includes contacts, contacts(:andrew)
  end
end
