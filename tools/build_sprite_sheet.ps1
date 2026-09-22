param(
    [Parameter(Mandatory = $true)]
    [string]$SourceAtlas,
    [string]$JumpAtlas,
    [Parameter(Mandatory = $true)]
    [string]$OutputDirectory
)

Add-Type -AssemblyName System.Drawing

$source = [System.Drawing.Bitmap]::FromFile($SourceAtlas)
$cellWidth = 128
$cellHeight = 128
$sheetColumns = 8
$sheetRows = 7
$sourceColumns = 4
$sourceRows = 8
$padding = 6

New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$frameDirectory = Join-Path $OutputDirectory 'frames'
New-Item -ItemType Directory -Force -Path $frameDirectory | Out-Null

function Get-SourceCell([int]$column, [int]$row) {
    $x0 = [int][Math]::Round($column * $source.Width / $sourceColumns)
    $x1 = [int][Math]::Round(($column + 1) * $source.Width / $sourceColumns)
    $y0 = [int][Math]::Round($row * $source.Height / $sourceRows)
    $y1 = [int][Math]::Round(($row + 1) * $source.Height / $sourceRows)
    return [System.Drawing.Rectangle]::new($x0, $y0, $x1 - $x0, $y1 - $y0)
}

function New-NormalizedFrame([int]$sourceColumn, [int]$sourceRow, [bool]$mirror, [int]$targetHeight) {
    $cell = Get-SourceCell $sourceColumn $sourceRow
    $minX = $cell.Right
    $minY = $cell.Bottom
    $maxX = $cell.Left - 1
    $maxY = $cell.Top - 1

    for ($y = $cell.Top; $y -lt $cell.Bottom; $y++) {
        for ($x = $cell.Left; $x -lt $cell.Right; $x++) {
            if ($source.GetPixel($x, $y).A -gt 8) {
                if ($x -lt $minX) { $minX = $x }
                if ($x -gt $maxX) { $maxX = $x }
                if ($y -lt $minY) { $minY = $y }
                if ($y -gt $maxY) { $maxY = $y }
            }
        }
    }

    $frame = [System.Drawing.Bitmap]::new($cellWidth, $cellHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($frame)
    $graphics.Clear([System.Drawing.Color]::Transparent)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy

    if ($maxX -ge $minX -and $maxY -ge $minY) {
        $cropWidth = $maxX - $minX + 1
        $cropHeight = $maxY - $minY + 1
        $scale = [Math]::Min(($cellWidth - 2 * $padding) / $cropWidth, $targetHeight / $cropHeight)
        $drawWidth = [Math]::Max(1, [int][Math]::Round($cropWidth * $scale))
        $drawHeight = [Math]::Max(1, [int][Math]::Round($cropHeight * $scale))
        $drawX = [int][Math]::Floor(($cellWidth - $drawWidth) / 2)
        $drawY = $cellHeight - $padding - $drawHeight
        $sourceRect = [System.Drawing.Rectangle]::new($minX, $minY, $cropWidth, $cropHeight)
        $destinationRect = [System.Drawing.Rectangle]::new($drawX, $drawY, $drawWidth, $drawHeight)
        $graphics.DrawImage($source, $destinationRect, $sourceRect, [System.Drawing.GraphicsUnit]::Pixel)
    }

    $graphics.Dispose()
    if ($mirror) {
        $frame.RotateFlip([System.Drawing.RotateFlipType]::RotateNoneFlipX)
    }
    return $frame
}

$sheet = [System.Drawing.Bitmap]::new($sheetColumns * $cellWidth, $sheetRows * $cellHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$sheetGraphics = [System.Drawing.Graphics]::FromImage($sheet)
$sheetGraphics.Clear([System.Drawing.Color]::Transparent)
$sheetGraphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy

function Add-Frame([string]$name, [int]$sheetColumn, [int]$sheetRow, [int]$sourceColumn, [int]$sourceRow, [bool]$mirror) {
    $targetHeight = switch ($sheetRow) {
        0 { 112 }
        1 { 112 }
        2 { 88 }
        3 { 104 }
        4 { 108 }
        5 { 108 }
        6 { 108 }
    }
    $frame = New-NormalizedFrame $sourceColumn $sourceRow $mirror $targetHeight
    $framePath = Join-Path $frameDirectory ($name + '.png')
    $frame.Save($framePath, [System.Drawing.Imaging.ImageFormat]::Png)
    $sheetGraphics.DrawImageUnscaled($frame, $sheetColumn * $cellWidth, $sheetRow * $cellHeight)
    $frame.Dispose()
}

# Walk right: primary poses followed by generated in-betweens.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('walk_right_{0:D2}' -f ($i + 1)) $i 0 $i 0 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('walk_right_{0:D2}' -f ($i + 5)) ($i + 4) 0 $i 6 $false }

# Walk left: exact mirrors for matched timing and silhouettes.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('walk_left_{0:D2}' -f ($i + 1)) $i 1 $i 0 $true }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('walk_left_{0:D2}' -f ($i + 5)) ($i + 4) 1 $i 6 $true }

# Crouch right and left.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('crouch_right_{0:D2}' -f ($i + 1)) $i 2 $i 1 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('crouch_left_{0:D2}' -f ($i + 1)) ($i + 4) 2 $i 1 $true }

# Jump right and left.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('jump_right_{0:D2}' -f ($i + 1)) $i 3 $i 2 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('jump_left_{0:D2}' -f ($i + 1)) ($i + 4) 3 $i 2 $true }

# Replace the jump row with its dedicated, scale-locked strip when supplied.
if ($JumpAtlas) {
    $jumpSource = [System.Drawing.Bitmap]::FromFile($JumpAtlas)
    for ($i = 0; $i -lt 4; $i++) {
        $x0 = [int][Math]::Round($i * $jumpSource.Width / 4)
        $x1 = [int][Math]::Round(($i + 1) * $jumpSource.Width / 4)
        $jumpCell = [System.Drawing.Rectangle]::new($x0, 0, $x1 - $x0, $jumpSource.Height)
        $rightFrame = [System.Drawing.Bitmap]::new($cellWidth, $cellHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
        $jumpGraphics = [System.Drawing.Graphics]::FromImage($rightFrame)
        $jumpGraphics.Clear([System.Drawing.Color]::Transparent)
        $jumpGraphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
        $jumpGraphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
        $jumpGraphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy
        $jumpDestination = [System.Drawing.Rectangle]::new($padding, $padding, $cellWidth - 2 * $padding, $cellHeight - 2 * $padding)
        $jumpGraphics.DrawImage($jumpSource, $jumpDestination, $jumpCell, [System.Drawing.GraphicsUnit]::Pixel)
        $jumpGraphics.Dispose()

        $rightPath = Join-Path $frameDirectory ('jump_right_{0:D2}.png' -f ($i + 1))
        $rightFrame.Save($rightPath, [System.Drawing.Imaging.ImageFormat]::Png)
        $sheetGraphics.DrawImageUnscaled($rightFrame, $i * $cellWidth, 3 * $cellHeight)

        $leftFrame = $rightFrame.Clone()
        $leftFrame.RotateFlip([System.Drawing.RotateFlipType]::RotateNoneFlipX)
        $leftPath = Join-Path $frameDirectory ('jump_left_{0:D2}.png' -f ($i + 1))
        $leftFrame.Save($leftPath, [System.Drawing.Imaging.ImageFormat]::Png)
        $sheetGraphics.DrawImageUnscaled($leftFrame, ($i + 4) * $cellWidth, 3 * $cellHeight)

        $leftFrame.Dispose()
        $rightFrame.Dispose()
    }
    $jumpSource.Dispose()
}

# Rear-view climbing actions.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('climb_up_{0:D2}' -f ($i + 1)) $i 4 $i 4 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('climb_down_{0:D2}' -f ($i + 1)) ($i + 4) 4 $i 5 $false }

# Run right and left.
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('run_right_{0:D2}' -f ($i + 1)) $i 5 $i 3 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('run_right_{0:D2}' -f ($i + 5)) ($i + 4) 5 $i 7 $false }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('run_left_{0:D2}' -f ($i + 1)) $i 6 $i 3 $true }
for ($i = 0; $i -lt 4; $i++) { Add-Frame ('run_left_{0:D2}' -f ($i + 5)) ($i + 4) 6 $i 7 $true }

$sheetPath = Join-Path $OutputDirectory 'cave-explorer-complete-128.png'
$sheet.Save($sheetPath, [System.Drawing.Imaging.ImageFormat]::Png)
$sheetGraphics.Dispose()
$sheet.Dispose()
$source.Dispose()

Write-Output "Saved $sheetPath (1024x896, 8x7 cells at 128x128)"
