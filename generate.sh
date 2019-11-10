#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
( cd "${DIR}" && kustomize build . )