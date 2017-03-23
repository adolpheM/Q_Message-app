class ContactsController < ApplicationController

  def index
    @contacts = Contact.all 
  end

  def new
    
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def create
    contacts = params[:contacts]

    contacts.each do |contact|
      name = contact[:name]
      phone_number = contact[:phone_number]
      contact = Contact.new({name: name, phone_number: phone_number, user_id: current_user.id})
      if contact.save
        flash[:success] = "Contacts Succesfully created"
      end 
    end
    redirect_to "/contacts"
  end

  def edit 
    @contact = Contact.find_by({id: params[:id]})
  end

  def update
    @contact = Contact.find_by(id: params[:id]) 
    @contact.name = params[:name]
    @contact.phone_number = params[:phone_number]
    @contact.save

    flash[:success] = "Contact Succesfully Updated"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy

    flash[:warning]= "Contact Deleted"
    redirect_to "/contacts"
  end

end

