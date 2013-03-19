class PrintWork
  include Mongoid::Document
  extend Enumerize
  mount_uploader :file, FileUploader

  field :file, type: String
  field :description, type: String
  field :state, type: String

  enumerize :state, in: [:queued, :cancelled, :ready], default: :queued

  # accesors, prevent setting the state from the print_works users (not admins)
  attr_accessible :file, :description

  # relations
  belongs_to :user

  # validations
  validates_presence_of :file, :state
  validates_size_of :file, maximum: 10.megabytes.to_i

  def cancel
    self.state = "cancelled" unless self.cancelled?
  end

  def cancelled?
    self.state == "cancelled"
  end

  def ready
    self.state = "ready" unless self.ready?
  end

  def ready?
    self.state == "ready"
  end

  def queued
    self.state = "queued" unless self.queued?
  end

  def queued?
    self.state == "queued"
  end

  def update_state(params)
    if params[:state] == "ready"
      self.ready
    else
      self.cancel
    end

    self.save
  end
end
