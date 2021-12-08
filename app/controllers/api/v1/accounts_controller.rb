module Api
  module V1
    class AccountsController < ApplicationController

      # Bypass authenitcation for basic login 
      skip_before_action :verify_authenticity_token  

      def new_transaction
        account_id = permitted_params[:account_id]
        amount = permitted_params[:amount]
        type = permitted_params[:transaction_type]
        account = Account.find account_id

        errors = TransactionValidator.new(
          account_id: account_id,
          amount: amount,
          transaction_type: type
        ).perform

        if errors.present?
          render json: { errors: errors }, status: :unprocessable_entity
        else
          TransactionCreator.new(
            account_id: account_id,
            amount: amount,
            transaction_type: type
          ).perform

          render json: { balance: account.balance }, status: :created
        end
      end

      private

      def permitted_params
        params.permit(:account_id, :amount, :transaction_type)
      end
    end
  end
end