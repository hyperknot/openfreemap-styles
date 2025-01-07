#!/usr/bin/env bash

ruff check --fix .
ruff format .

scripts/lint_styles.py styles

pnpm biome check --write --unsafe scripts
pnpm biome check --unsafe compare
