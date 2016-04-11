test-integration:
	docker-compose run --rm --service-ports test_integration
	docker-compose ps -q | xargs docker inspect -f '{{ .State.ExitCode }}' | grep -v 0 | wc -l | tr -d ' '

start-test-app:
	cd test/integration/test_app && elm reactor

# Shell into the test app for debugging
sh-test-app:
	docker-compose run test_app /bin/bash
