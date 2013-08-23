
address = 1133 15th St NW, Washington, DC
service = opentable
fields = name,address,city,state,area,postal_code,phone,reserve_url

restaurants := ./node_modules/.bin/restaurants
json2csv := ./node_modules/.bin/json2csv

install:
	npm install

all: opentable yelp

factual:
	$(MAKE) run service=factual

opentable:
	$(MAKE) run

run:
	$(restaurants) $(address) --service $(service) --all > json/$(service).json
	$(json2csv) --input json/$(service).json --output csv/$(service).csv --fields $(fields)

yelp:
	$(MAKE) run service=yelp fields=distance,name,rating,url,phone

.PHONY: install all run opentable yelp
