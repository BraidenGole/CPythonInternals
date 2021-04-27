TUTORIAL FOR USING EXISTING C CODE WITH CYTHON (FROM SCRATCH):
  1. Navigate to your desktop.
  2. Create a folder.
  3. Inside that folder create these files: `testing_interface.py` `setup.py` `program.pyx` `cprogram.pxd`
  4. Inside the same folder create a sub directory called `CSourceCode`
  5. Inside of the `CSourceCode` directory create two files `source.c` & `source.h`
  6. Now copy the contents from my example project files to get yourself with a working program using existing C code.
  7. IMPORTANT: Don't forget the comment at the top of the `pyx` file: `# distutils: sources = CSourceCode/source.c`
