module PropertyInformationsHelper
  def choose_new_or_edit
  if action_name == 'new' || action_name == 'create'
    property_informations_path
  elsif action_name == 'edit'
    property_information_path
  end
end
end
