.PHONY: run
run: # Run locally to port 8080
	scripts/run.py

.PHONY: updateblog
updateblog: # Update index.html with new data from posts
	scripts/update_blog.py

.PHONY: run
runblog: # Run locally to port 8080
	scripts/run_blog.py

.PHONY: update_www-data
update_www-data:
	scripts/update_www-data.sh

.PHONY: update_nginx
update_nginx:
	scripts/update_nginx.sh

.PHONY: ssl_cert
ssl_cert:
	scripts/ssl_cert.sh
