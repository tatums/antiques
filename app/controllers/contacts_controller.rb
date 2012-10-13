class ContactsController < ApplicationController
  before_filter :require_user, :except => [:new, :create]

  def index
    if params[:query]
      @contacts = Contact.search do
        keywords params[:query]
      end.results
    else
      @contacts = Contact.all
    end

    @groups = Group.all
    respond_to do |format|
      format.html
    end
  end


  def show
    @contact = Contact.find(params[:id])
    @groups = @contact.groups
    @available_groups = Group.excluding_ids(@groups.map(&:id))
    #@note = "*WARNING* All assoicated Invoices will also be deleted and cannot be undone."
    @notes = @contact.notes
    respond_to do |format|
      format.html
    end
  end


  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
    end
  end


  def edit
    @contact = Contact.find(params[:id])
  end


  def create
    @contact = Contact.new(params[:contact])
    add_to_group_if_group_present
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Subscriber was successfully saved.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    params[:contact][:group_ids] ||= []
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Subscriber was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
    end
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


end

