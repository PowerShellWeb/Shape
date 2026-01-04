$shapeTypes = @(foreach ($in in $this.input) {
    if ($in -match $this.ShapeTypePattern) {
        $matches.0
    }
})


if (-not $shapeTypes) {
    return "shape"
} 
if ($shapeTypes.Count -gt 1) {
    Write-Warning "There can be only one (shape type).  Using $($shapeTypes[0])"      
}
return $shapeTypes[0].ToLower()