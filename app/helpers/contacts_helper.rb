module ContactsHelper

  def group_memberships(contact)
    html = ""
    if contact.groups.any?
      html << "<ul><li><h3>Groups</h3></li>"
        contact.groups.each do |group|
          html << "<li><i class='icon-user'></i> #{link_to group.title, group}<span>#{link_to 'X', remove_group_from_contact_path(contact, group), confirm: 'Are you sure?', method: :delete}</span></li>"
        end
      html << "</ul>"
    end
    return html.html_safe
  end

  def add_to_group_button_if_available_groups(available_groups)
    if available_groups.any?
      link_to 'Assign to Group', '', :id => 'assign-to-grp',:class => 'nice small white radius button'
    end
  end


end
