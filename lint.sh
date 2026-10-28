#!/usr/bin/env bash

ruff check --fix .
ruff format .

scripts/lint_styles.py styles

npx biome check --write --unsafe scripts
npx biome check --unsafe compare
