function New-SharePointModernSiteTaxonomyField {
    <#
    .SYNOPSIS
    TBD
    .DESCRIPTION
    TBD
    .LINK
    https://github.com/rdtechie/PSO365
    .EXAMPLE
    TBD
    .NOTES
    Author: Richard Diphoorn
    #>

    [CmdletBinding()]
    param(
        $Identity,
        $Group,
        $DisplayName,
        $InternalName,
        $TermSetPath
    )
    begin {
        if ($script:ThisModuleLoaded -eq $true) {
            Get-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
        }
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."

        if (-not( Get-PnPField -Identity $Identity -ErrorAction SilentlyContinue )) {
            Add-PnPTaxonomyField -Group $Group -DisplayName $DisplayName -InternalName $InternalName -TermSetPath $TermSetPath -Required
            Write-Verbose -Message "Creating Taxonomyfield $DisplayName" -Verbose
        }
        else {
            Write-Warning -Message "Taxonomyfield $DisplayName already exists, skipping..."
        }
    }
    process {
    }
    end {
        Write-Verbose "$($FunctionName): End."
    }
}
