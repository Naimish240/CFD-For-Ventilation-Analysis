# CFD-For-Ventilation-Analysis

## **Abstract**

Isolation wards are used in hospitals to isolate patients who have contracted contagious diseases like COVID-19, cholera and Ebola. Hospitals are required to implement containment strategies to prevent their staff and visitors from spreading the disease. One way in which respiratory disease outbreaks can be controlled inside a hospital is through the study of the natural ventilation patterns inside a hospital ward. Usually, during a disease outbreak, the National Centre for Disease Control (NCDC) publishes guidelines addressing the setting up of isolation wards in hospitals.

In this project, we design an isolation ward using FreeCAD, a 3D modelling software, in accordance with the NCDC guidelines for COVID 19. We subsequently use OpenFOAM, a finite-volume CFD solver, to study the ventilation patterns in the room. This project is carried out with free and open source software for greater transparency and reproducibility.

## **Dependancies**

This project makes use of the following software:
- FreeCAD (v0.18)
- Gmsh (v4.8.4)
- OpenFOAM (v2012)
- MPICH (v3.3.2)
- ParaView (v5.6.0)

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

## **General Instructions**

