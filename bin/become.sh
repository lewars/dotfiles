#!/usr/bin/env bash

# This script is used to pass the credentials to authenticate to ansible using the current session and op

# Sign into 1password
eval $(op signin)

# Print secret to standout using secret reference
op read op://Personal/ansible-become-password/password
