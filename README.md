# Conway's Game of Life in Ruby

From the [Wikipedia Page](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life):

> The "game" is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves, or, for advanced "players", by creating patterns with particular properties.

> The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square "cells", each of which is in one of two possible states, alive or dead, (or "populated" and "unpopulated" respectively). Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

> Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
> Any live cell with two or three live neighbours lives on to the next generation.
> Any live cell with more than three live neighbours dies, as if by overpopulation.
> Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
> The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

## Running the tests

Test are written in Rspec and can be run via the terminal using

```
$ rspec
```

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Ruby 

## Authors

* **Thomas Countz** - *Initial work* - [8th Light](https://www.8thlight.com)
* **Connor Mendenhall** - *Initial work* - [8th Light](https://www.8thlight.com)


## License

Copyright 2018 Thomas Countz  

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
