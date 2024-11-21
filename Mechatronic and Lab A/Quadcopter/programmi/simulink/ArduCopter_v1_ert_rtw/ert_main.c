/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: ert_main.c
 *
 * Code generated for Simulink model 'ArduCopter_v1'.
 *
 * Model version                  : 1.52
 * Simulink Coder version         : 8.9 (R2015b) 13-Aug-2015
 * C/C++ source code generated on : Mon Oct 05 16:58:32 2015
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ArduCopter_v1.h"
#include "rtwtypes.h"

volatile int IsrOverrun = 0;
static boolean_T OverrunFlag = 0;
void rt_OneStep(void)
{
  /* Check for overrun. Protect OverrunFlag against preemption */
  if (OverrunFlag++) {
    IsrOverrun = 1;
    OverrunFlag--;
    return;
  }

  sei();
  ArduCopter_v1_step();

  /* Get model outputs here */
  cli();
  OverrunFlag--;
}

int main(void)
{
  volatile boolean_T runModel = 1;
  float modelBaseRate = 0.02;
  float systemClock = 0;
  init();
  MW_Arduino_Init();
  rtmSetErrorStatus(ArduCopter_v1_M, 0);
  ArduCopter_v1_initialize();
  configureArduinoAVRTimer();
  runModel =
    rtmGetErrorStatus(ArduCopter_v1_M) == (NULL);
  sei();
  sei();
  while (runModel) {
    runModel =
      rtmGetErrorStatus(ArduCopter_v1_M) == (NULL);
  }

  /* Disable rt_OneStep() here */

  /* Terminate model */
  ArduCopter_v1_terminate();
  cli();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
