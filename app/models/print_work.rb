class PrintWork
  include Mongoid::Document
    extend Enumerize

  field :file, type: String
  field :description, type: String

  enumerize :state, in: [:queued, :cancelled, :ready], default: :queued

  # validations
  validates_presence_of :file, :state
end
