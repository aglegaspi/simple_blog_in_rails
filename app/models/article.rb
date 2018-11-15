class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
            # this allows us to delete comments associated with a deleted article

    validates :title, presence: true, length: { minimum: 5 }
    # these methods help validate data you sent to models. this will ensure that all articles will have
    # a title that's at least 5 characters long. 
end
