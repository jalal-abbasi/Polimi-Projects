# Copyright 2012 The MathWorks, Inc.
# Autogenerated on: 30-Sep-2020 17:06:20
# Model: ARDUCOPTER_IMU_TEST_0
# MyTemplate
# File name: ArduCopter_IMU_test_0.mk
# Template: gmake 
# Template Version: 1.0 
# Tool Chain Configuration: Arduinomega2560
# Tool Chain Configuration Version: 2.0

THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)

MODEL_NAME := ArduCopter_IMU_test_0
HOST_PLATFORM := windows
BUILD_CFG := MW
TARGET_EXT := .elf
TARGET_HEX_EXT := .hex
OBJ_EXT := .o
TOOL_CHAIN_CFG := Arduinomega2560
FORMAT_PATH = $(if $(filter \\\\%,$(1)),"$(1)",$(subst $(SPACE),\$(SPACE),$(subst \,/,$(1))))

MATLAB_ROOT_RELATIVE := ..\..\..\..\..\..\..\Program Files (x86)\MATLAB\R2014a\#MATLAB_ROOT_RELATIVE_END
MATLAB_ROOT_ABSOLUTE := C:\Program Files (x86)\MATLAB\R2014a\#MATLAB_ROOT_ABSOLUTE_END
SOURCE_PATH := $(call FORMAT_PATH,.\)

ifneq (.a,$(strip $(TARGET_EXT)))
OUTPUT_PATH := $(call FORMAT_PATH,$(SOURCE_PATH)$(BUILD_CFG)/)
else
OUTPUT_PATH := $(call FORMAT_PATH,$(SOURCE_PATH)/)
endif

DERIVED_PATH := $(call FORMAT_PATH,$(SOURCE_PATH))
TARGET_NAME_PREFIX := 
TARGET_NAME_POSTFIX := 
TARGET_FILE_NO_EXT := $(TARGET_NAME_PREFIX)$(MODEL_NAME)$(TARGET_NAME_POSTFIX)
TARGET_FILE := $(TARGET_FILE_NO_EXT)$(TARGET_EXT)

TARGET := $(OUTPUT_PATH)$(TARGET_FILE)
TARGET_HEX := $(TARGET_FILE_NO_EXT)$(TARGET_HEX_EXT)

#Code Generation Files

