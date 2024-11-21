/*
 * File: ArduCopter_IMU_test_0.c
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

/* Block signals (auto storage) */
B_ArduCopter_IMU_test_0_T ArduCopter_IMU_test_0_B;

/* Real-time model */
RT_MODEL_ArduCopter_IMU_test__T ArduCopter_IMU_test_0_M_;
RT_MODEL_ArduCopter_IMU_test__T *const ArduCopter_IMU_test_0_M =
  &ArduCopter_IMU_test_0_M_;

/* Model output function */
void ArduCopter_IMU_test_0_output(void)
{
  /* local block i/o variables */
  uint8_T rtb_Switch;
  int8_T rtb_safe;
  real_T rtb_safe_0;

  /* S-Function (Arduino_Clock_sfcn): '<S3>/Clock' */
  ArduCopter_IMU_test_0_B.Clock = timestats_get_millis();

  /* S-Function (Arduino_RealTimeMonitor_sfcn): '<S3>/Real Time Monitor' */

  /* Check sample time. Allow a 1 ms tolerance on check. */
  if (timestats_get_delta_ms() > (timestats_get_specified_frame_rate_ms()+1))
    ArduCopter_IMU_test_0_B.RealTimeMonitor = (boolean_T)0;
  else
    ArduCopter_IMU_test_0_B.RealTimeMonitor = (boolean_T)1;

  /* Reset timer */
  timestats_mark();

  /* S-Function (Arduino_IMU_sfcn): '<S1>/ 6-DOF IMU ' */
  float imu_accel[3];
  float imu_gyro[3];
  float imu_temp;

  /* Stop the baro chip from holding the SPI bus */
  pinMode(40, OUTPUT);
  digitalWrite(40, HIGH);
  imu_update();
  imu_get_gyros(imu_gyro);
  imu_get_accels(imu_accel);
  imu_temp = imu_temperature();

  /* Degrees per second */
  ArduCopter_IMU_test_0_B.gyro_p = imu_gyro[0];
  ArduCopter_IMU_test_0_B.gyro_q = imu_gyro[1];
  ArduCopter_IMU_test_0_B.gyro_r = imu_gyro[2];

  /* G's */
  ArduCopter_IMU_test_0_B.gyro_p_i = imu_accel[0];
  ArduCopter_IMU_test_0_B.gyro_q_n = imu_accel[1];
  ArduCopter_IMU_test_0_B.gyro_r_e = -imu_accel[2];

  /* Deg C */
  ArduCopter_IMU_test_0_B.temp = imu_temp;

  /* S-Function (Arduino_RCRead_sfcn): '<S2>/RC Read' */
  if (APM_RC_GetState()) {
    ArduCopter_IMU_test_0_B.RCRead_o1 = APM_RC_InputCh((uint16_T)0);
    ArduCopter_IMU_test_0_B.RCRead_o2 = APM_RC_InputCh((uint16_T)1);
    ArduCopter_IMU_test_0_B.RCRead_o3 = APM_RC_InputCh((uint16_T)2);
    ArduCopter_IMU_test_0_B.RCRead_o4 = APM_RC_InputCh((uint16_T)3);
    ArduCopter_IMU_test_0_B.RCRead_o5 = APM_RC_InputCh((uint16_T)4);
    ArduCopter_IMU_test_0_B.RCRead_o6 = APM_RC_InputCh((uint16_T)5);
    ArduCopter_IMU_test_0_B.RCRead_o7 = APM_RC_InputCh((uint16_T)6);
    ArduCopter_IMU_test_0_B.RCRead_o8 = APM_RC_InputCh((uint16_T)7);
  }

  /* Switch: '<S2>/Switch1' incorporates:
   *  Constant: '<S2>/Constant'
   *  Constant: '<S2>/Constant1'
   *  DataTypeConversion: '<S2>/Data Type Conversion1'
   */
  if (ArduCopter_IMU_test_0_B.RCRead_o5 >=
      ArduCopter_IMU_test_0_P.Switch1_Threshold) {
    rtb_safe = ArduCopter_IMU_test_0_P.Constant_Value;
  } else {
    rtb_safe = ArduCopter_IMU_test_0_P.Constant1_Value_c;
  }

  /* End of Switch: '<S2>/Switch1' */

  /* SignalConversion: '<S3>/TmpSignal ConversionAt Inport1' incorporates:
   *  DataTypeConversion: '<S2>/Data Type Conversion2'
   *  DataTypeConversion: '<S3>/Data Type Conversion'
   *  DataTypeConversion: '<S3>/Data Type Conversion1'
   *  DataTypeConversion: '<S3>/Data Type Conversion2'
   *  Gain: '<S1>/degtorad'
   *  Gain: '<S1>/gtoms2'
   */
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[0] =
    ArduCopter_IMU_test_0_B.Clock;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[1] =
    ArduCopter_IMU_test_0_B.RealTimeMonitor;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[2] =
    ArduCopter_IMU_test_0_P.degtorad_Gain * ArduCopter_IMU_test_0_B.gyro_p;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[3] =
    ArduCopter_IMU_test_0_P.degtorad_Gain * ArduCopter_IMU_test_0_B.gyro_q;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[4] =
    ArduCopter_IMU_test_0_P.degtorad_Gain * ArduCopter_IMU_test_0_B.gyro_r;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[5] =
    ArduCopter_IMU_test_0_P.gtoms2_Gain * ArduCopter_IMU_test_0_B.gyro_p_i;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[6] =
    ArduCopter_IMU_test_0_P.gtoms2_Gain * ArduCopter_IMU_test_0_B.gyro_q_n;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[7] =
    ArduCopter_IMU_test_0_P.gtoms2_Gain * ArduCopter_IMU_test_0_B.gyro_r_e;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[8] =
    ArduCopter_IMU_test_0_B.temp;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[9] =
    ArduCopter_IMU_test_0_B.RCRead_o1;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[10] =
    ArduCopter_IMU_test_0_B.RCRead_o2;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[11] =
    ArduCopter_IMU_test_0_B.RCRead_o3;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[12] =
    ArduCopter_IMU_test_0_B.RCRead_o4;
  ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[13] = rtb_safe;

  /* S-Function (sfunar_serialPrintFloats): '<S3>/ ' */
  Serial_printfloats( &ArduCopter_IMU_test_0_B.TmpSignalConversionAtInport1[0],
                     (int16_T)14);

  /* Switch: '<S4>/Switch3' incorporates:
   *  Constant: '<S4>/Constant1'
   *  Constant: '<S4>/Constant2'
   */
  if (rtb_safe > ArduCopter_IMU_test_0_P.Switch3_Threshold) {
    rtb_safe_0 = ArduCopter_IMU_test_0_P.Constant1_Value;
  } else {
    rtb_safe_0 = ArduCopter_IMU_test_0_P.Constant2_Value;
  }

  /* End of Switch: '<S4>/Switch3' */

  /* Switch: '<S5>/Switch' incorporates:
   *  Constant: '<S5>/Off'
   *  Constant: '<S5>/On'
   */
  if (rtb_safe_0 != 0.0) {
    rtb_Switch = ArduCopter_IMU_test_0_P.On_Value;
  } else {
    rtb_Switch = ArduCopter_IMU_test_0_P.Off_Value;
  }

  /* End of Switch: '<S5>/Switch' */

  /* S-Function (sfunar_digitalOutput): '<S5>/Discrete Output' */
  digitalWrite(ArduCopter_IMU_test_0_P.DiscreteOutput_p1, rtb_Switch);

  /* Switch: '<S4>/Switch2' incorporates:
   *  Constant: '<S4>/Constant1'
   *  Constant: '<S4>/Constant2'
   */
  if (rtb_safe > ArduCopter_IMU_test_0_P.Switch2_Threshold) {
    rtb_safe_0 = ArduCopter_IMU_test_0_P.Constant2_Value;
  } else {
    rtb_safe_0 = ArduCopter_IMU_test_0_P.Constant1_Value;
  }

  /* End of Switch: '<S4>/Switch2' */

  /* Switch: '<S6>/Switch' incorporates:
   *  Constant: '<S6>/Off'
   *  Constant: '<S6>/On'
   */
  if (rtb_safe_0 != 0.0) {
    rtb_Switch = ArduCopter_IMU_test_0_P.On_Value_o;
  } else {
    rtb_Switch = ArduCopter_IMU_test_0_P.Off_Value_h;
  }

  /* End of Switch: '<S6>/Switch' */

  /* S-Function (sfunar_digitalOutput): '<S6>/Discrete Output' */
  digitalWrite(ArduCopter_IMU_test_0_P.DiscreteOutput_p1_b, rtb_Switch);

  /* Switch: '<S2>/Switch' */
  if (rtb_safe > ArduCopter_IMU_test_0_P.Switch_Threshold) {
    ArduCopter_IMU_test_0_B.Switch[0] = ArduCopter_IMU_test_0_B.RCRead_o3;
    ArduCopter_IMU_test_0_B.Switch[1] = ArduCopter_IMU_test_0_B.RCRead_o3;
    ArduCopter_IMU_test_0_B.Switch[2] = ArduCopter_IMU_test_0_B.RCRead_o3;
    ArduCopter_IMU_test_0_B.Switch[3] = ArduCopter_IMU_test_0_B.RCRead_o3;
  } else {
    ArduCopter_IMU_test_0_B.Switch[0] = 0U;
    ArduCopter_IMU_test_0_B.Switch[1] = 0U;
    ArduCopter_IMU_test_0_B.Switch[2] = 0U;
    ArduCopter_IMU_test_0_B.Switch[3] = 0U;
  }

  /* End of Switch: '<S2>/Switch' */

  /* S-Function (Arduino_RCWrite_sfcn): '<S2>/RC Write' */
  APM_RC_OutputCh( (uint8_T)0, (uint16_T)ArduCopter_IMU_test_0_B.Switch[0]);
  APM_RC_OutputCh( (uint8_T)1, (uint16_T)ArduCopter_IMU_test_0_B.Switch[1]);
  APM_RC_OutputCh( (uint8_T)2, (uint16_T)ArduCopter_IMU_test_0_B.Switch[2]);
  APM_RC_OutputCh( (uint8_T)3, (uint16_T)ArduCopter_IMU_test_0_B.Switch[3]);
  APM_RC_OutputCh( (uint8_T)4, (uint16_T)ArduCopter_IMU_test_0_P.Constant3_Value);
  APM_RC_OutputCh( (uint8_T)5, (uint16_T)
                  ArduCopter_IMU_test_0_P.Constant2_Value_l);
  APM_RC_OutputCh( (uint8_T)6, (uint16_T)
                  ArduCopter_IMU_test_0_P.Constant2_Value_l);
  APM_RC_OutputCh( (uint8_T)7, (uint16_T)
                  ArduCopter_IMU_test_0_P.Constant2_Value_l);
}

