# Running Instructions

1. Create the mesh with `gmshToFoam <mesh name>`
2. Check the mesh validity with `checkMesh`
3. Scale the mesh from metres to feet with `transformPoints -scale '(0.3048 0.3048 0.3048)'`
4. Set number of CPU cores in decomposeParDict
5. Set up system for parallel processing by running `decomposePar`
6. Run the simulation parallely with `mpirun -np <core_count> pisoFoam -parallel`
7. Merge simulation outputs together with `reconstructPar`

