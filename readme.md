# StepMania 5 Readme

## Instructions

### Quick Start
To get StepMania 5 working quickly on an Ubuntu machine:

- Place your resources directories in `./SM-Resources/`. This should include all of the directories in Folder Structure below.
- Run `make dependencies`
- Run `make StepMania`
- Run `make launcher`
- Run `make symlinks`

### Remove
- Run `make clean`
- Run `make cleanLauncher`

## Folder Structure

|StepMania-home/ Root Directory
|
|---|stepmania/ Current SM build
|   |...
|   |...
|
|---|SM-Resources/ External folder with non-build specific assets to share among computers
|   |---|Announcers/
|   |---|BackgroundEffects/
|   |---|BackgroundTransitions/
|   |---|BGAnimations/
|   |---|Characters/
|   |---|NoteSkins/
|   |---|RandomMovies/
|   |---|Songs/
|   |---|Themes/
|
|---Makefile
|---readme.md (you are here)
|---.gitignore

## Dependencies

- build-essential
- cmake
- mesa-common-dev
- libglu1-mesa-dev
- libglew1.5-dev
- libxtst-dev
- libxrandr-dev
- libpng-dev
- libjpeg-dev
- zlib1g-dev
- libbz2-dev
- libogg-dev
- libvorbis-dev
- libc6-dev
- yasm
- libasound-dev
- libpulse-dev
- binutils-dev
- libgtk-3-dev
- libmad0-dev
- libudev-dev
- libva-dev
- nasm

## Todo

  * [ ] make a master `make install` command
  * [ ] add descriptions for dependencies

==========
Wed Mar 02 13:27:36 PST 2022
initial commit
