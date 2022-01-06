module Api 
  module V1
    class InstituicaosController < ApplicationController
      # Listar todas as instituições
    	def index
        	instituicao = Instituicao.order('created_at DESC');
        	render json: {status: 'Instituições Carregadas!', message: 'Instituições Carregadas!', data:instituicao}, status: :ok
      	end

      # Listar instituição passando ID
		def show
			instituicao = Instituicao.find(params[:instituicao_id])
			render json: {status: 'Instituição Carregado!', message:'Instituição Carregado!', data:instituicao},status: :ok
		end

      # Criar uma nova instituição
		def create
			instituicao = Instituicao.new(instituicao_params)
			if instituicao.save
				render json: {status: 'Instituição criada!', message:'Instituição criada!', data:instituicao},status: :ok
			else
				render json: {status: 'ERROR', message:'Instituição não criada!', data:instituicao.errors},status: :unprocessable_entity
			end
		end

		def destroy
			instituicao = Instituicao.find(params[:id])
			instituicao.destroy
			render json: {status: 'Instituição Deletada!', message:'Instituição Deletada!', data:instituicao},status: :ok
		end

			# Parametros aceitos
		private
		def instituicao_params
			params.permit(:nome_instituicao, :cnpj, :tipo)
		end
    end
  end
end