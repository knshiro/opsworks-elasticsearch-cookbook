update:
	git checkout master
	git stash
	berks update
	berks vendor /tmp/opsworks-elasticsearch-cookbook
	git checkout pub
	rm -rf *
	mv /tmp/opsworks-elasticsearch-cookbook/* .
	git add .
	git commit -m 'New update' || true
	git push
	git checkout master
	git reset HEAD --hard
	git stash pop

package:
	berks package opsworks-elasticsearch-cookbook.tar.gz

deploy: package
	aws s3 cp opsworks-elasticsearch-cookbook.tar.gz s3://`cat s3_bucket`
