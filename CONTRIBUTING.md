# metadataCreator Contributing Guide <!-- omit in toc -->

Thanks for your interest in contributing to this repo! Here are some guidelines
and steps to get started.

## Table of Contents

* [Table of Contents](#table-of-contents)
* [Before You Begin](#before-you-begin)
* [Making Contributions](#making-contributions)
  * [PowerShell Guidelines](#powershell-guidelines)
  * [Python Guidelines](#python-guidelines)
  * [Sources Guidelines](#sources-guidelines)
  * [Languages Guidelines](#languages-guidelines)
  * [Documentation Guidelines](#documentation-guidelines)
* [Submitting your Contribution](#submitting-your-contribution)

## Before You Begin

Before you start contributing, be sure to read through all of the documentation
associated with this project. This will give you a better understanding of the
goals and purpose of the project.

## Making Contributions

Making contributions to a project can take many forms. Here are some ways you
can help:

* Writing documentation or tutorials about the project
* Testing for bugs and creating bug reports
* Fixing typos or small errors
* Adding new features or revising existing ones

### PowerShell Guidelines

To ensure that your contributions are consistent with the rest of the project,
please follow these guidelines:

* All variables, class, functions, parameters, and other identifiers should be
  written in PascalCase, e.g:
  * `New-MyFunction -Args1`
  * `$MyVariable = 1`
  * `Function MyFunction { ... }`
  * `Switch ($MyVariable) { ... }`
  * `$True`, `$False`, `$Null`
* Do not use aliases for cmdlets or functions. Prefer to use separate function
  if you want to repeat similar actions/tasks.
* Indentation must be 4 tab width.
* Always call for locale in script initialization for translation purposes.
* For file paths, use backwards slashes (`\`) instead of forward slashes (`/`).
* Always use `Write-Verbose` for verbose output.
* Comment your code as necessary, write simple descriptions for functions or
  other codes (as it's like written for 10 years old kid).
* If you commented some code blocks, avoid pushing those commented blocks to the
  repo unless it's necessary.
* Always consider other platforms when writing code (not just limited to
  Windows), as this project is intended to be cross-platform.
* Always save your files in UTF-8 **with** BOM encoding. This is the default
  encoding for PowerShell files.
* File name should follow Verb-Noun format in PascalCase, e.g: `New-MyFile.ps1`,
  `Get-MyFile.ps1`, except for main resource of this project: `./main.ps1` and
  `./setup.ps1` for quicker access via command line.

### Python Guidelines

Similar to the PowerShell guidelines, with a slight twist, please follow these
guidelines when contributing to the Python code:

* Nearly all guidelines on the PowerShell side apply here as well.
* However, for naming conventions, use snake_case instead of PascalCase, e.g:
  * `new_my_function(args1)`
  * `def my_function(string: str):`
  * `True`, `False`, `None`
* You could use PascalCase for class and variable names, e.g:
  * `class MyClass:`
  * `myVariable = 1`
* Text formatting should be done using f-strings, e.g:
  * `print(f"Hello, {name}!")`
* File formatting should be saved as UTF-8 **without** BOM encoding.
* Avoid using `async` and `await` keywords unless necessary, the Python modules
  used in this project are not async-compatible, especially `requests` and
  `BeautifulSoup`.
* To use translation, write following code in the beginning of your script:

  <!-- markdownlint-disable MD010 -->
  ```python
  #!/usr/bin/env python3
  # -*- coding: utf-8 -*-
  import os
  import json as j
  import requests as r
  from dotenv import load_dotenv as lenv

  # Load .env file
  lenv()

  # grab this script name
  script_name = os.path.basename(__file__)

  # from env, import translation file
  lang = os.getenv('LANGUAGE')
  with open(f'./Languages/{lang}/{script_name}.json', 'r') as f:
  	trl = j.load(f)

  # create a function to get translation string from json file
  def _(string: str):
  	return trl[string]
  ```
  <!-- markdownlint-enable MD010 -->

  Then, to translate a string, use `_('string')` in your script.

### Sources Guidelines

When contributing for the `/Sources`, please follow these guidelines:

* File format should be in `.json` and `.xml` only. Ensure that the file is
  saved in UTF-8 **without** BOM encoding.
* File name should be in camelCase, e.g: `myFile.json`, `myFile.xml`.

### Languages Guidelines

When contributing for the `/Languages`, please follow these guidelines:

* Copy `/Languages/en-US` folder and rename it to your language code by
  following Microsoft Culture Code formatting.
  * To find your language code, you can run `Get-Culture -ListAvailable` in
    PowerShell, and pick on the language code `Name` that matches your language
    `DisplayName`.
  * If you found two variants of your language, pick the one that has the most
    specific region code, e.g: `en-US` instead of `en`.
* Translate all files in the folder to your language.
* Update `/Languages/metadata.json` file to include your language code and name.
  * Be careful with the comma (`,`) and square brackets (`[` and `]`)!

### Documentation Guidelines

When contributing for the `/Documentations`, please follow these guidelines:

* Respect Markdown Linting rules.
* Name the file to UPPERCASE if the file placed in the root folder, e.g:
  `README.md`, `CONTRIBUTING.md`, `LICENSE.md`.
* Otherwise, all files should be placed in `/Documentations` folder and named in
  camelCase, e.g: `MyFile.md`.

## Submitting your Contribution

Once you have made a contribution and are ready to submit it to the project,
follow these steps:

* Fork the repo and clone it to your local machine
* Create a feature branch in your local repo
* Make your changes and push them to your feature branch
* Create a pull request in the upstream repository
* Make sure to add a description of the changes you made
* Submit the pull request

Your contribution may then undergo a review process before getting merged into
the main repo once it is approved.

Thanks again for your interest in contributing to this project! We're looking
forward to seeing what you come up with.
