require 'swagger_helper'

RSpec.describe 'api/v1/journals', type: :request do
  path '/api/v1/journals' do
    get('list journals') do
      tags 'Journals'
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

    post('create journal') do
      tags 'Journals'
      security [Bearer: []]
      parameter name: 'user_id', in: :query, type: :string, description: 'user_id'
      parameter name: 'voice_id', in: :query, type: :string, description: 'voice_id'
      consumes 'application/json', 'application/xml'
      parameter name: :journal, in: :body, schema: {
        type: :object,
        properties: {
          journal: {
            type: :object,
            properties: {
              file_name: { type: :string },
              transcribed_text: { type: :string },
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

  path '/api/v1/journals/{id}' do # rubocop:todo Metrics/BlockLength
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show journal') do
      tags 'Journals'
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

    patch('update journal') do
      tags 'Journals'
      security [Bearer: []] 
      consumes 'application/json', 'application/xml'
      parameter name: :journal, in: :body, schema: {
        type: :object,
        properties: {
          journal: {
            type: :object,
            properties: {
              file_name: { type: :string },
              transcribed_text: { type: :string },
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

    put('update journal') do
      tags 'Journals'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :journal, in: :body, schema: {
        type: :object,
        properties: {
          journal: {
            type: :object,
            properties: {
              file_name: { type: :string },
              transcribed_text: { type: :string },
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

    delete('delete journal') do
      tags 'Journals'
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
