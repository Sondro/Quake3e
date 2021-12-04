#############################################################################
# Include "Makefile.x" to edit below & keep Makefile as a template:
#############################################################################

-include Makefile.000

#----------------------------------------------------------

USER_PATH_NAME           = user
HOST_PATH_NAME           = host

USER_BPATH_NAME          = user
HOST_BPATH_NAME          = ded
GFX1_BPATH_NAME         = gfx1
GFX2_BPATH_NAME         = gfx2
GFXV_BPATH_NAME         = gfxv

OBJECT_SUFFIX            = _-_obj

DEBUG_BPATH_NAME         = debug-$(PLATFORM)-$(CPU)
RELEASE_BPATH_NAME       = release-$(PLATFORM)-$(CPU)

USER_NAME                = quake3e
HOST_NAME                = $(USER_NAME)_$(HOST_BPATH_NAME)

APP_TYPE                 = games

#----------------------------------------------------------

ifndef APP_PATH
  APP_PATH = /usr/local/$(APP_TYPE)/$(USER_NAME)
endif

ifndef CODE_PATH
  CODE_PATH = code
endif

ifndef BUILD_PATH
  BUILD_PATH = build
endif

#----------------------------------------------------------

BUILD_RELEASE = $(BUILD_PATH)/$(RELEASE_BPATH_NAME)
BUILD_DEBUG = $(BUILD_PATH)/$(DEBUG_BPATH_NAME)

HOST_PATH = $(CODE_PATH)/host
USER_PATH = $(CODE_PATH)/user

APP_CURL_PATH = $(USER_PATH)/app_curl
ASM_PATH = $(CODE_PATH)/asm
ASM_X86_PATH = $(ASM_PATH)/x86

COMMON_PATH = $(CODE_PATH)/co
MATH_PATH = $(COMMON_PATH)/math
MATH_GFX_PATH = $(MATH_PATH)/gfx
VM_X86_PATH = $(COMMON_PATH)/vm/x86
VM_X86_64_PATH = $(VM_X86_PATH)
#VM_X86_64_PATH = $(COMMON_PATH)/vm/x86_64
VM_ARM_PATH = $(COMMON_PATH)/vm/arm
VM_AARCH64_PATH = $(COMMON_PATH)/vm/aarch64

UNIX_PATH = $(CODE_PATH)/unix
UNIX_SDL_OFF_PATH = $(UNIX_PATH)/sdl/off
UNIX_VK_ON_PATH = $(UNIX_PATH)/vk/on

WIN32_PATH = $(CODE_PATH)/win32
WIN32_SDL_ON_PATH = $(WIN32_PATH)/sdl/on
WIN32_SDL_OFF_PATH = $(WIN32_PATH)/sdl/off
WIN32_VK_ON_PATH = $(WIN32_PATH)/vk/on

SDL_PATH = $(CODE_PATH)/sdl
BOTLIB_PATH = $(CODE_PATH)/botlib
UI_PATH = $(CODE_PATH)/ui
JPG_PATH = $(CODE_PATH)/libjpeg

GFXER_COMMON_PATH = $(CODE_PATH)/gfxercommon
GFXER_FONT_PATH = $(GFXER_COMMON_PATH)/font
GFXER1_PATH = $(CODE_PATH)/gfxer
GFXER2_PATH = $(CODE_PATH)/gfxer2
GFXER2_FX_PATH = $(GFXER2_PATH)/glsl
GFXERV_PATH = $(CODE_PATH)/gfxervk

GFXER2_STRING_PATH = $(GFXER2_PATH)/string

#----------------------------------------------------------

ifeq ($(B),$(BUILD_DEBUG))
 OBJECT_BPATH_NAME = $(DEBUG_BPATH_NAME)$(OBJECT_SUFFIX)
else
 OBJECT_BPATH_NAME = $(RELEASE_BPATH_NAME)$(OBJECT_SUFFIX)
endif

OBJECT_BPATH = $(BUILD_PATH)/$(OBJECT_BPATH_NAME)

USER_BPATH = $(OBJECT_BPATH)/$(USER_BPATH_NAME)
HOST_BPATH = $(OBJECT_BPATH)/$(HOST_BPATH_NAME)
BOTLIB_BPATH = $(OBJECT_BPATH)/botlib
JPG_BPATH = $(OBJECT_BPATH)/libjpeg
GFX1_BPATH = $(OBJECT_BPATH)/$(GFX1_BPATH_NAME)
GFX2_BPATH = $(OBJECT_BPATH)/$(GFX2_BPATH_NAME)
GFX2_FX_BPATH = $(GFX2_BPATH)/glsl
GFXV_BPATH = $(OBJECT_BPATH)/$(GFXV_BPATH_NAME)

BINARY_PATH = $(shell which $(1) 2> /dev/null)
VERSION = $(shell grep "\#define APP_VERSION" $(COMMON_PATH)/q_shared.h | \
  sed -e 's/.*".* \([^ ]*\)"/\1/')

#==========================================================
# ON or OFF (1 or 0):
#==========================================================

USER_ON                 = 1
HOST_ON                 = 1

OPENGL1_ON              = 1
OPENGL2_ON              = 1

VULKAN_ON_Make          = 1
VULKAN_API_ON_Make      = 1

GFXER_DLLS_ON_Make   = 1

SDL_ON_Make             = 1
CURL_ON_Make            = 1

HEADERS_ON_Make         = 0
APP_JPG_ON_Make         = 0

#----------------------------------------------------------

# Main Gfx(vulkan, opengl2, opengl):
GFXER_MAIN_Make = vulkan

GFXER_PREFIX_Make = $(USER_NAME)

#==========================================================
# FIX SETTINGS:
#==========================================================

ifndef HEADERS_ON_Make
  HEADERS_ON_Make = 1
endif

ifndef CURL_ON_Make
  CURL_ON_Make = 1
endif

ifndef CURL_DLL_ON_Make
  ifdef MINGW
    CURL_DLL_ON_Make = 0
  else
    CURL_DLL_ON_Make = 1
  endif
endif

ifndef DEPENDSENCIES_ON
  DEPENDSENCIES_ON = 1
