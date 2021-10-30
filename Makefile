#############################################################################
#
# GNU Make v0.3x+
#
#############################################################################

CLIENT_PATH_NAME        = client 
SERVER_PATH_NAME        = ded
RENDERER1_PATH_NAME     = rend1
RENDERER2_PATH_NAME     = rend2
RENDERERV_PATH_NAME     = rendv

CLIENT_NAME             = quake3e
SERVER_NAME             = $(CLIENT_NAME)_$(SERVER_PATH_NAME)

#----------------------------------------------------------
# ON or OFF (1 or 0):
#----------------------------------------------------------

CLIENT_ON               = 1
SERVER_ON               = 1

OPENGL1_ON              = 1
OPENGL2_ON              = 1

VULKAN_ON_Make          = 1
VULKAN_API_ON_Make      = 1
 
RENDERER_DLLS_ON_Make   = 1

SDL_ON_Make             = 1
CURL_ON_Make            = 1

HEADERS_ON_Make         = 0
APP_JPG_ON_Make         = 0
 
#----------------------------------------------------------

# (opengl, opengl2, or vulkan):
RENDERER_MAIN_Make = vulkan

RENDERER_NAME_Make  = $(CLIENT_NAME)

#----------------------------------------------------------

SET_PLATFORM = $(shell uname | sed -e 's/_.*//' | tr '[:upper:]' '[:lower:]' | sed -e 's/\//_/g')
SET_CPU   = $(shell uname -m | sed -e 's/i.86/x86/' | sed -e 's/^arm.*/arm/')

ifeq ($(shell uname -m),arm64)
  SET_CPU   = aarch64
endif

ifeq ($(SET_PLATFORM),mingw32)
  ifeq ($(SET_CPU),i386)
    SET_CPU = x86
  endif
endif

#----------------------------------------------------------

ifeq ($(V),1)
echo_cmd=@:
Q=
else
echo_cmd=@echo
Q=@
endif

#############################################################################
# Include "Makefile.x" to edit below & keep Makefile as a template:
#############################################################################

-include Makefile.000

#----------------------------------------------------------

ifeq ($(SET_PLATFORM),darwin)
  SDL_ON_Make=1
endif

ifeq ($(SET_PLATFORM),cygwin)
  PLATFORM=mingw32
endif

ifndef PLATFORM
PLATFORM=$(SET_PLATFORM)
endif
export PLATFORM

ifeq ($(PLATFORM),mingw32)
  MINGW=1
endif
ifeq ($(PLATFORM),mingw64)
  MINGW=1
endif

#----------------------------------------------------------

ifeq ($(SET_CPU),i86pc)
  SET_CPU=x86
endif

ifeq ($(SET_CPU),amd64)
  SET_CPU=x86_64
endif
ifeq ($(SET_CPU),x64)
  SET_CPU=x86_64
endif

ifndef CPU
CPU=$(SET_CPU)
endif
export CPU

#----------------------------------------------------------

ifneq ($(PLATFORM),$(SET_PLATFORM))
  CROSS_COMPILE=1
else
  CROSS_COMPILE=0

  ifneq ($(CPU),$(SET_CPU))
    CROSS_COMPILE=1
  endif
endif
export CROSS_COMPILE

#----------------------------------------------------------

ifndef APP_PATH
APP_PATH=/usr/local/games/$(CLIENT_NAME)
endif

ifndef MOUNT_PATH
MOUNT_PATH=code
endif

ifndef BUILD_PATH
BUILD_PATH=build
endif

#----------------------------------------------------------

ifndef DEPENDENCIES_ON
DEPENDENCIES_ON=1
endif

ifndef CCACHE_ON
CCACHE_ON=0
endif
export CCACHE_ON

ifndef HEADERS_ON_Make
HEADERS_ON_Make=1
endif

ifndef CURL_ON_Make
CURL_ON_Make=1
endif

ifndef CURL_DLL_ON_Make
  ifdef MINGW
    CURL_DLL_ON_Make=0
  else
    CURL_DLL_ON_Make=1
  endif
endif

#----------------------------------------------------------

ifeq ($(RENDERER_DLLS_ON_Make),0)
  ifeq ($(RENDERER_MAIN_Make),opengl)
    OPENGL1_ON=1
    OPENGL2_ON=0
    VULKAN_ON_Make=0
    VULKAN_API_ON_Make=0
  endif
  ifeq ($(RENDERER_MAIN_Make),opengl2)
    OPENGL1_ON=0
    OPENGL2_ON=1
    VULKAN_ON_Make=0
    VULKAN_API_ON_Make=0
  endif
  ifeq ($(RENDERER_MAIN_Make),vulkan)
    OPENGL1_ON=0
    OPENGL2_ON=0
    VULKAN_ON_Make=1
  endif
endif

ifneq ($(VULKAN_ON_Make),0)
  VULKAN_API_ON_Make=1
endif

#############################################################################

BUILD_DEBUG=$(BUILD_PATH)/debug-$(PLATFORM)-$(CPU)
BUILD_RELEASE=$(BUILD_PATH)/release-$(PLATFORM)-$(CPU)

