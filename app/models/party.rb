class Party < ActiveRecord::Base
  has_one :party_extra

  def self.available_to(user)
    scope = none
    scope = scope.or(adult_party) if user.adult?
    scope = scope.or(childrens_party(user.age))
    # ArgumentError: Relation passed to #or must be structurally compatible
    # scope = scope.or(kpop_music_festival)
    scope
  end

  def self.kpop_music_festival
    joins(:party_extra).merge(PartyExtra.kpop)
  end

  def self.adult_party
    where(party_type: 'adult')
  end

  def self.childrens_party(max_age)
    where(party_type: 'childrens')
      .where('max_age >= ?', max_age)
  end

  def self.not_full
    where(full: false)
  end
end
