#!/usr/bin/env pwsh
# -*- coding: utf-8 -*-

# Load .env file and set $lang var
Set-PsEnv
$lang = $ENV:LANGUAGE

# Grab this script name
$scriptName = $MyInvocation.MyCommand.Name

$l = Get-Content -Path ".\Languages\${lang}\${scriptName}.json" | ConvertFrom-Json

# disable PSUseConsistentWhitespace

Function Get-AniDbData {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory = $True)]
		[string]$AnimeId
	)

	# Append client vars
	$cln = $ENV:ANIDB_CLIENT_NAME
	$clv = $ENV:ANIDB_CLIENT_VERSION
	$clp = 1

	Try {
		# Create request
		$uri = "http://api.anidb.net:9001/httpapi?request=anime&client=${cln}&clientver=${clv}&protover=${clp}&aid=${AnimeId}"
		Write-Verbose "$($l.verbose.iwr_req -f $uri)"
		$resp = Invoke-WebRequest -Uri $uri -UseBasicParsing

		# Parse response
		Write-Verbose $l.verbose.parse
		[XML]$resp = $resp.Content

		# Get anime data
		Write-Verbose $l.verbose.get_data
		$titles = $resp.anime.titles.title

		Write-Verbose $l.verbose.get_synonyms
		$synonyms = $titles | Where-Object { $_.type -ne "main" } | Select-Object -Property 'lang', '#text'
		# remove duplicates
		$syns = @()
		ForEach ($syn in $synonyms) {
			$syns += [PSCustomObject][Ordered]@{
				"lang" = $syn.lang
				"text" = $syn.'#text'
			}
		}

		Write-Verbose $l.verbose.link_external
		$resources = $resp.anime.resources.resource

		# bind resources with try-catch
		Try {
			[int]$ann = ($resources | Where-Object { $_.type -eq 1 }).externalentity.identifier
		}
		Catch {
			$ann = $null
		}
		Try {
			[int]$mal = ($resources | Where-Object { $_.type -eq 2 }).externalentity.identifier
		}
		Catch {
			$mal = $null
		}
		Try {
			$wikiEn = ($resources | Where-Object { $_.type -eq 6 }).externalentity.identifier
		}
		Catch {
			$wikiEn = $null
		}
		Try {
			$wikiJa = ($resources | Where-Object { $_.type -eq 7 }).externalentity.identifier
		}
		Catch {
			$wikiJa = $null
		}
		Try {
			[int]$shoboi = ($resources | Where-Object { $_.type -eq 8 }).externalentity.identifier
		}
		Catch {
			$shoboi = $null
		}
		Try {
			[int]$allcin = ($resources | Where-Object { $_.type -eq 9 }).externalentity.identifier
		}
		Catch {
			$allcin = $null
		}
		Try {
			[int]$anison = ($resources | Where-Object { $_.type -eq 10 }).externalentity.identifier
		}
		Catch {
			$anison = $null
		}
		Try {
			$lain = ($resources | Where-Object { $_.type -eq 11 }).externalentity.identifier
		}
		Catch {
			$lain = $null
		}
		Try {
			$imdb = ($resources | Where-Object { $_.type -eq 43 }).externalentity.identifier
		}
		Catch {
			$imdb = $null
		}
		Try {
			$tmdbRes = ($resources | Where-Object { $_.type -eq 44 })
			Try {
				[int]$tmdbId = $tmdbRes.externalentity.identifier[0]
				[string]$tmdbType = $tmdbRes.externalentity.identifier[1]
			}
			Catch {
				[int]$tmdbId = $tmdbRes.externalentity.identifier[1]
				[string]$tmdbType = $tmdbRes.externalentity.identifier[0]
			}
			$tmdb = [Ordered]@{
				type = $tmdbType
				id   = $tmdbId
			}
		}
		Catch {
			$tmdb = [Ordered]@{
				type = $null
				id   = $null
			}
		}

		# Create dictionary
		Write-Verbose $l.verbose.build_hashtable
		$dict = [Ordered]@{
			aid       = [int]$AnimeId
			type      = $resp.anime.type
			episodes  = [int]$resp.anime.episodecount
			startdate = $resp.anime.startdate
			enddate   = $resp.anime.enddate
			title     = $titles | Where-Object { $_.type -eq "main" } | Select-Object -ExpandProperty '#text'
			synonyms  = $syns
			relations = [PSCustomObject]@{
				# if anime.resources.resource type="2", assign to MAL
				ann    = $ann
				mal    = $mal
				wikiEn = $wikiEn
				wikiJa = $wikiJa
				shoboi = $shoboi
				allcin = $allcin
				anison = $anison
				lain   = $lain
				imdb   = $imdb
				tmdb   = $tmdb
			}
		}

		$json = $dict | ConvertTo-Json -Depth 10

		Write-Verbose $l.verbose.return_data
		Return $json
	}
	Catch {
		Write-Error "$($l.error)`n`n$($_.Exception.Message)" -ErrorAction Continue
	}
}
