class InquiryController < ApplicationController


  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      # NoticeMailer.sendmail_blog(@inquiry).deliver
      redirect_to blogs_path
    else
      render :new
    end
  end

  private
  def inquiry_params
    params[:inquiry].permit(:name, :mail_address, :category, :content)
  end
end