endif

ifndef CCACHE_ON
  CCACHE_ON = 0
endif
export CCACHE_ON

#----------------------------------------------------------

ifeq ($(USER_ON),1)

  ifeq ($(GFXER_DLLS_ON_Make),0)
    ifeq ($(GFXER_MAIN_Make),vulkan)
      OPENGL1_ON         = 0
      OPENGL2_ON         = 0
      VULKAN_ON_Make     = 1
    else
    ifeq ($(GFXER_MAIN_Make),opengl2)
      OPENGL1_ON         = 0
      OPENGL2_ON         = 1
      VULKAN_ON_Make     = 0
      VULKAN_API_ON_Make = 0
    else
    ifeq ($(GFXER_MAIN_Make),opengl)
      OPENGL1_ON         = 1
      OPENGL2_ON         = 0
      VULKAN_ON_Make     = 0
      VULKAN_API_ON_Make = 0
    endif
    endif
    endif
  else
    ifeq ($(GFXER_MAIN_Make),vulkan)
      VULKAN_ON_Make     = 1
    else
    ifeq ($(GFXER_MAIN_Make),opengl2)
      OPENGL2_ON         = 1
    else
    ifeq ($(GFXER_MAIN_Make),opengl)
      OPENGL1_ON         = 1
    endif
    endif
    endif
  endif

  ifeq ($(VULKAN_ON_Make),1)
    VULKAN_API_ON_Make   = 1
  endif

endif # =USER_ON

#==========================================================
# CPU & Platform:
#==========================================================

SET_CPU = $(shell uname -m | sed -e 's/i.86/x86/' | sed -e 's/^arm.*/arm/')

ifeq ($(shell uname -m),arm64)
  SET_CPU = aarch64
endif

ifeq ($(SET_CPU),i86pc)
  SET_CPU = x86
endif

ifeq ($(SET_CPU),amd64)
  SET_CPU = x86_64
endif
ifeq ($(SET_CPU),x64)
  SET_CPU = x86_64
endif

#----------------------------------------------------------

SET_PLATFORM = $(shell uname | sed -e 's/_.*//' | tr '[:upper:]' '[:lower:]' | sed -e 's/\//_/g')

ifeq ($(SET_PLATFORM),mingw32)
  ifeq ($(SET_CPU),i386)
    SET_CPU = x86
  endif
endif

ifeq ($(SET_PLATFORM),darwin)
  SDL_ON_Make = 1
endif

ifeq ($(SET_PLATFORM),cygwin)
  PLATFORM = mingw32
endif

#----------------------------------------------------------

ifndef PLATFORM
  PLATFORM = $(SET_PLATFORM)
endif
export PLATFORM

ifeq ($(PLATFORM),mingw32)
  MINGW=1
endif
ifeq ($(PLATFORM),mingw64)
  MINGW=1
endif

#----------------------------------------------------------

ifndef CPU
  CPU = $(SET_CPU)
endif
export CPU

#----------------------------------------------------------

ifeq ($(PLATFORM),$(SET_PLATFORM))
  ifneq ($(CPU),$(SET_CPU))
    CROSS_COMPILE = 1
  endif # CPU != SET_CPU
  else
    CROSS_COMPILE = 0
  
endif # PLATFORM == SET_PLATFORM

export CROSS_COMPILE

#==========================================================

STRIP ?= strip
PKG_CONFIG ?= pkg-config
INSTALL = install
MKDIR = mkdir

#----------------------------------------------------------

ifneq ($(call BINARY_PATH, $(PKG_CONFIG)),)
  SDL_INCLUDES ?= $(shell $(PKG_CONFIG) --silence-errors --cflags-only-I sdl2)
  SDL_LIBS ?= $(shell $(PKG_CONFIG) --silence-errors --libs sdl2)
  X11_INCLUDES ?= $(shell $(PKG_CONFIG) --silence-errors --cflags-only-I x11)
  X11_LIBS ?= $(shell $(PKG_CONFIG) --silence-errors --libs x11)
endif

# SDL/X11 Defaults:
ifeq ($(X11_INCLUDES),)
  X11_INCLUDES = -I/usr/X11R6/include
endif
ifeq ($(X11_LIBS),)
  X11_LIBS = -lX11
endif
ifeq ($(SDL_LIBS),)
  SDL_LIBS = -lSDL2
endif

#==========================================================
# VM:
#==========================================================

ifeq ($(CPU),x86_64)
  VM_ON = 1
else
ifeq ($(CPU),x86)
  VM_ON = 1
else
  VM_ON = 0
endif
endif # CPU == x86_64

ifeq ($(CPU),arm)
  VM_ON = 1
endif
ifeq ($(CPU),aarch64)
  VM_ON = 1
endif

#==========================================================
BASE_CFLAGS =
#==========================================================

ifeq ($(APP_JPG_ON_Make),1)
  BASE_CFLAGS += -DAPP_JPG_ON_Make
endif # =APP_JPG_ON_Make

ifeq ($(VM_ON),0)
  BASE_CFLAGS += -DVM_OFF_CFlags
endif # !VM_ON

ifeq ($(GFXER_DLLS_ON_Make),1)
  BASE_CFLAGS += -DGFXER_DLLS_ON_Make
  BASE_CFLAGS += -DGFXER_PREFIX_Make=\\\"$(GFXER_PREFIX_Make)\\\"
  BASE_CFLAGS += -DGFXER_MAIN_Make="$(GFXER_MAIN_Make)"
endif # =GFXER_DLLS_ON_Make

ifdef MAIN_PATH
  BASE_CFLAGS += -DMAIN_PATH=\\\"$(MAIN_PATH)\\\"
endif

ifeq ($(HEADERS_ON_Make),1)
  BASE_CFLAGS += -DHEADERS_ON_Make=1
endif # =HEADERS_ON_Make

ifeq ($(CURL_ON_Make),1)
  BASE_CFLAGS += -DCURL_ON_Make
  ifeq ($(CURL_DLL_ON_Make),1)
    BASE_CFLAGS += -DCURL_DLL_ON_Make
  else
    ifeq ($(MINGW),1)
      BASE_CFLAGS += -DCURL_EXE
    endif # =MINGW
  endif # =CURL_DLL_ON_Make
