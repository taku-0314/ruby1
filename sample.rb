class Player
  def hand
    puts("数字を入力してください")
    puts("0:グー")
    puts("1:チョキ")
    puts("2: パー")
    player_hand = gets.to_i
    if player_hand>=3
      puts "0~2の数字を入力してください"
      self.hand
    else
      puts player_hand
    end
    return player_hand
  end
end

class Enemy
  def hand
    enemy_hand=rand(0..2)
    if enemy_hand==0
      puts "相手の手はグーです。"
    elsif enemy_hand==1
      puts "相手の手はチョキです。"
    elsif enemy_hand==2
      puts "相手の手はパーです。"
    end
    return enemy_hand
  end
end

class Janken
  def pon(player_hand,enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    dif=((player_hand)-(enemy_hand))
    ans=(dif+3)%3
    if(ans==2)
      puts "あなたの勝ちです"
    elsif(ans==1)
      puts "あなたの負けです"
    elsif(ans==0)
      puts "引き分けです、もう一度じゃんけんを行います"
      @player = Player.new
      re_hand = @player.hand
      @enemy = Enemy.new
      re_enemy_hand = @enemy.hand
      pon(re_hand,re_enemy_hand)
    end
  end
end

@player = Player.new
@enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(@player.hand, @enemy.hand)

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
