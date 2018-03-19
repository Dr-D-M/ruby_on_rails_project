class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :passworrd, message: "should match confirmation", if: :password
end
