## Shape 0.1:

Shape makes CSS Shapes (#1)

* It has a basic build (checkout, ezout, run local action) (#2)
* It has a GitHub action (#3)
* It consists of a single command, `Get-Shape` (#4)
  * `Get-Shape` has aliases for each [basic shape](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/basic-shape) type (#16) 
  * `Get-Shape` returns all of its input in a pseudo type, `Shape`
* `Shape` defines a shape based off of `.Input`
  * `Shape.CSS` gets the shape as CSS (#5)
  * `Shape.ToString()` will return the .CSS (#6)
  * `Shape.Help` contains helpful links (#7)
  * `Shape.ShapeTypePattern` gets a pattern for known shape types (#8)
  * `Shape.ShapeType` returns shape type based off of the input (#9)
  * `Shape` displays CSS by default (#10)
* The shape module has simple tests (#11)
* `Shape` covers the GitHub Basics
  * It has a README (#17)
  * It supports sponorship (#15)
  * It has a security guide (#14)
  * It has a contributing guide (#13)
  * It has a code of conduct (#12)