ASM_PATH=$(MOUNT_PATH)/asm
CLIENT_PATH=$(MOUNT_PATH)/client
SERVER_PATH=$(MOUNT_PATH)/server
RENDERER_COMMON_PATH=$(MOUNT_PATH)/renderercommon
RENDERER1_PATH=$(MOUNT_PATH)/renderer
RENDERER2_PATH=$(MOUNT_PATH)/renderer2
RENDERERV_PATH=$(MOUNT_PATH)/renderervk
SDL_PATH=$(MOUNT_PATH)/sdl

COMMON_PATH=$(MOUNT_PATH)/qcommon
UNIX_PATH=$(MOUNT_PATH)/unix
WIN32_PATH=$(MOUNT_PATH)/win32
BOTLIB_PATH=$(MOUNT_PATH)/botlib
UI_PATH=$(MOUNT_PATH)/ui
JPG_PATH=$(MOUNT_PATH)/libjpeg

BIN_PATH=$(shell which $(1) 2> /dev/null)

#----------------------------------------------------------

STRIP ?= strip
PKG_CONFIG ?= pkg-config
INSTALL=install
MKDIR=mkdir

#----------------------------------------------------------

ifneq ($(call BIN_PATH, $(PKG_CONFIG)),)
  SDL_INCLUDE ?= $(shell $(PKG_CONFIG) --silence-errors --cflags-only-I sdl2)
  SDL_LIBS ?= $(shell $(PKG_CONFIG) --silence-errors --libs sdl2)
  X11_INCLUDE ?= $(shell $(PKG_CONFIG) --silence-errors --cflags-only-I x11)
  X11_LIBS ?= $(shell $(PKG_CONFIG) --silence-errors --libs x11)
endif

#Defaults for SDL/X11?
ifeq ($(X11_INCLUDE),)
X11_INCLUDE = -I/usr/X11R6/include
endif
ifeq ($(X11_LIBS),)
X11_LIBS = -lX11
endif
ifeq ($(SDL_LIBS),)
SDL_LIBS = -lSDL2
endif

VERSION=$(shell grep "\#define APP_VERSION" $(COMMON_PATH)/q_shared.h | \
  sed -e 's/.*".* \([^ ]*\)"/\1/')

#----------------------------------------------------------

#Common VM definition:
ifeq ($(CPU),x86_64)
  VM_ON = true
else
ifeq ($(CPU),x86)
  VM_ON = true
else
  VM_ON = false
endif
endif

ifeq ($(CPU),arm)
  VM_ON = true
endif
ifeq ($(CPU),aarch64)
  VM_ON = true
endif

#----------------------------------------------------------

BASE_CFLAGS =

ifeq ($(APP_JPG_ON_Make),1)
  BASE_CFLAGS += -DAPP_JPG_ON_Make
endif

ifneq ($(VM_ON),true)
  BASE_CFLAGS += -DVM_OFF_CFlags
endif

ifneq ($(RENDERER_DLLS_ON_Make),0)
  BASE_CFLAGS += -DRENDERER_DLLS_ON_Make
  BASE_CFLAGS += -DRENDERER_NAME_Make=\\\"$(RENDERER_NAME_Make)\\\"
  BASE_CFLAGS += -DRENDERER_MAIN_Make="$(RENDERER_MAIN_Make)"
endif

ifdef MAIN_PATH
  BASE_CFLAGS += -DMAIN_PATH=\\\"$(MAIN_PATH)\\\"
endif

ifeq ($(HEADERS_ON_Make),1)
  BASE_CFLAGS += -DHEADERS_ON_Make=1
endif

ifeq ($(CURL_ON_Make),1)
  BASE_CFLAGS += -DCURL_ON_Make
  ifeq ($(CURL_DLL_ON_Make),1)
    BASE_CFLAGS += -DCURL_DLL_ON_Make
  else
    ifeq ($(MINGW),1)
      BASE_CFLAGS += -DCURL_EXE
    endif
  endif
endif

ifeq ($(VULKAN_API_ON_Make),1)
  BASE_CFLAGS += -DVULKAN_API_ON_Make
endif

ifeq ($(DEPENDENCIES_ON),1)
  BASE_CFLAGS += -MMD
endif

#----------------------------------------------------------

CPU_EXT=

CLIENT_EXTRA_FILES=


#############################################################################
# BUILD MINGW32 (Windows):
#############################################################################

ifdef MINGW

  ifeq ($(CROSS_COMPILE),1)
    # If CC is already set to something generic, we probably want to use
    # something more specific
    ifneq ($(findstring $(strip $(CC)),cc gcc),)
      CC=
    endif

    # We need to figure out the correct gcc & windres
    ifeq ($(CPU),x86_64)
      MINGW_PREFIXES=x86_64-w64-mingw32 amd64-mingw32msvc
      STRIP=x86_64-w64-mingw32-strip
    endif
    ifeq ($(CPU),x86)
      MINGW_PREFIXES=i686-w64-mingw32 i586-mingw32msvc i686-pc-mingw32
    endif

    ifndef CC
      CC=$(firstword $(strip $(foreach MINGW_PREFIX, $(MINGW_PREFIXES), \
         $(call BIN_PATH, $(MINGW_PREFIX)-gcc))))
    endif

    #STRIP=$(MINGW_PREFIX)-strip -g

    ifndef WINDRES
      WINDRES=$(firstword $(strip $(foreach MINGW_PREFIX, $(MINGW_PREFIXES), \
         $(call BIN_PATH, $(MINGW_PREFIX)-windres))))
    endif
  else
    #If MinGW doesn't use CC (not cc) use gcc:
    ifeq ($(call BIN_PATH, $(CC)),)
      CC=gcc
    endif

  endif

