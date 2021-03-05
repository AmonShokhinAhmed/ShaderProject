cmake_minimum_required(VERSION 3.1.5)

project(
    ShaderProject
    VERSION 1.0
    DESCRIPTION "A general purpose graphical experimentation app."
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(SRC_DIR src)
set(VENDOR_DIR ${CMAKE_BINARY_DIR}/vendor)

set(RUNTIME_DIR ${CMAKE_BINARY_DIR}/bin)

configure_file(buildconfig.h.in buildconfig.h)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${RUNTIME_DIR})


file(
    GLOB_RECURSE 
    SRCFILES 
    RELATIVE ${CMAKE_SOURCE_DIR} 
    CONFIGURE_DEPENDS
    "${SRC_DIR}/*.cpp"
    "${SRC_DIR}/*.h"
)

add_executable(${PROJECT_NAME}
    ${SRCFILES}
    )

add_custom_command(
        TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
                ${CMAKE_SOURCE_DIR}/src/shader
                $<TARGET_FILE_DIR:${PROJECT_NAME}>/shader)


include(FetchContent)

FetchContent_Declare(
        glfw
        GIT_REPOSITORY https://github.com/glfw/glfw
        SOURCE_DIR        "${VENDOR_DIR}/glfw"
        BINARY_DIR        "${VENDOR_DIR}/glfw-build"
)

FetchContent_GetProperties(glfw)
if(NOT glfw_POPULATED)
    FetchContent_Populate(glfw)

    set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "Build the GLFW example programs")
    set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "Build the GLFW test programs")
    set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "Build the GLFW documentation")
    set(GLFW_INSTALL OFF CACHE INTERNAL "Generate installation target")

    add_subdirectory(${glfw_SOURCE_DIR} ${glfw_BINARY_DIR})
endif()

FetchContent_Declare(
        glad
        GIT_REPOSITORY https://github.com/Dav1dde/glad.git
        SOURCE_DIR        "${VENDOR_DIR}/glad"
        BINARY_DIR        "${VENDOR_DIR}/glad-build"
)

FetchContent_GetProperties(glad)
if(NOT glad_POPULATED)
    FetchContent_Populate(glad)
    set(GLAD_PROFILE "core" CACHE STRING "OpenGL profile")
    set(GLAD_API "gl=" CACHE STRING "API type/version pairs, like \"gl=3.2,gles=\", no version means latest")
    set(GLAD_GENERATOR "c" CACHE STRING "Language to generate the binding for")
    add_subdirectory(${glad_SOURCE_DIR} ${glad_BINARY_DIR})
endif()

include(ExternalProject)
ExternalProject_Add(
    glm
    PREFIX ${VENDOR_DIR}/glm
    GIT_REPOSITORY https://github.com/g-truc/glm.git
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD ON
    )
ExternalProject_Get_Property(glm source_dir)
set(GLM_INCLUDE_DIR ${source_dir})

target_compile_definitions(${PROJECT_NAME} PRIVATE GLFW_INCLUDE_NONE)



target_include_directories(${PROJECT_NAME} PRIVATE
                           "${PROJECT_BINARY_DIR}"
                           "${GLM_INCLUDE_DIR}"
                           )

target_link_libraries(${PROJECT_NAME} glfw glad)