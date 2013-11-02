class Consultation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :doctor_id, type: Integer
  field :patient_id, type: Integer

  belongs_to :doctor
  belongs_to :patient

  has_one :conversation, as: :conversable

  after_save do |cons|
    Conversation.create!(:conversable_id => cons.id, :conversable_type => cons.class.to_s)
  end
end
