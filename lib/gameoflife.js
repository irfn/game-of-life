(function() {
  var Cell, Game, Grid, Point, Seeds;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Cell = (function() {
    function Cell(point) {
      this.point = point;
      this.ctx = $('#grid')[0].getContext("2d");
      this.spawn();
    }
    Cell.prototype.shade = function() {
      return {
        undefined: "rgb(200,200,200)",
        1: "rgb(100,0,0)",
        2: "rgb(120,0,0)",
        3: "rgb(140,0,0)",
        4: "rgb(150,0,0)",
        5: "rgb(160,0,0)",
        6: "rgb(170,0,0)"
      };
    };
    Cell.prototype.render = function() {
      this.ctx.fillStyle = this.shade()[this.currentAge];
      return this.ctx.fillRect(this.point.x, this.point.y, 10, 10);
    };
    Cell.prototype.ping = function() {
      return this.pingCount++;
    };
    Cell.prototype.spawn = function() {
      this.currentAge = 1;
      this.pingCount = 0;
      return this.render();
    };
    Cell.prototype.die = function() {
      this.currentAge = void 0;
      this.render();
      return this.point.available();
    };
    Cell.prototype.age = function() {
      return this.currentAge++;
    };
    Cell.prototype.lonely = function() {
      return this.pingCount < 2;
    };
    Cell.prototype.crowded = function() {
      return this.pingCount > 3;
    };
    Cell.prototype.life = function() {
      if (this.pingCount > 0) {
        if (this.lonely() || this.crowded()) {
          this.die();
        } else {
          this.age() && this.render();
        }
        return this.pingCount = 0;
      }
    };
    return Cell;
  })();
  Game = (function() {
    function Game(grid) {
      this.grid = grid;
      $('#tick').bind('click', __bind(function(event) {
        return this.grid.tick();
      }, this));
    }
    return Game;
  })();
  Grid = (function() {
    function Grid(x, y) {
      var point, _ref, _ref2;
      this.x = x;
      this.y = y;
      this.points = {};
      this.pointList = [];
      for (x = 0, _ref = this.x; x <= _ref; x += 10) {
        for (y = 0, _ref2 = this.y; y <= _ref2; y += 10) {
          point = new Point(x, y, this);
          this.pointList.push(point);
          this.points["" + x + "-" + y] = point;
        }
      }
    }
    Grid.prototype.pointAt = function(x, y) {
      return this.points["" + x + "-" + y];
    };
    Grid.prototype.tick = function() {
      var point, _i, _j, _k, _len, _len2, _len3, _ref, _ref2, _ref3, _results;
      _ref = this.pointList;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        point = _ref[_i];
        point.ping();
      }
      _ref2 = this.pointList;
      for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
        point = _ref2[_j];
        point.populate();
      }
      _ref3 = this.pointList;
      _results = [];
      for (_k = 0, _len3 = _ref3.length; _k < _len3; _k++) {
        point = _ref3[_k];
        _results.push(point.tick());
      }
      return _results;
    };
    return Grid;
  })();
  Point = (function() {
    function Point(x, y, grid) {
      this.x = x;
      this.y = y;
      this.grid = grid;
      this.neighbourCount = 0;
      this.cell = null;
    }
    Point.prototype.topLeft = function() {
      return this.grid.pointAt(this.x - 10, this.y - 10);
    };
    Point.prototype.left = function() {
      return this.grid.pointAt(this.x - 10, this.y);
    };
    Point.prototype.bottomLeft = function() {
      return this.grid.pointAt(this.x - 10, this.y + 10);
    };
    Point.prototype.topRight = function() {
      return this.grid.pointAt(this.x + 10, this.y - 10);
    };
    Point.prototype.right = function() {
      return this.grid.pointAt(this.x + 10, this.y);
    };
    Point.prototype.bottomRight = function() {
      return this.grid.pointAt(this.x + 10, this.y + 10);
    };
    Point.prototype.top = function() {
      return this.grid.pointAt(this.x, this.y - 10);
    };
    Point.prototype.bottom = function() {
      return this.grid.pointAt(this.x, this.y + 10);
    };
    Point.prototype.neighbours = function() {
      return [this.topLeft(), this.left(), this.bottomLeft(), this.topRight(), this.right(), this.bottomRight(), this.top(), this.bottom()];
    };
    Point.prototype.ping = function() {
      var point, _i, _len, _ref, _results;
      this.neighbourCount = 0;
      _ref = this.neighbours();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        point = _ref[_i];
        _results.push((point != null ? point.cell : void 0) != null ? this.pingCell() : void 0);
      }
      return _results;
    };
    Point.prototype.tick = function() {
      var _ref;
      return (_ref = this.cell) != null ? _ref.life() : void 0;
    };
    Point.prototype.populate = function() {
      if (this.neighbourCount === 3 && !(this.cell != null)) {
        return this.seed();
      }
    };
    Point.prototype.seed = function() {
      return this.occupy(new Cell(this));
    };
    Point.prototype.occupy = function(cell) {
      this.cell = cell;
    };
    Point.prototype.available = function() {
      return this.cell = null;
    };
    Point.prototype.pingCell = function() {
      var _ref;
      if ((_ref = this.cell) != null) {
        _ref.ping();
      }
      return this.neighbourCount++;
    };
    return Point;
  })();
  Seeds = (function() {
    function Seeds(grid) {
      this.grid = grid;
      this.seed = -1;
    }
    Seeds.prototype.seedAt = function(x, y) {
      this.grid.pointAt(this.seed + x, y).seed();
      return this.grid;
    };
    Seeds.prototype.glider = function() {
      this.seed++;
      this.seedAt(40, 40);
      this.seedAt(50, 50);
      this.seedAt(60, 50);
      this.seedAt(60, 40);
      return this.seedAt(60, 30);
    };
    Seeds.prototype.blinker = function() {
      this.seed++;
      this.seedAt(40, 40);
      this.seedAt(50, 40);
      return this.seedAt(60, 40);
    };
    return Seeds;
  })();
  $(document).ready(function() {
    return new Game(new Seeds(new Grid(300, 300)).glider());
  });
}).call(this);
