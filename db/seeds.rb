user = Erp::User.first

Erp::Contacts::Contact.destroy_all

# creating Owner
puts "Owner"
country = Erp::Areas::Country.first
owner = Erp::Contacts::Contact.create(
  name: 'Công ty TNHH Urbangrill',
  address: '268 Lý Thường Kiệt, Phường 14',
  state_id: country.states.first.id,
  country_id: country.states.first.districts.first.id,
  contact_type: Erp::Contacts::Contact::TYPE_COMPANY,
  is_customer: true,
  is_supplier: true,
  creator_id: user.id
)
(puts '=========== ERRORs ===========' + owner.errors.to_json) if owner.errors.present?

# creating customers
puts "Customers - Personal"
names = [
  ['Nguyễn Tôn Hùng', Erp::Contacts::Contact::GENDER_MALE]
]

names.each do |name|
  state = country.states.order("RANDOM()").first
  is_customer = rand(0..1)
  person = Erp::Contacts::Contact.create(
    name: name[0],
    address: "#{rand(1..400)} Lý Thường Kiệt, Phường #{rand(1..20)}",
    state_id: state.id,
    country_id: state.districts.order("RANDOM()").first.id,
    contact_type: Erp::Contacts::Contact::TYPE_PERSON,
    is_customer: "#{is_customer}",
    is_supplier: "#{(is_customer == 0 ? 1 : rand(0..1))}",
    creator_id: user.id,
    gender: name[1]
  )
  (puts '=========== ERRORs ===========' + person.errors.to_json) if person.errors.present?
end