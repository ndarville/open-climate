Open Climate
============
This is my collection of valuable climate data that I've used for some work.

It has everything from the original dataset to my R code to my data visualizations.

Setup
-----
1. Install editor: download RStudio
2. Install packages: `install.packages("tidyverse", "ggthemes")`

Projects
--------

### Reading ###

Original piece | GitHub folder
---------------|--------------
[Extreme Weather and Climate Change][] | [extreme-weather-and-climate-change][]

`reading` structure
-------------------
Taken from my [reading blog][] posts and ordered for reuse, learning, teaching, and reproducibility:

* R code: `code.R`
* Dataset: `data/*`
* Data visualization:
    - Main plots: `plot.png`, `plot.large.png`, `plot.small.png`
    - Aside plots: `foo.png`, `foo.large.png`, `foo.small.png`

The folder structure for these folders are `reading/<post>/<subfolder>/*` with the above files.

R style
-------
* Indentation is two spaces
* Break lines longer than 78
* Double quotes

Image sizes
-----------
* Large: `800✖600`
* Small: `457✖...`
    - (Resized to 457✖, my blog width)

They might be resized differently, but only as exceptions.


[Extreme Weather and Climate Change]: https://ndarville.com/reading/extreme-weather-and-climate-change/
[extreme-weather-and-climate-change]: https://github.com/ndarville/open-climate/tree/master/reading/extreme-weather-and-climate-change
[reading blog]: https://ndarville.com/reading
[extreme-weather-and-climate-change]:
