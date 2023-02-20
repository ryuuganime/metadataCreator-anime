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

| Name                       |   Type   | Description                                 | Uses Python? |     Dependency     |
| :------------------------- | :------: | :------------------------------------------ | :----------: | :----------------: |
| [aniDB][adb]               | Relation | Get anime relation to current title for ID  |              |     Anime API      |
| [AniList][al]              | Metadata | Search and retrieve anime metadata          |              |                    |
| [Anime API][aa]            | Relation | Search and Retrieve relation to other sites |              |                    |
| [Anime News Network][ann]  | Relation | Get anime relation to current title for ID  |              |       SIMKL        |
| [Anime-Planet][ap]         | Metadata | Retrieve anime metadata                     |     Yes      |     Anime API      |
| [aniSearch][as]            | Relation | Get show relation to current title for ID   |              |     Anime API      |
| [Annict (アニクト)][ant]   | Relation | Get show relation to current title for ID   |              |                    |
| [Bangumi][bgm]             | Relation | Get anime relation to current title for ID  |              |                    |
| [IMDb][imdb]               | Relation | Get show relation to current title for ID   |              |       SIMKL        |
| [Kaize][kz]                | Relation | Get anime relation to current title for ID  |     Yes      |     Anime API      |
| [Kitsu][kt]                | Metadata | Retrieve anime metadata                     |     Yes      |     Anime API      |
| [MyAnimeList][mal]         | Metadata | Search and retrieve anime metadata          |              |                    |
| [MyShows][ms]              | Relation | Get show relation to current title for ID   |              |      The TVDB      |
| [Nautiljon][nt]            | Relation | Get show relation to current title for ID   |     Yes      |                    |
| [Notify][ntf]              | Relation | Retrieve relation to other sites            |              |     Anime API      |
| [Otak Otaku][oo]           | Relation | Get show relation to current title for ID   |     Yes      |                    |
| [SIMKL][smk]               | Metadata | Retrieve show metadata                      |              |    MyAnimeList     |
| [The Movie Database][tmdb] | Relation | Get show relation to current title for ID   |              | SIMKL, Notify.moe  |
| [The TVDB][tvdb]           | Relation | Get show relation to current title for ID   |              | The Movie Database |
| [Trakt][tr]                | Relation | Get show relation to current title for ID   |              |       SIMKL        |
| [TV Time][time]            | Relation | Get show relation to current title for ID   |              |      The TVDB      |
| [TVMaze][maze]             | Relation | Get show relation to current title for ID   |              | The Movie Database |
| [TvRage][rage]             | Relation | Get show relation to current title for ID   |              |  TVMaze, MyShows   |
| [Кинопоиск][kno]           | Relation | Get show relation to current title for ID   |              |      MyShows       |
| [Шикимори][shk]            | Relation | Get show relation to current title for ID   |              |    MyAnimeList     |

### TV Schedule Database

| Name                      |   Type   | Description                                | Uses Python? | Dependency |
| :------------------------ | :------: | :----------------------------------------- | :----------: | :--------: |
| [LiveChart][lc]           | Relation | Get anime relation to current title for ID |              | Anime API  |
| [しょぼいカレンダー][shb] | Relation | Get anime relation to current title for ID |              | Notify.moe |

### Music Database

| Name               |   Type   | Description                                                            | Uses Python? |      Dependency      |
| :----------------- | :------: | :--------------------------------------------------------------------- | :----------: | :------------------: |
| [Apple Music][am]  | Relation | Retrieve song ID by looking up ISRC code attached on another site      |              | Spotify, MusicBrainz |
| [Spotify][sp]      |  Music   | Search and retrieve song information used on show's opening and ending |              |                      |
| [Last.fm][lfm]     |  Music   | Search and retrieve song information used on show's opening and ending |              |                      |
| [MusicBrainz][mbz] |  Music   | Search and retrieve song information used on show's opening and ending |              |                      |
| [Discogs][dcs]     |  Music   | Search and retrieve song information used on show's opening and ending |              |                      |

### Other

| Name                   |   Type   | Description                                          | Uses Python? |             Dependency              |
| :--------------------- | :------: | :--------------------------------------------------- | :----------: | :---------------------------------: |
| [Fanart.tv][fan]       |  Assets  | Retrieve show image assets: poster, background, logo |              | The Movie DB, IMDb, Trakt, The TVDB |
| [SilverYasha DB][sydb] | Relation | Get show relation to current title for ID            |              |              Anime API              |
| [Wikipedia][wi]        | Metadata | Retrieve show metadata                               |     Yes      |                                     |
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
[aa]: https://nttds.my.id/discord
[adb]: https://anidb.net
[al]: https://anilist.co
[am]: https://music.apple.com
[ann]: https://animenewsnetwork.com
[ant]: https://en.annict.com
[ap]: https://anime-planet.com
[as]: https://anisearch.com
[bgm]: https://bgm.tv
[dcs]: https://discogs.com
[fan]: https://fanart.tv
[imdb]: https://www.imdb.com
[iwr]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.3
[kno]: https://www.kinopoisk.ru
[kt]: https://kitsu.io
[kz]: https://kaize.io
[lc]: https://livechart.com
[lfm]: https://last.fm
[mal]: https://myanimelist.net
[maze]: https://tvmaze.com
[mbz]: https://musicbrainz.org
[ms]: https://en.myshows.me
[nt]: https://nautiljon.com
[ntf]: https://notify.moe
[oo]: https://otakotaku.com
[pscore]: https://github.com/PowerShell/PowerShell/releases
[python]: https://www.python.org/downloads/
[rage]: https://tvrage.com
[shb]: https://cal.shoboi.jp
[shk]: https://shikimori.one
[smk]: https://simkl.com
[sp]: https://spotify.com
[sydb]: https://db.silveryasha.web.id
[time]: https://www.tvtime.com
[tmdb]: https://www.themoviedb.org
[tr]: https://trakt.tv
[tvdb]: https://thetvdb.com
[wi]: https://wikipedia.org
