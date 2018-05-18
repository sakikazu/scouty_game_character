class Job
  def name
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def skill
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end

class Fighter < Job
  def name
    '戦士'
  end

  def skill(character)
    if character.man?
      'ギガスラッシュ'
    else
      'ビッグバン'
    end
  end
end

class Magician < Job
  def name
    '魔法使い'
  end

  def skill(character)
    if character.man?
      'ベギラマ'
    else
      'メラミ'
    end
  end
end

class Martial < Job
  def name
    '武道家'
  end

  def skill(character)
    if character.man?
      'ブースト'
    else
      'カウンタ'
    end
  end
end
