class ContactGroupsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @group.contacts.include?(@contact)
        format.html { redirect_to @group, notice: 'Subscriber already a member.' }
      else
        @group.contacts << @contact
        format.html { redirect_to @group, notice: 'Subscriber added to Group.' }
      end
    end
  end



  def destroy #called from groups#show
    @group = Group.find(params[:group_id])
    @contact_group = ContactGroup.find_by_contact_id_and_group_id(params[:id], params[:group_id])
    @contact_group.destroy
    respond_to do |format|
      format.html { redirect_to @group }
    end
  end
end