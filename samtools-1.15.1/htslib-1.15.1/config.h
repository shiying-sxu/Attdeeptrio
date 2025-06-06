/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* If you use configure, this file provides #defines reflecting your
   configuration choices.  If you have not run configure, suitable
   conservative defaults will be used.

   Autoheader adds a number of items to this template file that are not
   used by HTSlib: STDC_HEADERS and most HAVE_*_H header file defines
   are immaterial, as we assume standard ISO C headers and facilities;
   the PACKAGE_* defines are unused and are overridden by the more
   accurate PACKAGE_VERSION as computed by the Makefile.  */

/* Define if HTSlib should enable GCS support. */
#define ENABLE_GCS 1

/* Define if HTSlib should enable plugins. */
/* #undef ENABLE_PLUGINS */

/* Define if HTSlib should enable S3 support. */
#define ENABLE_S3 1

/* Define if you have the Common Crypto library. */
/* #undef HAVE_COMMONCRYPTO */

/* Define to 1 if you have the `drand48' function. */
#define HAVE_DRAND48 1

/* Define if using an external libhtscodecs */
/* #undef HAVE_EXTERNAL_LIBHTSCODECS */

/* Define to 1 if you have the `fdatasync' function. */
/* #undef HAVE_FDATASYNC */

/* Define to 1 if you have the `fsync' function. */
#define HAVE_FSYNC 1

/* Define to 1 if you have the `getpagesize' function. */
#define HAVE_GETPAGESIZE 1

/* Define to 1 if you have the `gmtime_r' function. */
#define HAVE_GMTIME_R 1

/* Define if you have libcrypto-style HMAC(). */
#define HAVE_HMAC 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the `bz2' library (-lbz2). */
#define HAVE_LIBBZ2 1

/* Define if libcurl file access is enabled. */
#define HAVE_LIBCURL 1

/* Define if libdeflate is available. */
#define HAVE_LIBDEFLATE 1

/* Define to 1 if you have the `lzma' library (-llzma). */
#define HAVE_LIBLZMA 1

/* Define to 1 if you have the `z' library (-lz). */
#define HAVE_LIBZ 1

/* Define to 1 if you have the <lzma.h> header file. */
#define HAVE_LZMA_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have a working `mmap' system call. */
#define HAVE_MMAP 1

/* Define to 1 if you have the `srand48_deterministic' function. */
/* #undef HAVE_SRAND48_DETERMINISTIC */

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/param.h> header file. */
#define HAVE_SYS_PARAM_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "samtools-help@lists.sourceforge.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "HTSlib"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "HTSlib 1.15.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "htslib"

/* Define to the home page for this package. */
#define PACKAGE_URL "http://www.htslib.org/"

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.15.1"

/* Platform-dependent plugin filename extension. */
/* #undef PLUGIN_EXT */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Enable large inode numbers on Mac OS X 10.5.  */
#ifndef _DARWIN_USE_64_BIT_INODE
# define _DARWIN_USE_64_BIT_INODE 1
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Needed for PTHREAD_MUTEX_RECURSIVE */
#define _XOPEN_SOURCE 600
