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
end