#----------------------------------------------------------

  # Use generic Windres if unfound:
  ifeq ($(WINDRES),)
    WINDRES=windres
  endif

  ifeq ($(CC),)
    $(error Cannot find a suitable cross compiler for $(PLATFORM))
  endif

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

  CLIENT_LDFLAGS=$(LDFLAGS)

#----------------------------------------------------------

  ifeq ($(SDL_ON_Make),1)
    BASE_CFLAGS += -DHEADERS_ON_Make=1 -I$(MOUNT_PATH)/libsdl/windows/include/SDL2
    #CLIENT_CFLAGS += -DHEADERS_ON_Make=1
    ifeq ($(CPU),x86)
      CLIENT_LDFLAGS += -L$(MOUNT_PATH)/libsdl/windows/mingw/lib32
      CLIENT_LDFLAGS += -lSDL2
      CLIENT_EXTRA_FILES += $(MOUNT_PATH)/libsdl/windows/mingw/lib32/SDL2.dll
    else
      CLIENT_LDFLAGS += -L$(MOUNT_PATH)/libsdl/windows/mingw/lib64
      CLIENT_LDFLAGS += -lSDL264
      CLIENT_EXTRA_FILES += $(MOUNT_PATH)/libsdl/windows/mingw/lib64/SDL264.dll
    endif
  endif

  ifeq ($(CURL_ON_Make),1)
    BASE_CFLAGS += -I$(MOUNT_PATH)/libcurl/windows/include
    ifeq ($(CPU),x86)
      CLIENT_LDFLAGS += -L$(MOUNT_PATH)/libcurl/windows/mingw/lib32
    else
      CLIENT_LDFLAGS += -L$(MOUNT_PATH)/libcurl/windows/mingw/lib64
    endif
    CLIENT_LDFLAGS += -lcurl -lwldap32 -lcrypt32
  endif

#----------------------------------------------------------

  DEBUG_CFLAGS = $(BASE_CFLAGS) -DDEBUG -D_DEBUG -g -O0
  RELEASE_CFLAGS = $(BASE_CFLAGS) -DNDEBUG $(OPTIMIZE)

#----------------------------------------------------------

else # !MINGW:

ifeq ($(SET_PLATFORM),darwin)

#############################################################################
# BUILD MAC:
#############################################################################

  BASE_CFLAGS += -Wall -Wimplicit -Wstrict-prototypes -pipe
  BASE_CFLAGS += -Wno-unused-result

  OPTIMIZE = -O2 -fvisibility=hidden

  SHARED_LIB_EXT = dylib
  SHARED_LIB_CFLAGS = -fPIC -fvisibility=hidden
  SHARED_LIB_LDFLAGS = -dynamiclib $(LDFLAGS)

  LDFLAGS =

#----------------------------------------------------------

  ifneq ($(SDL_INCLUDE),)
    BASE_CFLAGS += $(SDL_INCLUDE)
    CLIENT_LDFLAGS = $(SDL_LIBS)
  else
    BASE_CFLAGS += -I/Library/Frameworks/SDL2.framework/Headers
    CLIENT_LDFLAGS = -F/Library/Frameworks -framework SDL2
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
  endif

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
    BASE_CFLAGS += $(SDL_INCLUDE)
    CLIENT_LDFLAGS = $(SDL_LIBS)
  else
    BASE_CFLAGS += $(X11_INCLUDE)
    CLIENT_LDFLAGS = $(X11_LIBS)
  endif

  ifeq ($(APP_JPG_ON_Make),1)
    CLIENT_LDFLAGS += -ljpeg
  endif

  ifeq ($(CURL_ON_Make),1)
    ifeq ($(CURL_DLL_ON_Make),0)
      CLIENT_LDFLAGS += -lcurl
    endif
  endif

#----------------------------------------------------------

  ifeq ($(PLATFORM),linux)
    LDFLAGS += -ldl -Wl,--hash-style=both
    ifeq ($(CPU),x86)
      # linux32 make:
      BASE_CFLAGS += -m32
      LDFLAGS += -m32
    endif
  endif

#----------------------------------------------------------

  DEBUG_CFLAGS = $(BASE_CFLAGS) -DDEBUG -D_DEBUG -g -O0
  RELEASE_CFLAGS = $(BASE_CFLAGS) -DNDEBUG $(OPTIMIZE)

  DEBUG_LDFLAGS = -rdynamic

#----------------------------------------------------------

endif # *NIX platforms

endif # !MINGW

#----------------------------------------------------------

TARGET_CLIENT = $(CLIENT_NAME)$(CPU_EXT)$(BIN_EXT)

