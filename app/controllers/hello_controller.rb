class HelloController < ApplicationController

  def index
    # #もしparamsのmsgがnilでは無い場合(paramsが送られてきた場合)
    # if params['msg'] != nil
    #   @title = params['msg']
    # #違う場合
    # else
    #   @title = "index"
    # end
    # @msg = 'this is redirect sample'

  #フォームで送信する場合
  #もしpostが送られてきた場合(requestされた)
  #   if request.post?
  #     @title = 'Requestされました'
  #     if params['check1']
  #       @msg = "チェックしました"
  #     else
  #       @msg = "チェックしてください"
  #     end
  #   else
  #     @title = 'Indexページ'
  #     @msg = 'チェックしてテキストを入力してください'
  #     @value = ''
  #   end
  # end

  # def other
  #   # otherにアクセスすると、indexにアクセスし直して、msgにparamsを送信する
  #   redirect_to action: :index, params: {'msg': 'from other page'}
  # end


  ##　ラジオボタン
#   if request.post? #postがリクエストされた場合
#     @title = 'request'
#     if params['r1'] #paramsにr1が送られた場合　
#       @msg = 'あなたが選択したのは:' + params['r1']
#     else
#       @msg = 'ボタンが選択されていません'
#     end
#     #リクエスト(post)が送信されていない場合
#   else
#     @title = "Indexページ"
#     @msg = "ラジオボタンを選択して送信してください"
#   end
# end

  ##　セレクトボックス
  #もしリクエストがpostされた場合
  if request.post?
    @title = "Result"
    #postされたパラメータがs1の場合
    if params['s1']
      @msg = "あなたが選択したのは"
      #ループさせて複数選択に対応
      for val in params['s1']
        @msg += val + " "
      end
    else
      @msg = '選択してください'
    end
    #なにもリクエストされていない場合
  else
    @title = "Index"
    @msg = "select List"
  end
  end



end