ifneq (.a,$(strip $(TARGET_EXT)))
SOURCE_FILES := $(call FORMAT_PATH,.\APM_RC_APM1.cpp) $(call FORMAT_PATH,.\APM_RC_APM2.cpp) $(call FORMAT_PATH,.\AP_ADC.cpp) $(call FORMAT_PATH,.\AP_ADC_ADS7844.cpp) $(call FORMAT_PATH,.\AP_ADC_HIL.cpp) $(call FORMAT_PATH,.\AP_Baro.cpp) $(call FORMAT_PATH,.\AP_Baro_BMP085.cpp) $(call FORMAT_PATH,.\AP_Baro_BMP085_hil.cpp) $(call FORMAT_PATH,.\AP_Baro_MS5611.cpp) $(call FORMAT_PATH,.\AP_Common.cpp) $(call FORMAT_PATH,.\AP_Compass_HIL.cpp) $(call FORMAT_PATH,.\AP_Compass_HMC5843.cpp) $(call FORMAT_PATH,.\AP_Declination.cpp) $(call FORMAT_PATH,.\AP_GPS_406.cpp) $(call FORMAT_PATH,.\AP_GPS_Auto.cpp) $(call FORMAT_PATH,.\AP_GPS_HIL.cpp) $(call FORMAT_PATH,.\AP_GPS_IMU.cpp) $(call FORMAT_PATH,.\AP_GPS_MTK.cpp) $(call FORMAT_PATH,.\AP_GPS_MTK16.cpp) $(call FORMAT_PATH,.\AP_GPS_NMEA.cpp) $(call FORMAT_PATH,.\AP_GPS_SIRF.cpp) $(call FORMAT_PATH,.\AP_GPS_UBLOX.cpp) $(call FORMAT_PATH,.\AP_IMU_INS.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_MPU6000.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_Oilpan.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_Stub.cpp) $(call FORMAT_PATH,.\AP_Math.cpp) $(call FORMAT_PATH,.\AP_Param.cpp) $(call FORMAT_PATH,.\AP_PeriodicProcessStub.cpp) $(call FORMAT_PATH,.\AP_TimerProcess.cpp) $(call FORMAT_PATH,.\Arduino_Mega_ISR_Registry.cpp) $(call FORMAT_PATH,.\BetterStream.cpp) $(call FORMAT_PATH,.\Compass.cpp) $(call FORMAT_PATH,.\DataFlash.cpp) $(call FORMAT_PATH,.\DataFlash_APM1.cpp) $(call FORMAT_PATH,.\DataFlash_APM2.cpp) $(call FORMAT_PATH,.\DataLogger.cpp) $(call FORMAT_PATH,.\DerivativeFilter.cpp) $(call FORMAT_PATH,.\FastSerial.cpp) $(call FORMAT_PATH,.\GPS.cpp) $(call FORMAT_PATH,.\HardwareSerial.cpp) $(call FORMAT_PATH,.\I2C.cpp) $(call FORMAT_PATH,.\IMU.cpp) $(call FORMAT_PATH,.\IPAddress.cpp) $(call FORMAT_PATH,.\Pitot.cpp) $(call FORMAT_PATH,.\Print.cpp) $(call FORMAT_PATH,.\SPI.cpp) $(call FORMAT_PATH,.\Simulink_APM2_Wrapper.cpp) $(call FORMAT_PATH,.\TimeStats.cpp) $(call FORMAT_PATH,.\WInterrupts.c) $(call FORMAT_PATH,.\WMath.cpp) $(call FORMAT_PATH,.\WString.cpp) $(call FORMAT_PATH,.\c++.cpp) $(call FORMAT_PATH,.\matrix3.cpp) $(call FORMAT_PATH,.\new.cpp) $(call FORMAT_PATH,.\polygon.cpp) $(call FORMAT_PATH,.\quaternion.cpp) $(call FORMAT_PATH,.\s2b_wrapper.c) $(call FORMAT_PATH,.\startup_menu.cpp) $(call FORMAT_PATH,.\vector3.cpp) $(call FORMAT_PATH,.\vprintf.cpp) $(call FORMAT_PATH,.\wiring.c) $(call FORMAT_PATH,.\wiring_analog.c) $(call FORMAT_PATH,.\wiring_digital.c) $(call FORMAT_PATH,.\io_wrappers.cpp) $(call FORMAT_PATH,.\ArduCopter_IMU_test_0.c) $(call FORMAT_PATH,.\ArduCopter_IMU_test_0_data.c) $(call FORMAT_PATH,.\ert_main.c)
else
SOURCE_FILES := $(call FORMAT_PATH,.\APM_RC_APM1.cpp) $(call FORMAT_PATH,.\APM_RC_APM2.cpp) $(call FORMAT_PATH,.\AP_ADC.cpp) $(call FORMAT_PATH,.\AP_ADC_ADS7844.cpp) $(call FORMAT_PATH,.\AP_ADC_HIL.cpp) $(call FORMAT_PATH,.\AP_Baro.cpp) $(call FORMAT_PATH,.\AP_Baro_BMP085.cpp) $(call FORMAT_PATH,.\AP_Baro_BMP085_hil.cpp) $(call FORMAT_PATH,.\AP_Baro_MS5611.cpp) $(call FORMAT_PATH,.\AP_Common.cpp) $(call FORMAT_PATH,.\AP_Compass_HIL.cpp) $(call FORMAT_PATH,.\AP_Compass_HMC5843.cpp) $(call FORMAT_PATH,.\AP_Declination.cpp) $(call FORMAT_PATH,.\AP_GPS_406.cpp) $(call FORMAT_PATH,.\AP_GPS_Auto.cpp) $(call FORMAT_PATH,.\AP_GPS_HIL.cpp) $(call FORMAT_PATH,.\AP_GPS_IMU.cpp) $(call FORMAT_PATH,.\AP_GPS_MTK.cpp) $(call FORMAT_PATH,.\AP_GPS_MTK16.cpp) $(call FORMAT_PATH,.\AP_GPS_NMEA.cpp) $(call FORMAT_PATH,.\AP_GPS_SIRF.cpp) $(call FORMAT_PATH,.\AP_GPS_UBLOX.cpp) $(call FORMAT_PATH,.\AP_IMU_INS.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_MPU6000.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_Oilpan.cpp) $(call FORMAT_PATH,.\AP_InertialSensor_Stub.cpp) $(call FORMAT_PATH,.\AP_Math.cpp) $(call FORMAT_PATH,.\AP_Param.cpp) $(call FORMAT_PATH,.\AP_PeriodicProcessStub.cpp) $(call FORMAT_PATH,.\AP_TimerProcess.cpp) $(call FORMAT_PATH,.\Arduino_Mega_ISR_Registry.cpp) $(call FORMAT_PATH,.\BetterStream.cpp) $(call FORMAT_PATH,.\Compass.cpp) $(call FORMAT_PATH,.\DataFlash.cpp) $(call FORMAT_PATH,.\DataFlash_APM1.cpp) $(call FORMAT_PATH,.\DataFlash_APM2.cpp) $(call FORMAT_PATH,.\DataLogger.cpp) $(call FORMAT_PATH,.\DerivativeFilter.cpp) $(call FORMAT_PATH,.\FastSerial.cpp) $(call FORMAT_PATH,.\GPS.cpp) $(call FORMAT_PATH,.\HardwareSerial.cpp) $(call FORMAT_PATH,.\I2C.cpp) $(call FORMAT_PATH,.\IMU.cpp) $(call FORMAT_PATH,.\IPAddress.cpp) $(call FORMAT_PATH,.\Pitot.cpp) $(call FORMAT_PATH,.\Print.cpp) $(call FORMAT_PATH,.\SPI.cpp) $(call FORMAT_PATH,.\Simulink_APM2_Wrapper.cpp) $(call FORMAT_PATH,.\TimeStats.cpp) $(call FORMAT_PATH,.\WInterrupts.c) $(call FORMAT_PATH,.\WMath.cpp) $(call FORMAT_PATH,.\WString.cpp) $(call FORMAT_PATH,.\c++.cpp) $(call FORMAT_PATH,.\matrix3.cpp) $(call FORMAT_PATH,.\new.cpp) $(call FORMAT_PATH,.\polygon.cpp) $(call FORMAT_PATH,.\quaternion.cpp) $(call FORMAT_PATH,.\s2b_wrapper.c) $(call FORMAT_PATH,.\startup_menu.cpp) $(call FORMAT_PATH,.\vector3.cpp) $(call FORMAT_PATH,.\vprintf.cpp) $(call FORMAT_PATH,.\wiring.c) $(call FORMAT_PATH,.\wiring_analog.c) $(call FORMAT_PATH,.\wiring_digital.c) $(call FORMAT_PATH,.\io_wrappers.cpp) $(call FORMAT_PATH,.\ArduCopter_IMU_test_0.c) $(call FORMAT_PATH,.\ArduCopter_IMU_test_0_data.c) $(call FORMAT_PATH,.\ert_main.c)
endif

