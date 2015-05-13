class Party < ActiveRecord::Base
  has_one :party_extra

  def self.available_to(user)
    base = Party.unscoped.joins(:party_extra)
    partial = base.none
    partial = partial.or(base.adult_party) if user.adult?
    partial = partial.or(base.childrens_party(user.age))
    partial = partial.or(Party.unscoped.kpop_music_festival)
    all.merge(partial)
  end

  def self.kpop_music_festival
    where(party_type: 'festival')
      .joins(:party_extra)
      .merge(PartyExtra.kpop)
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
