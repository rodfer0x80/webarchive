.PHONY: run
run: # Run locally to port 8080
	scripts/run.py

.PHONY: updateblog
updateblog: # Update index.html with new data from posts
	scripts/update_blog.py

.PHONY: run
runblog: # Run locally to port 8080
	scripts/run_blog.py

