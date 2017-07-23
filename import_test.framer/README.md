## Sketch to Framer Import Test
This is a Framer project testing the workflow of working with a UI in Framer which is designed in Sketch. This is essentially using the Code tab in Framer Studio without ever opening the Design tab.

Currently this prototype clicks through different screens (artboards from sketch), however using states to handle interactivity should make things much simpler.

___
### Results
- Everything needs to be grouped in Sketch in order to be an interactive layer in Framer
- Naming convention in Sketch goes a long ways in Framer
- Symbols are flattened when imported so complex symbols (such as navigation) should be detatched and imported as groups of layers
- Buttons should include a rectangle behind words / icons for a bigger tap target
- (still testing) Bringing in a sinlge artboard with UI components grouped by screens will reduce complexity
  - Including a sinlge instance of global UI will make reduce complexity
