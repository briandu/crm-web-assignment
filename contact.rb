# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
#
class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts.push(new_contact)
    return new_contact
  end

  def self.all
    @@contacts
  end

  def self.contact_organize
    @first_name

  end

# This is the same method as below
# def self.find(id)
  #   @@contacts.find { |contact| contact.id == id }
  # end

  def self.find(userid)
     @@contacts.each do |contact|
       if contact.id == userid
         return contact
       end
     end
     false
  end


  def update(attribute, user_modify)
    case attribute
    when "first_name"
      self.first_name = user_modify
      when "last_name"
      self.last_name = user_modify
      when "email"
      self.email = user_modify
      when "note"
      self.note = user_modify
    end
  end

  def self.find_by(attribute, user_input)
    case attribute
      when "first_name"
        @@contacts.each do |contact|
          if contact.first_name == user_input
            return contact
          end
        end
      when "last_name"
        @@contacts.each do |contact|
          if contact.last_name == user_input
            return contact
          end
        end
      when "email"
        @@contacts.each do |contact|
          if contact.email == user_input
            return contact
          end
        end
      when "note"
        @@contacts.each do |contact|
          if contact.note == user_input
            return contact
          end
        end
      end
    end

  def self.delete_all
    @@contacts.clear
  end

  def self.delete(userid)
    @@contacts.delete_if{ |contact| contact.id == userid}
  end

end
