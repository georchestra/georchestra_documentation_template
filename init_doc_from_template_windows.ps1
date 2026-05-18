$ErrorActionPreference = "Stop"

$TemplateRepoUrl = "https://github.com/georchestra/georchestra_documentation_template.git"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$CloneDir = Join-Path $ScriptDir ".doc_template_tmp_$Timestamp"
$TargetDocsDir = Join-Path $ScriptDir "docs"
$TargetMkdocsConfig = Join-Path $ScriptDir "mkdocs.yml"
$TargetMkdocsRequirements = Join-Path $ScriptDir "mkdocs_requirements.txt"
$TargetReadTheDocsDocEn = Join-Path $ScriptDir "readthedocs_EN.md"
$TargetReadTheDocsDocFr = Join-Path $ScriptDir "readthedocs_FR.md"
$TargetInstallScript = Join-Path $ScriptDir "mkdocs_installation.sh"
$TargetRunScript = Join-Path $ScriptDir "mkdocs_run.sh"
$TemplateDocsDir = Join-Path $CloneDir "docs"
$TemplateMkdocsConfig = Join-Path $CloneDir "mkdocs.yml"
$TemplateMkdocsRequirements = Join-Path $CloneDir "mkdocs_requirements.txt"
$TemplateReadTheDocsDocEn = Join-Path $CloneDir "readthedocs_EN.md"
$TemplateReadTheDocsDocFr = Join-Path $CloneDir "readthedocs_FR.md"
$TemplateInstallScript = Join-Path $CloneDir "mkdocs_installation.sh"
$TemplateRunScript = Join-Path $CloneDir "mkdocs_run.sh"
$VenvDir = Join-Path $ScriptDir "venv_mkdocs"
$VenvPython = Join-Path $VenvDir "Scripts\python.exe"
$VenvMkdocs = Join-Path $VenvDir "Scripts\mkdocs.exe"

function Get-PythonCommand {
    foreach ($Candidate in @("python", "py")) {
        try {
            if ($Candidate -eq "py") {
                $Version = & py -3 -c "import sys; print('.'.join(map(str, sys.version_info[:3])))"
                return @{ Command = "py"; Arguments = @("-3"); Version = $Version }
            }

            $Version = & $Candidate -c "import sys; print('.'.join(map(str, sys.version_info[:3])))"
            return @{ Command = $Candidate; Arguments = @(); Version = $Version }
        } catch {
        }
    }

    throw "Python 3.11+ not found. Please install a suitable version."
}

try {
    if (Test-Path $TargetDocsDir) {
        throw "Initialization aborted: $TargetDocsDir already exists."
    }

    Write-Host "Cloning documentation template into $CloneDir"
    git clone --depth 1 $TemplateRepoUrl $CloneDir

    Write-Host "Copying documentation content into $ScriptDir"
    Copy-Item -Path $TemplateDocsDir -Destination $TargetDocsDir -Recurse -Force
    Write-Host "Copied docs/"

    Copy-Item -Path $TemplateMkdocsConfig -Destination $TargetMkdocsConfig -Force
    Write-Host "Copied mkdocs.yml"
    Copy-Item -Path $TemplateMkdocsRequirements -Destination $TargetMkdocsRequirements -Force
    Write-Host "Copied mkdocs_requirements.txt"
    Copy-Item -Path $TemplateReadTheDocsDocEn -Destination $TargetReadTheDocsDocEn -Force
    Write-Host "Copied readthedocs_EN.md"
    Copy-Item -Path $TemplateReadTheDocsDocFr -Destination $TargetReadTheDocsDocFr -Force
    Write-Host "Copied readthedocs_FR.md"
    Copy-Item -Path $TemplateInstallScript -Destination $TargetInstallScript -Force
    Write-Host "Copied mkdocs_installation.sh"
    Copy-Item -Path $TemplateRunScript -Destination $TargetRunScript -Force
    Write-Host "Copied mkdocs_run.sh"

    $Python = Get-PythonCommand
    Write-Host "Using $($Python.Command) (version $($Python.Version))"

    Push-Location $ScriptDir

    & $Python.Command @($Python.Arguments + @("-m", "venv", $VenvDir))
    Write-Host "Virtual environment created in .\venv_mkdocs\"

    & $VenvPython -m pip install -r $TargetMkdocsRequirements

    if (-not (Test-Path $VenvMkdocs)) {
        throw "MkDocs installation failed"
    }

    Write-Host "Running mkdocs serve"
    & $VenvMkdocs serve
} finally {
    Pop-Location -ErrorAction SilentlyContinue
    if (Test-Path $CloneDir) {
        Remove-Item -Path $CloneDir -Recurse -Force
    }
}
