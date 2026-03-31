$ErrorActionPreference = "Stop"

$TemplateRepoUrl = "https://github.com/georchestra/georchestra_documentation_template.git"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$CloneDir = Join-Path $ScriptDir ".doc_template_tmp_$Timestamp"

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
    if (Test-Path (Join-Path $ScriptDir "docs")) {
        throw "Initialization aborted: $ScriptDir\docs already exists."
    }

    Write-Host "Cloning documentation template into $CloneDir"
    git clone --depth 1 $TemplateRepoUrl $CloneDir

    Write-Host "Copying documentation content into $ScriptDir"
    Copy-Item -Path (Join-Path $CloneDir "docs") -Destination (Join-Path $ScriptDir "docs") -Recurse -Force
    Write-Host "Copied docs/"

    Copy-Item -Path (Join-Path $CloneDir "mkdocs.yml") -Destination (Join-Path $ScriptDir "mkdocs.yml") -Force
    Write-Host "Copied mkdocs.yml"
    Copy-Item -Path (Join-Path $CloneDir "mkdocs_requirements.txt") -Destination (Join-Path $ScriptDir "mkdocs_requirements.txt") -Force
    Write-Host "Copied mkdocs_requirements.txt"
    Copy-Item -Path (Join-Path $CloneDir "readthedocs.md") -Destination (Join-Path $ScriptDir "readthedocs.md") -Force
    Write-Host "Copied readthedocs.md"
    Copy-Item -Path (Join-Path $CloneDir "mkdocs_installation.sh") -Destination (Join-Path $ScriptDir "mkdocs_installation.sh") -Force
    Write-Host "Copied mkdocs_installation.sh"
    Copy-Item -Path (Join-Path $CloneDir "mkdocs_run.sh") -Destination (Join-Path $ScriptDir "mkdocs_run.sh") -Force
    Write-Host "Copied mkdocs_run.sh"

    $Python = Get-PythonCommand
    Write-Host "Using $($Python.Command) (version $($Python.Version))"

    Push-Location $ScriptDir

    & $Python.Command @($Python.Arguments + @("-m", "venv", "venv_mkdocs"))
    Write-Host "Virtual environment created in .\venv_mkdocs\"

    $VenvPython = Join-Path $ScriptDir "venv_mkdocs\Scripts\python.exe"
    $VenvMkdocs = Join-Path $ScriptDir "venv_mkdocs\Scripts\mkdocs.exe"

    & $VenvPython -m pip install -r (Join-Path $ScriptDir "mkdocs_requirements.txt")

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
