# StepMania 5 Readme
==========
Wed Mar 02 13:27:36 PST 2022

# Folder Structure
StepMania: Root Directory

- stepmania: Current SM build

- SM-Resources: External folder with non-build specific assets to share among computers

updating:
> cd path/to/stepmania
> git pull origin 5_1-new
> cd Build/
> cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release .. && cmake ..
> make -j8
