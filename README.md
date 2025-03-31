# CircleKymoIJ

This script generates a kymogram on a circular selection. It requires a calibrated image sequence (i.e. the pixel size and the frame interval have to be defined). Before running the script, the user must draw a circle on the image. 

![image](https://github.com/user-attachments/assets/0aeffecb-5b58-45f2-a10b-2eb02fa8c0f7)

# Requirements:
FIJI ([Fiji is just ImageJ]([url](https://imagej.net/software/fiji/)), NIH). Tested with Fiji (v2.14.0 / 1.54f), but should work with older versions as well.

# Usage:
To run the script, open the file in the script editor, either by dragging the file into Fiji's main window, or by opening the editor (click 'File > New > Script...') and opening the script from the File menu. Once the file is open:
* Open your image correctly (by making sure that the image is spatially and temporally calibrated after the import). It is recommended that you use 'File > Open' or 'Plugins > Bio-Formats > Import Bio-Formats' rather than dragging and dropping your image.
* Draw the circle selection (you can uncomment the dedicated line in the script).
* Press Run (Ctrl+R). 

# Output:
After execution, several windows are generated:
* The resulting kymograph on the circular selection
* The log window with the instruction to measure the speed on the kymograph
* The results table
* The ROI manager


