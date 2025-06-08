# Set ARM toolchain directory
set(ARM_TOOLCHAIN_DIR "/Applications/ARM/bin")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

# Set C compiler
set(CMAKE_C_COMPILER "${ARM_TOOLCHAIN_DIR}/arm-none-eabi-gcc")
# Set C++ compiler
set(CMAKE_CXX_COMPILER "${ARM_TOOLCHAIN_DIR}/arm-none-eabi-g++")
# Set ASM compiler
set(CMAKE_ASM_COMPILER "${ARM_TOOLCHAIN_DIR}/arm-none-eabi-gcc")

# Compiler flags
set(CPU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")
set(CMAKE_C_FLAGS "${CPU_FLAGS} -Wall -O2")
set(CMAKE_CXX_FLAGS "${CPU_FLAGS} -Wall -O2")
set(CMAKE_ASM_FLAGS "${CPU_FLAGS} -x assembler-with-cpp")

# Optional
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
