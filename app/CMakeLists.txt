# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

# 프로젝트를 생성할 때 C++ 지원을 활성화 하셨다면 CMakeLists.txt와 함께 native-lib.cpp 파일이
# 생성되셨을 겁니다. CMakeLists.txt에 다음 내용을 추가합니다.
# OpenCV Path는 자신의 설치 경로로 바꿔주시기 바랍니다.
# https://blog.qwaz.io/dev-diary/android-studio-2-2%EC%97%90%EC%84%9C-opencv-3-1-%EC%84%B8%ED%8C%85%ED%95%98%EA%B8%B0

set(OpenCV_DIR /home/dannykwon/OpenCV-android-sdk/sdk/native/jni)
find_package(OpenCV REQUIRED)



cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
             native-lib

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             src/main/cpp/native-lib.cpp )

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
              log-lib

              # Specifies the name of the NDK library that
              # you want CMake to locate.
              log

              # CMake 사용하도록 프로젝트 생성했다면
              # CMakeLists.txt 파일을 다음처럼 android 라이브러리를 사용하도록 수정합니다.
              android-lib android )

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
                       native-lib

                       # Links the target library to the log library
                       # included in the NDK.
                       ${log-lib}

                       # CMake 사용하도록 프로젝트 생성했다면
                       # CMakeLists.txt 파일을 다음처럼 android 라이브러리를 사용하도록 수정합니다.
                       ${android-lib}

                       # 그리고 target_link_libraries의 마지막에 ${OpenCV_LIBS}를 추가합니다.
                       # IDE 동기화가 성공적으로 이루어지는지 확인합니다.
                       ${OpenCV_LIBS})
