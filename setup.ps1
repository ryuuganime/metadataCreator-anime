#!/usr/bin/env pwsh
#Requires -Version 7

# set Write-Information to always show messages

$InformationPreference = 'Continue'

# ==============================================================================
# FUNCTIONS
# ==============================================================================

Function Show-SudoWarning {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $True)]
		[string]$Package
	)

	Write-Information @"
`e[31mWARNING: This script will attempt to use sudo to install packages.`e[0m
If you do not want to use sudo (or gsudo is not installed for Windows), please exit this script and install the following package manually:
$package
"@
}

Function Install-PackageFromDistro {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $True)]
		[string]$Package
	)

	$sudo = $True
	$installParam = "install"

	If ($IsLinux) {
		# Check currently available package managers
		If (Get-Command apx -ErrorAction SilentlyContinue) {
			$PackageManager = "apx"
			$sudo = $False
		}
		ElseIf (Get-Command apt -ErrorAction SilentlyContinue) {
			$PackageManager = "apt"
		}
		ElseIf (Get-Command dnf -ErrorAction SilentlyContinue) {
			$PackageManager = "dnf"
		}
		ElseIf (Get-Command yum -ErrorAction SilentlyContinue) {
			$PackageManager = "yum"
		}
		ElseIf (Get-Command pacman -ErrorAction SilentlyContinue) {
			$PackageManager = "pacman"
			$installParam = "-Syu"
		}
		# Confirm if apk is available AND if it's Alpine
		ElseIf (Get-Command apk -ErrorAction SilentlyContinue) {
			If (Test-Path -Path "/etc/alpine-release") {
				$PackageManager = "apk"
				$installParam = "add"
			}
			Else {
				Write-Error "apk: Not Alpine, unsupported OS" -ErrorAction Break
			}
		}
		Else {
			# Raise an error
			Write-Error "Unsupported package manager" -ErrorAction Break
		}
	}
	ElseIf ($IsMacOS) {
		If (Test-Path -Path "/usr/local/bin/brew") {
			$PackageManager = "brew"
		}
		Else {
			Write-Error "Unsupported package manager" -ErrorAction Break
		}
	}
	ElseIf ($IsWindows) {
		If (Get-Command choco -ErrorAction SilentlyContinue) {
			$PackageManager = "choco"
		}
		ElseIf (Get-Command winget -ErrorAction SilentlyContinue) {
			$PackageManager = "winget"
			$installParam = "install -e"
		}
		ElseIf (Get-Command scoop -ErrorAction SilentlyContinue) {
			$PackageManager = "scoop"
			$Sudo = $False
		}
		Else {
			Write-Error "Unsupported package manager" -ErrorAction Break
		}
	}
	Else {
		Write-Error "Unsupported operating system" -ErrorAction Break
	}

	# Install the package
	If ($sudo) {
		Show-SudoWarning -Package $Package
		Start-Process -FilePath "sudo" -ArgumentList "$PackageManager $installParam $Package" -Wait
	}
	Else {
		Start-Process -FilePath "$PackageManager" -ArgumentList "$installParam $Package" -Wait
	}
}

# ==============================================================================
# PREQS
# ==============================================================================

# Check for binaries
$binaries = @(
	'python3',
	'git'
)

$binaries | ForEach-Object {
	If (-not (Get-Command $_ -ErrorAction SilentlyContinue)) {
		# If $_ is python3, check for python
		If ($_ -eq 'python3') {
			If (-not (Get-Command 'python' -ErrorAction SilentlyContinue)) {
				Write-Error "$_ is not installed" -ErrorAction Continue
				Install-PackageFromDistro -Package 'python3'
			}
			Else {
				Write-Information "$_ is already installed"
			}
		}
		Else {
			Write-Error "$_ is not installed" -ErrorAction Continue
			Install-PackageFromDistro -Package $_
		}
	}
	Else {
		Write-Information "$_ is already installed"
	}
}

# Check required PowerShell Modules
$Modules = @(
	'Set-PsEnv',
	'PSGraphQL',
	'PowerHTML'
)

$Modules | ForEach-Object {
	If (-not (Get-Package -Name $_ -ErrorAction SilentlyContinue)) {
		Write-Information "Installing module $_"
		Install-Module -Name $_ -Force
	}
	Else {
		Write-Information "Module $_ is already installed"

	}
}

# Run Env Generator before running the rest of the script
If (-not (Test-Path -Path ".\.env" -ErrorAction SilentlyContinue)) {
	Write-Information "Generating env.ps1"
	.\Modules\Generate-Env.ps1
}

# ==============================================================================
# RUN THE REST OF THE SCRIPT
# ==============================================================================

# Load the environment variables
Set-PsEnv

# Grab python, run pip
Invoke-Expression -Command "${Env:PYTHON_PATH} -m pip install -r requirements.txt"
