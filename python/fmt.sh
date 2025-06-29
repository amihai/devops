#! /bin/bash

# Installl and run black to format the code, isort to order the import and flake8 for linter

if ! black --version &> /dev/null; then
    echo black is missing... install it
    pip install black
    source ~/.bashrc
fi

echo "Format the code with black"
black .

if ! isort --version &> /dev/null; then
    echo isort is missing.. install it
    pip install isort
    source ~/.bashrc
fi

echo "Order the import from files"
isort .

if ! flake8 --version &> /dev/null; then
    echo flake8 is missing... install it
    pip install flake8
    source ~/.bashrc
fi

echo "Check the code syntax (lint) with flake8"
flake8 .

echo "All set!"
