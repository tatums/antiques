module ContactsHelper

  def group_memberships(contact)
    html = ""
    if contact.groups.any?
      html << "<ul><li><h3>Groups</h3></li>"
        contact.groups.each do |group|
          html << "<li><i class='icon-user'></i> #{link_to group.title, group_contacts_path(group)}</li>"
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

  def heading_row_if_group_present(group, output = "")
    if group
      output = "<div class='row'><div class='span12'><h1>" + group.title + " Group</h1></div></div>"
    end
    return output.html_safe
  end

end
