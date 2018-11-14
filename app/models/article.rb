class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    # these methos help validate data you sent to models. this will ensure that all articles will have
    # a title that's at least 5 characters long. 
end
