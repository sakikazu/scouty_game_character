class Equipment
  def name
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def attack_power(job)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def defense_power(job)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end

class Sword < Equipment
  def name
    '剣'
  end

  def attack_power(job)
    power = 30
    power += 20 if job.class == Fighter
    power
  end

  def defense_power(job)
    power = 30
    power
  end
end

class Stick < Equipment
  def name
    '杖'
  end

  def attack_power(job)
    power = 30
    power += 20 if job.class == Magician
    power
  end

  def defense_power(job)
    power = 10
    power
  end
end

class Glove < Equipment
  def name
    'グローブ'
  end

  def attack_power(job)
    power = 20
    power
  end

  def defense_power(job)
    power = 20
    power += 20 if job.class == Martial
    power
  end
end
