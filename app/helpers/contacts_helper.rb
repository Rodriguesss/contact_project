module ContactsHelper
  def validate_name contact
    contact_name = contact.split()
    return contact_name[0]
  end

  def validate_rmk contact
    if contact.mb_chars.length < 40
      return contact
    else
      contact_rmk = ''
      27.times do |i|
        contact_rmk = contact_rmk + contact.mb_chars[i]
      end
      return contact_rmk
    end
  end

end
