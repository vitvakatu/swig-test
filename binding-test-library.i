%module binding_test_library
%{
#include "stddef.h"
extern int abs(int);
extern void fill_vec(char * vec, size_t s);
extern int max(const char * vec, size_t s);
extern int(*return_callback)();
extern int use_callback(int(*callback)(int));
%}

extern int abs(int);
extern void fill_vec(char * vec, size_t s);
extern int max(const char * vec, size_t s);
extern int(*return_callback)();
extern int use_callback(int(*callback)(int));