cmake_minimum_required(VERSION 2.8.9)
project(cmake_tut CXX C)

set (cmake_tut_VERSION_MAJOR 2)
set (cmake_tut_VERSION_MINOR 4)
set (cmake_tut_VERSION_PATCH 8)
# this means that our project is 2.4.8


#configure_file (
    #"${PROJECT_SOURCE_DIR}/inc/cmake_config.hpp.in"
    #"${PROJECT_SOURCE_DIR}/inc/cmake_config.hpp"
    #)


# Bring the headers into the project
include_directories(inc)



# ADDING LIBRARIRES
# Can manually add the sources using the set command as follows:
# set(SOURCES src/mainapp.cpp src/Student.cpp)
# this I have commented coz it is not that efficient way
# However, the file(GLOB...) allows for wildcard additions:
file(GLOB MOD_LIB_SOURCES "src/lib/*.cpp")
# we have to tell implicitely taat it is static or shared
    # or we can use
      # set (BUILD_SHARED_LIBRARIES OFF)
        #off for staticc on for dynamic

# shared libraries#Generate the shared library from the sources
add_library(shared_ex SHARED ${MOD_LIB_SOURCES})

# shared libraries#Generate the static library from the sources
add_library(static_ex STATIC ${MOD_LIB_SOURCES})



# LInking Libraries
#For the shared library:
#set ( PROJECT_LINK_LIBS libtestStudent.so )
#link_directories( ./lib/ )

#For the static library:
#set ( PROJECT_LINK_LIBS libtestStudent.a )
#link_directories( ./lib/ )



# building binaries
set (LIBRARIES_TO_LINK

   )

add_executable(cmake_tut src/main.cpp)
target_link_libraries(cmake_tut ${LIBRARIES_TO_LINK})


# install locations for make install
install(TARGETS cmake_tut DESTINATION /usr/lib)
