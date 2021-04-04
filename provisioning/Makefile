deploy:
	ansible-playbook --extra-vars "@env.json" -i hosts.yml setup.yml

docker-login-agent:
	ansible-playbook -i hosts.yml docker-login-agent.yml

deploy-agent:
	ansible-playbook --extra-vars "@env.json" -i hosts.yml setup-agent.yml

docker-login:
	ansible-playbook --extra-vars "@env.json" -i hosts.yml docker-login.yml

show-initial-password:
	ansible -i hosts.yml manager -m shell -a 'cd /home/deploy/jenkins && docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword'

authorize-agents:
	ansible-playbook authorize-agents.yml -i hosts.yml

generate-agent-key:
	ssh-keygen -q -t rsa -N '' -f files/agent_rsa

install-dependencies:
	ansible-galaxy install -r requirements.yml
