
convert: opentable.json
	./node_modules/.bin/json2csv --input opentable.json --output opentable.csv --fields name,address,city,state,area,postal_code,phone,reserve_url

install:
	npm install

opentable:
	./node_modules/.bin/restaurants 1133 15th St NW, Washington, DC --all > opentable.json