endif # =CURL_ON_Make

ifeq ($(VULKAN_API_ON_Make),1)
  BASE_CFLAGS += -DVULKAN_API_ON_Make
endif # =VULKAN_API_ON_Make

ifeq ($(DEPENDSENCIES_ON),1)
  BASE_CFLAGS += -MMD
endif # =DEPENDSENCIES_ON

#==========================================================

ifeq ($(V),1)
echo_cmd = @:
Q =
else
echo_cmd = @echo
Q = @
endif

#----------------------------------------------------------

CPU_EXT =

USER_EXTRA_FILES =

#############################################################################
# BUILD MINGW32 (Windows):
#############################################################################

ifdef MINGW
  ifeq ($(CROSS_COMPILE),1)

#==========================================================
# Reset broken CC:
#==========================================================

    ifneq ($(findstring $(strip $(CC)),cc gcc),)
      CC =
    endif

#==========================================================
# Get the right gcc & windres:
#==========================================================

    ifeq ($(CPU),x86_64)
      MINGW_PREFIXES = x86_64-w64-mingw32 amd64-mingw32msvc
      STRIP = x86_64-w64-mingw32-strip
    endif
    ifeq ($(CPU),x86)
      MINGW_PREFIXES = i686-w64-mingw32 i586-mingw32msvc i686-pc-mingw32
    endif

    ifndef CC
      CC = $(firstword $(strip $(foreach MINGW_PREFIX, $(MINGW_PREFIXES), \
         $(call BINARY_PATH, $(MINGW_PREFIX)-gcc))))
    endif

    #STRIP = $(MINGW_PREFIX)-strip -g

    ifndef WINDRES
      WINDRES = $(firstword $(strip $(foreach MINGW_PREFIX, $(MINGW_PREFIXES), \
         $(call BINARY_PATH, $(MINGW_PREFIX)-windres))))
    endif
  else
    # Use gcc over 'CC' (not 'cc'):
    ifeq ($(call BINARY_PATH, $(CC)),)
      CC = gcc
    endif
  endif

#==========================================================
# Check missing vars:
#========================================================== 

  ifeq ($(WINDRES),)
    WINDRES = windres
  endif

  ifeq ($(CC),)
    $(error No cross compiler for $(PLATFORM))
  endif

#==========================================================

  BASE_CFLAGS += -Wall -Wimplicit -Wstrict-prototypes -DICON_ON_Make -DMINGW=1
  BASE_CFLAGS += -Wno-unused-result -fvisibility=hidden

#----------------------------------------------------------

  ifeq ($(CPU),x86_64)
    CPU_EXT = .x64
    BASE_CFLAGS += -m64
    OPTIMIZE = -s -O2 -ffast-math -fstrength-reduce
  endif
  ifeq ($(CPU),x86)
    BASE_CFLAGS += -m32
    OPTIMIZE = -O2 -march=i586 -mtune=i686 -ffast-math -fstrength-reduce
  endif

#----------------------------------------------------------

  SHARED_LIB_EXT = dll
  SHARED_LIB_CFLAGS = -fPIC -fvisibility=hidden
  SHARED_LIB_LDFLAGS = -shared $(LDFLAGS)

  BIN_EXT = .exe

  LDFLAGS = -mwindows -Wl,--dynamicbase -Wl,--nxcompat
  LDFLAGS += -Wl,--gc-sections -fvisibility=hidden
  LDFLAGS += -lwsock32 -lgdi32 -lwinmm -lole32 -lws2_32 -lpsapi -lcomctl32

  USER_LDFLAGS=$(LDFLAGS)

#----------------------------------------------------------

  ifeq ($(SDL_ON_Make),1)
    BASE_CFLAGS += -DHEADERS_ON_Make=1 -I$(CODE_PATH)/libsdl/windows/include/SDL2
    #USER_CFLAGS += -DHEADERS_ON_Make=1
    ifeq ($(CPU),x86)
      USER_LDFLAGS += -L$(CODE_PATH)/libsdl/windows/mingw/lib32
      USER_LDFLAGS += -lSDL2
      USER_EXTRA_FILES += $(CODE_PATH)/libsdl/windows/mingw/lib32/SDL2.dll
    else
      USER_LDFLAGS += -L$(CODE_PATH)/libsdl/windows/mingw/lib64
      USER_LDFLAGS += -lSDL264
      USER_EXTRA_FILES += $(CODE_PATH)/libsdl/windows/mingw/lib64/SDL264.dll
    endif # CPU == x86
  endif # =SDL_ON_Make

  ifeq ($(CURL_ON_Make),1)
    BASE_CFLAGS += -I$(CODE_PATH)/libcurl/windows/include
    ifeq ($(CPU),x86)
      USER_LDFLAGS += -L$(CODE_PATH)/libcurl/windows/mingw/lib32
    else
      USER_LDFLAGS += -L$(CODE_PATH)/libcurl/windows/mingw/lib64
    endif # CPU == x86
    USER_LDFLAGS += -lcurl -lwldap32 -lcrypt32
  endif # =CURL_ON_Make

#----------------------------------------------------------

  DEBUG_CFLAGS = $(BASE_CFLAGS) -DDEBUG -D_DEBUG -g -O0
  RELEASE_CFLAGS = $(BASE_CFLAGS) -DNDEBUG $(OPTIMIZE)

#----------------------------------------------------------

else # !MINGW:

#############################################################################
# BUILD MAC:
#############################################################################

ifeq ($(SET_PLATFORM),darwin)

  BASE_CFLAGS += -Wall -Wimplicit -Wstrict-prototypes -pipe
  BASE_CFLAGS += -Wno-unused-result

  OPTIMIZE = -O2 -fvisibility=hidden

  SHARED_LIB_EXT = dylib
  SHARED_LIB_CFLAGS = -fPIC -fvisibility=hidden
  SHARED_LIB_LDFLAGS = -dynamiclib $(LDFLAGS)

  LDFLAGS =

