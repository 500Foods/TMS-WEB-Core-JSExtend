# TMS-WEB-Core-JSExtend

This repository contains the complete source code for a Delphi package consisting of components designed for use within TMS WEB Core projects.  These components are wrappers (mostly) for popular JavaScript libraries. The first such component, a wrapper for [FlatPickr](https://flatpickr.js.org/), was first published along with the TMS Software blog post that relates to it, on May 17, 2022.

**Installation**

1. For the Design-Time Package, follow these steps.
- Download the repository ZIP and unzip into your usual Delphi Projects folder.
- Navigate to the DeSign-Time folder and load the JSExtend project.
- Using the Project Manager window, right-clcik on JSExtend.bpl and select 'install'.
- This should install the TJSFlatPickr component.

2. For the Run-Time/JSFlatPickr.pas file, there are (at least) two options.
- The Run-Time/JSFlatPickr.pas can be added to your project directly OR
- Go to the Delphi Tools/Options... menu, and then under TMS WEB / Options / Library Path, add the Run-Time folder.

3. Add the FlatPickr JS Library JS and CSS CDN links to your Project.html file. For example:
```
<script src="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/flatpickr.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/flatpickr.min.css" rel="stylesheet"/>
```
Once installed, you should be able to find the TJSFlatPickr component at the bottom of the Delphi Component Palette (in the JSEXtend Group) when editing a TMS WEB Core TWebForm.  Drop the component onto the form and then set the (many!) Object Insepctor properties as desired, and the FlatPickr control should appear once the project is run.  There's not much to see directly in the IDE.

If you find this repository useful to your work, or that it has saved you time or effort when it comes to crafting a better TMS WEB Core project, please consider supporting my efforts via "[Buy Me A :pizza:](https://www.buymeacoffee.com/andrewsimard500)". You may also be interested in my other repositories here on GitHub:
- [TMS WEB Core JSON Primer](https://github.com/500Foods/TMS-WEB-Core-JSON-Primer)

Enjoy!

Andrew Simard, Founder,  
500 Foods Corporation.
