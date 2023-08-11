.PHONY: run
run:
	scripts/root_server.py

.PHONY: update
update: # Update local nginx instance
	scripts/update.sh

.PHONY: updateblog
update_blog: # Update index.html with new data from posts
	scripts/update_blog.py

.PHONY: local
run_blog: # Run locally to port 8080
	scripts/localhost_server.py

.PHONY: update_www-data
update_www-data:
	scripts/update_www-data.sh

.PHONY: update_nginx
update_nginx:
	scripts/update_nginx.sh

.PHONY: update_obsidian
update_obsidian: # update obsidian docker img and files
	scripts/update_obsidian.sh

.PHONY: update_ytpl
update_ytpl: # update ytpl docker img and executable
	scripts/ytpl_update.sh

.PHONY: update_iptables
update_iptables:
	scripts/update_iptables.sh

.PHONY: firewall_down
firewall_down:
	scripts/firewall_down.sh

.PHONY: ssl_cert
ssl_cert:
	scripts/ssl_cert.sh