#----------------------------------------------------------

  ifneq ($(SDL_INCLUDES),)
    BASE_CFLAGS += $(SDL_INCLUDES)
    USER_LDFLAGS = $(SDL_LIBS)
  else
    BASE_CFLAGS += -I/Library/Frameworks/SDL2.framework/Headers
    USER_LDFLAGS = -F/Library/Frameworks -framework SDL2
  endif

#----------------------------------------------------------

  DEBUG_CFLAGS = $(BASE_CFLAGS) -DDEBUG -D_DEBUG -g -O0
  RELEASE_CFLAGS = $(BASE_CFLAGS) -DNDEBUG $(OPTIMIZE)

#----------------------------------------------------------

else

#############################################################################
# BUILD *NIX:
#############################################################################

  BASE_CFLAGS += -Wall -Wimplicit -Wstrict-prototypes -pipe
  BASE_CFLAGS += -Wno-unused-result
  BASE_CFLAGS += -DICON_ON_Make
  BASE_CFLAGS += -I/usr/include -I/usr/local/include

  OPTIMIZE = -O2 -fvisibility=hidden

#----------------------------------------------------------

  ifeq ($(CPU),x86_64)
    CPU_EXT = .x64
  else 
  ifeq ($(CPU),x86)
    OPTIMIZE += -march=i586 -mtune=i686
  endif
  endif # CPU == x86_64

  ifeq ($(CPU),arm)
    OPTIMIZE += -march=armv7-a
    CPU_EXT = .arm
  endif

  ifeq ($(CPU),aarch64)
    CPU_EXT = .aarch64
  endif

#----------------------------------------------------------

  SHARED_LIB_EXT = so
  SHARED_LIB_CFLAGS = -fPIC -fvisibility=hidden
  SHARED_LIB_LDFLAGS = -shared $(LDFLAGS)

  LDFLAGS = -lm
  LDFLAGS += -Wl,--gc-sections -fvisibility=hidden

#----------------------------------------------------------

  ifeq ($(SDL_ON_Make),1)
    BASE_CFLAGS += $(SDL_INCLUDES)
    USER_LDFLAGS = $(SDL_LIBS)
  else
    BASE_CFLAGS += $(X11_INCLUDES)
    USER_LDFLAGS = $(X11_LIBS)
  endif

  ifeq ($(APP_JPG_ON_Make),1)
    USER_LDFLAGS += -ljpeg
  endif

  ifeq ($(CURL_ON_Make),1)
    ifeq ($(CURL_DLL_ON_Make),0)
      USER_LDFLAGS += -lcurl
    endif
  endif

#----------------------------------------------------------

  ifeq ($(PLATFORM),linux)
    LDFLAGS += -ldl -Wl,--hash-style=both
    ifeq ($(CPU),x86)
      # Linux32 make:
      BASE_CFLAGS += -m32
      LDFLAGS += -m32
    endif
  endif # PLATFORM == linux

#----------------------------------------------------------

  DEBUG_CFLAGS = $(BASE_CFLAGS) -DDEBUG -D_DEBUG -g -O0
  RELEASE_CFLAGS = $(BASE_CFLAGS) -DNDEBUG $(OPTIMIZE)

  DEBUG_LDFLAGS = -rdynamic

#----------------------------------------------------------

endif # *NIX platforms

endif # !MINGW

#############################################################################

TARGETS =

#==========================================================
ifeq ($(HOST_ON),1)
#==========================================================

  define DO_DED_CC
  $(echo_cmd) "DED_CC $<"
  $(Q)$(CC) $(UNSHARED_LIB_CFLAGS) -DDEDICATED $(CFLAGS) -o $@ -c $<
  endef

#----------------------------------------------------------

  TARGET_HOST = $(HOST_NAME)$(CPU_EXT)$(BIN_EXT)
  TARGETS += $(B)/$(TARGET_HOST)

endif # =HOST_ON

#==========================================================
ifeq ($(USER_ON),1)
#==========================================================

  define DO_CC
  $(echo_cmd) "CC $<"
  $(Q)$(CC) $(UNSHARED_LIB_CFLAGS) $(CFLAGS) -o $@ -c $<
  endef

  define DO_GFXER_CC
  $(echo_cmd) "GFXER_CC $<"
  $(Q)$(CC) $(GFXER_CFLAGS) $(CFLAGS) -o $@ -c $<
  endef

  define DO_REF_STR
  $(echo_cmd) "REF_STR $<"
  $(Q)rm -f $@
  $(Q)$(STRINGIFY) $< $@
  endef

#----------------------------------------------------------

  TARGET_GFXER1 = $(GFXER_PREFIX_Make)_opengl_$(SHARED_LIB_NAME)
  STRINGIFY = $(GFX2_BPATH)/stringify$(BIN_EXT)
  TARGET_GFXER2 = $(GFXER_PREFIX_Make)_opengl2_$(SHARED_LIB_NAME)
  TARGET_GFXER_VULKAN = $(GFXER_PREFIX_Make)_vulkan_$(SHARED_LIB_NAME)
  
  TARGET_USER = $(USER_NAME)$(CPU_EXT)$(BIN_EXT)
  TARGETS += $(B)/$(TARGET_USER)

#----------------------------------------------------------

  ifeq ($(GFXER_DLLS_ON_Make),1)
    GFXER_CFLAGS = $(SHARED_LIB_CFLAGS)
    ifeq ($(OPENGL1_ON),1)
      TARGETS += $(B)/$(TARGET_GFXER1)
    endif
    ifeq ($(OPENGL2_ON),1)
      TARGETS += $(B)/$(TARGET_GFXER2)
    endif
    ifeq ($(VULKAN_ON_Make),1)
      TARGETS += $(B)/$(TARGET_GFXER_VULKAN)
    endif
    else
      GFXER_CFLAGS = $(UNSHARED_LIB_CFLAGS)
  endif # =GFXER_DLLS_ON_Make

endif # =USER_ON

#==========================================================

ifeq ($(CCACHE_ON),1)
  CC = ccache $(CC)
endif

#----------------------------------------------------------

