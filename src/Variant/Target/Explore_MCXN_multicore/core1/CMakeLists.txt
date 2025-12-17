

set(TARGET_CORE1 "core1.elf")

add_executable(${TARGET_CORE1}
        main.c
        hardware_init.c
        pin_mux.c
        ../../../../board/board.c
        ../../../../board/clock_config.c
        ../../../../board/semihost_hardfault.c
        ../../../../component/uart/fsl_adapter_lpuart.c
        ../../../../device/core1/system_MCXN947_cm33_core1.c
        ../../../../drivers/fsl_clock.c
        ../../../../drivers/fsl_common.c
        ../../../../drivers/fsl_common_arm.c
        ../../../../drivers/fsl_gpio.c
        ../../../../drivers/fsl_lpflexcomm.c
        ../../../../drivers/fsl_lpuart.c
        ../../../../drivers/fsl_reset.c
        ../../../../drivers/fsl_spc.c
        ../../../../freertos/freertos-kernel/croutine.c
        ../../../../freertos/freertos-kernel/event_groups.c
        ../../../../freertos/freertos-kernel/list.c
        ../../../../freertos/freertos-kernel/queue.c
        ../../../../freertos/freertos-kernel/stream_buffer.c
        ../../../../freertos/freertos-kernel/tasks.c
        ../../../../freertos/freertos-kernel/timers.c
        ../../../../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.c
        ../../../../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c
        ../../../../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c
        ../../../../mcmgr/mcmgr.c
        ../../../../mcmgr/mcmgr_internal_core_api_mcxnx4x.c
#        ../../../../startup/boot_multicore_slave.c
        ../../../../startup/startup_mcxn947_cm33_core1.c
        ../../../../utilities/fsl_assert.c
        ../../../../utilities/fsl_debug_console.c
        ../../../../utilities/fsl_str.c
)

target_sources(${TARGET_CORE1} PRIVATE

)

include(${PLATFORM_SOURCE_DIR}/${PLATFORM}_core1_build.cmake)
