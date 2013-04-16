class PrintWork
  include Mongoid::Document
  extend Enumerize
  mount_uploader :file, FileUploader

  field :file, type: String
  field :description, type: String
  field :state, type: String

  # accesors
  attr_accessible :file, :description

  enumerize :state, in: [:queued, :cancelled, :ready], default: :queued

  # relations
  belongs_to :user

  # validations
  validates_presence_of :file, :state
  validates_size_of :file, maximum: 10.megabytes.to_i
  validate :file, :validate_count_for_user

  def validate_count_for_user
    if PrintWork.where(user: user).count > 1
      errors.add(:file, "Ya tenes mas de 2 archivos encolados. No podes subir mas")
    end
  end
end
