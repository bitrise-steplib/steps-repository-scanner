<h3 align="center">
  <img src="Logos/fastlane_text.png" alt="fastlane Logo" />
</h3>

fastlane Example Setups
=======================

This repository contains a few `fastlane` example setups that help you getting started.

### [Acast](https://www.acast.com)

[![Acast logotype](Logos/acast.png)](https://www.acast.com)

🎶 **Simple setup, saving tons of time**

- Slack notifications on failed builds or unsuccessful tests
  - Slack notifications are only fired if they're run on our CI
- Managed provisioning profiles using [match](https://github.com/fastlane/match)
- Creation of screenshots using [snapshot](https://github.com/fastlane/snapshot)
  - Text and device frames are added to screenshots using [frameit](https://github.com/fastlane/frameit)
  - Delivered to iTunes Connect using [deliver](https://github.com/fastlane/deliver)
- Submission to App Store using [gym](https://github.com/fastlane/gym) and [deliver](https://github.com/fastlane/deliver)

<p align="center">
  <a href="/Acast/">Overview</a> &bull;
  <a href="/Acast/Fastfile">Fastfile</a> &bull;
  <a href="/Acast/Appfile">Appfile</a> &bull;
  <a href="/Acast/Deliverfile">Deliverfile</a> &bull;
  <a href="/Acast/Gymfile">Gymfile</a> &bull;
  <a href="/Acast/Matchfile">Matchfile</a> &bull;
  <a href="/Acast/Scanfile">Scanfile</a> &bull;
  <a href="/Acast/Snapfile">Snapfile</a> &bull;
  <a href="/Acast/screenshots/Framefile.json">Framefile</a>
</p>
----

### [Fitbay](https://fitbay.com)
[![fastlane Logo](Logos/Fitbay.png)](https://fitbay.com)

:womans_clothes: **Full stack deployment**

- Crashlytics, TestFlight, and App Store distribution
- Automatic build environment selection
- Managing of Provisioning Profiles
- Slack Team notifications
- Version number bump and Git commit
- Custom scripts
- Lane switching with private lanes

<p align="center">
  <a href="/Fitbay/">Overview</a> &bull;
  <a href="/Fitbay/Fastfile">Fastfile</a>
</p>
----

### [Artsy eidolon](https://github.com/artsy/eidolon)
[![Artsy](Logos/Artsy.png)](https://github.com/artsy/eidolon)

:green_heart: **Standard Setup**

- Building and Signing of the iOS App
- Version Bump & Git Actions
- Hockey Distribution
- Production Keys


<p align="center">
  <a href="/Artsy/eidolon">Overview</a> &bull;
  <a href="/Artsy/eidolon/Fastfile">Fastfile</a>
</p>
----

### [Wikipedia](https://github.com/wikimedia/apps-ios-wikipedia/) by Wikimedia Foundation

:green_book: **Advanced - Multiple Environments**

- Different Bundle Identifiers per `lane`
- Advanced Testing
- Hockey Deployment
- App Store and TestFlight Deployment
- Custom `fastlane` actions like automatic change-logs based on git


<p align="center">
  <a href="/Wikipedia/">Overview</a> &bull;
  <a href="/Wikipedia/Fastfile">Fastfile</a> &bull;
  <a href="/Wikipedia/Deliverfile">Deliverfile</a> &bull;
  <a href="/Wikipedia/Appfile">Appfile</a> &bull;
  <a href="/Wikipedia/metadata/">Metadata</a>
</p>
----

### [MindNode](https://mindnode.com/)
[![MindNode](Logos/MindNode.png)](https://mindnode.com/)

:computer: **Advanced iOS/Mac Setup**

- Mac and iOS Universal App
- App Store and TestFlight Deployment
- Automated Screenshots
- Screenshot Framing & Adding of Titles
- Copying of example data for screenshots
- Custom `xcodebuild` command


<p align="center">
  <a href="/MindNode/">Overview</a> &bull;
  <a href="/MindNode/Fastfile">Fastfile</a> &bull;
  <a href="/MindNode/Snapfile">Snapfile</a> &bull;
  <a href="/MindNode/MindNode.js">MindNode.js</a> &bull;
  <a href="/MindNode/screenshots">screenshots</a> &bull;
  <a href="/MindNode/screenshots/Framefile.json">Framefile.json</a> &bull;
  <a href="/MindNode/mac">MacScreenshots</a>
</p>
----

### [Product Hunt](https://www.producthunt.com/apps/ios)
[![ProductHunt Logo](Logos/ProductHunt.png)](https://www.producthunt.com/apps/ios)

:chart_with_upwards_trend: **Standard Setup**

- App Store and TestFlight Deployment
- Managing of Provisioning Profiles
- Push Notifications
- Version Bump & Git Actions

<p align="center">
  <a href="/ProductHunt/">Overview</a> &bull;
  <a href="/ProductHunt/Fastfile">Fastfile</a> &bull;
  <a href="/ProductHunt/Deliverfile">Deliverfile</a> &bull;
  <a href="/ProductHunt/metadata">metadata</a>
</p>
----


### [Be My Eyes](http://www.bemyeyes.org/)
[![Be My Eyes Logo](Logos/BeMyEyes.png)](http://www.bemyeyes.org/)

:eyes: **Standard Setup**

- App Store and TestFlight Distribution
- Local action `get_global_value`
- Version Bump & Git Actions


<p align="center">
  <a href="/BeMyEyes/">Overview</a> &bull;
  <a href="/BeMyEyes/Fastfile">Fastfile</a> &bull;
  <a href="/BeMyEyes/Deliverfile">Deliverfile</a> &bull;
  <a href="/BeMyEyes/actions/get_global_value.rb">get_global_value</a>
</p>
----

### [Touchwonders](http://touchwonders.com)
[![Touchwondersa](Logos/Touchwonders.png)](http://touchwonders.com)

:bike: **Shared Fastfile for multiple projects**

- Maintain and Deploy multiple of Apps and Projects.
- Import external `Fastfile` from external repo.
- Load fastlane configuration YAML file.
- Create/Renew/Download profiles for multiple targets.
- Custom `load_release_notes` action.

A description on how the setup works is available in the [Overview](/Touchwonders).


<p align="center">
  <a href="/Touchwonders/">Overview</a> &bull;
  <a href="/Touchwonders/Fastfile">Fastfile</a> &bull;
  <a href="/Touchwonders/fastlane_config.yaml">Configuration file</a>
</p>
----
