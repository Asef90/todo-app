require 'rails_helper'

RSpec.describe "Todos", type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let!(:project) { create(:project) }
  let!(:todo) { create(:todo, is_completed: false, project: project) }
  let(:todo_response) { json_response['todo'] }

  describe 'POST /todos' do
    context 'project already exists' do
      before { post '/todos', params: { todo: attributes_for(:todo), project: { title: project.title } },
                              headers: headers }

      it 'returns todo response for specified project' do
        expect(todo_response['project_id']).to eq project.id
      end

      it 'returns all public project attributes' do
        expect(todo_response.keys).to match_array(['id', 'text', 'is_completed', 'project_id'])
      end

      it 'returns http success' do
        expect(response).to be_successful
      end
    end

    context 'project does not exist' do
      before { post '/todos', params: { todo: attributes_for(:todo), project: { title: 'Another project' } },
                              headers: headers }

      it 'returns todo response for new project' do
        expect(todo_response['project_id']).to_not eq project.id
      end

      it 'returns all public project attributes' do
        expect(todo_response.keys).to match_array(['id', 'text', 'is_completed', 'project_id'])
      end

      it 'returns http success' do
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /projects/:project_id/todos/:id' do
    before { patch "/projects/#{project.id}/todos/#{todo.id}", params: { todo: { is_completed: true } },
                                                               headers: headers }

    it 'returns http success' do
      expect(response).to be_successful
    end

    context 'response content' do
      it 'returns all public project attributes' do
        expect(todo_response.keys).to match_array(['id', 'text', 'is_completed', 'project_id'])
      end

      it 'returns todo with completed status' do
        expect(todo_response['is_completed']).to be_truthy
      end
    end
  end
end
