function New-SharePointModernSiteListFolder {
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
        $RootFolder,
        $SubFolder
    )
    begin {
        if ($script:ThisModuleLoaded -eq $true) {
            Get-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
        }
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."

        if ($SubFolder) {
            if (-not(Get-PnPFolder -Url ( -join ($RootFolder, '/', $SubFolder) ) -ErrorAction SilentlyContinue)) {
                Write-Verbose -Message "Creating folder $RootFolder/$SubFolder" -Verbose
                Resolve-PnPFolder -SiteRelativePath ( -join ($RootFolder, '/', $SubFolder) ) | Out-Null
            }
            else {
                Write-Warning -Message "Folder $RootFolder/$SubFolder already exists, skipping..."
            }
        }
    }
    process {
    }
    end {
        Write-Verbose "$($FunctionName): End."
    }
}
