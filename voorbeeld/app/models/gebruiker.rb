class Gebruiker < ActiveRecord::Base
  attr_accessible :naam, :email, :wachtwoord
  attr_accessor :wachtwoord
  before_save :versleutel_wachtwoord

  validates :naam,  :presence => true
  validates :wachtwoord,  :presence => true, :length => {:minimum => 8}
  validates :email, :presence => true, :uniqueness => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  def self.authenticate(email, wachtwoord)
    gebruiker = find_by_email(email)
    if gebruiker
      versleuteld_wachtwoord = Digest::SHA1.hexdigest(wachtwoord+gebruiker.wachtwoord_salt)
      if gebruiker.wachtwoord_hash == versleuteld_wachtwoord
        gebruiker # geef record terug
      end
    end
  end

  def versleutel_wachtwoord
    if wachtwoord.present?
      self.wachtwoord_salt = rand(36**16).to_s(36)
      self.wachtwoord_hash = Digest::SHA1.hexdigest(wachtwoord+wachtwoord_salt)
    end
  end
end