HEADER_FILES := $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\APM_RC_APM1.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\APM_RC_APM2.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_ADC.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_ADC_ADS7844.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_ADC_HIL.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Baro.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Baro_BMP085.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Baro_BMP085_hil.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Baro_MS5611.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Common.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Compass_HIL.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Compass_HMC5843.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Declination.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_406.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_Auto.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_HIL.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_IMU.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_MTK.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_MTK16.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_NMEA.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_SIRF.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_GPS_UBLOX.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_IMU_INS.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_InertialSensor_MPU6000.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_InertialSensor_Oilpan.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_InertialSensor_Stub.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Math.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_Param.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_PeriodicProcessStub.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\AP_TimerProcess.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\Arduino_Mega_ISR_Registry.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\BetterStream.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\Compass.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\DataFlash.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\DataFlash_APM1.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\DataFlash_APM2.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\DataLogger.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\DerivativeFilter.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\FastSerial.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\GPS.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\HardwareSerial.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\I2C.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\IMU.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\IPAddress.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\Pitot.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\Print.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\SPI.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\Simulink_APM2_Wrapper.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\TimeStats.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\WString.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\c++.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\matrix3.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\new.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\polygon.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\quaternion.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\startup_menu.h) $(call FORMAT_PATH,..\..\..\..\..\..\..\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\arduino\cores\arduino\vector3.h) $(call FORMAT_PATH,.\ArduCopter_IMU_test_0.h)

LIBRARY_FILES := 

OBJ_FILES := $(addprefix $(DERIVED_PATH),$(addsuffix $(OBJ_EXT),$(basename $(notdir $(SOURCE_FILES)))))

SKIPPED_FILES := 

#Code Generation Information

