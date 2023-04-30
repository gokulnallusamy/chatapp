class ConversationsController < ApplicationController

  def index
    if params[:search].present?
      @users = User.where('email LIKE ?',"%#{params[:search]}%").all_except_current_user(current_user)
      @conversations = Conversation.all
    else
    @users = User.paginate(page: params[:page], per_page: 10).all_except_current_user(current_user)
    @conversations = Conversation.all
    end

  end

  # def search
  #   @user = User.where("email LIKE ?","%#{params[:search]}%")
  # end

  # POST /conversations or /conversations.json
  def create
    if Conversation.communication(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.communication(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

      if @conversation.save
         redirect_to conversation_messages_url(@conversation)
      end
  end

  private

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
