cmake_minimum_required(VERSION 3.13)

project(Experimental_project C ASM)

set(CMAKE_C_STANDARD 11)

# Toolchain defines
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

# Specify compiler manually
set(CMAKE_C_COMPILER /Applications/ARM/bin/arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER /Applications/ARM/bin/arm-none-eabi-gcc)

# MCU flags
set(MCU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffreestanding -fdata-sections -ffunction-sections")

# Linker script
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/stm32_hal/linker/STM32G431KB.ld)

# Compiler flags
set(CMAKE_C_FLAGS "${MCU_FLAGS} -Wall -O0 -g3")
set(CMAKE_ASM_FLAGS "${MCU_FLAGS} -x assembler-with-cpp")

# Linker flags
set(CMAKE_EXE_LINKER_FLAGS "${MCU_FLAGS} -T${LINKER_SCRIPT} -Wl,--gc-sections -Wl,-Map=${PROJECT_NAME}.map")

# Sources
set(SOURCES
    stm32_hal/startup/startup_stm32g4xx.S
    src/main.c
    src/system_stm32g4xx.c
    src/_exit.c
)

# Include dirs
include_directories(${CMAKE_SOURCE_DIR}/src)

# Target
add_executable(${PROJECT_NAME} ${SOURCES})
# Custom post-build commands to generate .bin and .hex
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary ${PROJECT_NAME} ${PROJECT_NAME}.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${PROJECT_NAME} ${PROJECT_NAME}.hex)