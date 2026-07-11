#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_NAME = image_recommendation_system
PYTHON_VERSION = 3.14
PYTHON_INTERPRETER = python

#################################################################################
# COMMANDS                                                                      #
#################################################################################


## Install Python dependencies; At first it only sync main deps then also dev if it installed
.PHONY: requirements
requirements:
	uv sync

## Install dev deps; all tools and other libraries
.PHONY: dev_tools
dev_tools:
	uv add --group dev ruff ty commitizen
	
.PHONY: EDA
EDA:
	uv add --group dev numpy pandas scipy matplotlib plotly seaborn

.PHONY: scikitlearn_ml
scikitlearn_ml:
	uv add --group dev scikit-learn
	
.PHONY: ensembletrees_ml
ensembletrees_ml:
	uv add --group dev xgboost lightgbm catboost
	
.PHONY: pytorch_dl
pytorch_dl:
	uv add --group dev torch

.PHONY: torchvision_dl
torchvision_dl:
	uv add --group dev torchvision

## Delete all compiled Python files
.PHONY: clean
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete


## Lint using ruff (use `make format` to do formatting)
.PHONY: lint
lint:
	ruff format --check
	ruff check

## Format source code with ruff
.PHONY: format
format:
	ruff check --fix
	ruff format





## Set up Python interpreter environment
.PHONY: create_environment
create_environment:
	uv venv --python $(PYTHON_VERSION)
	@echo ">>> New uv virtual environment created. Activate with:"
	@echo ">>> Windows: .\\\\.venv\\\\Scripts\\\\activate"
	@echo ">>> Unix/macOS: source ./.venv/bin/activate"
	



#################################################################################
# PROJECT RULES                                                                 #
#################################################################################


## Make dataset
.PHONY: data
data: requirements
	$(PYTHON_INTERPRETER) image_recommendation_system/dataset.py


#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys; \
lines = '\n'.join([line for line in sys.stdin]); \
matches = re.findall(r'\n## (.*)\n[\s\S]+?\n([a-zA-Z_-]+):', lines); \
print('Available rules:\n'); \
print('\n'.join(['{:25}{}'.format(*reversed(match)) for match in matches]))
endef
export PRINT_HELP_PYSCRIPT

help:
	@$(PYTHON_INTERPRETER) -c "${PRINT_HELP_PYSCRIPT}" < $(MAKEFILE_LIST)
