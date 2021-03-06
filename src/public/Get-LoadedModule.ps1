
function Get-LoadedModule {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory = $true)]
        [alias("Module")]
        [string]$ModuleName
        )

    $LoadedModules = Get-Module | Select-Object Name
    if (-not( $LoadedModules.Name -like "*$ModuleName*" ) ) {
        Import-Module -Name $ModuleName
    }

}