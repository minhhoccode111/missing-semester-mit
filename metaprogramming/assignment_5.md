# [Build your own](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/building-actions) GitHub action to run [proselint](https://github.com/amperser/proselint) or [write-good](https://github.com/btford/write-good) on all the .md files in the repository.

Enable it in your repository, and check that it works by filing a pull request with a typo in it.

Set up proselint

```yml
jobs:
  build:
    steps:
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: "3.x"
      - name: Install Proselint
        run: pip install proselint
      - name: Run proselint on markdown files
        run: find . -name "*.md" -exec proselint {} + || true # Don't fail the CI
```

Set up write-good

```yml
jobs:
  build:
    steps:
      - name: Set up Node
        uses: actions/setup-node@v3
        with:
          node-version: "16"
      - name: Install write-good
        run: npm install -g write-good
      - name: Lint markdown with write-good
        run: find . -name "*.md" -exec write-good {} \; || true # Don't fail the CI
```
