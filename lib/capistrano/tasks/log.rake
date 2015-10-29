namespace :logs do

  desc "Tail rails logs"
  task :tail do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end

	namespace :tail do
  	desc "Tail Sidekiq logs"
  	task :sidekiq do
    	on roles(:app) do
      	execute "tail -f #{shared_path}/log/sidekiq.log"
    	end
  	end

  	namespace :unicorn do
	  	desc "Tail Unicorn Stderror logs"
	  	task :stderror do
	    	on roles(:app) do
	      	execute "tail -f #{shared_path}/log/unicorn.stderr.log"
	    	end
	  	end

	  	desc "Tail Unicorn Stdout logs"
	  	task :stdout do
	    	on roles(:app) do
	      	execute "tail -f #{shared_path}/log/unicorn.stdout.log"
	    	end
	  	end
		end

		namespace :nginx do
			desc "Tail Nginx error logs"
	  	task :error do
	    	on roles(:app) do
	      	execute "tail -f /var/log/nginx/error.log"
	    	end
	  	end

	  	desc "Tail Nginx acccess logs"
	  	task :access do
	    	on roles(:app) do
	      	execute "tail -f /var/log/nginx/access.log"
	    	end
	  	end
		end
	end
end