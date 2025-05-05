class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    contacts = Contact.all

    render json: ContactSerializer.new(
      contacts
    ).serializable_hash.to_json
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
