# src/CMakeLists.txt

set(SRC_FILES
    main.c
    # ../stm32_hal/startup/startup_stm32g4xx.S

    # # HAL Drivers
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal.c
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal_rcc.c
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal_gpio.c
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal_cortex.c
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal_flash.c
    # ../stm32_hal/HAL_Driver/Src/stm32g4xx_hal_dma.c
    # Add more HAL sources if needed
)

# Add the executable
add_executable(Experimental_project ${SRC_FILES})

# # Proper linker options — THIS ONLY!
# target_link_options(Experimental_project PRIVATE
#     -nostartfiles
#     -nostdlib
#     -T ${CMAKE_SOURCE_DIR}/stm32_hal/linker/STM32G4XX.ld
#     -Wl,--gc-sections
# )
