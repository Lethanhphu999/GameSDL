cmake_minimum_required(VERSION 3.16)
project(GameSDL)

# set the output directory for built objects.
# This makes sure that the dynamic library goes into the build directory automatically.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIGURATION>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIGURATION>")

# prevent installing to system directories. 
set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}" CACHE INTERNAL "")

# This assumes the SDL source is available in vendored/SDL
add_subdirectory(ThirdParty/SDL EXCLUDE_FROM_ALL)
add_subdirectory(ThirdParty/SDL_image EXCLUDE_FROM_ALL)
add_subdirectory(ThirdParty/SDL_ttf EXCLUDE_FROM_ALL)
add_subdirectory(ThirdParty/SDL_net EXCLUDE_FROM_ALL)

# Create your game executable target as usual
add_executable(${PROJECT_NAME} WIN32 src/main.cpp)

# Link to the actual SDL3 library.
target_link_libraries(${PROJECT_NAME} PRIVATE
                        SDL3::SDL3
                        SDL3_image::SDL3_image 
                        SDL3_ttf::SDL3_ttf
                        SDL3_net::SDL3_net)