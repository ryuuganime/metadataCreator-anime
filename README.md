# metadataCreator-anime <!-- omit in toc -->

> **Warning**
>
> This project is still in development, and is not ready for production use.

Another attempt creating an automation of metadata inserter: Anime. Made hybrid by PowerShell and Python

> **Warning**
>
> PowerShell Core version 7 and above is required to run this script.

## Table of Contents

* [Table of Contents](#table-of-contents)
* [Required 3rd Party Services and Tool](#required-3rd-party-services-and-tool)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [FAQ](#faq)
  * [Why PowerShell?](#why-powershell)
  * [Why hybrid?](#why-hybrid)

## Required 3rd Party Services and Tool

<!-- markdownlint-disable MD034 -->
| Name               |   Type   | Description                                                            | Link                          |
| :----------------- | :------: | :--------------------------------------------------------------------- | :---------------------------- |
| aniDB              | Relation | Get anime relation to current title for ID                             | https://anidb.net             |
| AniList            | Metadata | Search and retrieve anime metadata                                     | https://anilist.co            |
| Anime API          | Relation | Search and Retrieve relation to other sites                            | https://nttds.my.id/discord   |
| Anime-Planet       | Relation | Get anime relation to current title for ID                             | https://anime-planet.com      |
| aniSearch          | Metadata | Retrieve anime metadata in German, Italian, French, and Spanish        | https://anisearch.com         |
| Annict (アニクト)  | Metadata | Retrieve anime metadata in Japanese                                    | https://annict.jp             |
| Fanart.tv          |  Assets  | Retrieve show image assets: poster, background, logo                   | https://fanart.tv             |
| Kaize              | Relation | Get anime relation to current title for ID                             | https://kaize.io              |
| Kitsu              | Metadata | Retrieve anime metadata                                                | https://kitsu.io              |
| Last.fm            |  Music   | Search and retrieve song information used on show's opening and ending | https://last.fm               |
| LiveChart          | Relation | Get anime relation to current title for ID                             | https://livechart.com         |
| MyAnimeList        | Metadata | Search and retrieve anime metadata                                     | https://myanimelist.net       |
| Nautiljon          | Metadata | Retrieve anime metadata in French                                      | https://nautiljon.com         |
| Notify             | Metadata | Retrieve anime metadata                                                | https://notify.moe            |
| Otak Otaku         | Metadata | Retrieve anime metadata in Indonesian                                  | https://otakotaku.com         |
| SilverYasha DB     | Metadata | Retrieve anime metadata in Indonesian                                  | https://db.silveryasha.web.id |
| SIMKL              | Metadata | Retrieve show metadata                                                 | https://simkl.com             |
| Spotify            |  Music   | Search and retrieve song information used on show's opening and ending | https://spotify.com           |
| The Movie Database | Metadata | Retrieve show metadata                                                 | https://www.themoviedb.org    |
| Trakt              | Metadata | Retrieve show metadata                                                 | https://trakt.tv              |
| Шикимори           | Metadata | Retrieve anime metadata in Russian                                     | https://shikimori.one         |
| しょぼいカレンダー | Relation | Get anime relation to current title for ID                             | https://cal.shoboi.jp         |
<!-- markdownlint-enable MD034 -->

## Getting Started

### Prerequisites

* [PowerShell Core][pscore] version 7 and above
* [Python][python] version 3.9 and above
* `git` command line tool

### Installation

1. Fork this repo!
   You can do this by clicking the `Fork` button on the top right corner of this page.
2. Clone your forked repo to your local machine.
   To do this, open your terminal and run the following command:

   ```bash
   git clone https://github.com/<your_username>/metadataCreator-anime.git
   ```

3. Run the `setup.ps1` script to install the required PowerShell, Python, and other dependencies automatically.

   ```bash
   pwsh ./setup.ps1
   ```

## Usage

Simply run this command on working directory in a console!

```bash
pwsh ./main.ps1
```

## FAQ

### Why PowerShell?

As the time of writing, the maintainer of this repo has advanced knowledge in PowerShell and not Python. Although it is entirely doable in Python, it is just matter of comfortability of the maintainer.

### Why hybrid?

PowerShell although is the primary scripting language used in this repo, there is undoubtedly a need for Python, especially the use of HTML parser.

This is because PowerShell does not have a built-in HTML parser, and the only way to do it is by using the [`Invoke-WebRequest`][iwr] cmdlet. However, this cmdlet is not suitable for this repo as it is not able to parse the HTML code properly, and there is no modules that could do such for ability to run this script cross-platform. Therefore, Python is used to parse the HTML code with the help of the `BeautifulSoup` library.

All responses made in Python will be returned as JSON, and PowerShell will do the rest of the task.

> **Note**
>
> Currently maintainer found a module on PowerShell that could parse HTML easily. At the moment, it was being checked for cross platform compatibility.
>
> If the module can be used on any platform, Python will be dropped from language of choice.

<!-- Links -->
[iwr]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.3
[pscore]: https://github.com/PowerShell/PowerShell/releases
[python]: https://www.python.org/downloads/
