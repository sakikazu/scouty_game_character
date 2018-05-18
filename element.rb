class Element
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

class Wind < Element
  def name
    '風'
  end

  def attack_power(job)
    power = 5
    power += 20 if job.class == Martial
    power
  end

  def defense_power(job)
    power = 10
    power
  end
end

class Water < Element
  def name
    '水'
  end

  def attack_power(job)
    power = 10
    power
  end

  def defense_power(job)
    power = 5
    power += 10 if job.class == Fighter
    power
  end
end

class Thunder < Element
  def name
    '雷'
  end

  def attack_power(job)
    power = 15
    power
  end

  def defense_power(job)
    power = 0
    power += 5 if job.class == Magician
    power
  end
end
