.PHONY: clean develop install-tests lint publish test

develop:
	pip2 install "pip>=7"
	pip2 install -e git+https://github.com/getsentry/sentry.git#egg=sentry[dev]
	pip2 install -e .
	make install-tests

install-tests:
	pip install .[tests]

lint:
	@echo "--> Linting python"
	flake8
	@echo ""

test:
	@echo "--> Running Python tests"
	py.test tests || exit 1
	@echo ""

publish:
	python setup.py sdist bdist_wheel upload

clean:
	rm -rf *.egg-info src/*.egg-info
	rm -rf dist build