TARGET_RENDERER1 = $(RENDERER_NAME_Make)_opengl_$(SHARED_LIB_NAME)
TARGET_RENDERER2 = $(RENDERER_NAME_Make)_opengl2_$(SHARED_LIB_NAME)
TARGET_RENDERER_VULKAN = $(RENDERER_NAME_Make)_vulkan_$(SHARED_LIB_NAME)

TARGET_SERVER = $(SERVER_NAME)$(CPU_EXT)$(BIN_EXT)

STRINGIFY = $(B)/rend2/stringify$(BIN_EXT)

TARGETS =

#----------------------------------------------------------

ifneq ($(SERVER_ON),0)
  TARGETS += $(B)/$(TARGET_SERVER)
endif

ifneq ($(CLIENT_ON),0)
  TARGETS += $(B)/$(TARGET_CLIENT)
  ifneq ($(RENDERER_DLLS_ON_Make),0)
    ifeq ($(OPENGL1_ON),1)
      TARGETS += $(B)/$(TARGET_RENDERER1)
    endif
    ifeq ($(OPENGL2_ON),1)
      TARGETS += $(B)/$(TARGET_RENDERER2)
    endif
    ifeq ($(VULKAN_ON_Make),1)
      TARGETS += $(B)/$(TARGET_RENDERER_VULKAN)
    endif
  endif
endif

ifeq ($(CCACHE_ON),1)
  CC := ccache $(CC)
endif

ifneq ($(RENDERER_DLLS_ON_Make),0)
    RENDERER_CFLAGS=$(SHARED_LIB_CFLAGS)
else
    RENDERER_CFLAGS=$(UNSHARED_LIB_CFLAGS)
endif

#----------------------------------------------------------

define DO_CC
$(echo_cmd) "CC $<"
$(Q)$(CC) $(UNSHARED_LIB_CFLAGS) $(CFLAGS) -o $@ -c $<
endef

define DO_RENDERER_CC
$(echo_cmd) "RENDERER_CC $<"
$(Q)$(CC) $(RENDERER_CFLAGS) $(CFLAGS) -o $@ -c $<
endef

define DO_REF_STR
$(echo_cmd) "REF_STR $<"
$(Q)rm -f $@
$(Q)$(STRINGIFY) $< $@
endef

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

define DO_DED_CC
$(echo_cmd) "DED_CC $<"
$(Q)$(CC) $(UNSHARED_LIB_CFLAGS) -DDEDICATED $(CFLAGS) -o $@ -c $<
endef

define DO_WINDRES
$(echo_cmd) "WINDRES $<"
$(Q)$(WINDRES) -i $< -o $@
endef

#----------------------------------------------------------

ifndef SHARED_LIB_NAME
  SHARED_LIB_NAME=$(CPU).$(SHARED_LIB_EXT)
endif

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

#Create rules for copying files into the base build path (useful for bundling):
define GENERATE_COPY_TARGETS
$(foreach FILE,$1, \
  $(eval $(call ADD_COPY_TARGET, \
    $(FILE), \
    $(addprefix $(B)/,$(notdir $(FILE))))))
endef

#----------------------------------------------------------

ifneq ($(CLIENT_ON),0)
  $(call GENERATE_COPY_TARGETS,$(CLIENT_EXTRA_FILES))
endif

#----------------------------------------------------------

#Create Build folders & tools, then build:
targets: doFolders tools
	@echo ""
	@echo "Building $(CLIENT_NAME) in $(B):"
	@echo ""
	@echo "  VERSION: $(VERSION)"
	@echo "  PLATFORM: $(PLATFORM)"
	@echo "  CPU: $(CPU)"
	@echo "  SET_PLATFORM: $(SET_PLATFORM)"
	@echo "  SET_CPU: $(SET_CPU)"
ifdef MINGW
	@echo "  WINDRES: $(WINDRES)"
endif
	@echo "  CC: $(CC)"
	@echo ""
	@echo "  CFLAGS:"
	@for i in $(CFLAGS); \
	do \
		echo "    $$i"; \
	done
	@echo ""
	@echo "  Output:"
	@for i in $(TARGETS); \
	do \
		echo "    $$i"; \
	done
	@echo ""
ifneq ($(TARGETS),)
	@$(MAKE) $(TARGETS) V=$(V)
endif

#----------------------------------------------------------

#Create folders from paths:
doFolders:
	@if [ ! -d $(BUILD_PATH) ];then $(MKDIR) $(BUILD_PATH);fi
	@if [ ! -d $(B) ];then $(MKDIR) $(B);fi
	@if [ ! -d $(B)/client ];then $(MKDIR) $(B)/client;fi
	@if [ ! -d $(B)/rend1 ];then $(MKDIR) $(B)/rend1;fi
	@if [ ! -d $(B)/rend2 ];then $(MKDIR) $(B)/rend2;fi
	@if [ ! -d $(B)/rend2/glsl ];then $(MKDIR) $(B)/rend2/glsl;fi
	@if [ ! -d $(B)/rendv ];then $(MKDIR) $(B)/rendv;fi
	@if [ ! -d $(B)/$(SERVER_PATH_NAME) ];then $(MKDIR) $(B)/$(SERVER_PATH_NAME);fi
	@if [ ! -d $(B)/botlib ];then $(MKDIR) $(B)/botlib;fi

