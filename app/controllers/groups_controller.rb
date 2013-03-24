class GroupsController < ApplicationController
  respond_to :html
  before_filter :require_user

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    @group = Group.find(params[:id])
    @contacts = @group.contacts
    @non_members = Contact.excluding_ids(@contacts.map(&:id))
    @groups= Group.all
    respond_with(@group)
  end

  def new
    @group = Group.new
    store_referer
    respond_with(@group)
  end


  def edit
    @group = Group.find(params[:id])
    respond_with(@group)
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:notice] = 'Group was successfully created.'
    end
    respond_with(@group)
  end

  def update
    @group = Group.find(params[:id])
    add_to_group_if_contact_present

    if @group.update_attributes(params[:group])
      flash[:notice] = 'Group was successfully updated.'
    end
    respond_with(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_with(@group)
  end


  private

  def add_to_group_if_contact_present
    if params[:contact_id]
      @contact = Contact.find(params[:contact_id])
      unless @contact.groups.include?(@group)
        @contact.groups << @group
      end
    end
  end


end