COMPILER_CODEGEN_ARGS := -I"C:/Users/User/Desktop/Quadcopter/programmi/simulink/ArduCopter_IMU_test_0_rtt" -I"C:/Users/User/Desktop/Quadcopter/programmi/simulink" -I"C:/Program Files (x86)/MATLAB/R2014a/extern/include" -I"C:/Program Files (x86)/MATLAB/R2014a/simulink/include" -I"C:/Program Files (x86)/MATLAB/R2014a/rtw/c/src" -I"C:/Program Files (x86)/MATLAB/R2014a/rtw/c/src/ext_mode/common" -I"C:/Program Files (x86)/MATLAB/R2014a/rtw/c/ert" -I"C:/MATLAB/SupportPackages/R2014a/arduino-1.0.5/hardware/arduino/cores/arduino" -I"C:/MATLAB/SupportPackages/R2014a/arduino-1.0.5/hardware/arduino/variants/mega" -I"C:/MATLAB/SupportPackages/R2014a/arduino/include" -I"C:/MATLAB/SupportPackages/R2014a/arduino-1.0.5/libraries/Servo" -mmcu=atmega2560 -ffunction-sections -fdata-sections -std=gnu99 -Wall -Wstrict-prototypes -g -Os -D"MODEL=ArduCopter_IMU_test_0" -D"NUMST=1" -D"NCSTATES=0" -D"HAVESTDIO=" -D"ONESTEPFCN=0" -D"TERMFCN=1" -D"MAT_FILE=0" -D"MULTI_INSTANCE_CODE=0" -D"INTEGER_CODE=0" -D"MT=0" -D"CLASSIC_INTERFACE=0" -D"ALLOCATIONFCN=0" -D"TID01EQ=0" -D"F_CPU=16000000" -D"ARDUINO=105" -D"_RUNONTARGETHARDWARE_BUILD_=" -D"_ROTH_MEGA2560_=" -D"_RTT_NUMSERVOS_=0"

COMPILER_TCCFG_ARGS := -c -x none
COMPILER_ARGS := $(COMPILER_CODEGEN_ARGS) $(COMPILER_TCCFG_ARGS)

LINKER_CODEGEN_ARGS :=  -lm -mmcu=atmega2560 -g -Wl,--gc-sections 

LINKER_TCCFG_ARGS := -o $(TARGET)
LINKER_ARGS := $(LINKER_CODEGEN_ARGS) $(LINKER_TCCFG_ARGS)

PREBUILD_ARGS := 

POSTBUILD_ARGS := -O ihex -R .eeprom $(TARGET)  ArduCopter_IMU_test_0.hex

EXECUTE_ARGS := 



COMPILER ?= $(subst \,/,C:\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\tools\avr\bin\avr-gcc)

LINKER ?= $(subst \,/,C:\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\tools\avr\bin\avr-gcc)

PREBUILD_TOOL ?= 

POSTBUILD_TOOL ?= $(subst \,/,C:\MATLAB\SupportPackages\R2014a\arduino-1.0.5\hardware\tools\avr\bin\avr-objcopy)

EXECUTE_USES_TARGET = off
ifeq (on,$(EXECUTE_USES_TARGET))
 EXECUTE_TOOL ?= $(TARGET)
else
 EXECUTE_TOOL ?= 
endif
ifeq (windows,$(HOST_PLATFORM))
 RM ?= del /q
else
 RM ?= rm -f
endif
ifeq (windows,$(HOST_PLATFORM))
 MKDIR ?= mkdir
else
 MKDIR ?= mkdir -p
endif

#Targets
.DEFAULT_GOAL := all

.PHONY : all execute prebuild build postbuild info environment check clean

all : execute

ifneq (,$(strip $(EXECUTE_TOOL)))
execute : build
	$(info "Evaluating execute target")
	"$(EXECUTE_TOOL)" $(EXECUTE_ARGS)
else
execute : build
endif

ifneq (.a,$(strip $(TARGET_EXT)))
build : prebuild $(TARGET) $(TARGET_HEX)
	$(info "Evaluating build target")
else
build : prebuild $(TARGET)
	$(info "Evaluating build target")
endif

ifneq (,$(strip $(PREBUILD_TOOL)))
ifneq (.a,$(strip $(TARGET_EXT)))
prebuild : | $(OUTPUT_PATH) $(DERIVED_PATH)
	$(info "Evaluating prebuild target")
	"$(PREBUILD_TOOL)" $(PREBUILD_ARGS)
    else
