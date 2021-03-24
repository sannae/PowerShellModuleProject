Install-Module -Name PSScriptAnalyzer -Force

describe 'Module-level tests' {

    # The module will import successfully
    it 'the module imports successfully' {
        { Import-Module "$PSScriptRoot\PowerShellModuleProject.psm1" -ErrorAction Stop } | should -not throw
    }

    # The module has an associated manifest
    it 'the module has an associated manifest' {
        Test-Path "$PSScriptRoot\PowerShellModuleProject.psd1" | should -Be $true
    }

    # the module passes all default code-linting rules defined by PSScriptAnalyzer
    # (https://www.interfacett.com/videos/use-powershell-script-analyzer-clean-code/)
    it 'passes all default PSScriptAnalyzer rules' {
        Invoke-ScriptAnalyzer -Path "$PSScriptRoot\PowerShellModuleProject.psm1" | should -BeNullOrEmpty
    }

}
