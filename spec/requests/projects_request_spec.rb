require 'rails_helper'

RSpec.describe 'Projects', type: :request do

  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let!(:projects) { create_list(:project, 3, :with_todos) }

  describe 'GET /projects' do
    before { get '/projects', headers: headers }

    it 'returns http success' do
      expect(response).to be_successful
    end

    context 'response content' do
      let(:projects_response) { json_response['projects'] }

      it 'returns all public project attributes' do
        expect(projects_response.first.keys).to match_array(['id', 'title', 'todos'])
      end

      it 'returns all existing projects' do
        expect(projects_response.count).to eq(projects.count)
      end
    end
  end
end
