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

    @message = Message.new({title: title, message: message, group_id: group_id})

    if @message.save
      flash[:success] = "Message Created"
      redirect_to "/messages/#{@message.id}"
    end 
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
