class User < ApplicationRecord
  has_secure_password

  belongs_to :archive_by, class_name: 'User', foreign_key: 'archive_by_id', optional: true

  enum status: ['archive', 'unarchive']

  validates :email,
    presence: true,
    uniqueness: true

  after_update :send_email_to_user

  def send_email_to_user
    UserNotificationMailer.with(user: self , status: status).send_status_change_email_to_user.deliver
  end
end
