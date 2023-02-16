@{
	Rules = @{
		PSUseCompabilityCmdlets = @{
			compability = @(
				'core-7.3.0-windows',
				'core-7.3.0-linux',
				'core-7.3.0-macos'
			)
		}
		PSUseConsistentIndentation = @{
			Enable = $true
			PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
			Kind = 'tab'
		}
		PSUseConsistentWhitespace  = @{
			Enable          = $true
			CheckInnerBrace = $true
			CheckOpenBrace  = $true
			CheckOpenParen  = $true
			CheckOperator   = $true
			CheckPipe       = $true
			CheckSeparator  = $true
		}
		PSAlignAssignmentStatement = @{
			Enable = $true
			CheckHashtable = $true
		}
	}
	ExcludeRules = @(
		# We know the risk, but we still use this as a workaround for calling python binary
		"PSAvoidUsingInvokeExpression"
		# We don't really modify anything on system, verbs only used for clarity
		"PSUseShouldProcessForStateChangingFunctions"
	)
}
