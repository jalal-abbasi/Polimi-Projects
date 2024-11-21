/*
 * File: ArduCopter_IMU_test_0.h
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

#ifndef RTW_HEADER_ArduCopter_IMU_test_0_h_
#define RTW_HEADER_ArduCopter_IMU_test_0_h_
#include <stddef.h>
#include <string.h>
#ifndef ArduCopter_IMU_test_0_COMMON_INCLUDES_
# define ArduCopter_IMU_test_0_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "Simulink_APM2_Wrapper.h"
#endif                                 /* ArduCopter_IMU_test_0_COMMON_INCLUDES_ */

#include "ArduCopter_IMU_test_0_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T gyro_p;                       /* '<S1>/ 6-DOF IMU ' */
  real_T gyro_q;                       /* '<S1>/ 6-DOF IMU ' */
  real_T gyro_r;                       /* '<S1>/ 6-DOF IMU ' */
  real_T gyro_p_i;                     /* '<S1>/ 6-DOF IMU ' */
  real_T gyro_q_n;                     /* '<S1>/ 6-DOF IMU ' */
  real_T gyro_r_e;                     /* '<S1>/ 6-DOF IMU ' */
  real_T temp;                         /* '<S1>/ 6-DOF IMU ' */
  real_T TmpSignalConversionAtInport1[14];
  uint32_T Clock;                      /* '<S3>/Clock' */
  uint16_T RCRead_o1;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o2;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o3;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o4;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o5;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o6;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o7;                  /* '<S2>/RC Read' */
  uint16_T RCRead_o8;                  /* '<S2>/RC Read' */
  uint16_T Switch[4];                  /* '<S2>/Switch' */
  uint16_T RCWrite_o1;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o2;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o3;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o4;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o5;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o6;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o7;                 /* '<S2>/RC Write' */
  uint16_T RCWrite_o8;                 /* '<S2>/RC Write' */
  boolean_T RealTimeMonitor;           /* '<S3>/Real Time Monitor' */
} B_ArduCopter_IMU_test_0_T;

/* Parameters (auto storage) */
struct P_ArduCopter_IMU_test_0_T_ {
  real_T Clock_SampleTime;             /* Mask Parameter: Clock_SampleTime
                                        * Referenced by: '<S3>/Clock'
                                        */
  real_T RealTimeMonitor_SampleTime;   /* Mask Parameter: RealTimeMonitor_SampleTime
                                        * Referenced by: '<S3>/Real Time Monitor'
                                        */
  real_T uDOFIMU_SampleTime;           /* Mask Parameter: uDOFIMU_SampleTime
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  real_T _SampleTime;                  /* Mask Parameter: _SampleTime
                                        * Referenced by: '<S3>/ '
                                        */
  real_T degtorad_Gain;                /* Expression: 3.141592/180
                                        * Referenced by: '<S1>/degtorad'
                                        */
  real_T gtoms2_Gain;                  /* Expression: 9.81
                                        * Referenced by: '<S1>/gtoms2'
                                        */
  real_T Switch1_Threshold;            /* Expression: 1800
                                        * Referenced by: '<S2>/Switch1'
                                        */
  real_T Constant1_Value;              /* Expression: 1
                                        * Referenced by: '<S4>/Constant1'
                                        */
  real_T Constant2_Value;              /* Expression: 0
                                        * Referenced by: '<S4>/Constant2'
                                        */
  int32_T _baud;                       /* Expression: int32(baud)
                                        * Referenced by: '<S3>/ '
                                        */
  int32_T _uart;                       /* Expression: int32(uart)
                                        * Referenced by: '<S3>/ '
                                        */
  uint32_T uDOFIMU_lpf_filt_freq_hz;   /* Expression: uint32(lpf_filt_freq_hz)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  uint32_T uDOFIMU_gyro_scale;         /* Expression: uint32(gyro_scale)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  uint32_T uDOFIMU_accel_scale;        /* Expression: uint32(accel_scale)
                                        * Referenced by: '<S1>/ 6-DOF IMU '
                                        */
  int16_T Constant3_Value;             /* Computed Parameter: Constant3_Value
                                        * Referenced by: '<S2>/Constant3'
                                        */
  uint16_T Constant2_Value_l;          /* Computed Parameter: Constant2_Value_l
                                        * Referenced by: '<S2>/Constant2'
                                        */
  int8_T Constant1_Value_c;            /* Computed Parameter: Constant1_Value_c
                                        * Referenced by: '<S2>/Constant1'
                                        */
  int8_T Constant_Value;               /* Computed Parameter: Constant_Value
                                        * Referenced by: '<S2>/Constant'
                                        */
  int8_T Switch3_Threshold;            /* Computed Parameter: Switch3_Threshold
                                        * Referenced by: '<S4>/Switch3'
                                        */
  int8_T Switch2_Threshold;            /* Computed Parameter: Switch2_Threshold
                                        * Referenced by: '<S4>/Switch2'
                                        */
  int8_T Switch_Threshold;             /* Computed Parameter: Switch_Threshold
                                        * Referenced by: '<S2>/Switch'
                                        */
  uint8_T Off_Value;                   /* Computed Parameter: Off_Value
                                        * Referenced by: '<S5>/Off'
                                        */
  uint8_T On_Value;                    /* Computed Parameter: On_Value
                                        * Referenced by: '<S5>/On'
                                        */
  uint8_T Off_Value_h;                 /* Computed Parameter: Off_Value_h
                                        * Referenced by: '<S6>/Off'
                                        */
  uint8_T On_Value_o;                  /* Computed Parameter: On_Value_o
                                        * Referenced by: '<S6>/On'
                                        */
  uint8_T DiscreteOutput_p1;           /* Expression: uint8(SParameter1)
                                        * Referenced by: '<S5>/Discrete Output'
                                        */
  uint8_T DiscreteOutput_p1_b;         /* Expression: uint8(SParameter1)
                                        * Referenced by: '<S6>/Discrete Output'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_ArduCopter_IMU_test_0_T {
  const char_T * volatile errorStatus;
};

/* Block parameters (auto storage) */
extern P_ArduCopter_IMU_test_0_T ArduCopter_IMU_test_0_P;

/* Block signals (auto storage) */
extern B_ArduCopter_IMU_test_0_T ArduCopter_IMU_test_0_B;

/* Model entry point functions */
extern void ArduCopter_IMU_test_0_initialize(void);
extern void ArduCopter_IMU_test_0_output(void);
extern void ArduCopter_IMU_test_0_update(void);
extern void ArduCopter_IMU_test_0_terminate(void);

/* Real-time Model object */
extern RT_MODEL_ArduCopter_IMU_test__T *const ArduCopter_IMU_test_0_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ArduCopter_IMU_test_0'
 * '<S1>'   : 'ArduCopter_IMU_test_0/IMU SENSORS '
 * '<S2>'   : 'ArduCopter_IMU_test_0/MOTORS '
 * '<S3>'   : 'ArduCopter_IMU_test_0/SERIAL PRINT '
 * '<S4>'   : 'ArduCopter_IMU_test_0/MOTORS /safe_Led'
 * '<S5>'   : 'ArduCopter_IMU_test_0/MOTORS /safe_Led/LED Blue'
 * '<S6>'   : 'ArduCopter_IMU_test_0/MOTORS /safe_Led/LED Red'
 */
#endif                                 /* RTW_HEADER_ArduCopter_IMU_test_0_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
