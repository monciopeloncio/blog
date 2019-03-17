#!/bin/bash
echo "Your PATH is $PATH"
echo "You are on branch $TRAVIS_BRANCH"
echo "The TRAVIS_PULL_REQUEST_BRANCH is $TRAVIS_PULL_REQUEST_BRANCH"
if [[ "$TRAVIS_PULL_REQUEST_BRANCH" = "" ]]
then
	zip -r r-ladies.zip docs/

	curl -H "Content-Type: application/zip" \
		 -H "Authorization: Bearer $NETLIFYKEY" \
		 --data-binary "@r-ladies.zip" \
	     https://api.netlify.com/api/v1/sites/<Your site domain name>/deploys
else
    echo "You are not on master, deploying preview."
fi
