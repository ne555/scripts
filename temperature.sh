#!/bin/bash
sensors -A coretemp-isa-0000 | grep Core | cut -d+ -f2 | cut -d' ' -f1
