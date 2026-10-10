# aap-juce-byod: BYOD on Android

It is a port of [Chowdhury-DSP/BYOD](https://github.com/Chowdhury-DSP/BYOD) to [Audio Plugins for Android](https://github.com/atsushieno/aap-core) using [aap-juce](https://github.com/atsushieno/aap-juce).

We have some limitation on BYOD: selecting a BYOD preset causes parameter metadata refresh, but it is currently not working on AAP. Do not expect parameter names reflected accordingly.

## Build

Run `./gradlew build` (`gradlew.bat build` on Windows). The shared aap-juce
preparation task applies the application patch, selects JUCE patches by version,
and stages the launcher icon before native configuration, Java compilation, and
lint. Existing patches are adopted without resetting the source checkouts.

Port configuration and aap-juce calls are included in the upstream
`CMakeLists.txt` through `aap-juce-support.patch`. Gradle retains the
`src/main/cpp/CMakeLists.txt` reference through the existing source-directory
symlink, which accommodates Android Studio's CMake path-resolution limits.
The existing Makefile remains available. Maven dependencies must be published or otherwise resolvable;
for local aap-core development, its existing `publishToMavenLocal` workflow is
still available through Make. `make dist` still collects built APK/AAB files.

## Licenses

BYOD is distributed under the GPLv3 license.

aap-juce-byod is distributed under the GPLv3 license.
