/*
 * File: ArduCopter_IMU_test_0_data.c
 *
 * Code generated for Simulink model 'ArduCopter_IMU_test_0'.
 *
 * Model version                  : 1.54
 * Simulink Coder version         : 8.6 (R2014a) 27-Dec-2013
 * TLC version                    : 8.6 (Jan 30 2014)
 * C/C++ source code generated on : Wed Sep 30 17:06:13 2020
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objective: Execution efficiency
 * Validation result: Not run
 */

#include "ArduCopter_IMU_test_0.h"
#include "ArduCopter_IMU_test_0_private.h"

/* Block parameters (auto storage) */
P_ArduCopter_IMU_test_0_T ArduCopter_IMU_test_0_P = {
  0.02,                                /* Mask Parameter: Clock_SampleTime
                                        * Referenced by: '<S3>/Clock'
                                        */
  0.02,                                /* Mask Parameter: RealTimeMonitor_SampleTime
                                        * Referenced by: '<S3>/Real Time Monitor'
                                        */
  0.02,                                /* Mask Parameter: uDOFIMU_SampleTime
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  -1.0,                                /* Mask Parameter: _SampleTime
                                        * Referenced by: '<S3>/ '
                                        */
  0.01745328888888889,                 /* Expression: 3.141592/180
                                        * Referenced by: '<S1>/degtorad'
                                        */
  9.81,                                /* Expression: 9.81
                                        * Referenced by: '<S1>/gtoms2'
                                        */
  1800.0,                              /* Expression: 1800
                                        * Referenced by: '<S2>/Switch1'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S4>/Constant1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S4>/Constant2'
                                        */
  57600,                               /* Expression: int32(baud)
                                        * Referenced by: '<S3>/ '
                                        */
  1,                                   /* Expression: int32(uart)
                                        * Referenced by: '<S3>/ '
                                        */
  20U,                                 /* Expression: uint32(lpf_filt_freq_hz)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  500U,                                /* Expression: uint32(gyro_scale)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  8U,                                  /* Expression: uint32(accel_scale)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  0,                                   /* Computed Parameter: Constant3_Value
                                        * Referenced by: '<S2>/Constant3'
                                        */
  0U,                                  /* Computed Parameter: Constant2_Value_l
                                        * Referenced by: '<S2>/Constant2'
                                        */
  1,                                   /* Computed Parameter: Constant1_Value_c
                                        * Referenced by: '<S2>/Constant1'
                                        */
  0,                                   /* Computed Parameter: Constant_Value
                                        * Referenced by: '<S2>/Constant'
                                        */
  0,                                   /* Computed Parameter: Switch3_Threshold
                                        * Referenced by: '<S4>/Switch3'
                                        */
  0,                                   /* Computed Parameter: Switch2_Threshold
                                        * Referenced by: '<S4>/Switch2'
                                        */
  0,                                   /* Computed Parameter: Switch_Threshold
                                        * Referenced by: '<S2>/Switch'
                                        */
  1U,                                  /* Computed Parameter: Off_Value
                                        * Referenced by: '<S5>/Off'
                                        */
  0U,                                  /* Computed Parameter: On_Value
                                        * Referenced by: '<S5>/On'
                                        */
  1U,                                  /* Computed Parameter: Off_Value_h
                                        * Referenced by: '<S6>/Off'
                                        */
  0U,                                  /* Computed Parameter: On_Value_o
                                        * Referenced by: '<S6>/On'
                                        */
  25U,                                 /* Expression: uint8(SParameter1)
                                        * Referenced by: '<S5>/Discrete Output'
                                        */
  27U                                  /* Expression: uint8(SParameter1)
                                        * Referenced by: '<S6>/Discrete Output'
                                        */
};

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