prebuild : | $(OUTPUT_PATH) $(DERIVED_PATH)
    endif
else
prebuild : | $(OUTPUT_PATH) $(DERIVED_PATH)
endif

ifneq (,$(strip $(POSTBUILD_TOOL)))
ifneq (.a,$(strip $(TARGET_EXT)))
postbuild : $(TARGET)
	$(info "Evaluating postbuild target")
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
$(TARGET_HEX) : $(TARGET)
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
    else
postbuild : $(TARGET)
    endif
else
postbuild : $(TARGET)
endif

ifneq (,$(strip $(LINKER)))
ifneq (.a,$(strip $(TARGET_EXT)))
ifneq (,$(strip $(POSTBUILD_TOOL)))
$(TARGET) : $(OBJ_FILES) $(LIBRARY_FILES)
	"$(LINKER)" $(OBJ_FILES) $(LIBRARY_FILES) $(LINKER_ARGS)
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
else
$(TARGET) : $(OBJ_FILES) $(LIBRARY_FILES)
	"$(LINKER)" $(OBJ_FILES) $(LIBRARY_FILES) $(LINKER_ARGS)
endif
else
$(TARGET) : $(OBJ_FILES)
	"$(LINKER)" $(OBJ_FILES) $(LIBRARY_FILES) $(LINKER_ARGS)
endif

$(OBJ_FILES) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
else
ifneq (,$(strip $(POSTBUILD_TOOL)))
$(TARGET) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
else
$(TARGET) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
endif
endif

$(OUTPUT_PATH) :
ifeq (,$(wildcard $(OUTPUT_PATH)))
	@$(MKDIR) "$(OUTPUT_PATH)"
endif

$(DERIVED_PATH) :
ifeq (,$(wildcard $(DERIVED_PATH)))
	@$(MKDIR) "$(DERIVED_PATH)"
endif

clean :
	-@$(RM) $(TARGET) $(OBJ_FILES)

info : 
	$(info MODEL_NAME=$(MODEL_NAME))
	$(info HOST_PLATFORM=$(HOST_PLATFORM))
	$(info BUILD_CFG=$(BUILD_CFG))
	$(info TOOL_CHAIN_CFG=$(TOOL_CHAIN_CFG))
	$(info TARGET_EXT=$(TARGET_EXT))
	$(info OBJ_EXT=$(OBJ_EXT))
	$(info SOURCE_PATH=$(SOURCE_PATH))
	$(info OUTPUT_PATH=$(OUTPUT_PATH))
	$(info DERIVED_PATH=$(DERIVED_PATH))
	$(info TARGET_FILE=$(TARGET_FILE))
	$(info TARGET=$(TARGET))
	$(info COMPILER=$(COMPILER))
	$(info COMPILER_ARGS=$(COMPILER_ARGS))
	$(info COMPILER_CODEGEN_ARGS=$(COMPILER_CODEGEN_ARGS))
	$(info COMPILER_TCCFG_ARGS=$(COMPILER_TCCFG_ARGS))
	$(info LINKER=$(LINKER))
	$(info LINKER_ARGS=$(LINKER_ARGS))
	$(info LINKER_CODEGEN_ARGS=$(LINKER_CODEGEN_ARGS))
	$(info LINKER_TCCFG_ARGS=$(LINKER_TCCFG_ARGS))
	$(info PREBUILD_TOOL=$(PREBUILD_TOOL))
	$(info PREBUILD_ARGS=$(PREBUILD_ARGS))
	$(info POSTBUILD_TOOL=$(POSTBUILD_TOOL))
	$(info POSTBUILD_ARGS=$(POSTBUILD_ARGS))
	$(info EXECUTE_TOOL=$(EXECUTE_TOOL))
	$(info EXECUTE_ARGS=$(EXECUTE_ARGS))
	$(info SOURCE_FILES=$(SOURCE_FILES))
	$(info HEADER_FILES=$(HEADER_FILES))
	$(info LIBRARY_FILES=$(LIBRARY_FILES))
	$(info OBJ_FILES=$(OBJ_FILES))
	$(info SKIPPED_FILES=$(SKIPPED_FILES))
	$(info RM=$(RM))
	$(info MKDIR=$(MKDIR))

environment :
	$(if $(findstring windows,$(HOST_PLATFORM)),$(info ENVIRONMENT=$(shell set)),$(info ENVIRONMENT=$(shell env)))
