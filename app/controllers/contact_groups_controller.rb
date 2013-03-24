class ContactGroupsController < ApplicationController
  respond_to :html
  before_filter :require_user

  def create
    @group = Group.find(params[:group_id])
    @contact = Contact.find(params[:id])
    @group.contact_groups.build(contact: @contact)

    if @group.save
      flash[:notice] = 'Subscriber added to Group.'
    end
    respond_with(@group)
  end



  def destroy #called from groups#show
    @group = Group.find(params[:group_id])
    @contact_group = ContactGroup.find_by_contact_id_and_group_id(params[:id], params[:group_id])
    @contact_group.destroy
    respond_with(@group)
  end
end