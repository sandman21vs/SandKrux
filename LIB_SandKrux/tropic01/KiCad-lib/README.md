# TROPIC01 KiCad Library

This directory contains support files for designing PCB with TROPIC01, **Tested with KiCad 9.0**.

<img src="KiCad_banner_TROPIC01.png" alt="KiCad printscreens" width="50%">

## Content

- `TROPIC01.kicad_sym` - Symbol library containing schematic symbol for TROPIC01 chip
- `TROPIC01.step` - 3D STEP model for the TROPIC01 chip package
- `logos.pretty/` - Tropic Square logo and branding, provided as footprints, ready to be used in silkscreen

As footprint we recommend to use standard `Package_DFN_QFN:QFN-32-1EP_4x4mm_P0.4mm_EP2.65x2.65mm` provided by KiCad.

## Installation and Usage as Project-Specific Libraries (Recommended)

This method keeps the libraries just with your project. For more details refer to original KiCad documentation about how to use libraries.

1. **Copy the KiCad-lib folder** into your KiCad project directory or a subdirectory (e.g., `libraries/`)

2. **Add the Library:**
  - Open your KiCad project
  - Go to `Preferences` → `Manage Symbol Libraries...`
  - In the "Project Specific Libraries" tab, click the folder icon to add a new library
  - Browse to and select `TROPIC01.kicad_sym`
  - Give it a nickname (e.g., "TROPIC_SQUARE")
  - Click OK

3. **Add the Footprint Library:**
  - Go to `Preferences` → `Manage Footprint Libraries...`
  - In the "Project Specific Libraries" tab, click the folder icon to add a new library
  - Browse to and select the `logos.pretty` folder
  - Give it a nickname (e.g., "TROPIC_SQUARE"_Logos")
  - Click OK

4. **Configure 3D Model Path:**

By default, KiCad uses the standard 3D model for the QFN32 footprint. You can override this with our custom model to display the palm tree logo on the TROPIC01 package in the 3D viewer. To use our 3D model:
  - Open the PCB editor
  - Select a TROPIC01 footprint
  - Right-click → `Properties` → `3D Models` tab
  - Update the path so it points to provided `TROPIC01.step`


## Adding Logo Footprints to PCB

The logo footprints are designed for PCB silkscreen branding. They include various sizes to fit different board designs. These footprints contain only graphical elements and have no electrical connections.

1. Open the PCB Editor
2. Click the "Add Footprint" button (or press `O`)
3. In the footprint chooser, search for "tropicsquare"
4. Select the desired logo variant:
   - `tropicsquare_logo` - Full logo (default size)
   - `tropicsquare_logo_7` - Logo, 7mm
   - `tropicsquare_logo_8` - Logo, 8mm
   - `tropicsquare_name_7` - Company name text, 7mm
   - `tropicsquare_palm` - Palm icon (default size)
   - `tropicsquare_palm_8` - Palm icon, 8mm
   - `tropicsquare_palm_10` - Palm icon, 10mm
5. Place it on your PCB (typically on the silkscreen layer)

## License

See the LICENSE.txt file in the root directory for licensing information.
