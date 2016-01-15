module Person::Male
  extend ActiveSupport::Concern

  included do
    default_scope { where(gender: :male) }
  end
end
