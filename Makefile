build : data/tz.sql.gz
	docker build .
release :
	echo releasing...

data/tz.sql.gz : 
	mkdir -p data
	wget -O data/tz_world.zip http://efele.net/maps/tz/world/tz_world.zip > data/tz_world.zip
	unzip -u -d data data/tz_world.zip
	shp2pgsql -G -s 4326 -I -S -D data/world/tz_world.shp > data/tz.sql
	gzip -9 data/tz.sql
	rm -rf data/world
	rm -rf data/tz_world.zip

