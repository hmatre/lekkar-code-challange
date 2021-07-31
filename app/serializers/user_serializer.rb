class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :status, :status_changed_time


  attribute :archive_by_user do |object|
    {
      user_id: object.archive_by_id,
      email: object.archive_by&.email
    }
  end
end
