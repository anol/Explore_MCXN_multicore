message(STATUS "Project name: '${PROJECT_NAME}'")

add_subdirectory("core0")
add_subdirectory("core1")

add_custom_target(${PROJECT_NAME}.elf
        COMMAND ${CMAKE_LINKER} -o ${MY_BINARY_DIR}/${PROJECT_NAME}.elf -T ${CMAKE_CURRENT_SOURCE_DIR}/combined.ld ${MY_BINARY_DIR}/core0.elf ${MY_BINARY_DIR}/core1.elf
)

add_dependencies(${PROJECT_NAME}.elf ${TARGET_CORE0} ${TARGET_CORE1})

add_custom_target(${PROJECT_NAME}.hex
        COMMAND ${OBJCOPY} -O ihex ${MY_BINARY_DIR}/${PROJECT_NAME}.elf ${MY_BINARY_DIR}/${PROJECT_NAME}.hex
)

add_dependencies(${PROJECT_NAME}.hex ${PROJECT_NAME}.elf)