/* Model update function */
void ArduCopter_IMU_test_0_update(void)
{
  /* (no update code required) */
}

/* Model initialize function */
void ArduCopter_IMU_test_0_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(ArduCopter_IMU_test_0_M, (NULL));

  /* block I/O */
  (void) memset(((void *) &ArduCopter_IMU_test_0_B), 0,
                sizeof(B_ArduCopter_IMU_test_0_T));

  /* Start for S-Function (Arduino_Clock_sfcn): '<S3>/Clock' */

  /* APM2 System startup function. Required for any blocks. Inserted by:
     S-Function (Arduino_Clock_sfcn): <S3>/Clock */
  Simulink_APM2_Startup();

  /* S-Function (Arduino_Clock_sfcn): <S3>/Clock */

  /* Nothing to do for Clock block */

  /* S-Function (Arduino_RealTimeMonitor_sfcn): <S3>/Real Time Monitor */
  timestats_set_specified_frame_rate_ms((uint32_t)(0.02 * 1000));
  timestats_mark();

  /* S-Function (Arduino_IMU_sfcn): <S1>/ 6-DOF IMU  */

  /* Start up the IMU - Calibrated */
  imu_init(20U,500U,8U);

  /* S-Function (Arduino_RCRead_sfcn): <S2>/RC Read */

  /* All init handled in System setup function */

  /* Start for S-Function (sfunar_serialPrintFloats): '<S3>/ ' */

  /* Using UART0 */
  Serial_begin(57600);

  /* S-Function (sfunar_digitalOutput): <S5>/Discrete Output */
  pinMode(ArduCopter_IMU_test_0_P.DiscreteOutput_p1, OUTPUT);

  /* S-Function (sfunar_digitalOutput): <S6>/Discrete Output */
  pinMode(ArduCopter_IMU_test_0_P.DiscreteOutput_p1_b, OUTPUT);

  /* S-Function (Arduino_RCWrite_sfcn): <S2>/RC Write */

  /* All of init handled in the System setup function */
}

/* Model terminate function */
void ArduCopter_IMU_test_0_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
