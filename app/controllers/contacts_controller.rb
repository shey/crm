class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    contacts = Contact.all

    render json: ContactSerializer.new(
      contacts
    ).serializable_hash.to_json
  end

  def show
    render json: ContactSerializer.new(
      @contact
    ).serializable_hash.to_json
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: ContactSerializer.new(
        contact
      ).serializable_hash.to_json, status: :created
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def by_tag
    contacts = Contact.with_tag(search_tag)
    render json: ContactSerializer.new(
      contacts
    ).serializable_hash.to_json
  end

  def update
  end

  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def search_tag
    params[:tag].downcase
  end

  def contact_params
    params.require(:contact).permit(:name, :email, tags: [])
  end

  def set_contact
    @contact = Contact.find_by(id: params[:id])
    render json: {error: "Contact not found"}, status: :not_found unless @contact
  end
end
