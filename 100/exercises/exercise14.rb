contact_data = ["joe@email.com", "123 Main St.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :tel]

contacts.each do |name|
  fields.each do |field|
    contacts[name][field] = contact_data.shift
  end
end

p contacts

#even better
contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end

p contacts
