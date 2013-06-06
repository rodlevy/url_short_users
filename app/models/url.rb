class Url < ActiveRecord::Base
    
  before_create :shorten
  validates   :url, :presence => :true
  validates   :url, :uniqueness   => :true
  validate   :check_valid_url
  belongs_to  :user
  
# on custom validate its singular

  def shorten
    self.url_short = SecureRandom.hex(5)
  end

  def insert_user
    p '**************'
    p current_user
    if current_user
      self.user_id = current_user.id
    end
  end

  def check_valid_url
    return self if url.nil?
    match = self.url.match URI.regexp(['http', 'https'])
    unless match
      errors[:url] << "The URL is not valid"
    end
  end
end
