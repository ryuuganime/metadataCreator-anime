# metadataCreator-anime <!-- omit in toc -->

> **Warning**
>
> This project is still in development, and is not ready for production use.

Another attempt creating an automation of metadata inserter: Anime. Made hybrid
by PowerShell and Python

> **Warning**
>
> PowerShell Core version 7 and above is required to run this script.

## Table of Contents

* [Table of Contents](#table-of-contents)
* [Required 3rd Party Services and Tool](#required-3rd-party-services-and-tool)
  * [Shows Database](#shows-database)
  * [TV Schedule Database](#tv-schedule-database)
  * [Music Database](#music-database)
  * [Other](#other)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [FAQ](#faq)
  * [Why PowerShell?](#why-powershell)
  * [Why hybrid?](#why-hybrid)

<!-- markdownlint-disable MD034 MD013 -->
## Required 3rd Party Services and Tool

### Shows Database

| Name               |   Type   | Description                                 | Link                        | Uses Python? |     Dependency     |
| :----------------- | :------: | :------------------------------------------ | :-------------------------- | :----------: | :----------------: |
| aniDB              | Relation | Get anime relation to current title for ID  | https://anidb.net           |              |     Anime API      |
| AniList            | Metadata | Search and retrieve anime metadata          | https://anilist.co          |              |                    |
| Anime API          | Relation | Search and Retrieve relation to other sites | https://nttds.my.id/discord |              |                    |
| Anime-Planet       | Metadata | Retrieve anime metadata                     | https://anime-planet.com    |     Yes      |     Anime API      |
| aniSearch          | Relation | Get show relation to current title for ID   | https://anisearch.com       |              |     Anime API      |
| Annict (アニクト)  | Relation | Get show relation to current title for ID   | https://annict.jp           |              |                    |
| Bangumi            | Relation | Get anime relation to current title for ID  | https://bgm.tv              |              |                    |
| IMDb               | Relation | Get show relation to current title for ID   | https://www.imdb.com        |              |       SIMKL        |
| Kaize              | Relation | Get anime relation to current title for ID  | https://kaize.io            |     Yes      |     Anime API      |
| Kitsu              | Metadata | Retrieve anime metadata                     | https://kitsu.io            |     Yes      |     Anime API      |
| MyAnimeList        | Metadata | Search and retrieve anime metadata          | https://myanimelist.net     |              |                    |
| MyShows            | Relation | Get show relation to current title for ID   | https://en.myshows.me       |              |      The TVDB      |
| Nautiljon          | Relation | Get show relation to current title for ID   | https://nautiljon.com       |     Yes      |                    |
| Notify             | Relation | Retrieve relation to other sites            | https://notify.moe          |              |     Anime API      |
| Otak Otaku         | Relation | Get show relation to current title for ID   | https://otakotaku.com       |     Yes      |                    |
| SIMKL              | Metadata | Retrieve show metadata                      | https://simkl.com           |              |    MyAnimeList     |
| The Movie Database | Relation | Get show relation to current title for ID   | https://www.themoviedb.org  |              | SIMKL, Notify.moe  |
| The TVDB           | Relation | Get show relation to current title for ID   | https://thetvdb.com         |              | The Movie Database |
| Trakt              | Relation | Get show relation to current title for ID   | https://trakt.tv            |              |       SIMKL        |
| TV Time            | Relation | Get show relation to current title for ID   | https://www.tvtime.com      |              |      The TVDB      |
| TVMaze             | Relation | Get show relation to current title for ID   | https://tvmaze.com          |              | The Movie Database |
| TvRage             | Relation | Get show relation to current title for ID   | https://tvrage.com          |              |  TVMaze, MyShows   |
| Кинопоиск          | Relation | Get show relation to current title for ID   | https://www.kinopoisk.ru    |              |      MyShows       |
| Шикимори           | Relation | Get show relation to current title for ID   | https://shikimori.one       |              |    MyAnimeList     |

### TV Schedule Database

| Name               |   Type   | Description                                | Link                  | Uses Python? | Dependency |
| :----------------- | :------: | :----------------------------------------- | :-------------------- | :----------: | :--------: |
| LiveChart          | Relation | Get anime relation to current title for ID | https://livechart.com |              | Anime API  |
| しょぼいカレンダー | Relation | Get anime relation to current title for ID | https://cal.shoboi.jp |              | Notify.moe |

### Music Database

| Name        | Type  | Description                                                            | Link                    | Uses Python? | Dependency |
| :---------- | :---: | :--------------------------------------------------------------------- | :---------------------- | :----------: | :--------: |
| Spotify     | Music | Search and retrieve song information used on show's opening and ending | https://spotify.com     |              |            |
| Last.fm     | Music | Search and retrieve song information used on show's opening and ending | https://last.fm         |              |            |
| MusicBrainz | Music | Search and retrieve song information used on show's opening and ending | https://musicbrainz.org |              |            |
| Discogs     | Music | Search and retrieve song information used on show's opening and ending | https://discogs.com     |              |            |

### Other

| Name           |   Type   | Description                                          | Link                          | Uses Python? |        Dependency         |
| :------------- | :------: | :--------------------------------------------------- | :---------------------------- | :----------: | :-----------------------: |
| Fanart.tv      |  Assets  | Retrieve show image assets: poster, background, logo | https://fanart.tv             |              | The Movie DB, IMDb, Trakt |
| SilverYasha DB | Relation | Get show relation to current title for ID            | https://db.silveryasha.web.id |              |         Anime API         |
| Wikipedia      | Metadata | Retrieve show metadata                               | https://wikipedia.org         |     Yes      |                           |
<!-- markdownlint-enable MD034 MD013 -->

## Getting Started

### Prerequisites

* [PowerShell Core][pscore] version 7 and above
* [Python][python] version 3.9 and above
* `git` command line tool

### Installation

1. Fork this repo!
   You can do this by clicking the `Fork` button on the top right corner of this
   page.
2. Clone your forked repo to your local machine.
   To do this, open your terminal and run the following command:

   ```bash
   git clone https://github.com/<your_username>/metadataCreator-anime.git
   ```

3. Run the `setup.ps1` script to install the required PowerShell modules, Python
   packages, and other binary dependencies automatically.

   ```bash
   pwsh ./setup.ps1
   ```

   * Currently supported package managers for automatic install:
     * Linux: `apx` (Vanilla OS), `apt` (Debian or Ubuntu deriv.), `rpm`
       (Red Hat deriv.), `yum` (Red Hat deriv.), `pacman` (Arch deriv.),
       `apk` (Alpine)
     * macOS: `brew`
     * Windows: `choco`, `winget`, `scoop`

## Usage

Simply run this command on working directory in a console!

```bash
pwsh ./main.ps1
```

## FAQ

### Why PowerShell?

As the time of writing, the maintainer of this repo has advanced knowledge in
PowerShell and not Python. Although it is entirely doable in Python, it is just
matter of comfortability of the maintainer.

### Why hybrid?

PowerShell although is the primary scripting language used in this repo, there
is undoubtedly a need for Python, especially the use of HTML parser.

This is because PowerShell does not have a built-in HTML parser, and the only
way to do it is by using the [`Invoke-WebRequest`][iwr] cmdlet. However, this
cmdlet is not suitable for this repo as it is not able to parse the HTML code
properly, and there is no modules that could do such for ability to run this
script cross-platform. Therefore, Python is used to parse the HTML code with the
help of the `BeautifulSoup` library.

All responses made in Python will be returned as JSON, and PowerShell will do
the rest of the task.

> **Note**
>
> Currently maintainer found a module on PowerShell that could parse HTML
> easily. At the moment, it was being checked for cross platform compatibility.
>
> If the module can be used on any platform, Python will be dropped from
> language of choice.

<!-- Links -->
[iwr]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.3
[pscore]: https://github.com/PowerShell/PowerShell/releases
[python]: https://www.python.org/downloads/
