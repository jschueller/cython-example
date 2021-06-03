
import numpy as np
cimport numpy as np

cdef extern from *:
    """
    static void c_function(double *x, int n) { for (int i=0;i<n;++i) x[i] = i+8000; }
    """
    void c_function(double *x, int n);

def foo():
    size = 0
    cdef np.ndarray[double, ndim=1, mode='c'] A = np.zeros(size, dtype=np.double)
    bar(A, size)
    print(A)
    return 0

cdef void bar(double[:] ndx, int n):
    # here &ndx[0] fails with "IndexError: Out of bounds on buffer access (axis 0)" when size==0 (obviously)
    # is it possible to access a valid C pointer of the start of the memoryviewslice ndx instead ?
    c_function(&ndx[0], n)

        
    
  
