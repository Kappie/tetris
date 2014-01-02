module Tetris
  BLOCK_SIZE = 32
  HEIGHT = 20 * BLOCK_SIZE
  WIDTH = 10 * BLOCK_SIZE
  COLORS = %w(green purple yellow blue grey red)
  PIECES = {
  I:  [[
        [1, 1, 1, 1]
      ],
      [
        [1],
        [1],
        [1],
        [1],
      ]],

  O:  [[
        [1, 1],
        [1, 1]
      ]],

  T:  [[
        [nil, 1, nil],
        [1, 1, 1]
      ],
      [
        [1, nil],
        [1, 1],
        [1, nil]
      ],
      [
        [1, 1, 1],
        [nil, 1, nil]
      ],
      [
        [nil, 1],
        [1, 1],
        [nil, 1]
      ]],

  J:  [[
        [1, 1, 1],
        [nil, nil, 1]
      ],
      [
        [nil, 1],
        [nil, 1],
        [1, 1]
      ],
      [
        [1, nil, nil],
        [1, 1, 1]
      ],
      [
        [1, 1],
        [1, nil],
        [1, nil]
      ]]
  }
end