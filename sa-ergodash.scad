// SA profile keycap set for an ErgoDash
//
// Board source code: https://github.com/omkbd/ErgoDash/#ergodash
//
// Keyboard layout: http://www.keyboard-layout-editor.com/#/gists/501437fce9123ecdaa15e9d15ec325b4
//
// Results: https://imgur.com/gallery/wct27xg
//          https://imgur.com/gallery/HOkjk6J
//          https://www.reddit.com/r/ErgoMechKeyboards/comments/nz4mkf/3d_printed_keycaps/
//
// Rendering in OpenSCAD takes a long time, tens of minutes.  Use the colour/group
// parameter to test on a small number of keys.
//
// Fonts and sizes are chosen according to the symbols, since especially the Unicode symbols
// for the control keys (⎄, 🔉, etc) aren't in many fonts, and may need adjustment.

// Set colour to 1-3 to output only some keys
colour=0;
// Set legends to 0 or 1 to output key bodies or legends
legends=0;

echo(str("Generating ", legends ? "legends" : "key bodies", " for colour group ", colour));

include <./includes.scad>

// Key top legends
t_legends = [
  [  "🔉",  "!", "@", "#", "$", "%", "^",   "⏯", "&", "✱", "(", ")", "{", "}"],
  [  "↹", "\"", "<", ">", "P", "Y", "~",   "+", "F", "G", "C", "R", "L", "?"],
  [  "|",  "A", "O", "E", "U", "I", "◆",   "⎄", "D", "H", "T", "N", "S", "_"],
  [  "⇧",  ":", "Q", "J", "K", "X", "⎋",   "⌦", "B", "M", "W", "V", "Z", "⇧"],
  [  "⇺",  "⇻", "⇞", "⇟", "⌫", "✲", "✦",   "✦", "↵", " ", "←", "↓", "↑", "→"],
];

// Key bottom legend, or the same as the top legend if there should only be one
b_legends = [
  [  "🔉", "1", "2", "3", "4", "5", "6",   "⏯", "7", "8", "9", "0", "[", "]"],
  [  "↹", "'", ",", ".", "P", "Y", "`",   "=", "F", "G", "C", "R", "L", "/"],
  [ "\\", "A", "O", "E", "U", "I", "◆",   "⎄", "D", "H", "T", "N", "S", "-"],
  [  "⇧", ";", "Q", "J", "K", "X", "⎋",   "⌦", "B", "M", "W", "V", "Z", "⇧"],
  [  "⇺", "⇻", "⇞", "⇟", "⌫", "✲", "✦",   "✦", "↵", " ", "←", "↓", "↑", "→"],
];

// Legend font sizes
s = 6;
l = 8;
h = 4;
sizes = [
  [ l, h, h, h, h, h, h,   l, h, h, h, h, 3, 3],
  [ l, h, h, h, s, s, 5,   5, s, s, s, s, s, h],
  [ h, s, s, s, s, s, l,   l, s, s, s, s, s, h],
  [ l, h, s, s, s, s, l,   l, s, s, s, s, s, l],
  [ l, l, l, l, l, 7, l,   l, l, l, s, s, s, s],
];

// Legend fonts
s2="Noto Sans Symbols2:style=Regular";
fc="Comfortaa:style=Bold";
dj="DejaVu Sans";
fm="FreeMono";

// Top/single legend font
t_font = [
  [ s2, fc, fc, fc, fc, fc, fc,   s2, fc, s2, fc, fc, fc, fc],
  [ dj, fc, fc, fc, fc, fc, fc,   fc, fc, fc, fc, fc, fc, fc],
  [ fc, fc, fc, fc, fc, fc, dj,   fm, fc, fc, fc, fc, fc, fc],
  [ dj, fc, fc, fc, fc, fc, fm,   fm, fc, fc, fc, fc, fc, dj],
  [ dj, dj, dj, dj, fm, s2, dj,   dj, dj, dj, fc, fc, fc, fc],
];

// Bottom legend font
b_font = [
  [ s2, fc, fc, fc, fc, fc, fc,   s2, fc, fc, fc, fc, fc, fc],
  [ dj, fc, fc, fc, fc, fc, fc,   fc, fc, fc, fc, fc, fc, fc],
  [ fc, fc, fc, fc, fc, fc, dj,   fm, fc, fc, fc, fc, fc, fc],
  [ dj, fc, fc, fc, fc, fc, fm,   fm, fc, fc, fc, fc, fc, dj],
  [ dj, dj, dj, dj, fm, s2, dj,   dj, dj, dj, fc, fc, fc, fc],
];

