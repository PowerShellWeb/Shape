@"

# Shape

## CSS Shapes with PowerShell

[CSS Shapes](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Shapes) are pretty amazing!

There are $((shape).Help.Count) shape types:

"@

$shapeHelp = (shape).Help
foreach ($shapeType in $shapeHelp.Keys) {
    "* [$shapeType]($($shapeHelp[$shapeType]))"
}

@"
Unfortunately, that also means there are $($shapeHelp.Count) _slightly_ different ways to write a shape.

Polygons work in pairs.  Paths must be quoted.

Most others need to be joined with spaces, 
but shape itself needs to be joined with spaces and commas before keywords. 

This module exists in order to make it _slightly_ easier to generate shapes. 
"@


@"

## Installing and Importing

You can install the module from the PowerShell Gallery:

~~~PowerShell
Install-Module Shape
~~~

After it is installed, you can simply import it:

~~~PowerShell
Import-Module Shape -PassThru
~~~

### Cloning and importing

You can also clone this repository and import the module locally:

~~~PowerShell
git clone https://github.com/PowerShellWeb/Shape
cd ./Shape
Import-Module ./ -PassThru
~~~
"@


@'


## Getting Started

Shape tries to have simple syntax.

After importing, we can create any CSS shape with simple syntax

~~~PowerShell
circle 50% 
ellipse 4rem 50% at right center
~~~


## Using Shapes 

To use a shape in a page, we simply make it into a string.

~~~PowerShell
".circle { width: 100%; height: 100%; clip-path:$(circle 50%) }"
~~~

Here's a page with nothing but an ellipse.

We need to provide a background color to see the shape.

~~~PowerShell
@(
    "<html>"
    "<head><style>"    
    "body { max-width: 100vw; height: 100vh}"
    ".ellipse { background-color: #4488ff;width: 100%; height:100%; clip-path:$(ellipse 50% 50%); }"
    "</style></head>"
    "<body><div class='ellipse'></div></body>"
    "</html>"
) > ./ellipse.html
~~~

Here's a page with nothing but an inset path:

~~~PowerShell
@(
    "<html>"
    "<head><style>"    
    "body { max-width: 100vw; height: 100vh}"
    ".inset { background-color: #4488ff;width: 100%; height:100%; clip-path:$(inset 5%); }"
    "</style></head>"
    "<body><div class='inset'></div></body>"
    "</html>"
) > ./inset.html
~~~

You can use the shape module to generate any CSS shape.

Have Fun!
'@
