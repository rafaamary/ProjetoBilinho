module Api 
    module V1
        class FaturasController < ApplicationController
            # Listar todos as faturas
            def index
              fatura = Fatura.order('created_at DESC');
              render json: {status: 'Faturas Carregadas!', message: 'Faturas Carregadas!', data:fatura}, status: :ok
            end

            def destroy
				fatura = Fatura.find(params[:id])
				fatura.destroy
				render json: {status: 'Fatura Deletada!', message:'Fatura Deletada!', data:fatura},status: :ok
			end

        end
    end
end