include(FetchContent)
message(STATUS "download yaml-cpp ...")

set(yaml-cpp_GIT_REPOSITORY
    "https://github.com/jbeder/yaml-cpp.git"
    CACHE STRING "yaml-cpp git repository")

FetchContent_Declare(
    yaml-cpp
    GIT_REPOSITORY ${yaml-cpp_GIT_REPOSITORY}
    GIT_TAG "0.8.0"
    GIT_SHALLOW TRUE)

FetchContent_GetProperties(yaml-cpp)
if(NOT yaml-cpp_POPULATED)
    # Disable unnecessary components to speed up the build
    set(YAML_CPP_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(YAML_CPP_BUILD_TOOLS OFF CACHE BOOL "" FORCE)
    set(YAML_CPP_BUILD_CONTRIB OFF CACHE BOOL "" FORCE)
    set(YAML_CPP_FORMAT_SOURCE OFF CACHE BOOL "" FORCE)
    
    # Enable installation
    set(YAML_CPP_INSTALL ON CACHE BOOL "" FORCE)
    
    FetchContent_MakeAvailable(yaml-cpp)
endif()

# target: yaml-cpp::yaml-cpp