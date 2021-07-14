class InquiryController < ApplicationController

  def index
  end

  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if params[:back]
      # redirect_to new_inquiry_path こちらを使うと, フォームが消える。つまり、上記new, confirmで値が消えないのはデフォルトでrenderを使っているから？
      render :new
    elsif @inquiry.save
      NoticeMailer.sendmail_inquiry(@inquiry).deliver
      redirect_to inquiry_index_path
    else
      render :new
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :mail_address, :category, :content)
  end
end
