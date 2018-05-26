require_relative './element'
require_relative './job'
require_relative './equipment.rb'

class Character
  def initialize
    @element = nil
    @job = nil
    @equipment = nil
  end

  def inspect
    {
      element: @element&.name,
      job: @job&.name,
      equipment: @equipment&.name,
      attack_power: self.attack_power,
      defense_power: self.defense_power,
      skill: self.skill,
    }
  end

  def man?
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def character_attack_power
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def character_defense_power
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
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
    power = character_attack_power
    power += @element.attack_power(@job) unless @element.nil?
    power += @equipment.attack_power(@job) unless @equipment.nil?
    power
  end

  def defense_power
    power = character_defense_power
    power += @element.defense_power(@job) unless @element.nil?
    power += @equipment.defense_power(@job) unless @equipment.nil?
    power
  end

  def skill
    @job.nil? ? '' : @job.skill(self)
  end
end

class Man < Character
  def man?
    true
  end

  def character_attack_power
    5
  end

  def character_defense_power
    0
  end
end

class Woman < Character
  def man?
    false
  end

  def character_attack_power
    0
  end

  def character_defense_power
    5
  end
end

