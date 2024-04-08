# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /app/cpp_src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /app/build

# Include any dependencies generated for this target.
include CMakeFiles/PBRT.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/PBRT.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/PBRT.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PBRT.dir/flags.make

CMakeFiles/PBRT.dir/main.cpp.o: CMakeFiles/PBRT.dir/flags.make
CMakeFiles/PBRT.dir/main.cpp.o: /app/cpp_src/main.cpp
CMakeFiles/PBRT.dir/main.cpp.o: CMakeFiles/PBRT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PBRT.dir/main.cpp.o"
	/usr/bin/g++-10 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/PBRT.dir/main.cpp.o -MF CMakeFiles/PBRT.dir/main.cpp.o.d -o CMakeFiles/PBRT.dir/main.cpp.o -c /app/cpp_src/main.cpp

CMakeFiles/PBRT.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PBRT.dir/main.cpp.i"
	/usr/bin/g++-10 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /app/cpp_src/main.cpp > CMakeFiles/PBRT.dir/main.cpp.i

CMakeFiles/PBRT.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PBRT.dir/main.cpp.s"
	/usr/bin/g++-10 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /app/cpp_src/main.cpp -o CMakeFiles/PBRT.dir/main.cpp.s

# Object files for target PBRT
PBRT_OBJECTS = \
"CMakeFiles/PBRT.dir/main.cpp.o"

# External object files for target PBRT
PBRT_EXTERNAL_OBJECTS =

PBRT: CMakeFiles/PBRT.dir/main.cpp.o
PBRT: CMakeFiles/PBRT.dir/build.make
PBRT: /usr/local/lib/libjluna.so
PBRT: /usr/local/julia-1.10.2/lib/libjulia.so
PBRT: CMakeFiles/PBRT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable PBRT"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PBRT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PBRT.dir/build: PBRT
.PHONY : CMakeFiles/PBRT.dir/build

CMakeFiles/PBRT.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PBRT.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PBRT.dir/clean

CMakeFiles/PBRT.dir/depend:
	cd /app/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /app/cpp_src /app/cpp_src /app/build /app/build /app/build/CMakeFiles/PBRT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PBRT.dir/depend

