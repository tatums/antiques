class GroupContactsController < ApplicationController
  respond_to :html
  before_filter :require_user

  def create
    @group = Group.find(params[:id])
    @contact = Contact.find(params[:contact_id])

    @contact.contact_groups.build(group: @group)
    if @contact.save
      flash[:notice] = 'Subscriber added to Group.'
    end
    respond_with(@contact)
  end


  def destroy #called from contact#show
    @contact = Contact.find(params[:contact_id])
    @contact_group = ContactGroup.find_by_group_id_and_contact_id(params[:id], params[:contact_id])
    @contact_group.destroy
    respond_with(@group)
  end
end