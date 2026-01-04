function Get-Shape {
    <#
    .SYNOPSIS
        Gets a Shape
    .DESCRIPTION
        Gets a CSS Shape
    .EXAMPLE
        shape circle 50%
    .EXAMPLE
        "$(Gradient '#4488ff', '#224488')" # Stringifying a gradient returns the CSS
    .EXAMPLE
        # Make a a page with a basic shape
        @(            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh }"
            ".circle { width: 100%; height: 100%; background: #4488ff; clip-path:$(shape circle 50%)}"
            "</style></head><body><div class='circle'></div></body></html>"
        ) > ./circle.html
    .EXAMPLE
        @(            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh }"
            ".ellipse { width: 100%; height: 100%; background: #4488ff; clip-path:$(shape ellipse 40% 60%)}"
            "</style></head><body><div class='ellipse'></div></body></html>"
        ) > ./ellipse.html
    .EXAMPLE
        @(            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh }"
            ".inset { width: 100%; height: 100%; background: #4488ff; clip-path:$(shape inset 10% 20% 30% 40%)}"
            "</style></head><body><div class='inset'></div></body></html>"
        ) > ./inset.html
    .EXAMPLE
        @(            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh }"
            ".xywh { width: 100%; height: 100%; background: #4488ff; clip-path:$(shape xywh 10% 20% 30% 40%)}"
            "</style></head><body><div class='xywh'></div></body></html>"
        ) > ./xywh.html
    .EXAMPLE
        @(            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh }"
            ".tri { width: 100%; height: 100%; background: #4488ff; clip-path:$(shape polygon 50% 0% 100% 100% 0% 100%)}"
            "</style></head><body><div class='tri'></div></body></html>"
        ) > ./tri.html
    .EXAMPLE
        # Make a page with a random conic gradient
        
        $gradient = @(
            "conic"
            # Make 2 to 4 random colors
            foreach ($n in 1..(Get-Random -Min 2 -Max 4)) {
                "#{0:x6}" -f (Get-Random -Max 0xffffff)
            }
        ) | gradient
        # Generate a minimal page with the gradient
        @(
            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./randomconicgradient.html
    .EXAMPLE    
        # Make a page with a random linear gradient
        
        $gradient = @(
            "linear"
            # Make 2 to 4 random colors
            foreach ($n in 1..(Get-Random -Min 2 -Max 4)) {
                "#{0:x6}" -f (Get-Random -Max 0xffffff)
            }
        ) | gradient
        # Generate a minimal page with the gradient
        @(
            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./randomlineargradient.html
    .EXAMPLE
        '#4488ff', '#224488' | Gradient # We can pipe into gradient
    
    #>
    [Alias('Shape',
        'circle','ellipse',
        'inset','rect',
        'polygon','path2d','xywh',
        'css.circle', 'css.ellipse', 
        'css.inset', 'css.rect', 
        'css.polygon', 'css.path2d', 'css.xywh'
    )]
    param()

    # All this function does is gather all of the input and arguments
    $allIn = @($input) + @($args)

    if ($MyInvocation.InvocationName -notin '&', '.', 'Shape', 'Get-Shape') {
        $allIn = @(
            "$($MyInvocation.InvocationName -replace '^CSS\p{P}?' -replace '2d$')".ToLower()
        ) + $allIn
    }

    # and create a custom object.
    [PSCustomObject]@{
        PSTypeName = 'Shape'
        Input = $allIn
    }

    # This allows us to accept any input, and modify the gradient after it has been created.

    # The implementation of the Gradient logic is in PowerShell extended types.
}
