class GroupContactsController < ApplicationController

  def create
    @group = Group.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    respond_to do |format|
      if @contact.groups.include?(@group)
        format.html { redirect_to @contact, notice: 'Subscriber already a member.' }
      else
        @contact.groups << @group
        format.html { redirect_to @contact, notice: 'Subscriber added to Group.' }
      end
    end
  end


  def destroy #called from contact#show
    @contact = Contact.find(params[:contact_id])
    @contact_group = ContactGroup.find_by_group_id_and_contact_id(params[:id], params[:contact_id])
    @contact_group.destroy
    respond_to do |format|
      format.html { redirect_to @contact }
    end
  end
end