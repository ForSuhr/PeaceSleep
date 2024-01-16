# PeaceSleep
## Introduction
A sleep aid app.

The feature of this app is that it can use curves to schedule volume changes over time. Typically, you might want a sleep aid app where the volume gradually decreases over time.

This app is designed to run on embedded-devices, but you are free to adapt it to any devices for your need.

## How to use
In the main window, you can drag different sound balls and combine them. Double click to remove. The dot at the center is a dial used to adjust the volume.

![1](https://github.com/ForSuhr/PeaceSleep/assets/105584788/cb29ad1a-4e04-40f7-b758-a4b4f8d51f27)

This is an interactive chart, where you can drag the dots to adjust the curve, by doing so you will schedule volume changes. At the same time, this feature works as a timer.

![2](https://github.com/ForSuhr/PeaceSleep/assets/105584788/fb4edd93-4b49-4227-a911-a8873c723d09)

## Notice
- The project used Qt Charts Module, which is only available under GPL-v3 in case of open-source. So the caveat here: this project does not available under LGPL-v3.
- The sounds used in this project came from www.freesounds.org, which is currently down already.
