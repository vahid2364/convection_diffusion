# convection_diffusion equation solver
Convection–diffusion equation solver 1D - compares explicit, implicit, and analytical solutions

More about convection-diffusion equation:
https://en.wikipedia.org/wiki/Convection–diffusion_equation 


Compilation: 

h1 {
  text-shadow: 2px 2px 5px red;
}

./run.sh

or 

ifort -c -qmkl $MKLROOT/include/mkl_rci.f90 diff_conv_imp.f90 stdlib_linalg_diag.f90 stdlib_math_linspace.f90 stdlib_math.f90 stdlib_kinds.f90 stdlib_optval.f90
ifort -qmkl diff_conv_imp.o stdlib_linalg_diag.o stdlib_math.o stdlib_math_linspace.o stdlib_kinds.o stdlib_optval.o



