
PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=BYOD

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/BYOD
JUCE_DIR=$(APP_SRC_DIR)/modules/JUCE

METADATA_GENERATOR_CMAKE_EXTRA_FLAGS=-DJUCEAAP_HAVE_AUDIO_PLAYHEAD_NEW_POSITION_INFO=1

# For metadata updates, relative to build-desktop
APP_SHARED_CODE_LIBS="$(APP_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a modules/libjuce_plugin_modules.a res/libBinaryData.a"

PATCH_FILE=$(shell pwd)/aap-juce-support.patch
PATCH_DEPTH=1

# JUCE patches if any
JUCE_PATCHES= \
	$(PWD)/external/aap-juce/JUCE-support-Android-export-jni-symbols.patch
JUCE_PATCH_DEPTH=1

PRE_BUILD_TASKS=update-rtneural

include $(AAP_JUCE_DIR)/Makefile.cmake-common

update-rtneural: external/BYOD/modules/RTNeural/.stamp-rtneural

external/BYOD/modules/RTNeural/.stamp-rtneural:
	cd external/BYOD/modules/RTNeural ; \
	git remote add atsushieno https://github.com/atsushieno/RTNeural.git ; \
	git fetch atsushieno bump-xsimd-for-android ; \
	git switch bump-xsimd-for-android ; \
	git submodule update --init --recursive ; \
	touch .stamp-rtneural ; \
	cd ../../../..

