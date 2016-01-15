module Person::Female
  extend ActiveSupport::Concern

  included do
    default_scope { where(gender: :female) }
  end
end
