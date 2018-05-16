function New-SharePointModernSiteList {
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
        $Title,
        $Url,
        $Template = 'DocumentLibrary'
    )
    begin {
        if ($script:ThisModuleLoaded -eq $true) {
            Get-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
        }
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."

        if (-not(Get-PnPList -Identity $Title -ErrorAction SilentlyContinue)) {
            Write-Verbose -Message "Creating the list $Title." -Verbose
            New-PnPList -Title $Title -Url $Url -Template $Template -OnQuickLaunch
        }
        else {
            Write-Warning -Message "List $Title already exists, skipping..."
        }
    }
    process {
    }
    end {
        Write-Verbose "$($FunctionName): End."
    }
}
