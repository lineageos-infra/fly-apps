PHONY: deploy

deploy:
	fly secrets set --stage SSH_NKOWN_HOSTS_B64=$(cat ssh/known_hosts | base64 -w 0)
	fly deploy
