//=============================================================================
// circleKymo.ijm
//=============================================================================
/**
 * This script generates a kymogram on a circular selection. It 
 * requires a calibrated image sequence (i.e. the pixel size and 
 * the frame interval have to be defined). Before running the 
 * script, the user must draw a circle on the image.
 * 
 * input: time-lapse image with a circle selection
 * outputs: kymogram is generated but not saved
 * requirements: Multi Kymograph
 * 
 * version: 1.0
 * date: 200230
 * author: Cyrille Billaudeau
 * institute: ProCeD - MICALIS - INRAE
 */

run("Clear Results");
print("\\Clear");
 
// To load the data test and draw the circle selection, uncomment the next 3 lines.
//pathDataTest=File.openDialog("Select data test provided with the script");
//open(pathDataTest);
//run("Specify...", "width=10 height=10 x=28 y=34 oval");

// Parameters
intervalInterp=1;//pixel
timeInterval=Stack.getFrameInterval();

// Concert circle to interpolated polyline selection 
roiManager("reset");
run("Interpolate", "interval="+intervalInterp);
roiManager("add");
Roi.getCoordinates(xpoints, ypoints);
roiManager("deselect");
makeSelection("polyline", xpoints, ypoints);

// Get circle perimeter to calibrate spatial scale of the kymogram
run("Set Measurements...", "area perimeter stack redirect=None decimal=3");
run("Measure");
kymoLength=getResult("Length", 0);

// Generate kymogram
run("Multi Kymograph", "linewidth=3");
getDimensions(imW_kymo, height, channels, slices, frames);
run("Fire");

run("Tile");

// calibrate kymogram (width: length / height: time) 
selectWindow("Kymograph");
pixW_kymo=kymoLength/imW_kymo;
run("Properties...", "channels=1 slices=1 frames=1 pixel_width="+pixW_kymo+" pixel_height="+timeInterval+" voxel_depth=0.1");
Stack.setXUnit("microns");
Stack.setYUnit("sec");

// To measure velocity, draw a line on the kymogram and run Measure (Ctrl+m). The velocity (unit: µm/sec) is the width divided by the height (those 2 values are displayed in the result table).
run("Set Measurements...", "area perimeter bounding stack redirect=None decimal=3");
setTool("line");
print("To measure velocity, draw a line on the kymogram and run Measure (Ctrl+m).");
print("The velocity (unit: µm/sec) is the width divided by the height (those 2 values are displayed in the result table).")
