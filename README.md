# CFD-For-Ventilation-Analysis

[Click here to briefly see our thought proccess behind the design iterations](https://github.com/Naimish240/CFD-For-Ventilation-Analysis/tree/main/simulations/icofoam_cases)

## **Abstract**

Isolation wards are used in hospitals to isolate patients who have contracted contagious diseases like COVID-19, cholera and Ebola. Hospitals are required to implement containment strategies to prevent their staff and visitors from spreading the disease. One way in which respiratory disease outbreaks can be controlled inside a hospital is through the study of the natural ventilation patterns inside a hospital ward. Usually, during a disease outbreak, the National Centre for Disease Control (NCDC) publishes guidelines addressing the setting up of isolation wards in hospitals.

In this project, we design an isolation ward using FreeCAD, a 3D modelling software, in accordance with the NCDC guidelines for COVID 19. We subsequently use OpenFOAM, a finite-volume CFD solver, to study the ventilation patterns in the room. This project is carried out with free and open source software for greater transparency and reproducibility.

## **General Instructions**

Each case has a `allrun.sh` shell script associated with it, to run the simulation. After the simulation finishes running, you can open the `state.psvm` file in ParaView (by using the loading from saved state option) to visualise the results of each simulation. Running `allrun.sh` also produces a `logs` folder, to help with debugging.

You can run the simulation by simply running `./allrun.sh` from the corresponding `case` directory. To clean up the simulation, delete all generated files afterwards. Ensure that the shell script is executable by running `chmod +X allrun.sh`.

The `allrun.sh` script runs the following commands :

```sh
gmshToFoam one_inlet.msh # Prepare the mesh generated by Gmsh for OpenFOAM
checkMesh # Check if the mesh is 'valid'
transformPoints -scale '(0.3048 0.3048 0.3048)' # Since the CAD model was defined in Feet, we scale the mesh down to avoid unit conversion issues
decomposePar # Set up the case to run parallely
mpirun -np <number_of_cores> icoFoam -parallel # Runs the case on multiple cores
reconstructPar # Reconstruct the simulation results by merging results from cores together into single file
```

By default, the simulation is set up to run on 2 cores using the 'scotch' method. The number of cores used can be changed by editing the following line in `decomposeParDict` of each case:

```
numberOfSubdomains  <Replace with number of cores>;
```

A general explanation going through our overall thought process in the design iteration phase can be found in the `simulations/icofoam_cases` directory.

## **Procedure**

Our "pipeline" for running each case is as follows:

- First, we define the geometry of the room (floor plan) in FreeCAD.
- Next, we export the flow field (after making the required unions and cuts) as a STEP file.
- Then, we take the STEP file into Gmsh, and define the inlets, outlets, surfaces and walls.
- After that, we generate a hexahedral mesh with Gmsh. We refine the mesh till around 100k cells are produced.
- We then export the mesh from Gmsh as a .msh file, saving it in the "ASCII - II" format.
- Then, we prepare the mesh for OpenFOAM using the `gmshToFoam` command on the exported mesh.
- After that, we scale the mesh down to account for unit conversion errors. This is because the CAD model was generated in imperial units, whereas OpenFOAM uses metric.
- Next, we run the simulation using the icoFoam solver. We use mpich to parallelize this process, and run `reconstructPar` to merge the results from each CPU core.
- Then, we open the `controlDict` in ParaView, and plot the streamlines using "point source".
- Finally, we save the ParaView state to `state.psvm` for future reference.

## **Folder Setup**

Each case is divided as follows:
```
<Case Name>
├── case
│   ├── 0
│   │   ├── p
│   │   └── U
│   ├── <Mesh_Name>.msh
│   ├── allrun.sh
│   ├── constant
│   │   ├── polyMesh
│   │   └── transportProperties
│   ├── instructions.md
│   ├── state.pvsm
│   └── system
│       ├── controlDict
│       ├── decomposeParDict
│       ├── fvSchemes
│       └── fvSolution
├── geometry
│   ├── <FreCAD>.FCStd
│   ├── <Gmsh>.geo
│   └── <CAD_Export>.step
└── screenshots
    └── <Screenshot>.png
```

The `case` directory contains the files required to run the OpenFOAM simulation.
The `geometry` directory contains the CAD model, STEP file and GEO files.
The `screenshots` directory contains the screenshots associated with the project.

## **Dependancies**

This project makes use of the following software:
- FreeCAD (v0.18)
- Gmsh (v4.8.4)
- OpenFOAM (v2012)
- MPICH (v3.3.2)
- ParaView (v5.6.0)