require 'swagger_helper'

RSpec.describe 'api/v1/voices', type: :request do
  path '/api/v1/voices' do
    get('list voices') do
      tags 'Voices'
      security [Bearer: []]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create voice') do
      tags 'Voices'
      security [Bearer: []]
      parameter name: 'user_id', in: :query, type: :string, description: 'user_id'
      consumes 'application/json', 'application/xml'
      parameter name: :voice, in: :body, schema: {
        type: :object,
        properties: {
          voice: {
            type: :object,
            properties: {
              file_name: { type: :string },
              voice_file: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/voices/{id}' do # rubocop:todo Metrics/BlockLength
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show voice') do
      tags 'Voices'
      security [Bearer: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update voice') do
      tags 'Voices'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
       parameter name: :voice, in: :body, schema: {
        type: :object,
        properties: {
          voice: {
            type: :object,
            properties: {
              file_name: { type: :string },
              voice_file: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update voice') do
      tags 'Voices'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
       parameter name: :voice, in: :body, schema: {
        type: :object,
        properties: {
          voice: {
            type: :object,
            properties: {
              file_name: { type: :string },
              voice_file: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete voice') do
      tags 'Voices'
      security [Bearer: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
