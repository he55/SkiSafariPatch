DEBUG = 0
# FINALPACKAGE = 1

ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SkiSafari


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SkiSafariPatch

SkiSafariPatch_FILES = Tweak.x
SkiSafariPatch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
