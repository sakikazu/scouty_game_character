# scouty_game_character

## 新人研修

### ポイント
- 要件に合う設計ができているか
- 実際クラスを使う際に考慮した作りになっているか。Characterのinitializeに渡すものは？JobやElementはどう与えるか。

### メンターとして開発したこのプログラムについて
- 解き方：コンポジションと継承を使いました。
- 工夫した点：性別はCharacterを作るための必須情報なのでinitializeで渡すでもなく、別クラスとして分けることにしました（Man / Woman）。その他のElement, Job, Equipmentは必須ではなく、後で変わる可能性もあるものだと判断したため、セッターとしてchange_xxxを設けました。
- 悩んだ点：Element x Jobの組み合わせで攻撃力がアップする場合などは、該当クラスにifを設ける形にすると将来的に煩雑でバグを生みやすくなる懸念があったので、AdditionalPowerみたいなクラスに逃がして、そこにHashで一覧できる形にしようかと思いましたが、元の攻撃力と追加の分のコードが分かれてしまうことになり、ここは良い案が浮かばず、そのまま単純にifでやる形にしてます。
- 不足してる点：この研修課題ではテストはやらなかったため書いてません。

### pry上での実行
```Ruby
[1] pry(main)> load './character.rb'                                                                                                                                              => true
[2] pry(main)> man = Man.new
=> {:element=>nil, :job=>nil, :equipment=>nil, :attack_power=>5, :defense_power=>0, :skill=>""}
[3] pry(main)> man.change_element(Wind.new)
=> #<Wind:0x007f85b591a090>
[4] pry(main)> p man
{:element=>"風", :job=>nil, :equipment=>nil, :attack_power=>10, :defense_power=>10, :skill=>""}
=> {:element=>"風", :job=>nil, :equipment=>nil, :attack_power=>10, :defense_power=>10, :skill=>""}
[5] pry(main)> man.change_job(Martial.new)
=> #<Martial:0x007f85b2a87b60>
[6] pry(main)> p man
{:element=>"風", :job=>"武道家", :equipment=>nil, :attack_power=>30, :defense_power=>10, :skill=>"ブースト"}
=> {:element=>"風", :job=>"武道家", :equipment=>nil, :attack_power=>30, :defense_power=>10, :skill=>"ブースト"}
[9] pry(main)> man.change_equipment(Stick.new)
=> #<Stick:0x007f85b2091ea8>
[10] pry(main)> p man
{:element=>"風", :job=>"武道家", :equipment=>"杖", :attack_power=>60, :defense_power=>20, :skill=>"ブースト"}
=> {:element=>"風", :job=>"武道家", :equipment=>"杖", :attack_power=>60, :defense_power=>20, :skill=>"ブースト"}
[11] pry(main)> man.change_job(Magician.new)
=> #<Magician:0x007f85b5ae6108>
[12] pry(main)> p man
{:element=>"風", :job=>"魔法使い", :equipment=>"杖", :attack_power=>60, :defense_power=>20, :skill=>"ベギラマ"}
=> {:element=>"風", :job=>"魔法使い", :equipment=>"杖", :attack_power=>60, :defense_power=>20, :skill=>"ベギラマ"}
[13] pry(main)> man.change_job(Fighter.new)
=> #<Fighter:0x007f85b2b15f50>
[14] pry(main)> p man
{:element=>"風", :job=>"戦士", :equipment=>"杖", :attack_power=>40, :defense_power=>20, :skill=>"ギガスラッシュ"}
=> {:element=>"風", :job=>"戦士", :equipment=>"杖", :attack_power=>40, :defense_power=>20, :skill=>"ギガスラッシュ"}
```


## 元課題
以下の仕様で、戦士、魔法使い、武道家の
- 攻撃力
- 防御力
- スキル
のパラメータを取得できるようにしたいです。

問題文では少ないパターンの組み合わせになっていますが、将来的に装備やジョブの数が数百、数十になることを想定したクラス設計をしてください。

----

キャラクター(Character):
  - 性別 -> 男の場合は攻撃力 +5, 女の場合は防御力 +5

属性(Element):
  - 風(Wind) -> 攻撃力 +5 防御力 +10(武道家の場合はさらに攻撃力+20)
  - 水(Water) -> 攻撃力 +10 防御力 +5(戦士の場合はさらに防御力+10)
  - 雷(Thunder) -> 攻撃力 +15 防御力 +0(魔法使いの場合はさらに防御力+5)

ジョブ(Job):
  - 戦士(Fighter) → スキル: 男の場合は「ギガスラッシュ」、女の場合は「ビッグバン」
  - 魔法使い(Magician) → スキル: 男の場合は「ベギラマ」、女の場合は「メラミ」
  - 武道家(Martial) → スキル: 男の場合は「ブースト」、女の場合は「カウンタ」

装備(Equipment):
  - 剣(Sword) 攻撃力 +30 防御力 +30(戦士の場合はさらに攻撃力+20)
  - 杖(Stick) 攻撃力 +30 防御力 +10(魔法使いの場合はさらに攻撃力+20)
  - グローブ(Glove) 攻撃力 +20 防御力 +20(武道家の場合はさらに防御力+20)

