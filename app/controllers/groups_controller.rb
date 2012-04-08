class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @contacts = @group.contacts
    @non_members = Contact.excluding_ids(@contacts.map(&:id))
    @groups= Group.all
    respond_to do |format|
      format.html
    end
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html
    end
  end


  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to contacts_path, notice: 'Group was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @group = Group.find(params[:id])
    add_to_group_if_contact_present
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to group_contacts_path(@group), notice: 'Group was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
    end
  end

private

def add_contact_when_present
  binding.pry
end



def add_to_group_if_contact_present
  if params[:contact_id]
    @contact = Contact.find(params[:contact_id])
    unless @contact.groups.include?(@group)
      @contact.groups << @group
    end
  end
end


end
