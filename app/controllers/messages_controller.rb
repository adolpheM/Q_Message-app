class MessagesController < ApplicationController

  def new
    @group = Group.find_by(id: params[:group_id])
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def create
    title = params[:title]
    message = params[:message]
    group_id = params[:group_id]
  
    @message = Message.new(title: title, message: message, group_id: group_id)

    if @message.save
      message_content = @message.message

      url = "https://bulksms.vsms.net/eapi/submission/send_batch/1/1.0?username=#{ENV['username']}&password=#{ENV['password']}&batch_data=msisdn,message"

      @message.group.contacts.each do |contact|
        url += "%0a%22#{contact.phone_number}%22,%22#{message_content}%22"

      response = Unirest.post(url).body
      dfg response
      end
    end 

      flash[:success] = "Message Sent"
  end

  def edit
    @message = Message.find_by(id: params[:id])
  end

  def update
    @message = Message.find_by(id: params[:id]) 

    @message.title = params[:title]
    @message.message = params[:message]
    @message.save

    flash[:sucess] = "Message Updated"
    redirect_to "/messages/#{@message.id}"
  end

end

