module Api
  module V1
    class InstituicaosController < ApplicationController
      # Listar todas as instituições
      def index
        instituicao = Instituicao.order('created_at DESC')
        render json: { status: 'Instituições Carregadas!', message: 'Instituições Carregadas!', data: instituicao },
               status: :ok
      end

      # Listar instituição passando ID
      def show
        instituicao = Instituicao.find(params[:id])
        render json: { status: 'Instituição Carregado!', message: 'Instituição Carregado!', data: instituicao },
               status: :ok
      end

      # Criar uma nova instituição
      def create
        instituicao = Instituicao.new(instituicao_params)
        if instituicao.save
          render json: { status: 'Instituição criada!', message: 'Instituição criada!', data: instituicao },
                 status: :ok
        else
          render json: { status: 'ERROR', message: 'Instituição não criada!', data: instituicao.errors },
                 status: :unprocessable_entity
        end
      end

      # Deletar instituição
      def destroy
        instituicao = Instituicao.find(params[:id])
        instituicao.destroy
        render json: { status: 'Instituição Deletada!', message: 'Instituição Deletada!', data: instituicao },
               status: :ok
      end

      # Atualizar uma Instituição
			def update
				instituicao = Instituicao.find(params[:id])
				if instituicao.update(instituicao_params)
					render json: {status: 'SUCCESS', message:'Instituição Atualizada!', data:instituicao},status: :ok
        else
					render json: {status: 'ERROR', message:'Instituição não Atualizada!', data:instituicao.errors}, status: :unprocessable_entity
				end
			end

      # Parametros aceitos
      private

      def instituicao_params
        params.permit(:nome_instituicao, :cnpj, :tipo)
      end
    end
  end
end
