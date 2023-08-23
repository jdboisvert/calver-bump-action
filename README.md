# calver-bump-action
A GitHub Action used to help automate running bumpver update on a project for you following the CalVer versioning convention. 

## Usage
Include the following in your workflow file to run the action.
```yaml
- name: Bump Version
  uses: jdboisvert/calver-bump-action@main
  with:
    git-username: 'Auto Bumpver Update Bot'
    git-email: 'actions@github.com'
    bumpver-config-path: '.bumpver.cfg'
    commit-message: 'Auto bumpver update'

```

## Inputs
| Name | Description | Required | Default |
| --- | --- | --- | --- |
| git-username | The username to use when committing the bumpver update | false | CalVer Auto Bump Bot |
| git-email | The email to use when committing the bumpver update | false | actions@github.com |
| commit-message | The commit message to use when committing the bumpver update | false | Auto bump version |
