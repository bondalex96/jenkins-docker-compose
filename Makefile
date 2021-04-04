include .env
export

deploy:
	ssh deploy@${HOST} 'rm -rf jenkins && mkdir jenkins'
	scp docker-compose-prod.yml deploy@${HOST}:jenkins/docker-compose.yml
	scp -r docker deploy@${HOST}:jenkins/docker
	ssh deploy@${HOST} 'cd jenkins && echo "DOMAIN_NAME=${DOMAIN_NAME}" >> .env'
	ssh deploy@${HOST} 'cd jenkins && echo "EMAIL=${EMAIL}" >> .env'
	ssh deploy@${HOST} 'cd jenkins && docker-compose down --remove-orphans'
	ssh deploy@${HOST} 'cd jenkins && docker-compose pull'
	ssh deploy@${HOST} 'cd jenkins && docker-compose build --pull'
	ssh deploy@${HOST} 'cd jenkins && docker-compose up -d'
