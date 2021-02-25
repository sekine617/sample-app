
#if Rails.env == 'development'

  # (1..2).each do |i|
  #     Shop.create!(name: "ケーキ屋#{i}", email: "cake#{i}@cake.jp", auth_id: "#{i}" ,password: "password#{i}", phone_number: "0120#{i}00000", opening_hours: "10:00~19:00", address: "東京",)
  #     end

  (1..20).each do
    email = Faker::Internet.email
    gimei = Gimei.new
    last_name = gimei.last.kanji 
    first_name = gimei.first.kanji
    last_hurigana = gimei.last.katakana 
    first_hurigana = gimei.first.katakana
    user = User.new(last_name: last_name, first_name: first_name ,last_hurigana: last_hurigana, first_hurigana: first_hurigana, email: email, password: 'password',)
    user.save!
  end

Shop.create!(
    [
        {name: 'ラミティエル', email: 'lamitiel@gmail.com', auth_id: '12345678', password: 'kjbl35h32',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都葛飾区新宿9丁目47 20番10号'},

    {name: 'Amour(アムール)', email: 'Amour@gmail.com', auth_id: '186322', password: '.djbvhli31',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都調布市深大寺元町1丁目652番地1号'},

{name: 'Beauté(ボーテ)', email: 'Beaute@gmail.com', auth_id: '1386981', password: '.cknnkjbb3',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都足立区千住龍田町17番地19号'},

{name: 'Bonheur(ボヌール)', email: 'Bonheur@gmail.com', auth_id: '109374', password: 'jkbu8674c',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都千代田区神田平河町466番地18号'},

{name: 'Hirondelle(イロンデール)', email: 'Hirondelle@gmail.com', auth_id: '10861771', password: 'clkhv4hl',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都国分寺市泉町3丁目980番地14号'},

{name: 'Chouette(シュエット)', email: 'Chouette@gmail.com', auth_id: '19371831', password: '.jkb24llh',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都八王子市高月町668番地4号'},

{name: 'クロシェット', email: 'Clochette@gmail.com', auth_id: '764931', password: ';jkbr23',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都港区白金1丁目508番地17号'},

{name: 'エスポワール', email: 'Espoir@gmail.com', auth_id: '836414', password: ';lkhonb21',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都千代田区丸の内ＪＰタワー649番地4号'},

{name: 'フルール', email: 'Fleur@gmail.com', auth_id: '4355426', password: 'liugbui3',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都杉並区下高井戸4丁目112番地10号'},

{name: 'フォンテーヌ', email: 'Fontaine@gmail.com', auth_id: '6246577', password: 'lkgby331',
phone_number: '0120-000-000', opening_hours: '10:00~19:00', address: '東京都豊島区南池袋4丁目308番地6号'},
    ])


Photo.create!([
    {image: File.open("#{Rails.root}/app/assets/images/home1.jpg"), title: 'チョコレートスイーツ特集' , description: '海外の人気ショコラティエや老舗洋菓子店のチョコレートスイーツを多数ご用意しました。'},
    {image: File.open("#{Rails.root}/app/assets/images/home2.jpg"), title: 'イチゴフェア' , description: 'いちごの王様「あまおう」や「紅ほっぺ」を使用した、ストロベリーデザートを中心にケーキ、ゼリーなどのグラスデザートもお買い求めできます。'},
    {image: File.open("#{Rails.root}/app/assets/images/home3.jpg"), title: '誕生日ケーキデリバリー' , description: 'お誕生日のお祝いに欠かせないバースデイケーキを店頭に出向かずに受け取ることができます。'},
    {image: File.open("#{Rails.root}/app/assets/images/shop1.jpg"), title: '店舗画像' },

])


array = %w[チョコレート フルーツ タルト デコレーションケーキ カットケーキ イチゴ 生クリーム カスタードクリーム]
array.each do |tag|
 tag_list = ActsAsTaggableOn::Tag.new
 tag_list.name = tag
 tag_list.save
end

   
  #   (1..5).each do |i|
  #     Product.create!(name: 'モンブラン', price: 600, description: '国産栗を使用したモンブラン', image: 'img04.jpeg', quantity_per_day: i,
  #                     shop_id: 1, category_ids: [1])
  #   end
  (1..2).each do |i|
  Product.create!(
    [
     {name: 'レアチーズケーキ', price: 600, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "カットケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake1.jpg"),
      description: 'サクサクのクッキー生地に、濃厚なデンマーク産クリームチーズを流し込んで固めた特製チーズケーキです。
      濃厚なチーズのしっとりした舌触りと食感を楽しめます。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ベイクドチーズケーキ', price: 450, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "カットケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake2.jpg"),
      description: 'サクサクのクッキー生地に、濃厚なデンマーク産クリームチーズを流し込んで焼いた特製チーズケーキです。
      濃厚なチーズのしっとりした舌触りと食感を楽しめます。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ショコラデコレーション', price: 2500, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート", "デコレーションケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake3.jpg"),
      description: '小麦粉とカカオパウダーで焼き上げたスポンジと濃厚なチョコレートムースを重ね、ショコラホイップ、イチゴの飾りで仕上げたムースケーキです。
      
      お酒：使用
      蜂蜜：不使用
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ガトーショコラ', price: 400, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート", "カットケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake4.jpg"),
      description: 'ヴァローナ社のチョコレートを贅沢に使用したガトーショコラです。香り高いカカオ本来の風味を感じられ、しっとりとした食感と軽い口当たりになっています。
      
      お酒：使用
      蜂蜜：不使用
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'ミルクレープ', price: 480, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "カスタードクリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake5.jpg"),
      description: '一枚一枚丁寧に重ねられたミルクレープです。しっとりとした皮は、生クリームとカスタードを混ぜたオリジナルのクリームと相性抜群です。甘さ控えめなので大人でも楽しめます。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'フラワーデコレーション', price: 4600, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "デコレーションケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake6.jpg"),
      description: 'しっとりふわふわスポンジに北海道産の特性生クリームを使用したデコレーションケーキです。仕上げにクリームでできたフラワーを飾り華やかに仕上げました。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'フルーツタルト', price: 3400, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "フルーツ", "カスタードクリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake7.jpg"),
      description: 'アーモンドの風味豊かなタルト台にカスタードクリームと生クリームを合わせた特性クリームを塗り、季節のフルーツを乗せたフルーツタルトです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ガトー・オ・ショコラ', price: 400, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["チョコレート", "カットケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake8.jpg"),
      description: 'ヴァローナ社のチョコレートを贅沢に使用したガトーショコラです。香り高いカカオ本来の風味を感じられ、しっとりとした食感と軽い口当たりになっています。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'しっとりロールケーキ', price: 1800, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake9.jpg"),
      description: 'しっとりふわふわスポンジに北海道産の特性生クリームを使用したロールケーキです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・
      
      当日中にお食べください'}, 

    {name: 'シュークリーム', price: 400, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "カスタードクリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake10.jpg"),
      description: 'サクサクに焼き上げたシュー生地に、カスタードクリームと生クリームを合わせた特性クリーム入れたシュークリームです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'イチゴのショートケーキ', price: 540, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "ショートケーキ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake11.jpg"),
      description: 'しっとりとしたスポンジ生地に滑らかなクリームとイチゴをふんだんに使った口当たりの良いさっぱりとしたケーキです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'ショコラエクレール', price: 500, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート", "カスタードクリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake12.jpg"),
      description: 'つややかなグラサージュのかかったチョコレートのエクレアです。エクレアの中には酸味の効いたパッションゼリーとカスタードクリームが入っており、濃厚チョコレートとの相性ピッタリの一品となっています。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'イチゴのシフォンケーキ', price: 460, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "イチゴ"], image: File.open("#{Rails.root}/app/assets/images/seed/cake13.jpg"),
      description: '米粉を100％使用したシフォン生地に特性生クリームをたっぷり使用し季節のイチゴを乗せて仕上げたシフォンケーキです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆
      
      当日中にお食べください'}, 

    {name: 'フルーツチーズタルト', price: 480, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "タルト", "フルーツ", "カスタードクリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake14.jpg"),
      description: 'アーモンドの風味豊かなタルト台にカスタードクリームと生クリームを合わせた特性クリームを塗り、季節のフルーツを乗せたフルーツタルトです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ・キウイ
      
      当日中にお食べください'}, 

     {name: 'メロンタルト', price: 500, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "フルーツ", "タルト"], image: File.open("#{Rails.root}/app/assets/images/seed/cake15.jpg"),
      description: 'アーモンドの風味豊かなタルト台にカスタードクリームと生クリームを合わせた特性クリームを塗り、メロンを乗せたタルトです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ローズ・ベリー', price: 660, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake16.jpg"),
      description: 'ホワイトチョコレートの薔薇の中に、ベリームース、ゼリーが入った甘酸っぱいケーキ。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: '和栗モンブラン', price: 440, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム"], image: File.open("#{Rails.root}/app/assets/images/seed/cake17.jpg"),
      description: '焼き上げたメレンゲにカスタードクリームと生クリームをのせ、モンブランクリームをたっぷりしぼりました。

      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'アントルメ・ショコラ', price: 580, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート"], image: File.open("#{Rails.root}/app/assets/images/seed/cake18.jpg"),
      description: 'ビスキュイ生地をチョコレートクリームとパッションムースではさみビターチョコレートのガナッシュでコーティングした濃厚なチョコレートケーキです。


      お酒：使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ブッシュ・ド・ノエル', price: 2100, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート"], image: File.open("#{Rails.root}/app/assets/images/seed/cake19.jpg"),
      description: 'ヘーゼルナッツに、ミルクチョコレートのガナッシュを重ねたブッシュ・ド・ノエル。チョコレートの濃厚な味わいを楽しめます。

      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 

    {name: 'ショコラティーヌ', price: 560, quantity_per_day: 10, shop_id: Random.rand(1..10), tag_list: ["生クリーム", "チョコレート"], image: File.open("#{Rails.root}/app/assets/images/seed/cake20.jpg"),
      description: '小麦粉とカカオパウダーで焼き上げたスポンジと濃厚なチョコレートムースを重ね、ショコラホイップで仕上げたムースケーキです。
      
      お酒：不使用
      蜂蜜：使用（1歳未満の乳児には食べさせないでください。）
      特定原材料等(28品目)：小麦・卵・乳成分・大豆・オレンジ
      
      当日中にお食べください'}, 
     
    ]
  ) 
end

(1..30).each do
Review.create!([
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40)  , comment: 'とても美味しかったです。', rate: 5 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: '美味しかったです', rate: 4 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: 'クリームが軽くて食べやすかったです。', rate: 4 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: '甘さがちょうどよく、食べやすかったです。', rate: 5 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: 'そこそこ美味しかったです。', rate: 4 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: '少し甘すぎました。', rate: 3 },
  {user_id: Random.rand(1..20) , product_id: Random.rand(1..40) , comment: '味がパッとしませんでした。', rate: 3 },
])
end

# @today = Date.current
# (1..20).each do 
# (0..180).each do |i|
#      product_id = Random.rand(1..40)
#      product = Product.find_by(id: product_id)
#      shop = Shop.find_by(id: product.shop_id)
#      rand_num = Random.rand(1..2)
#      Order.create!([
#         {user_id: Random.rand(1..20) , postcode: '12345' , prefecture_code: '22', address_city: '葛飾区', address_street: '新宿9丁目47', address_building: '20番10号', receipt_date: "#{@today + i.day}", receipt_time: Random.rand(1..4), total_price: rand_num * product.price }
#       ])
#      OrderProduct.create!([
#            {order_id: Order.last.id, product_id: product_id, shop_id: shop.id, quantity: rand_num , price: product.price}
#       ])
# end
# end

#end
