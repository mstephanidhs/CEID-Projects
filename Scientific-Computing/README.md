# Scientific-Computing #

### 1st Exercise ###

Create the function sp_mat2latex which returns in LATEX the sparse CSR and CSC representation of a matrix that
is in sparse form.

### 2nd Exercise ###

Create the function blkToeplitzTrid(n,B,A,C) which given the matrices
A, B, C of size m × m, returns in sparse form the Toeplitz block tridiagonal matrix.

### 3rd Exercise ###

Create a function sp_mx2bccs which given a square sparse matrix A and an integer nb (block size),
returns the BCCS (block compressed column storage) representation of the above matrix.

### 4th Exercise ###

Create a function that takes as an input a matrix in BCCS representation (ie.
the arrays val, brow_idx, bcol_ptr) with their values) and returns the vector y ← y + Ax


