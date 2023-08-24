# calver-bump-action
A GitHub Action used to help automate running bumpver update on a project for you following the [CalVer](https://calver.org/) versioning convention (YY.MM.DD.INC). 

So the first tag of the day will look like
```shell
v23.8.24.0
```
the following tag will look like
```shell
v23.8.24.1
```

## Usage
Include the following in your workflow file to run the action.
```yaml
- name: Bump Version
  uses: jdboisvert/calver-bump-action@main
```

## Example
```yaml
name: Bump Version

on:
  push:
    branches:
      - main

jobs:
  bump-version:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code with full history
      uses: actions/checkout@v2
      with:
        fetch-depth: 0

    - name: Bump Version
      uses: jdboisvert/calver-bump-action@v1.0.0
```

## Features and Notes
- This action will only create a tag for you with no Release generated
- This will not commit the version change to the main branch. In this code a `VERSION` file in the root of the project is either generated or updated with the new version. Your code will need to read this file to use the version it holds in the tag (for example in `setup.py` for a Python project). The idea is anything you release will use the tag version and anything you are working on will use the version in the `VERSION` file in it.
