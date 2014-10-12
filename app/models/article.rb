class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  def publish!
    published
    save!
  end
end
