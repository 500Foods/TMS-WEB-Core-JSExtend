**TJSFlatPickr**

This document is intended to help get started using this component in your TMS WEB Core projects.  The main benefit of
using the TJSFlatPickr component is to have the ability to set [FlatPickr](https://flatpickr.js.org/) options while working within the Delph IDE. 
Nearly all of the options available to FlatPickr have been added to the component and can be accessed from the Delphi
Object Inspector once a TJSFlatPickr has been dropped onto a TWebForm.

Note, however, that not ALL options are available in this fashion, and that making changes to the options of a FlatPickr
component at run-time after it has already been created in this fashion is restricted to a very small subset of these
options due to how FlatPickr works.  So in either case (needing an option not available in one of these properties, or needing to change
the option at run-time) it would be best to actually create the FlatPickr component yourself at run-time and not use
this TJSFlatPickr component, at least for that part of your project. 

