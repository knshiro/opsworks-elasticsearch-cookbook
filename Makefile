package:
	berks package opsworks-elasticsearch-cookbook.tar.gz

deploy: package
	aws s3 cp opsworks-elasticsearch-cookbook.tar.gz s3://`cat s3_bucket`