#	@if [ ! -d $(B)/libjpeg ];then $(MKDIR) $(B)/libjpeg;fi

#############################################################################
# CLIENT/SERVER:
#############################################################################
#CODE_HEADER = $(wildcard include/*.h)
CODE_HEADER =

#RENDERER1_OBJS = $(wildcard $(RENDERER1_PATH)/*.c)

RENDERER1_OBJS = \
  $(B)/rend1/tr_animation.o \
  $(B)/rend1/tr_arb.o \
  $(B)/rend1/tr_backend.o \
  $(B)/rend1/tr_bsp.o \
  $(B)/rend1/tr_cmds.o \
  $(B)/rend1/tr_curve.o \
  $(B)/rend1/tr_flares.o \
  $(B)/rend1/tr_font.o \
  $(B)/rend1/tr_image.o \
  $(B)/rend1/tr_image_png.o \
  $(B)/rend1/tr_image_jpg.o \
  $(B)/rend1/tr_image_bmp.o \
  $(B)/rend1/tr_image_tga.o \
  $(B)/rend1/tr_image_pcx.o \
  $(B)/rend1/tr_init.o \
  $(B)/rend1/tr_light.o \
  $(B)/rend1/tr_main.o \
  $(B)/rend1/tr_marks.o \
  $(B)/rend1/tr_mesh.o \
  $(B)/rend1/tr_model.o \
  $(B)/rend1/tr_model_iqm.o \
  $(B)/rend1/tr_noise.o \
  $(B)/rend1/tr_scene.o \
  $(B)/rend1/tr_shade.o \
  $(B)/rend1/tr_shade_calc.o \
  $(B)/rend1/tr_shader.o \
  $(B)/rend1/tr_shadows.o \
  $(B)/rend1/tr_sky.o \
  $(B)/rend1/tr_surface.o \
  $(B)/rend1/tr_vbo.o \
  $(B)/rend1/tr_world.o

ifneq ($(RENDERER_DLLS_ON_Make), 0)
  RENDERER1_OBJS += \
    $(B)/rend1/q_shared.o \
    $(B)/rend1/puff.o \
    $(B)/rend1/q_math.o
endif

#----------------------------------------------------------

