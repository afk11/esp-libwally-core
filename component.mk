COMPONENT_SUBMODULES += wally_core

# Common root directory for all source directories
LSRC := libwally-core

# Derived from libsodium/src/libsodium/Makefile.am
# (ignoring the !MINIMAL set)

# Fix some warnings in current libsodium source files
# (not applied to whole component as we compile some of our own files, also.)
# $(LSRC)/crypto_pwhash/argon2/argon2-fill-block-ref.o: CFLAGS += -Wno-unknown-pragmas
#$(LSRC)/crypto_pwhash/argon2/pwhash_argon2i.o: CFLAGS += -Wno-type-limits
#$(LSRC)/crypto_pwhash/argon2/argon2-core.o: CFLAGS += -Wno-type-limits
#$(LSRC)/crypto_pwhash/scryptsalsa208sha256/pwhash_scryptsalsa208sha256.o: CFLAGS += -Wno-type-limits
#$(LSRC)/sodium/utils.o: CFLAGS += -Wno-unused-variable

COMPONENT_ADD_INCLUDEDIRS := $(LSRC)/include
COMPONENT_PRIV_INCLUDEDIRS := $(LSRC)/include $(LSRC)/src

# Not using autoconf, but this needs to be set
# ?? CFLAGS += -DCONFIGURED

# Add the options from configure.ac (this needs checking if new versions are added )
# CFLAGS +=  -DNATIVE_LITTLE_ENDIAN -DHAVE_WEAK_SYMBOLS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS

# randombytes.c needs to pull in platform-specific implementation
# $(LSRC)/randombytes/randombytes.o: CFLAGS+=-DRANDOMBYTES_DEFAULT_IMPLEMENTATION

# Temporary suppress "fallthrough" warnings until they are fixed in libsodium repo
#$(LSRC)/crypto_shorthash/siphash24/ref/shorthash_siphashx24_ref.o: CFLAGS += -Wno-implicit-fallthrough
#$(LSRC)/crypto_shorthash/siphash24/ref/shorthash_siphash24_ref.o: CFLAGS += -Wno-implicit-fallthrough
