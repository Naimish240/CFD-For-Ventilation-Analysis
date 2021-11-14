mkdir logs

echo "... creating mesh"
gmshToFoam 3_branch.msh > logs/gmshToFoam.log
echo "... mesh created"

echo "... checking mesh validity"
checkMesh > logs/checkMesh.log
echo "... mesh validity verified"

echo "... scaling mesh to avoid unit mismatch"
transformPoints -scale '(0.3048 0.3048 0.3048)' > logs/transformPoints.log
echo "... mesh scaled"

echo "... setting up parallel processing"
decomposePar > logs/decomposePar.log
echo "... starting simulation"

mpirun -np 2 icoFoam -parallel | tee logs/icoFoam.log
echo "... reconstructing simulation results"

reconstructPar > logs/reconstructPar.log
echo "... exiting"

