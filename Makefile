.PHONY: build fixlinks
include .env


build:
	mkdocs build
	./fixlinks.sh
	rm -rf .build
	mkdir -p .build/mkdocs-plugins
	mv site/* .build/mkdocs-plugins
	echo "Ready to publish"

fixlinks:
	./fixlinks.sh


clean:
	rm -rf site/
	rm -rf .build/

# require env variables
publish-dev:
	PYAZ_ACCOUNT_KEY=${DEV_ACCOUNT_KEY} pyazblob upload --path .build/ --account-name "neoteroideveuwstacc" -cn "\$$web" -r -f


publish-prod:
	PYAZ_ACCOUNT_KEY=${PROD_EUW_ACCOUNT_KEY} pyazblob upload --path .build/ --account-name "neoteroieuwstacc" -cn "\$$web" -r -f
	PYAZ_ACCOUNT_KEY=${PROD_USE_ACCOUNT_KEY} pyazblob upload --path .build/ --account-name "neoteroieusstacc" -cn "\$$web" -r -f
