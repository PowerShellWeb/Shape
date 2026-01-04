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

if ($ShapeType -eq 'polygon') {
    return "polygon($(
        @(for ($valueIndex = 0; $valueIndex -lt $shapeValues.Count; $valueIndex += 2) {
            @(if ($null -ne $shapeValues[$valueIndex + 1]) {
                $shapeValues[$valueIndex]
                $shapeValues[$valueIndex + 1]
            } else {
                $shapeValues[$valueIndex]
                $shapeValues[$valueIndex]                
            }) -join ' '
        }) -join ', '
    ))"
}

$joinWith = if ($ShapeType -notin 'shape') {
    ' '
} else {
    ', '
}
 
"$shapeType($(
    @(
        $shapeValues
    ) -join $joinWith
))"
