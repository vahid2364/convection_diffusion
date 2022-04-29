# Project Title: Convection-diffusion equation solver

Convection–diffusion equation solver 1D - compares explicit, implicit, and analytical solutions

## Description

More information about convection-diffusion equation: https://en.wikipedia.org/wiki/Convection–diffusion_equation 

## Getting Started

### Dependencies

* Pre-compiled example works on Mac OS using Intel oneAPI Fortran 2021b
* Fortran standard Library is needed: https://stdlib.fortran-lang.org
* Fortran MKL Library is needed: https://www.intel.com/content/www/us/en/develop/documentation/onemkl-developer-reference-fortran/top.html 
* ex. is bre-built in Mac OS 11.
* MKL lib is dynamically linked.
* STD LIB is linked statically. 

### Compiling program

* How to compile the program
* Step-by-step bullets
```
./run.sh
```
or
```
1. ifort -c -qmkl $MKLROOT/include/mkl_rci.f90 diff_conv_imp.f90 stdlib_linalg_diag.f90 stdlib_math_linspace.f90 stdlib_math.f90 
```
```
2. ifort -qmkl diff_conv_imp.o stdlib_linalg_diag.o stdlib_math.o stdlib_math_linspace.o stdlib_kinds.o stdlib_optval.o
```
### Executing program
```
./a.out
```

-------
## Result

![data](https://user-images.githubusercontent.com/11892854/165896367-37355c9f-a0fe-4d13-8ec0-dbe0b0c215ce.png)


## Author

Contributors names and contact info

ex. Vahid Attari 
ex. attari.v@tamu.edu 
web: https://arroyavelab.tamu.edu/people/vahid-attari/ 

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
* [Matlab_version] (https://github.com/aaliyyaman/Sol_Of_ConvectionDiffusion)





