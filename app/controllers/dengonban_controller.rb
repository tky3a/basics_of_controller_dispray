class DengonbanController < ApplicationController
  layout 'dengonban'

  def initialize
    super
    #beginの処理が走った場合, rescueの例外処理を実行
    begin
      # ファイルを読み込んで、そのファイルの文字列をJSONとして解析
      @dengon_data = JSON.parse(File.read("data.txt"))
    rescue
      # 空のハッシュ{}を@dengon_dataに代入
      @dengon_data = Hash.new
    end
    @dengon_data.each do |key, obj|
      if Time.now.to_i - key.to_i > 24 * 60 * 60 then
        @dengon_data.delete(key)
      end
    end
      # ファイルの書き出し
      File.write("data.txt", @dengon_data.to_json)
  end

  def index
    # もし(post)requestが送られた場合
    if request.post?
      # MyData.new: MyDataクラスのインスタンスを作成
      obj = MyData.new(msg:params['msg'], name:params['name'],
      mail:params['mail'])
      # 作成したインスタンス(obj)を@dengon_dataに代入
      # @dengon_data[Time.now.to_i]　とすることでキーをタイムスタンプにしているので、実際にデータが格納された時に現在の時刻も追加される
      @dengon_data[Time.now.to_i] = obj
      # @dengon_dataをjson形式に変更
      data = @dengon_data.to_json
      # dataをdata.textという名前で書き出し
      File.write("data.text", data)
      # dataの内容をJSONとして解析
      @dengon_data = JSON.parse(data)
    end
  end

end


##MyDataクラスを作成（データを保管するためのクラス）
class MyData
    attr_accessor :name
    attr_accessor :mail
    attr_accessor :msg

    # データを代入
    def initialize msg:msg, name:name, mail:mail
      self.name = name
      self.mail = mail
      self.msg = msg
    end

end