// Stem orientation and overall height as this is for the thumb cluster
rotate_and_shrink_stem = [
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 1,   1, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 1, 1, 1,   1, 1, 1, 0, 0, 0, 0],
];

// Key translation, so everything is against the bottom
th = -0.382;
tm =  0;
tt = -0.096;
key_translate = [
  [th, th, th, th, th, th, th,   th, th, th, th, th, th, th],
  [tt, tt, tt, tt, tt, tt, tt,   tt, tt, tt, tt, tt, tt, tt],
  [tm, tm, tm, tm, tm, tm, tm,   tm, tm, tm, tm, tm, tm, tm],
  [tt, tt, tt, tt, tt, tt, -2,   -2, tt, tt, tt, tt, tt, tt],
  [tm, tm, tm, tm, -2, -2, -2,   -2, -2, -2, tm, tm, tm, tm],
];

// Key colour, to produce only the chosen subset
colour_g = [
  [ 2, 3, 3, 3, 3, 3, 3,   3, 3, 3, 3, 3, 3, 2],
  [ 2, 1, 1, 1, 1, 1, 3,   3, 1, 1, 1, 1, 1, 2],
  [ 2, 1, 1, 1, 1, 1, 3,   3, 1, 1, 1, 1, 1, 2],
  [ 2, 1, 1, 1, 1, 1, 3,   3, 1, 1, 1, 1, 1, 2],
  [ 2, 2, 2, 2, 2, 2, 2,   2, 2, 2, 2, 2, 2, 2],
];
k_colours = ["blue", "grey", "red", "yellow", "green"];
l_colours = ["black", "black", "black", "black", "black"];

// Key profile
profile = [
  [ 1, 1, 1, 1, 1, 1, 1,   1, 1, 1, 1, 1, 1, 1],
  [ 2, 2, 2, 2, 2, 2, 2,   2, 2, 2, 2, 2, 2, 2],
  [ 3, 3, 3, 3, 3, 3, 3,   3, 3, 3, 3, 3, 3, 3],
  [ 4, 4, 4, 4, 4, 4, 1,   1, 4, 4, 4, 4, 4, 4],
  [ 2, 2, 2, 2, 2, 2, 2,   2, 2, 2, 2, 2, 2, 2],
];

// Homing "ditch" (dug-out bar)
t = true;
homing = [
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, t, 0, 0,   0, 0, t, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0],
];

// Key legend
module ergodash_legend(x, y) {
     if (t_legends[y][x] == b_legends[y][x]) {
          legend(t_legends[y][x], font=b_font[y][x], size=sizes[y][x])
               children();
     } else {
          legend(t_legends[y][x], [0, -3/4], font=t_font[y][x], size=sizes[y][x])
               legend(b_legends[y][x], [0, 3/4], font=b_font[y][x], size=sizes[y][x])
               children();
     }
}

// Rotate thumb keys, as the switches are mounted sideways
module ergodash_rotate(x, y) {
     if (rotate_and_shrink_stem[y][x] > 0) {
          rotated()
               children();
     } else {
          children();
     }
}

// Homing key "hollow"
module ergodash_homing(x, y) {
     if (homing[y][x]) {
          translate([0, 0, -3/2 * $inset_legend_depth])
               cylinder(r=4.5, h=3 * $inset_legend_depth, center=true);
     }
}

$stem_inner_slop = 0;

for (y = [0:1:4]) {
     for (x = [0:1:13]) {
          // Position keys in a grid
          o_y = floor((14*y+x) / 9);
          o_x = (14*y+x) % 9;

          // Generate only keys in the chosen group, or all if none specified
          if (colour == 0 || colour == colour_g[y][x]) {
               translate([0, 0, key_translate[y][x]])
                    translate_u(-o_x, -o_y)
                    sa_row(profile[y][x], 0)
                    upside_down() {

                    ergodash_legend(x, y)
                         ergodash_rotate(x, y) {
                         $dish_type = "disable";
                         $inset_legend_depth = 0.2; // whatever layer height you use
                         $total_depth = $total_depth - 2*rotate_and_shrink_stem[y][x];

                         union() {
                              if (legends) {
                                   color(l_colours[colour_g[y][x]])
                                        dished() { legends(homing[y][x] ? 3 * $inset_legend_depth : $inset_legend_depth); }
                                   %key(true)
                                         ergodash_homing(x, y);
                              } else {
                                   %dished() { legends(homing[y][x] ? 3 * $inset_legend_depth : $inset_legend_depth); }
                                   color(k_colours[colour_g[y][x]])
                                        key(true)
                                        ergodash_homing(x, y);
                              }
                         }
                    }
               }
          }
     }
}
