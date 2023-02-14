# metadataCreator-anime

Another attempt creating an automation of metadata inserter: Anime. Made hybrid by PowerShell and Python

## FAQ

### Why PowerShell?

As the time of writing, the maintainer of this repo has advanced knowledge in PowerShell and not Python. Although it is entirely doable in Python, it is just matter of comfortability of the maintainer.

### Why hybrid?

PowerShell although is the primary scripting language used in this repo, there is undoubtedly a need for Python, especially the use of HTML parser.

This is because PowerShell does not have a built-in HTML parser, and the only way to do it is by using the [`Invoke-WebRequest`][iwr] cmdlet. However, this cmdlet is not suitable for this repo as it is not able to parse the HTML code properly, and there is no modules that could do such for ability to run this script cross-platform. Therefore, Python is used to parse the HTML code with the help of the `BeautifulSoup` library.

<!-- Links -->
[iwr]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.3
