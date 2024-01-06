#!/usr/bin/env bash

ruff check --fix .
ruff format .

scripts/lint_styles.py styles

pnpm prettier scripts -w
