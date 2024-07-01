function [x, y] = PolarACartesianasGrado(r, t) 
  % Conversion de coordenadas polares a cartesianas,
  % el angulo esta dado en grados. 
  [x, y] = PolarACartesianas(r, t*pi/180);
endfunction
