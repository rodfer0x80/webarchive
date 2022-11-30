.PHONY: run
run: # Run locally to port 8080
	scripts/run.py

.PHONY: update
update: # Update local nginx instance
	scripts/update.sh

.PHONY: updateblog
update_blog: # Update index.html with new data from posts
	scripts/update_blog.py

.PHONY: run
run_blog: # Run locally to port 8080
	scripts/run_blog.py

.PHONY: update_www-data
update_www-data:
	scripts/update_www-data.sh

.PHONY: update_nginx
update_nginx:
	scripts/update_nginx.sh

.PHONY: update_iptables
update_iptables:
	scripts/update_iptables.sh

.PHONY: firewall_down
firewall_down:
	scripts/firewall_down.sh

.PHONY: ssl_cert
ssl_cert:
	scripts/ssl_cert.sh
