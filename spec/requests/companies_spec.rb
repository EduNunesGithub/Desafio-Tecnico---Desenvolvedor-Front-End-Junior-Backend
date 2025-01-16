# spec/requests/companies_spec.rb

require 'swagger_helper'

RSpec.describe 'Companies API', type: :request do
  # Criar uma company para os testes
  let!(:company) { Company.create!(address: 'Rua Exemplo', cnpj: '12.345.678/0001-99', company_name: 'Exemplo Ltda', phone: '11912345678', whatsapp: '11912345678') }

  # Especificação para o endpoint de criação de uma company
  path '/companies' do
    post 'Create a company' do
      tags 'Companies'
      consumes 'application/json'
      parameter name: :company, in: :body, required: true, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          cnpj: { type: :string },
          company_name: { type: :string },
          phone: { type: :string },
          whatsapp: { type: :string }
        },
        required: ['address', 'cnpj', 'company_name', 'phone', 'whatsapp']
      }

      response '201', 'company created' do
        let(:company) { { address: 'Rua Nova', cnpj: '21.654.321/0001-99', company_name: 'Nova Empresa Ltda', phone: '+55 11 99876-5432', whatsapp: '+55 11 99876-5432' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:company) { { address: '', cnpj: 'invalid_cnpj', company_name: '', phone: '', whatsapp: '' } }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de listar todas as companies
  path '/companies' do
    get 'Retrieve all companies' do
      tags 'Companies'
      response '200', 'companies found' do
        schema type: :object,
               properties: {
                 vehicles: { type: :array, items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     description: { type: :object, properties: {
                       heading: { type: :string },
                       paragraph: { type: :string }
                     }},
                     features: { type: :object, properties: {
                       consumption: { type: :string },
                       engine: { type: :string },
                       power: { type: :string },
                       speed: { type: :string }
                     }},
                     image: { type: :object, properties: {
                       mobile: { type: :string },
                       desktop: { type: :string }
                     }},
                     legal_text: { type: :string },
                     name: { type: :string },
                     price: { type: :number },
                     subheading: { type: :string },
                     video: { type: :string },
                     created_at: { type: :string, format: 'date-time' },
                     updated_at: { type: :string, format: 'date-time' }
                   }
                 }},
                 meta: { type: :object, properties: {
                   current_page: { type: :integer },
                   next_page: { type: :integer },
                   prev_page: { type: :integer },
                   total_pages: { type: :integer },
                   total_count: { type: :integer }
                 }}
               }
        let!(:vehicle_1) { create(:vehicle, name: 'Prius', description: { heading: 'Voluptatem autem et dicta qui.', paragraph: 'In voluptatem autem. Illo voluptatem occaecati.' }, price: 196853.7, created_at: '2025-01-15T17:11:11.741Z', updated_at: '2025-01-15T17:11:11.741Z') }
        let!(:vehicle_2) { create(:vehicle, name: 'Prius', description: { heading: 'Accusamus enim ad pariatur quia.', paragraph: 'Earum est qui. Vel est qui.' }, price: 197180.22, created_at: '2025-01-15T17:11:11.754Z', updated_at: '2025-01-15T17:11:11.754Z') }

        run_test!
      end
    end
  end

  # Especificação para o endpoint de obter uma company específica
  path '/companies/{id}' do
    get 'Retrieve a specific company' do
      tags 'Companies'
      parameter name: :id, in: :path, type: :integer, description: 'Company ID'

      response '200', 'company found' do
        let(:id) { company.id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 99999 }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de atualizar uma company
  path '/companies/{id}' do
    put 'Update a company' do
      tags 'Companies'
      parameter name: :id, in: :path, type: :integer, description: 'Company ID'
      parameter name: :company, in: :body, required: true, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          cnpj: { type: :string },
          company_name: { type: :string },
          phone: { type: :string },
          whatsapp: { type: :string }
        },
        required: ['address', 'cnpj', 'company_name', 'phone', 'whatsapp']
      }

      response '200', 'company updated' do
        let(:id) { company.id }
        let(:company) { { address: 'Rua Alterada', cnpj: '22.333.444/0001-99', company_name: 'Empresa Atualizada Ltda', phone: '+55 11 98765-4321', whatsapp: '+55 11 98765-4321' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { company.id }
        let(:company) { { address: '', cnpj: 'invalid_cnpj', company_name: '', phone: '', whatsapp: '' } }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de deletar uma company
  path '/companies/{id}' do
    delete 'Delete a company' do
      tags 'Companies'
      parameter name: :id, in: :path, type: :integer, description: 'Company ID'

      response '204', 'company deleted' do
        let(:id) { company.id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 99999 }
        run_test!
      end
    end
  end
end
