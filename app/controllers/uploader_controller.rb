class UploaderController < ApplicationController
  def img
  	put_policy = Qiniu::Auth::PutPolicy.new('testyune')
  	uptoken = Qiniu::Auth.generate_uptoken(put_policy)
  	render json: {uptoken: uptoken}
  end
end
