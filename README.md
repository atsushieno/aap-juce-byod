# aap-juce-byod: BYOD on Android

It is a port of [Chowdhury-DSP/BYOD](https://github.com/Chowdhury-DSP/BYOD) to [Audio Plugins for Android](https://github.com/atsushieno/aap-core) using [aap-juce](https://github.com/atsushieno/aap-juce).

![aap-juce-byod on aaphostsample](docs/images/aap-juce-byod-sshot.png)

## Build instruction

It is aap-juce CMake application which would typically build just with `make` with sufficient setup, but this time we need a fix for RTNeural to get it working in good performance: https://github.com/jatinchowdhury18/RTNeural/pull/81

I didn't fork BYOD to just alter the commit hash for RTNeural, so you will have to perform some additional operations:

```
cd external/BYOD/modules/RTNeural
git remote add atsushieno https://github.com/atsushieno/RTNeural.git
git fetch atsushieno bump-xsimd-for-android
git switch bump-xsimd-for-android
git submodule update --recursive --init
cd ../../../..

make
```

## Current issues

- MainActivity fails to launch
  - JuceActivity causes UnsatisfiedLinkError to the JNI symbols that BYOD somehow linked out, unlike other aap-juce apps.
- <del>Basically applying effect is slow. Definitely not for non-static uses so far. </del>
  - <del>It is most likely it could not make use of optimal processor instructions i.e. SIMD/NEON.</del>
- [Loading the list of presets is slow](https://github.com/atsushieno/aap-juce/issues/34). It could take <del>minutes</del>seconds (with RTNeural fix mentioned above).

## Licenses

BYOD is distributed under the GPLv3 license.

aap-juce-byod is distributed under the GPLv3 license.
