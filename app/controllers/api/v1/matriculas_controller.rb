module Api 
    module V1
        class MatriculasController < ApplicationController
            # Listar todas as matriculas
            def index
              matricula = Matricula.order('created_at DESC');
              render json: {status: 'Matrículas Carregadas!', message: 'Matrículas Carregadas!', data:matricula}, status: :ok
            end

            # Listar matricula passando ID
			def show
				matricula = Matricula.find(params[:id_matricula])
				render json: {status: 'Matrícula Carregada!', message:'Matrícula Carregada!', data:matricula},status: :ok
			end

             # Criar uma nova matricula
			def create
				matricula = Matricula.new(matricula_params)
				if matricula.save
					render json: {status: 'Matricula Criada!', message:'Matricula Criada!', data:matricula},status: :ok
				else
					render json: {status: 'ERROR', message:'Matricula não Criada!', data:matricula.errors},status: :unprocessable_entity
				end
			end

			def destroy
				matricula = Matricula.find(params[:id])
				matricula.destroy
				render json: {status: 'Matricula Deletada!', message:'Matricula Deletada!', data:matricula},status: :ok
			end

			# Parametros aceitos
			private
			def matricula_params
				params.permit(:valor_total_curso, :quantidade_faturas, :dia_venc_fatura, :nome_curso, :instituicao_id, :aluno_id)
			end
            
        end
    end
end