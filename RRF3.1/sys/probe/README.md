These files are here so they can remain statically named (rather than the more free for all Macros directory)
This folder is for probe moves.

Tried to keep it simple, the filename is descriptive
probe / x = probe x
probe / height_set_small = set probing height to small value

#### Displaced Z heightmap?

 * send G29 S2 to clear the height map
 * home Z
 * run G29. This generated a sensible height map.

Sending G29 S2 before homing Z was critical to avoid perpetuating the error in the new height map. I can see now that when the printer is Z-homed using the Z probe, the height map should be re-normalised to the new Z probe trigger point. I will implement this in the next firmware version.