Erp::Contacts::Engine.routes.draw do
	namespace :backend, module: "backend", path: "backend/contacts" do
		resources :titles do
			collection do
			  post 'list'
			  get 'dataselect'
			end
		end
		resources :tags
		resources :contacts do
			collection do
			  post 'list'
			  delete 'delete_all'
			end
		end
	end
end