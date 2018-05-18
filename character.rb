class Character
  attr_reader :gender

  def initialize(gender = 1)
    @gender = gender
    @element = nil
    @job = nil
    @equipment = nil
  end

  def change_element(element)
    @element = element
  end

  def change_job(job)
    @job = job
  end

  def change_equipment(equipment)
    @equipment = equipment
  end

  def attack_power
    power = 0
    power += 5 if @gender == 1
    power += @element.attack_power(@job) unless @element.nil?
    power
  end

  def defense_power
    power = 0
    power += 5 if @gender != 1
    power += @element.defense_power(@job) unless @element.nil?
    power
  end

  def skill
    @job.nil? ? "" : @job.skill(self)
  end
end

class Element
  def attack_power(job)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def defense_power(job)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end
class Wind < Element
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

class Job
  def skill
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end
class Martial < Job
  def skill(character)
    if character.gender == 1
      'ブースト'
    else
      'カウンタ'
    end
  end
end
