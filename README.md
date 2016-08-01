# auto-foil-kinematics-vi
LabVIEW vi that tracks flat hydro-/airfoils between frames of an AVI video, and optionally saves out several kinematic parameters.

Assumes a grayscale, 1024x1024 AVI input where the foil is white, in contrast to a dark background.  Can filter out smaller particles such as PIV particles.  Foil must also be of uniform or nearly-uniform thickness.  Tracks the foil's location in space, and can optionally save out: tracks of the foil in pixels, tracks of the foil in mm, amplitude of oscillation along the foil's length, selected snapshots of foil motion to draw kinematics envelopes, and animations of detected foil motion.
