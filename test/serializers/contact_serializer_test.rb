require "test_helper"

class ContactSerializerTest < ActiveSupport::TestCase
  test "serializes a contact with expected fields" do
    contact = contacts(:cathy)

    serialized =
      ContactSerializer.new(contact).serializable_hash

    data = serialized[:data]

    assert_equal :contact, data[:type]
    assert_equal contact.name, data[:attributes][:name]
    assert_equal contact.email, data[:attributes][:email]
    assert_equal contact.tags, data[:attributes][:tags]
  end
end
