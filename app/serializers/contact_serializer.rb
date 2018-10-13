class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind do
  	link(:related) { kind_url(object.kind.id) }
  end
  
  has_many :phones
  has_one :address

  # link(:self) { contact_path(object.id) }
  # link(:kind) { kind_path(object.kind.id) }

  # link(:self) { contact_url(object.id) }

  # def author
  # 	"Luiz Henrique"
  # end

  meta do
  	{ author: "Luiz Henrique" }
  end

  def attributes(*args)
  	h = super(*args)
  	# h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
  	h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  	h
  end
end
