#!/usr/bin/env pwsh
# -*- coding: utf-8 -*-

Function Format-Hyperlink {
	<#
		.SYNOPSIS
			Format a hyperlink for PowerShell 5.1 and any terminal emulator that supports VTE escape sequences

		.DESCRIPTION
			Format a hyperlink for PowerShell 5.1 and any terminal emulator that supports VTE escape sequences

		.PARAMETER Uri
			The URI to format

		.PARAMETER Label
			The label to display

		.EXAMPLE
			Format-Hyperlink -Uri https://example.com -Label "Example"

		.INPUTS
			System.String

		.OUTPUTS
			System.String

		.NOTES
			Some terminal emulators may not support VTE escape sequences. In that case, the hyperlink will be displayed as plain text.

		.LINK
			https://diddledani.com/powershell-clickable-hyperlinks/
	#>

	[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$True, Position = 0)]
		[ValidateNotNullOrEmpty()]
		[Uri]$Uri,

		[Parameter(Mandatory=$True, Position = 1)]
		[string] $Label
	)

	If (($PSVersionTable.PSVersion.Major -lt 6 -or $IsWindows) -and -not $Env:WT_SESSION) {
		# Fallback for Windows users not inside Windows Terminal
		If ($Label) {
			Write-Output "$Label ($Uri)" -NoEnumerate
		}
		Write-Output "$Uri"
	}

	If ($Label) {
		Write-Output "`e]8;;$Uri`e\$Label`e]8;;`e\" -NoEnumerate
	}

	Write-Output "$Uri" -NoEnumerate
}

Export-ModuleMember -Function Format-Hyperlink
