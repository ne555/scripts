#!/bin/bash
pip list --outdated --format=freeze \
    | grep --invert-match '^\-e' \
    | cut --delimiter== --fields=1 \
    | xargs --max-args=1 pip install --upgrade