RENDERER2_OBJS = $(wildcard $(RENDERER2_PATH)/*.c)

ifneq ($(RENDERER_DLLS_ON_Make), 0)
  RENDERER2_OBJS += \
    $(B)/rend2/q_shared.o \
    $(B)/rend2/puff.o \
    $(B)/rend2/q_math.o
endif

RENDERER2_FX_OBJS = $(B)/rend2/glsl/*.o


RENDERER_VULKAN_OBJS = $(wildcard $(RENDERERV_PATH)/*.c)

ifneq ($(RENDERER_DLLS_ON_Make), 0)
  RENDERER_VULKAN_OBJS += \
    $(B)/rendv/q_shared.o \
    $(B)/rendv/puff.o \
    $(B)/rendv/q_math.o
endif

JPG_OBJS = $(wildcard $(JPG_PATH)/*.c)

#OBJ := $(wildcard $(CLIENT_PATH)/*.c)

#COMMON_OBJS := $(wildcard $(COMMON_PATH)/*.c)
#BOT_OBJS := $(wildcard $(BOTLIB_PATH)/*.c)

#OBJ += $(wildcard $(COMMON_PATH)/*.c)
#OBJ += $(BOT_OBJS)

#client:
CLIENT_OBJS = $(wildcard $(CLIENT_PATH)/*.c)

OBJ = \
  $(B)/client/cl_cgame.o \
  $(B)/client/cl_cin.o \
  $(B)/client/cl_console.o \
  $(B)/client/cl_input.o \
  $(B)/client/cl_keys.o \
  $(B)/client/cl_main.o \
  $(B)/client/cl_net_chan.o \
  $(B)/client/cl_parse.o \
  $(B)/client/cl_scrn.o \
  $(B)/client/cl_ui.o \
  $(B)/client/cl_avi.o \
  $(B)/client/cl_jpeg.o \
  $(B)/client/snd_adpcm.o \
  $(B)/client/snd_dma.o \
  $(B)/client/snd_mem.o \
  $(B)/client/snd_mix.o \
  $(B)/client/snd_wavelet.o \
  $(B)/client/snd_main.o \
  $(B)/client/snd_codec.o \
  $(B)/client/snd_codec_wav.o  

#common:

#COMMON_OBJS += $(wildcard $(COMMON_PATH)/*.c)
#OBJ += $(COMMON_OBJS)

OBJ += \
  $(B)/client/cmd.o \
  $(B)/client/cm_load.o \
  $(B)/client/cm_patch.o \
  $(B)/client/cm_polylib.o \
  $(B)/client/cm_test.o \
  $(B)/client/cm_trace.o \
  $(B)/client/common.o \
  $(B)/client/cvar.o \
  $(B)/client/files.o \
  $(B)/client/history.o \
  $(B)/client/keys.o \
  $(B)/client/md4.o \
  $(B)/client/md5.o \
  $(B)/client/msg.o \
  $(B)/client/net_chan.o \
  $(B)/client/net_ip.o \
  $(B)/client/huffman.o \
  $(B)/client/huffman_static.o \
  $(B)/client/q_math.o \
  $(B)/client/q_shared.o \
  $(B)/client/unzip.o \
  $(B)/client/puff.o \
  $(B)/client/vm.o \
  $(B)/client/vm_interpreted.o 

#server:
SERVER_OBJS = $(wildcard $(SERVER_PATH)/*.c)
OBJ += $(SERVER_OBJS)

#botlib:
CODE_HEADER = $(wildcard $(BOTLIB_PATH)/*.h) $(wildcard $(COMMON_PATH)/*.h) 
#$(wildcard $(B)/client/*.h)

BOTLIB_CODE = $(wildcard $(BOTLIB_PATH)/*.c)
BOTLIB_OBJS = $(BOTLIB_CODE:%.c=%.o)


OBJ += $(BOTLIB_OBJS)

#----------------------------------------------------------

ifneq ($(APP_JPG_ON_Make),1)
  OBJ += $(JPG_OBJS)
endif

ifneq ($(RENDERER_DLLS_ON_Make),1)
  ifeq ($(VULKAN_ON_Make),1)
    OBJ += $(RENDERER_VULKAN_OBJS)
  else
    ifeq ($(OPENGL2_ON),1)
      OBJ += $(RENDERER2_OBJS)
      OBJ += $(RENDERER2_FX_OBJS)
    else
      OBJ += $(RENDERER1_OBJS)
    endif
  endif
endif

#----------------------------------------------------------

ifeq ($(CPU),x86)
ifndef MINGW
  OBJ += \
    $(B)/client/snd_mix_mmx.o \
    $(B)/client/snd_mix_sse.o
endif
endif

#----------------------------------------------------------

ifeq ($(VM_ON),true)
  ifeq ($(CPU),x86)
    OBJ += $(B)/client/vm_x86.o
  endif
  ifeq ($(CPU),x86_64)
    OBJ += $(B)/client/vm_x86.o
  endif
  ifeq ($(CPU),arm)
    OBJ += $(B)/client/vm_armv7l.o
  endif
  ifeq ($(CPU),aarch64)
    OBJ += $(B)/client/vm_aarch64.o
  endif
endif

#----------------------------------------------------------

ifeq ($(CURL_ON_Make),1)
  OBJ += $(B)/client/cl_curl.o
endif

ifdef MINGW

#----------------------------------------------------------

  OBJ += \
    $(B)/client/win_main.o \
    $(B)/client/win_shared.o \
    $(B)/client/win_syscon.o \
    $(B)/client/win_resource.o

ifeq ($(SDL_ON_Make),1)
    OBJ += \
        $(B)/client/sdl_glimp.o \
        $(B)/client/sdl_gamma.o \
        $(B)/client/sdl_input.o \
        $(B)/client/sdl_snd.o
else # !SDL_ON_Make
    OBJ += \
        $(B)/client/win_gamma.o \
        $(B)/client/win_glimp.o \
        $(B)/client/win_input.o \
        $(B)/client/win_minimize.o \
        $(B)/client/win_qgl.o \
        $(B)/client/win_snd.o \
        $(B)/client/win_wndproc.o
ifeq ($(VULKAN_API_ON_Make),1)
    OBJ += \
        $(B)/client/win_qvk.o
endif
endif # !SDL_ON_Make

else # !MINGW

#----------------------------------------------------------

  OBJ += \
    $(B)/client/unix_main.o \
    $(B)/client/unix_shared.o \
    $(B)/client/linux_signals.o

ifeq ($(SDL_ON_Make),1)
    OBJ += \
        $(B)/client/sdl_glimp.o \
        $(B)/client/sdl_gamma.o \
        $(B)/client/sdl_input.o \
        $(B)/client/sdl_snd.o
else # !SDL_ON_Make
    OBJ += \
        $(B)/client/linux_glimp.o \
        $(B)/client/linux_qgl.o \
        $(B)/client/linux_snd.o \
        $(B)/client/x11_dga.o \
        $(B)/client/x11_randr.o \
        $(B)/client/x11_vidmode.o
ifeq ($(VULKAN_API_ON_Make),1)
    OBJ += \
        $(B)/client/linux_qvk.o
endif

endif #!SDL_ON_Make

endif #!MINGW

#----------------------------------------------------------

# Client binary:

$(B)/$(TARGET_CLIENT): $(OBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(OBJ) $(CLIENT_LDFLAGS) \
		$(LDFLAGS)

#----------------------------------------------------------

# Modular renderers:

$(B)/$(TARGET_RENDERER1): $(RENDERER1_OBJS)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(RENDERER1_OBJS) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

$(STRINGIFY): $(MOUNT_PATH)/renderer2/stringify.c
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(MOUNT_PATH)/renderer2/stringify.c $(LDFLAGS)

$(B)/$(TARGET_RENDERER2): $(RENDERER2_OBJS) $(RENDERER2_FX_OBJS)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(RENDERER2_OBJS) $(RENDERER2_FX_OBJS) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

$(B)/$(TARGET_RENDERER_VULKAN): $(RENDERER_VULKAN_OBJS)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(RENDERER_VULKAN_OBJS) $(SHARED_LIB_CFLAGS) $(SHARED_LIB_LDFLAGS)

#############################################################################
# DEDICATED SERVER
#############################################################################

DOBJ = \
  $(B)/$(SERVER_PATH_NAME)/sv_bot.o \
  $(B)/$(SERVER_PATH_NAME)/sv_client.o \
  $(B)/$(SERVER_PATH_NAME)/sv_ccmds.o \
  $(B)/$(SERVER_PATH_NAME)/sv_filter.o \
  $(B)/$(SERVER_PATH_NAME)/sv_game.o \
  $(B)/$(SERVER_PATH_NAME)/sv_init.o \
  $(B)/$(SERVER_PATH_NAME)/sv_main.o \
  $(B)/$(SERVER_PATH_NAME)/sv_net_chan.o \
  $(B)/$(SERVER_PATH_NAME)/sv_snapshot.o \
  $(B)/$(SERVER_PATH_NAME)/sv_world.o \
  \
  $(B)/$(SERVER_PATH_NAME)/cm_load.o \
  $(B)/$(SERVER_PATH_NAME)/cm_patch.o \
  $(B)/$(SERVER_PATH_NAME)/cm_polylib.o \
  $(B)/$(SERVER_PATH_NAME)/cm_test.o \
  $(B)/$(SERVER_PATH_NAME)/cm_trace.o \
  $(B)/$(SERVER_PATH_NAME)/cmd.o \
  $(B)/$(SERVER_PATH_NAME)/common.o \
  $(B)/$(SERVER_PATH_NAME)/cvar.o \
  $(B)/$(SERVER_PATH_NAME)/files.o \
  $(B)/$(SERVER_PATH_NAME)/history.o \
  $(B)/$(SERVER_PATH_NAME)/keys.o \
  $(B)/$(SERVER_PATH_NAME)/md4.o \
  $(B)/$(SERVER_PATH_NAME)/md5.o \
  $(B)/$(SERVER_PATH_NAME)/msg.o \
  $(B)/$(SERVER_PATH_NAME)/net_chan.o \
  $(B)/$(SERVER_PATH_NAME)/net_ip.o \
  $(B)/$(SERVER_PATH_NAME)/huffman.o \
  $(B)/$(SERVER_PATH_NAME)/huffman_static.o \
  \
  $(B)/$(SERVER_PATH_NAME)/q_math.o \
  $(B)/$(SERVER_PATH_NAME)/q_shared.o \
  \
  $(B)/$(SERVER_PATH_NAME)/unzip.o \
  $(B)/$(SERVER_PATH_NAME)/vm.o \
  $(B)/$(SERVER_PATH_NAME)/vm_interpreted.o \
  \
  $(B)/$(SERVER_PATH_NAME)/be_aas_bspq3.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_cluster.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_debug.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_entity.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_file.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_main.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_move.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_optimize.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_reach.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_route.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_routealt.o \
  $(B)/$(SERVER_PATH_NAME)/be_aas_sample.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_char.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_chat.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_gen.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_goal.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_move.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_weap.o \
  $(B)/$(SERVER_PATH_NAME)/be_ai_weight.o \
  $(B)/$(SERVER_PATH_NAME)/be_ea.o \
  $(B)/$(SERVER_PATH_NAME)/be_interface.o \
  $(B)/$(SERVER_PATH_NAME)/l_crc.o \
  $(B)/$(SERVER_PATH_NAME)/l_libvar.o \
  $(B)/$(SERVER_PATH_NAME)/l_log.o \
  $(B)/$(SERVER_PATH_NAME)/l_memory.o \
  $(B)/$(SERVER_PATH_NAME)/l_precomp.o \
  $(B)/$(SERVER_PATH_NAME)/l_script.o \
  $(B)/$(SERVER_PATH_NAME)/l_struct.o

ifdef MINGW
  DOBJ += \
  $(B)/$(SERVER_PATH_NAME)/win_main.o \
  $(B)/client/win_resource.o \
  $(B)/$(SERVER_PATH_NAME)/win_shared.o \
  $(B)/$(SERVER_PATH_NAME)/win_syscon.o
else
  DOBJ += \
  $(B)/$(SERVER_PATH_NAME)/linux_signals.o \
  $(B)/$(SERVER_PATH_NAME)/unix_main.o \
  $(B)/$(SERVER_PATH_NAME)/unix_shared.o
endif

ifeq ($(VM_ON),true)
  ifeq ($(CPU),x86)
    DOBJ += $(B)/$(SERVER_PATH_NAME)/vm_x86.o
  endif
  ifeq ($(CPU),x86_64)
    DOBJ += $(B)/$(SERVER_PATH_NAME)/vm_x86.o
  endif
  ifeq ($(CPU),arm)
    DOBJ += $(B)/$(SERVER_PATH_NAME)/vm_armv7l.o
  endif
  ifeq ($(CPU),aarch64)
    DOBJ += $(B)/$(SERVER_PATH_NAME)/vm_aarch64.o
  endif
endif

$(B)/$(TARGET_SERVER): $(DOBJ)
	$(echo_cmd) "LD $@"
	$(Q)$(CC) -o $@ $(DOBJ) $(LDFLAGS)

#############################################################################
# CLIENT/SERVER RULES
#############################################################################


$(B)/client/%.o: $(ASM_PATH)/%.s
	$(DO_AS)

$(B)/client/%.o: $(CLIENT_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(SERVER_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(COMMON_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(BOTLIB_PATH)/%.c
  %.o: %.c ${CODE_HEADER}
	$(DO_BOT_CC)

$(B)/libjpeg/%.o: $(JPG_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(SDL_PATH)/%.c
	$(DO_CC)

$(B)/rend1/%.o: $(RENDERER1_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rend1/%.o: $(RENDERER_COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rend1/%.o: $(COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rend2/glsl/%.c: $(RENDERER2_PATH)/glsl/%.glsl $(STRINGIFY)
	$(DO_REF_STR)

$(B)/rend2/glsl/%.o: $(B)/renderer2/glsl/%.c
	$(DO_RENDERER_CC)

$(B)/rend2/%.o: $(RENDERER2_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rend2/%.o: $(RENDERER_COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rend2/%.o: $(COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rendv/%.o: $(RENDERERV_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rendv/%.o: $(RENDERER_COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/rendv/%.o: $(COMMON_PATH)/%.c
	$(DO_RENDERER_CC)

$(B)/client/%.o: $(UNIX_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(WIN32_PATH)/%.c
	$(DO_CC)

$(B)/client/%.o: $(WIN32_PATH)/%.rc
	$(DO_WINDRES)

$(B)/$(SERVER_PATH_NAME)/%.o: $(ASM_PATH)/%.s
	$(DO_AS)

$(B)/$(SERVER_PATH_NAME)/%.o: $(SERVER_PATH)/%.c
	$(DO_DED_CC)

$(B)/$(SERVER_PATH_NAME)/%.o: $(COMMON_PATH)/%.c
	$(DO_DED_CC)

$(B)/$(SERVER_PATH_NAME)/%.o: $(BOTLIB_PATH)/%.c
	$(DO_BOT_CC)

$(B)/$(SERVER_PATH_NAME)/%.o: $(UNIX_PATH)/%.c
	$(DO_DED_CC)

$(B)/$(SERVER_PATH_NAME)/%.o: $(WIN32_PATH)/%.c
	$(DO_DED_CC)

$(B)/$(SERVER_PATH_NAME)/%.o: $(WIN32_PATH)/%.rc
	$(DO_WINDRES)

#############################################################################
# TOOLS:
#############################################################################

install: release 
	@for i in $(TARGETS); do 
		if [ -f $(BUILD_RELEASE)$$i ]; then 
			$(INSTALL) -D -m 0755 "$(BUILD_RELEASE)/$$i" "$(APP_PATH)$$i";
			$(STRIP) "$(APP_PATH)$$i"; 
		fi 
	done

wipe: wipe-debug wipe-release

clean:
	@echo "'clean' $(B):" 
	@rm $(BUILD_RELEASE)/$(CLIENT_PATH_NAME) 
	@rm -f $(B)/$(OBJ) $(B)/$(DOBJ)
	@rm -f $(B)/$(TARGETS)
	@rm -rf $(BUILD_RELEASE)/$(CLIENT_PATH_NAME) 
	@rm -rf $(B)/$(SERVER_PATH_NAME)
	@rm -rf $(B)/$(RENDERER1_PATH_NAME)
	@rm -rf $(B)/$(RENDERER2_PATH_NAME)
	@rm -rf $(B)/$(RENDERERV_PATH_NAME) 

clean2: 
	@echo "'clean2' $(B):" 
	@rm $(BUILD_RELEASE)/$(CLIENT_PATH_NAME) 
	@rm -f $(B)/$(OBJ) $(B)/$(DOBJ)
	@rm -f $(B)/$(TARGETS)
	@rm -rf $(BUILD_RELEASE)/$(CLIENT_PATH_NAME) 
	@rm $(B)/$(SERVER_PATH_NAME)/'*.o, *.d'
	@rm $(B)/$(RENDERER1_PATH_NAME)/'*.o, *.d'
	@rm $(B)/$(RENDERER2_PATH_NAME)/'*.o, *.d'
	@rm $(B)/$(RENDERERV_PATH_NAME)/'*.o, *.d' 

clean-d:
	@echo "clean-d $(B):"
	@if [ -d $(B) ];then (find $(B) -name '*.d' -exec rm {} \;)fi
	@rm -f $(OBJ) $(DOBJ)
	@rm -f $(TARGETS)

wipe-debug:
	@rm -rf $(BUILD_DEBUG)

wipe-release:
	@rm -rf $(BUILD_RELEASE)

wipe-build: clean
	@rm -rf $(BUILD_PATH)

#############################################################################
# KEEP FILES (DEPENDENCIES)
#############################################################################

KEEP=$(shell find . -name '*.d')

ifneq ($(strip $(KEEP)),)
 include $(KEEP)
endif

.PHONY: all clean clean2 clean-debug clean-release copyfiles \
	debug default dist distclean doFolders release \
	targets tools toolsclean
