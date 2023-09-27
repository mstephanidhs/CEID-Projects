## Parallel-Processing ##

The main objective of the project is the parallelization of the global optimization software, using the various programming models studied during the course.
Specifically, the Hooke-Jeeves method should be applied in parallel to the random points that are selected by the program. The main goal of this parallel 
implementation is to minimize the time needed to find the local minima calculated by the Hooke-Jeeves function and the final finding of the point corresponding 
to the global minimum.

The programming models that will be used to parallelize the program are the following:

* **OpenMP:** multiple threads apply the above method at random points
* **OpenMP tasks:** as before but using the OpenMP task model
* **MPI:** multiple processes apply the above method to the random points
* **MPI+OpenMP:** hybrid programming model, with multiple threads per MPI process

