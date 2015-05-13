class PartyExtra < ActiveRecord::Base
  belongs_to :party

  def self.kpop
    where(music_type: 'kpop')
  end
end
