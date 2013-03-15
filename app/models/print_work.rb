class PrintWork
  include Mongoid::Document
  extend Enumerize
  mount_uploader :file, FileUploader

  field :file, type: String
  field :description, type: String
  field :state, type: String

  enumerize :state, in: [:queued, :cancelled, :ready], default: :queued

  # relations
  belongs_to :user

  # scopes

  # validations
  validates_presence_of :file, :state
end
