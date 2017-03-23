class GroupsController < ApplicationController
  
  def index
    @group = Group.all 
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def create 
    @group = Group.new(name: params[:name])

    if @group.save
      flash[:success] = "Group Created"
      contact_ids = params[:contact_ids]
      contact_ids.each do |contact_id|
        contact_group = ContactGroup.new(group_id: @group.id, contact_id: contact_id)
        contact_group.save
      end 
    end
    redirect_to "/groups/#{@group.id}"
  end


  def new
    
  end

  def edit 
    
  end

end

