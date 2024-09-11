roiManager("reset");
intervalInterp=1;//pixel
run("Interpolate", "interval="+intervalInterp);
//run("Interpolate", "interval="+intervalInterp+" smooth");
//run("Interpolate", "interval="+intervalInterp+" adjust");
//run("Interpolate", "interval="+intervalInterp+" smooth adjust");
roiManager("add");
Roi.getCoordinates(xpoints, ypoints);
roiManager("deselect");
makeSelection("polyline", xpoints, ypoints);
run("Multi Kymograph", "linewidth=3");
run("Fire");