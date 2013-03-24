class ContactsController < ApplicationController
  respond_to :html, :js
  before_filter :require_user, :except => [:new, :create]

  def index
    @contacts = find_contact_from_query
    @groups = Group.all
    respond_with(@contacts)
  end

  def show
    @contact = Contact.find(params[:id])
    @groups = @contact.groups
    @available_groups = Group.excluding_ids(@groups.map(&:id))
    @notes = @contact.notes
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])
    add_to_group_if_group_present
    flash[:notice] = 'Subscriber was successfully updated.' if @contact.save
    respond_with(@contact)
  end

  def update
    params[:contact][:group_ids] ||= []
    @contact = Contact.find(params[:id])
    flash[:notice] = 'Subscriber was successfully updated.' if @contact.update_attributes(params[:contact])
    respond_with(@contact)
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_with(nil, location: contacts_url)
  end

private

  def add_to_group_if_group_present
    if params[:group_id]
      @group = Group.find(params[:group_id])
      unless @group.contacts.include?(@contact)
        @group.contacts << @contact
      end
    end
  end

  def find_contact_from_query
    if params[:query]
      Contact.search(params[:query])
    else
      Contact.all
    end
  end

end