define DO_BOT_CC
$(echo_cmd) "BOT_CC $<"
$(Q)$(CC) $(UNSHARED_LIB_CFLAGS) $(CFLAGS) $(BOTCFLAGS) -DBOTLIB -o $@ -c $< 
endef

define DO_UNSHARED_LIB_CC
$(echo_cmd) "DO_UNSHARED_LIB_CC $<"
$(Q)$(CC) $(UNSHARED_LIB_CFLAGS) $(CFLAGS) -o $@ -c $<
endef

define DO_SHARED_LIB_CC
$(echo_cmd) "SHARED_LIB_CC $<"
$(Q)$(CC) $(CFLAGS) $(SHARED_LIB_CFLAGS) -o $@ -c $<
endef

define DO_AS
$(echo_cmd) "AS $<"
$(Q)$(CC) $(CFLAGS) -DELF -x assembler-with-cpp -o $@ -c $<
endef

define DO_WINDRES
$(echo_cmd) "WINDRES $<"
$(Q)$(WINDRES) -i $< -o $@
endef

#----------------------------------------------------------

ifndef SHARED_LIB_NAME
  SHARED_LIB_NAME = $(CPU).$(SHARED_LIB_EXT)
endif

#############################################################################
# RULES:
#############################################################################

ifeq ($(HOST_ON),1)

