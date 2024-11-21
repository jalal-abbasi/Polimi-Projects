/*
 * File: ert_main.c
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
#include "Arduino.h"
#define STEP_SIZE                      (unsigned long) (20000)

int_T main(void)
{
  unsigned long oldtime = 0L;
  unsigned long actualtime;
  init();
  ArduCopter_IMU_test_0_initialize();

  /* This pin indicates the base rate overrun */
  pinMode(26, OUTPUT);
  digitalWrite(26, 0);

#ifdef _RTT_USE_SERIAL0_

  Serial_begin(0, 115200);

#endif

#ifdef _RTT_USE_SERIAL1_

  Serial_begin(1, 115200);

#endif

#ifdef _RTT_USE_SERIAL2_

  Serial_begin(2, 115200);

#endif

#ifdef _RTT_USE_SERIAL3_

  Serial_begin(3, 115200);

#endif

  /* The main step loop */
  while (rtmGetErrorStatus(ArduCopter_IMU_test_0_M) == (NULL)) {
    actualtime = micros();
    if ((unsigned long) (actualtime - oldtime) >= STEP_SIZE) {
      oldtime = actualtime;
      ArduCopter_IMU_test_0_output();

      /* Get model outputs here */
      ArduCopter_IMU_test_0_update();

      /* Check for overrun */
      if ((unsigned long) (micros() - oldtime) > STEP_SIZE) {
        digitalWrite(26, 1);
      }
    }
  }

  ArduCopter_IMU_test_0_terminate();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
