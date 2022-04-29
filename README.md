# convection_diffusion equation solver
Convection–diffusion equation solver 1D - compares explicit, implicit, and analytical solutions

More about convection-diffusion equation:
https://en.wikipedia.org/wiki/Convection–diffusion_equation 


Compilation: 

./run.sh

or 

ifort -c -qmkl $MKLROOT/include/mkl_rci.f90 diff_conv_imp.f90 stdlib_linalg_diag.f90 stdlib_math_linspace.f90 stdlib_math.f90 stdlib_kinds.f90 stdlib_optval.f90
ifort -qmkl diff_conv_imp.o stdlib_linalg_diag.o stdlib_math.o stdlib_math_linspace.o stdlib_kinds.o stdlib_optval.o

![data](https://user-images.githubusercontent.com/11892854/165896367-37355c9f-a0fe-4d13-8ec0-dbe0b0c215ce.png)




