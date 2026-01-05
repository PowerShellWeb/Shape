<#
.SYNOPSIS
    Gets Shapes as CSS
.DESCRIPTION
    Gets the Shape as CSS.
.EXAMPLE
    shape circle 50% |
        Select-Object -Expand CSS
#>
param()

$ShapeType = 'shape'

# Get our gradient type
$ShapeType = $this.ShapeType
$shapeValues = @(foreach ($in in $this.input) {
    if ($in -notmatch $this.ShapeTypePattern) {
        $in
    }
})

if (-not $ShapeType) { $ShapeType = 'shape'}

@(
    "$shapeType("
        switch ($shapeType) {
            path {
                # Only paths need to be quoted
                "'$($shapeValues -join ' ' -replace "'", "\'" -replace [Environment]::NewLine, '\')'"
            }
            polygon {
                # Polygons need to be in comma separated pairs, 
                # and could come as pairs or comma separated pairs
                $shapeValues = @($shapeValues -replace ',' -ne '')
                @(for ($valueIndex = 0; $valueIndex -lt $shapeValues.Count; $valueIndex += 2) {
                    @(if ($null -ne $shapeValues[$valueIndex + 1]) {
                        $shapeValues[$valueIndex]
                        $shapeValues[$valueIndex + 1]
                    } else {
                        $shapeValues[$valueIndex]
                        $shapeValues[$valueIndex]                
                    }) -join ' '
                }) -join ', '
            }
            shape {
                # Shapes segments start with keywords, and each segment should be separated by commas                
                $keyPattern = "^(?>$(
                    'arc', 'curve', 'close', 'move', '[hv]?line', 'smooth' -join '|'
                ))"

                $buffer = @()
                @(
                    for ($valueIndex = 0; $valueIndex -lt $shapeValues.Count; $valueIndex++) {
                        if ($shapeValues[$valueIndex] -match $keyPattern) {
                            if ($buffer) { $buffer -join ' ' } 
                            $buffer = @()
                        }
                        if ($shapeValues[$valueIndex] -eq ',') {
                            continue
                        }
                        $buffer+= $shapeValues[$valueIndex]
                    }
                    if ($buffer) {$buffer -join ' '}
                ) -join ', '
            }
            
            default {
                # all other shapes simply join their values with spaces
                $shapeValues -join ' '    
            }
        }    
    ")" 
) -join ''

