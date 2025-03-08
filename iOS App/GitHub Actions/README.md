To set this up, move `swift.yml` to the path:

```
.github/workflows/swift.yml
```

Make sure to address the TODO comment at the top of the file.

---

To ensure passing is enforced for pull requests (e.g. `develop` into `main`) add a new Ruleset in the repository's settings. Targeting the `main` branch (Include by pattern), tick:

* Restrict deletions
* Require a pull request before merging
    * Allowed merge methods: Merge
* Require status checks to pass
    * Require branches to be up to date before merging
    * Status checks that are required: Build and Test (the name of our job)
* Block force pushes