function New-SharePointModernSiteContentType {
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
        $Description,
        $Group,
        $BaseContentType
    )
    begin {
        if ($script:ThisModuleLoaded -eq $true) {
            Get-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
        }
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."

        if (-not( Get-PnPContentType -Identity $Identity -ErrorAction SilentlyContinue )) {
            $null = Add-PnPContentType -Name $Identity -Description $Description -Group $Group -ParentContentType (Get-PnPContentType -Identity $BaseContentType -ErrorAction SilentlyContinue)
            Write-Verbose -Message "Creating new content type `"$Identity`"" -Verbose
        }
        else {
            Write-Warning -Message "Content Type `"$Identity`" already exists, skipping..."
        }
    }
    process {
    }
    end {
        Write-Verbose "$($FunctionName): End."
    }
}
