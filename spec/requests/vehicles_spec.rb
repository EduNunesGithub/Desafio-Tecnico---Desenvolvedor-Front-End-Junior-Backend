# spec/requests/vehicles_spec.rb

require 'swagger_helper'

RSpec.describe 'Vehicles API', type: :request do
  # Criar um veículo para os testes
  let!(:vehicle) { Vehicle.create!(
    name: 'Prius',
    description: { heading: 'Voluptatem autem et dicta qui.', paragraph: 'In voluptatem autem.' },
    features: { consumption: '45.2 km/l', engine: '1406 cm3', power: '34 cv', speed: '490 km/h' },
    image: { mobile: 'https://example.com/car-small.webp', desktop: 'https://example.com/car.webp' },
    legal_text: 'Eligendi omnis sint. Fugit qui sunt.',
    price: 196853.7,
    subheading: 'Molestias quo debitis tempora.',
    video: 'https://www.youtube.com/embed/du86pct7yzy?si=t77ac61b&controls=0'
  )}

  # Especificação para o endpoint de criação de um veículo
  path '/vehicles' do
    post 'Create a vehicle' do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, required: true, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :object, properties: { heading: { type: :string }, paragraph: { type: :string } } },
          features: { type: :object, properties: { consumption: { type: :string }, engine: { type: :string }, power: { type: :string }, speed: { type: :string } } },
          image: { type: :object, properties: { mobile: { type: :string }, desktop: { type: :string } } },
          legal_text: { type: :string },
          price: { type: :number },
          subheading: { type: :string },
          video: { type: :string }
        },
        required: ['name', 'description', 'features', 'image', 'legal_text', 'price', 'subheading', 'video']
      }

      response '201', 'vehicle created' do
        let(:vehicle) {
          {
            name: 'Tesla Model S',
            description: { heading: 'Autonomous electric car', paragraph: 'Electric car with full autonomy.' },
            features: { consumption: '120.5 km/l', engine: '5000 cm3', power: '500 cv', speed: '320 km/h' },
            image: { mobile: 'https://example.com/tesla-small.webp', desktop: 'https://example.com/tesla.webp' },
            legal_text: 'All rights reserved.',
            price: 79999.9,
            subheading: 'Luxury electric car.',
            video: 'https://www.youtube.com/embed/xYzMw72nJ0Y?si=TkDjd9qH&controls=0'
          }
        }
        run_test!
      end

      response '422', 'invalid request' do
        let(:vehicle) { { name: '', description: { heading: '', paragraph: '' }, features: { consumption: '', engine: '', power: '', speed: '' }, image: { mobile: '', desktop: '' }, legal_text: '', price: nil, subheading: '', video: '' } }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de listar todos os veículos
  path '/vehicles' do
    get 'Retrieve all vehicles' do
      tags 'Vehicles'
      response '200', 'vehicles found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :object, properties: { heading: { type: :string }, paragraph: { type: :string } } },
            features: { type: :object, properties: { consumption: { type: :string }, engine: { type: :string }, power: { type: :string }, speed: { type: :string } } },
            image: { type: :object, properties: { mobile: { type: :string }, desktop: { type: :string } } },
            legal_text: { type: :string },
            price: { type: :number },
            subheading: { type: :string },
            video: { type: :string },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: ['id', 'name', 'description', 'features', 'image', 'legal_text', 'price', 'subheading', 'video', 'created_at', 'updated_at']
        }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de obter um veículo específico
  path '/vehicles/{id}' do
    get 'Retrieve a specific vehicle' do
      tags 'Vehicles'
      parameter name: :id, in: :path, type: :integer, description: 'Vehicle ID'

      response '200', 'vehicle found' do
        let(:id) { vehicle.id }
        run_test!
      end

      response '404', 'vehicle not found' do
        let(:id) { 99999 }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de atualizar um veículo
  path '/vehicles/{id}' do
    put 'Update a vehicle' do
      tags 'Vehicles'
      parameter name: :id, in: :path, type: :integer, description: 'Vehicle ID'
      parameter name: :vehicle, in: :body, required: true, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :object, properties: { heading: { type: :string }, paragraph: { type: :string } } },
          features: { type: :object, properties: { consumption: { type: :string }, engine: { type: :string }, power: { type: :string }, speed: { type: :string } } },
          image: { type: :object, properties: { mobile: { type: :string }, desktop: { type: :string } } },
          legal_text: { type: :string },
          price: { type: :number },
          subheading: { type: :string },
          video: { type: :string }
        },
        required: ['name', 'description', 'features', 'image', 'legal_text', 'price', 'subheading', 'video']
      }

      response '200', 'vehicle updated' do
        let(:id) { vehicle.id }
        let(:vehicle) {
          {
            name: 'Tesla Model X',
            description: { heading: 'Electric SUV', paragraph: 'Electric SUV with full autonomy.' },
            features: { consumption: '110.5 km/l', engine: '5500 cm3', power: '550 cv', speed: '310 km/h' },
            image: { mobile: 'https://example.com/tesla-x-small.webp', desktop: 'https://example.com/tesla-x.webp' },
            legal_text: 'All rights reserved for Tesla.',
            price: 89999.9,
            subheading: 'Luxury electric SUV.',
            video: 'https://www.youtube.com/embed/xYzMw72nJ0Y?si=TkDjd9qH&controls=0'
          }
        }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { vehicle.id }
        let(:vehicle) { { name: '', description: { heading: '', paragraph: '' }, features: { consumption: '', engine: '', power: '', speed: '' }, image: { mobile: '', desktop: '' }, legal_text: '', price: nil, subheading: '', video: '' } }
        run_test!
      end
    end
  end

  # Especificação para o endpoint de deletar um veículo
  path '/vehicles/{id}' do
    delete 'Delete a vehicle' do
      tags 'Vehicles'
      parameter name: :id, in: :path, type: :integer, description: 'Vehicle ID'

      response '204', 'vehicle deleted' do
        let(:id) { vehicle.id }
        run_test!
      end

      response '404', 'vehicle not found' do
        let(:id) { 99999 }
        run_test!
      end
    end
  end
end