$(HOST_BPATH)/%.o: $(COMMON_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(BOTLIB_PATH)/%.c
	$(DO_BOT_CC)
$(HOST_BPATH)/%.o: $(HOST_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(MATH_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(UNIX_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(VM_X86_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(VM_X86_64_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(VM_ARM_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(VM_AARCH64_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(WIN32_PATH)/%.c
	$(DO_DED_CC)
$(HOST_BPATH)/%.o: $(WIN32_PATH)/%.rc
	$(DO_WINDRES)

endif # =HOST_ON

#==========================================================

ifeq ($(USER_ON),1)

$(USER_BPATH)/%.o: $(ASM_PATH)/%.s
	$(DO_AS)
$(USER_BPATH)/%.o: $(APP_CURL_PATH)/%.c
	$(DO_CC)
$(BOTLIB_BPATH)/%.o: $(BOTLIB_PATH)/%.c
	$(DO_BOT_CC)
$(USER_BPATH)/%.o: $(COMMON_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(HOST_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(JPG_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(MATH_GFX_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(MATH_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(SDL_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(UNIX_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(USER_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(VM_X86_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(VM_X86_64_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(VM_ARM_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(VM_AARCH64_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(WIN32_PATH)/%.c
	$(DO_CC)
$(USER_BPATH)/%.o: $(WIN32_PATH)/%.rc
	$(DO_WINDRES)

#==========================================================

$(GFX1_BPATH)/%.o: $(GFXER1_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX1_BPATH)/%.o: $(GFXER_COMMON_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX1_BPATH)/%.o: $(GFXER_FONT_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX1_BPATH)/%.o: $(MATH_GFX_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX1_BPATH)/%.o: $(MATH_PATH)/%.c
	$(DO_GFXER_CC)

#----------------------------------------------------------

$(GFX2_FX_BPATH)/%.c: $(GFXER2_FX_PATH)/%.glsl $(STRINGIFY)
	$(DO_REF_STR)
$(GFX2_FX_BPATH)/%.o: $(GFXER2_FX_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX2_BPATH)/%.o: $(GFXER2_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX2_BPATH)/%.o: $(GFXER_COMMON_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX2_BPATH)/%.o: $(GFXER_FONT_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX2_BPATH)/%.o: $(MATH_GFX_PATH)/%.c
	$(DO_GFXER_CC)
$(GFX2_BPATH)/%.o: $(MATH_PATH)/%.c
	$(DO_GFXER_CC)

#----------------------------------------------------------

$(GFXV_BPATH)/%.o: $(GFXERV_PATH)/%.c
	$(DO_GFXER_CC)
$(GFXV_BPATH)/%.o: $(GFXER_COMMON_PATH)/%.c
	$(DO_GFXER_CC)
$(GFXV_BPATH)/%.o: $(MATH_GFX_PATH)/%.c
	$(DO_GFXER_CC)
$(GFXV_BPATH)/%.o: $(MATH_PATH)/%.c
	$(DO_GFXER_CC)  

endif # =USER_ON

#############################################################################
# TARGETS:
#############################################################################

default: release
all: debug release

debug:
	@$(MAKE) targets B=$(BUILD_DEBUG) CFLAGS="$(CFLAGS) $(DEBUG_CFLAGS)" LDFLAGS="$(LDFLAGS) $(DEBUG_LDFLAGS)" V=$(V)

release:
	@$(MAKE) targets B=$(BUILD_RELEASE) CFLAGS="$(CFLAGS) $(RELEASE_CFLAGS)" V=$(V)

#----------------------------------------------------------

define ADD_COPY_TARGET
TARGETS += $2
$2: $1
	$(echo_cmd) "CP $$<"
	@cp $1 $2
endef

# Build path rules (for bundling):
define GENERATE_COPY_TARGETS
  $(foreach FILE,$1, \
    $(eval $(call ADD_COPY_TARGET, \
      $(FILE), \
      $(addprefix $(B)/, $(notdir $(FILE))))))
endef

#----------------------------------------------------------

ifeq ($(USER_ON),1)
  $(call GENERATE_COPY_TARGETS,$(USER_EXTRA_FILES))
endif

#==========================================================
# Create Tools & Build folders:
#==========================================================

targets: doFolders tools
	@echo ""
	@echo "Building $(USER_NAME) in $(B):"
	@echo ""
	@echo " VERSION: $(VERSION)"
	@echo " PLATFORM: $(PLATFORM)"
	@echo " CPU: $(CPU)"
	@echo " SET_PLATFORM: $(SET_PLATFORM)"
	@echo " SET_CPU: $(SET_CPU)"
ifdef MINGW
	@echo " WINDRES: $(WINDRES)"
endif
	@echo " CC: $(CC)"
	@echo ""
	@echo " CFLAGS:"
	@for i in $(CFLAGS); \
	do \
		echo " $$i"; \
	done
	@echo ""
	@echo " Output:"
	@for i in $(TARGETS); \
	do \
		echo " $$i"; \
	done
	@echo ""
ifneq ($(TARGETS),)
	@$(MAKE) $(TARGETS) V=$(V)
endif

#----------------------------------------------------------
# Create folders from paths:
#----------------------------------------------------------

doFolders:
	@if [ ! -d $(BUILD_PATH) ];then $(MKDIR) $(BUILD_PATH);fi
	@if [ ! -d $(B) ];then $(MKDIR) $(B);fi
	@if [ ! -d $(OBJECT_BPATH) ];then $(MKDIR) $(OBJECT_BPATH);fi
	@if [ ! -d $(USER_BPATH) ];then $(MKDIR) $(USER_BPATH);fi
	@if [ ! -d $(HOST_BPATH) ];then $(MKDIR) $(HOST_BPATH);fi
	@if [ ! -d $(GFX1_BPATH) ];then $(MKDIR) $(GFX1_BPATH);fi
	@if [ ! -d $(GFX2_BPATH) ];then $(MKDIR) $(GFX2_BPATH);fi
	@if [ ! -d $(GFX2_FX_BPATH) ];then $(MKDIR) $(GFX2_FX_BPATH);fi
	@if [ ! -d $(GFXV_BPATH) ];then $(MKDIR) $(GFXV_BPATH);fi
	@if [ ! -d $(BOTLIB_BPATH) ];then $(MKDIR) $(BOTLIB_BPATH);fi
	
#@if [ ! -d $(JPG_BPATH) ];then $(MKDIR) $(JPG_BPATH);fi

#############################################################################
# [DEDICATED] HOST & USER OBJECTS:
#############################################################################

HOST_CODE := $(wildcard $(HOST_PATH)/*.c)
OBJ = $(patsubst $(HOST_PATH)/%.c, $(USER_BPATH)/%.o, $(HOST_CODE))
HOST_OBJ = $(patsubst $(HOST_PATH)/%.c, $(HOST_BPATH)/%.o, $(HOST_CODE))

COMMON_CODE := $(wildcard $(COMMON_PATH)/*.c)
OBJ += $(patsubst $(COMMON_PATH)/%.c, $(USER_BPATH)/%.o, $(COMMON_CODE))
HOST_OBJ += $(patsubst $(COMMON_PATH)/%.c, $(HOST_BPATH)/%.o, $(COMMON_CODE))

MATH_CODE := $(wildcard $(MATH_PATH)/*.c)
OBJ += $(patsubst $(MATH_PATH)/%.c, $(USER_BPATH)/%.o, $(MATH_CODE))
HOST_OBJ += $(patsubst $(MATH_PATH)/%.c, $(HOST_BPATH)/%.o, $(MATH_CODE))

BOTLIB_CODE := $(wildcard $(BOTLIB_PATH)/*.c)
OBJ += $(patsubst $(BOTLIB_PATH)/%.c, $(BOTLIB_BPATH)/%.o, $(BOTLIB_CODE))
HOST_OBJ += $(patsubst $(BOTLIB_PATH)/%.c, $(HOST_BPATH)/%.o, $(BOTLIB_CODE))

#----------------------------------------------------------

ifeq ($(VM_ON),1)
  ifeq ($(CPU),x86)
    VM_X86_CODE := $(wildcard $(VM_X86_PATH)/*.c)
    OBJ += $(patsubst $(VM_X86_PATH)/%.c, $(USER_BPATH)/%.o, $(VM_X86_CODE))
    HOST_OBJ += $(patsubst $(VM_X86_PATH)/%.c, $(HOST_BPATH)/%.o, $(VM_X86_CODE))
  endif
  ifeq ($(CPU),x86_64)
    VM_X86_64_CODE := $(wildcard $(VM_X86_64_PATH)/*.c)
    OBJ += $(patsubst $(VM_X86_64_PATH)/%.c, $(USER_BPATH)/%.o, $(VM_X86_64_CODE))
    HOST_OBJ += $(patsubst $(VM_X86_64_PATH)/%.c, $(HOST_BPATH)/%.o, $(VM_X86_64_CODE))
  endif
  ifeq ($(CPU),arm)
    VM_ARM_CODE := $(wildcard $(VM_ARM_PATH)/*.c)
    OBJ += $(patsubst $(VM_ARM_PATH)/%.c, $(USER_BPATH)/%.o, $(VM_ARM_CODE))
    HOST_OBJ += $(patsubst $(VM_ARM_PATH)/%.c, $(HOST_BPATH)/%.o, $(VM_ARM_CODE))
  endif
  ifeq ($(CPU),aarch64)
    VM_AARCH64_CODE := $(wildcard $(VM_AARCH64_PATH)/*.c)
    OBJ += $(patsubst $(VM_AARCH64_PATH)/%.c, $(USER_BPATH)/%.o, $(VM_AARCH64_CODE))
    HOST_OBJ += $(patsubst $(VM_AARCH64_PATH)/%.c, $(HOST_BPATH)/%.o, $(VM_AARCH64_CODE))
  endif
endif # =VM_ON

#==========================================================
ifdef MINGW # (Windows):
#==========================================================

  WIN32_MAIN_CODE := $(wildcard $(WIN32_PATH)/*.c)
  OBJ += $(patsubst $(WIN32_PATH)/%.c, $(USER_BPATH)/%.o, $(WIN32_MAIN_CODE))
  HOST_OBJ += $(patsubst $(WIN32_PATH)/%.c, $(HOST_BPATH)/%.o, $(WIN32_MAIN_CODE))

  # END HOST_OBJ:

#----------------------------------------------------------

  WIN32_SDL_ON_CODE := $(wildcard $(WIN32_SDL_ON_PATH)/*.c)
  OBJ += $(patsubst $(WIN32_SDL_ON_PATH)/%.c, $(USER_BPATH)/%.o, $(WIN32_SDL_ON_CODE))

#----------------------------------------------------------

  ifeq ($(SDL_ON_Make),0)
    WIN32_SDL_OFF_CODE := $(wildcard $(WIN32_SDL_OFF_PATH)/*.c)
    OBJ += $(patsubst $(WIN32_SDL_OFF_PATH)/%.c, $(USER_BPATH)/%.o, $(WIN32_SDL_OFF_CODE))
   ifeq ($(VULKAN_API_ON_Make),1)
      WIN32_VK_ON_CODE := $(wildcard $(WIN32_VK_ON_PATH)/*.c)
      OBJ += $(patsubst $(WIN32_VK_ON_PATH)/%.c, $(USER_BPATH)/%.o, $(WIN32_VK_ON_CODE))
   endif # =VULKAN_API_ON_Make
  endif # !SDL_ON_Make

#==========================================================
else # !MINGW (UNIX):
#==========================================================
  
  UNIX_MAIN_CODE := $(wildcard $(UNIX_PATH)/*.c)
  OBJ += $(patsubst $(UNIX_PATH)/%.c, $(USER_BPATH)/%.o, $(UNIX_MAIN_CODE))
  HOST_OBJ += $(patsubst $(UNIX_PATH)/%.c, $(HOST_BPATH)/%.o, $(UNIX_MAIN_CODE))

  # END HOST_OBJ:

#----------------------------------------------------------

  ifeq ($(SDL_ON_Make),1)
    SDL_ON_CODE := $(wildcard $(SDL_PATH)/*.c)
    OBJ += $(patsubst $(SDL_PATH)/%.c, $(USER_BPATH)/%.o, $(SDL_ON_CODE))
  else # !SDL_ON_Make:
    UNIX_SDL_OFF_CODE := $(wildcard $(UNIX_SDL_OFF_PATH)/*.c)
    OBJ += $(patsubst $(UNIX_SDL_OFF_PATH)/%.c, $(USER_BPATH)/%.o, $(UNIX_SDL_OFF_CODE))
  ifeq ($(VULKAN_API_ON_Make),1)
    UNIX_VULKAN_ON_CODE := $(wildcard $(UNIX_VK_ON_PATH)/*.c)
    OBJ += $(patsubst $(UNIX_VK_ON_PATH)/%.c, $(USER_BPATH)/%.o, $(UNIX_VULKAN_ON_CODE))
  endif

endif # !SDL_ON_Make
endif # !MINGW

#----------------------------------------------------------

ifeq ($(USER_ON),1)

USER_CODE := $(wildcard $(USER_PATH)/*.c)
OBJ += $(patsubst $(USER_PATH)/%.c, $(USER_BPATH)/%.o, $(USER_CODE))

MATH_GFX_CODE := $(wildcard $(MATH_GFX_PATH)/*.c)
OBJ += $(patsubst $(MATH_GFX_PATH)/%.c, $(USER_BPATH)/%.o, $(MATH_GFX_CODE))

#----------------------------------------------------------

ifeq ($(CPU),x86)
  ifndef MINGW
    ASM_X86_CODE := $(wildcard $(ASM_X86_PATH)/*.s)
    OBJ += $(patsubst $(ASM_X86_PATH)/%.c, $(USER_BPATH)/%.o, $(ASM_X86_CODE))
  endif
endif

#----------------------------------------------------------

ifeq ($(CURL_ON_Make),1)
  APP_CURL_CODE := $(wildcard $(APP_CURL_PATH)/*.c)
  OBJ += $(patsubst $(APP_CURL_PATH)/%.c, $(USER_BPATH)/%.o, $(APP_CURL_CODE))
endif

#----------------------------------------------------------

ifeq ($(APP_JPG_ON_Make),0)
  JPG_CODE := $(wildcard $(JPG_PATH)/*.c)
  OBJ += $(patsubst $(JPG_PATH)/%.c, $(USER_BPATH)/%.o, $(JPG_CODE))
endif

#----------------------------------------------------------

GFXER_COMMON_CODE := $(wildcard $(GFXER_COMMON_PATH)/*.c)
GFXER_FONT_CODE := $(wildcard $(GFXER_FONT_PATH)/*.c)

GFXER_VULKAN_CODE := $(wildcard $(GFXERV_PATH)/*.c)
GFX_V_OBJ = $(patsubst $(GFXER_COMMON_PATH)/%.c, $(GFXV_BPATH)/%.o, $(GFXER_COMMON_CODE))
GFX_V_OBJ += $(patsubst $(GFXERV_PATH)/%.c, $(GFXV_BPATH)/%.o, $(GFXER_VULKAN_CODE))

GFXER2_CODE := $(wildcard $(GFXER2_PATH)/*.c)
GFX_2_OBJ = $(patsubst $(GFXER_COMMON_PATH)/%.c, $(GFX2_BPATH)/%.o, $(GFXER_COMMON_CODE))
GFX_2_OBJ += $(patsubst $(GFXER_FONT_PATH)/%.c, $(GFX2_BPATH)/%.o, $(GFXER_FONT_CODE))
GFX_2_OBJ += $(patsubst $(GFXER2_PATH)/%.c, $(GFX2_BPATH)/%.o, $(GFXER2_CODE))

GFXER2_FX_CODE := $(wildcard $(GFXER2_FX_PATH)/*.glsl)
GFX_2_FX_OBJ = $(patsubst $(GFXER2_FX_PATH)/%.glsl, $(GFX2_FX_BPATH)/%.o, $(GFXER2_FX_CODE))

GFXER1_CODE := $(wildcard $(GFXER1_PATH)/*.c)
GFX_1_OBJ = $(patsubst $(GFXER_COMMON_PATH)/%.c, $(GFX1_BPATH)/%.o, $(GFXER_COMMON_CODE))
GFX_1_OBJ += $(patsubst $(GFXER_FONT_PATH)/%.c, $(GFX1_BPATH)/%.o, $(GFXER_FONT_CODE))
GFX_1_OBJ += $(patsubst $(GFXER1_PATH)/%.c, $(GFX1_BPATH)/%.o, $(GFXER1_CODE))

#----------------------------------------------------------

ifeq ($(GFXER_DLLS_ON_Make),1)

  ifeq ($(VULKAN_ON_Make),1)
    GFX_V_OBJ += $(patsubst $(MATH_PATH)/%.c, $(GFXV_BPATH)/%.o, $(MATH_CODE))
    GFX_V_OBJ += $(patsubst $(MATH_GFX_PATH)/%.c, $(GFXV_BPATH)/%.o, $(MATH_GFX_CODE))
  endif

  ifeq ($(OPENGL2_ON),1)
    GFX_2_OBJ += $(patsubst $(MATH_PATH)/%.c, $(GFX2_BPATH)/%.o, $(MATH_CODE))
    GFX_2_OBJ += $(patsubst $(MATH_GFX_PATH)/%.c, $(GFX2_BPATH)/%.o, $(MATH_GFX_CODE))
  endif

  ifeq ($(OPENGL1_ON),1)
    GFX_1_OBJ += $(patsubst $(MATH_PATH)/%.c, $(GFX1_BPATH)/%.o, $(MATH_CODE))
    GFX_1_OBJ += $(patsubst $(MATH_GFX_PATH)/%.c, $(GFX1_BPATH)/%.o, $(MATH_GFX_CODE))
  endif

endif # =GFXER_DLLS_ON_Make

#----------------------------------------------------------

ifeq ($(GFXER_DLLS_ON_Make),0)
  ifeq ($(VULKAN_ON_Make),1)
    OBJ += $(GFX_V_OBJ)
  else
    ifeq ($(OPENGL2_ON),1)
      OBJ += $(GFX_2_OBJ)
      OBJ += $(GFX_2_FX_OBJ)
    else
      OBJ += $(GFX_1_OBJ)
    endif
  endif
endif

#==========================================================
# User binary:
#==========================================================

$(B)/$(TARGET_USER): $(OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(OBJ) $(USER_LDFLAGS) \
		$(LDFLAGS)

#===========================================================
# Modular gfxers:
#===========================================================

$(B)/$(TARGET_GFXER_VULKAN): $(GFX_V_OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(GFX_V_OBJ) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

$(STRINGIFY): $(wildcard $(GFXER2_STRING_PATH)/*.c)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(wildcard $(GFXER2_STRING_PATH)/*.c) $(LDFLAGS)

$(B)/$(TARGET_GFXER2): $(GFX_2_OBJ) $(GFX_2_FX_OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(GFX_2_OBJ) $(GFX_2_FX_OBJ) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

$(B)/$(TARGET_GFXER1): $(GFX_1_OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(GFX_1_OBJ) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

endif # =USER_ON

#==========================================================
# Host binary (dedicated):
#==========================================================

$(B)/$(TARGET_HOST): $(HOST_OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(HOST_OBJ) $(LDFLAGS)

#############################################################################
# TOOLS:
#############################################################################

install: release
	@echo "'install' = compile 'release' or 'debug' target ('release' by default):"
	@for i in $(TARGETS); do 
		if [ -f $(BUILD_RELEASE)$$i ]; then 
			$(INSTALL) -D -m 0755 "$(BUILD_RELEASE)/$$i" "$(APP_PATH)$$i";
			$(STRIP) "$(APP_PATH)$$i"; 
		fi 
	done

#==========================================================

clean: clean-object
	@echo "'clean' = remove all TARGETS in project:"
	@rm -rf $(BUILD_RELEASE)/$(TARGET_HOST)
	@rm -rf $(BUILD_RELEASE)/$(TARGET_USER)
	@rm -rf $(BUILD_RELEASE)/$(TARGET_GFXER_VULKAN)
	@rm -rf $(BUILD_RELEASE)/$(TARGET_GFXER2)
	@rm -rf $(BUILD_RELEASE)/$(TARGET_GFXER1)
	@rm -rf $(BUILD_RELEASE)$(OBJECT_SUFFIX)/$(GFX2_BPATH_NAME)/stringify$(BIN_EXT)
	@rm -rf $(BUILD_DEBUG)/$(TARGET_HOST)
	@rm -rf $(BUILD_DEBUG)/$(TARGET_USER)
	@rm -rf $(BUILD_DEBUG)/$(TARGET_GFXER_VULKAN)
	@rm -rf $(BUILD_DEBUG)/$(TARGET_GFXER2)
	@rm -rf $(BUILD_DEBUG)/$(TARGET_GFXER1)
	@rm -rf $(BUILD_DEBUG)$(OBJECT_SUFFIX)/$(GFX2_BPATH_NAME)/stringify$(BIN_EXT)

#----------------------------------------------------------

clean-object:
	@echo "'clean-object' = remove all *.d & *.o in project:" 
	@rm -rf $(DEPENDS) $(ALL_OBJS)

#==========================================================

nuke: wipe-build clean-object

#==========================================================

wipe: wipe-debug wipe-release

#----------------------------------------------------------

wipe-object:
	@echo "'wipe-object' = remove all object folders:" 
	@rm -rf $(BUILD_PATH)/$(DEBUG_BPATH_NAME)$(OBJECT_SUFFIX)
	@rm -rf $(BUILD_PATH)/$(RELEASE_BPATH_NAME)$(OBJECT_SUFFIX)

#----------------------------------------------------------

wipe-debug:
	@echo "'wipe-debug' = remove debug folder & debug object folder:" 
	@rm -rf $(BUILD_DEBUG)
	@rm -rf $(BUILD_PATH)/$(DEBUG_BPATH_NAME)$(OBJECT_SUFFIX)

#----------------------------------------------------------

wipe-release:
	@echo "'wipe-release' = remove release folder & release object folder:" 
	@rm -rf $(BUILD_RELEASE)
	@rm -rf $(BUILD_PATH)/$(RELEASE_BPATH_NAME)$(OBJECT_SUFFIX)

#----------------------------------------------------------

wipe-build: 
	@echo "'wipe-build' = remove build folder:" 
	@rm -rf $(BUILD_PATH)

#############################################################################
# DEPENDS (DEPENDENCIES):
#############################################################################

DEPENDS = $(shell find . -name '*.d')
ALL_OBJS = $(shell find . -name '*.o')

#include $(DEPENDS)

ifneq ($(strip $(DEPENDS)),)
 include $(DEPENDS)
endif

#############################################################################

.PHONY: all clean clean-object debug default doFolders nuke release targets tools \
	wipe wipe-build wipe-debug wipe-release wipe-object 
