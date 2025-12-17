message(STATUS "Target name: '${TARGET_CORE0}'")

#configure_file(${TARGET_CORE0}_config.h.in ${PROJECT_BINARY_DIR}/Target_config.h)

#add_custom_command(TARGET ${TARGET_CORE0} POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy
#        ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_CORE0}
#        ${MY_BINARY_DIR}/${TITLE}_${PROJECT_VERSION_MAJOR}_${PROJECT_VERSION_MINOR}.elf
#)

target_include_directories(${TARGET_CORE0} PUBLIC
        ${SOURCE_ROOT_DIR}/device/core0
)

target_include_directories(${TARGET_CORE0} PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${SOURCE_ROOT_DIR}/board
        ${SOURCE_ROOT_DIR}/CMSIS
        ${SOURCE_ROOT_DIR}/component
        ${SOURCE_ROOT_DIR}/device
        ${SOURCE_ROOT_DIR}/device/periph
        ${SOURCE_ROOT_DIR}/drivers
        ${SOURCE_ROOT_DIR}/freertos/freertos-kernel/include
        ${SOURCE_ROOT_DIR}/freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure
        ${SOURCE_ROOT_DIR}/freertos/freertos-kernel/template
        ${SOURCE_ROOT_DIR}/mcmgr
        ${SOURCE_ROOT_DIR}/utilities
)

target_compile_definitions(${TARGET_CORE0} PUBLIC
        -DMCUXPRESSO_SDK
        -DCPU_MCXN947VDF_cm33_core0
        -D__USE_SHMEM
        -DSDK_DEBUGCONSOLE=1
        -DMCUX_META_BUILD
        -DMULTICORE_APP=1
        -DSDK_OS_FREE_RTOS
        -DCPU_MCXN947VDF
        -DCPU_MCXN947VDF_cm33
        -DCR_INTEGER_PRINTF
        -D__MCUXPRESSO
        -D__USE_CMSIS
        -DNDEBUG
#        -D__REDLIB__
        -D__MULTICORE_MASTER
        -D__MULTICORE_MASTER_SLAVE_M33SLAVE
        -DCONFIG_FLASH_BASE_ADDRESS=0x0
        -DCONFIG_LV_ATTRIBUTE_MEM_ALIGN
        -DCONFIG_LV_ATTRIBUTE_LARGE_CONST
)

target_compile_options(${TARGET_CORE0} PUBLIC
        -Wall
        -Os
        -fno-common
        -g
        -gdwarf-4
        -mcpu=cortex-m33
        -mfpu=fpv5-sp-d16
        -mfloat-abi=hard
        -c
        -ffunction-sections
        -fdata-sections
        -fno-builtin
        -mthumb
        -fstack-usage
#        -specs=redlib.specs
        -specs=nano.specs
)

target_link_options(${TARGET_CORE0} PUBLIC
        -T ${CMAKE_CURRENT_SOURCE_DIR}/${TARGET_CORE0}.ld
        -mthumb
        -mcpu=cortex-m33
        -mfpu=fpv5-sp-d16
        -mfloat-abi=hard
        -Wl,--library-path=${CMAKE_BINARY_DIR}
        -Wl,--library-path=${CMAKE_CURRENT_SOURCE_DIR}
        -static
        --specs=nano.specs
        # Enable garbage collection of unused input sections
        -Wl,--gc-sections
        # Diagnostics
        -Wl,-Map=${TARGET_CORE0}.map
        #        -Wl,--cref
        -Wl,--print-memory-usage
        #        -v
)
