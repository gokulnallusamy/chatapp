class MessagesController < ApplicationController

  before_action :set_conversation

  # GET /messages or /messages.json
  def index
    @messages = @conversation.messages.all.includes(:user)
  end

  # POST /messages or /messages.json
  def create
    @message = @conversation.messages.new(message_params)
    @message.user_id = current_user.id
    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_url(@message.conversation_id), notice: "Message was successfully created." }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :conversation_id, :user_id)
    end
end
