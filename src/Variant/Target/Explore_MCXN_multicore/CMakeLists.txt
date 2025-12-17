message(STATUS "Project name: '${PROJECT_NAME}'")

add_subdirectory("core0")
add_subdirectory("core1")

add_custom_target(${PROJECT_NAME}.hex
        COMMAND ${OBJCOPY} -O ihex ${MY_BINARY_DIR}/core0.elf ${MY_BINARY_DIR}/core0.hex
        COMMAND ${OBJCOPY} -O ihex ${MY_BINARY_DIR}/core1.elf ${MY_BINARY_DIR}/core1.hex
        COMMAND ${SREC_CAT} ${MY_BINARY_DIR}/core0.hex -Intel ${MY_BINARY_DIR}/core1.hex -Intel -o ${MY_BINARY_DIR}/${PROJECT_NAME}.hex -Intel
)

add_dependencies(${PROJECT_NAME}.hex ${TARGET_CORE0} ${TARGET_CORE1})
