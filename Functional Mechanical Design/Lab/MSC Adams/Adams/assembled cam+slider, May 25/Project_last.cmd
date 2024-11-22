!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.amachinery
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Project_last
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Project_last.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Project_last.ground.Cam_profile_2_ref_marker  &
   adams_id = 62  &
   location = 600.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.ground.mar_follower_1_1_cont  &
   adams_id = 63  &
   location = 500.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.ground.follower_1_1_spring_attach_j  &
   adams_id = 64  &
   location = 325.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Project_last.ground.follower_1_1_spring_attach_j  &
   name_visibility = off
!
marker create  &
   marker_name = .Project_last.ground.follower_1_1_fol_attach_j  &
   adams_id = 65  &
   location = 400.0, 150.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .Project_last.ground.follower_1_1_fol_attach_j  &
   name_visibility = off
!
marker create  &
   marker_name = .Project_last.ground.follower_1_1_cam_attach_j  &
   adams_id = 66  &
   location = 600.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Project_last.ground.follower_1_1_cam_attach_j  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .Project_last.ground.MARKER_98  &
   adams_id = 98  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.ground.MARKER_86  &
   adams_id = 86  &
   location = 600.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.ground.MARKER_94  &
   adams_id = 94  &
   location = 325.0, 150.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Project_last.ground  &
   material_type = .Project_last.steel
!
part attributes  &
   part_name = .Project_last.ground  &
   name_visibility = off
!
!----------------------------------- crank ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
part create rigid_body name_and_position  &
   part_name = .Project_last.crank  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.crank
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Project_last.crank.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 55.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_2  &
   adams_id = 2  &
   location = 58.2409513471, 83.1766985771, 0.0  &
   orientation = 63.4349488229d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.crank.cm  &
   adams_id = 29  &
   location = 29.1204756735, 41.5883492886, 0.0  &
   orientation = 145.0d, 89.9999999828d, 89.9999999297d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_109  &
   adams_id = 109  &
   location = 58.2409513471, 83.1766985771, 0.0  &
   orientation = 145.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_97  &
   adams_id = 97  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_18  &
   adams_id = 18  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Project_last.crank  &
   material_type = .Project_last.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Project_last.crank.LINK_1  &
   i_marker = .Project_last.crank.MARKER_1  &
   j_marker = .Project_last.crank.MARKER_2  &
   width = 40.0  &
   depth = 20.0
!
part attributes  &
   part_name = .Project_last.crank  &
   color = GREEN  &
   name_visibility = off
!
!---------------------------------- coupler -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
part create rigid_body name_and_position  &
   part_name = .Project_last.coupler  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.coupler
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_3  &
   adams_id = 3  &
   location = 58.2409513471, 83.1766985771, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_4  &
   adams_id = 4  &
   location = 251.2409513471, 83.1766985771, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.cm  &
   adams_id = 30  &
   location = 154.7409513471, 83.1766985771, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_108  &
   adams_id = 108  &
   location = 58.2409513471, 83.1766985771, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_107  &
   adams_id = 107  &
   location = 251.2409513471, 83.1766985771, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Project_last.coupler  &
   material_type = .Project_last.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Project_last.coupler.LINK_2  &
   i_marker = .Project_last.coupler.MARKER_3  &
   j_marker = .Project_last.coupler.MARKER_4  &
   width = 40.0  &
   depth = 20.0
!
part attributes  &
   part_name = .Project_last.coupler  &
   color = MAIZE  &
   name_visibility = off
!
!----------------------------------- PART_5 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
part create rigid_body name_and_position  &
   part_name = .Project_last.PART_5  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.PART_5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Project_last.PART_5.MARKER_16  &
   adams_id = 16  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.PART_5.cm  &
   adams_id = 48  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.PART_5.MARKER_17  &
   adams_id = 17  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Project_last.PART_5  &
   mass = 2.0913121528E-03  &
   center_of_mass_marker = .Project_last.PART_5.cm  &
   ixx = 1.1E+06  &
   iyy = 1.1E+06  &
   izz = 1.1E+06  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape ellipsoid  &
   ellipsoid_name = .Project_last.PART_5.ELLIPSOID_17  &
   adams_id = 8  &
   center_marker = .Project_last.PART_5.MARKER_16  &
   x_scale_factor = 8.0  &
   y_scale_factor = 8.0  &
   z_scale_factor = 8.0
!
part attributes  &
   part_name = .Project_last.PART_5  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint hooke  &
   joint_name = .Project_last.Hooke_Crank_Coupler  &
   adams_id = 23  &
   i_marker_name = .Project_last.coupler.MARKER_108  &
   j_marker_name = .Project_last.crank.MARKER_109
!
constraint attributes  &
   constraint_name = .Project_last.Hooke_Crank_Coupler  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Project_last.rotation_crank_ground  &
   adams_id = 20  &
   i_marker_name = .Project_last.crank.MARKER_97  &
   j_marker_name = .Project_last.ground.MARKER_98
!
constraint attributes  &
   constraint_name = .Project_last.rotation_crank_ground  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Project_last.fixed_tilting_crank  &
   adams_id = 4  &
   i_marker_name = .Project_last.PART_5.MARKER_17  &
   j_marker_name = .Project_last.crank.MARKER_18
!
constraint attributes  &
   constraint_name = .Project_last.fixed_tilting_crank  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Project_last.Last_Sim  &
   commands =   &
              "simulation single_run transient type=kinematic initial_static=no end_time=2.0 number_of_steps=500 model_name=.Project_last"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .Project_last.Follower_Motion_1  &
   definition_name = .amachinery.parts.Follower_Motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Project_last.follower_1_1  &
   definition_name = .amachinery.parts.follower  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Project_last.cam_sys_1  &
   definition_name = .amachinery.parts.cam_sys  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Project_last.Cam_profile_2  &
   definition_name = .amachinery.parts.cam_profile  &
   location = 600.0, 150.0, 0.0  &
   orientation = 90.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.follower_motion_name  &
   string_value = ".Project_last.Follower_Motion_1"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.motion_type  &
   string_value = "angle"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.methods  &
   string_value = "import"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.follower_displacement  &
   string_value = "translation"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_num  &
   integer_value = 6
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_1_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      0.0,  &
      1.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_2_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      1.0,  &
      2.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_3_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      2.0,  &
      3.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_4_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      3.0,  &
      4.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_5_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      4.0,  &
      5.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_6_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_7_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_8_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_9_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_10_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_11_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_12_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_13_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_14_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_15_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_16_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_17_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_18_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_19_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_20_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_21_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      1.0,  &
      1.0,  &
      2.0,  &
      5.0,  &
      6.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.function_type  &
   string_value =   &
      "step",  &
      "shf",  &
      "poly",  &
      "const",  &
      "const",  &
      "const"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.import_spl_file  &
   string_value = "C:/Users/marta/Desktop/magistrale/secondo anno/functional/progetto/ADAMS_project/motion_law.csv"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.one_cycle_duration  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.func_spl_x  &
   real_value =   &
      0.0,  &
      1.445783133,  &
      2.891566265,  &
      4.337349398,  &
      5.78313253,  &
      7.228915663,  &
      8.674698795,  &
      10.12048193,  &
      11.56626506,  &
      13.01204819,  &
      14.45783133,  &
      15.90361446,  &
      17.34939759,  &
      18.79518072,  &
      20.24096386,  &
      21.68674699,  &
      23.13253012,  &
      24.57831325,  &
      26.02409639,  &
      27.46987952,  &
      28.91566265,  &
      30.36144578,  &
      31.80722892,  &
      33.25301205,  &
      34.69879518,  &
      36.14457831,  &
      37.59036145,  &
      39.03614458,  &
      40.48192771,  &
      41.92771084,  &
      43.37349398,  &
      44.81927711,  &
      46.26506024,  &
      47.71084337,  &
      49.15662651,  &
      50.60240964,  &
      52.04819277,  &
      53.4939759,  &
      54.93975904,  &
      56.38554217,  &
      57.8313253,  &
      59.27710843,  &
      60.72289157,  &
      62.1686747,  &
      63.61445783,  &
      65.06024096,  &
      66.5060241,  &
      67.95180723,  &
      69.39759036,  &
      70.84337349,  &
      72.28915663,  &
      73.73493976,  &
      75.18072289,  &
      76.62650602,  &
      78.07228916,  &
      79.51807229,  &
      80.96385542,  &
      82.40963855,  &
      83.85542169,  &
      85.30120482,  &
      86.74698795,  &
      88.19277108,  &
      89.63855422,  &
      91.08433735,  &
      92.53012048,  &
      93.97590361,  &
      95.42168675,  &
      96.86746988,  &
      98.31325301,  &
      99.75903614,  &
      101.2048193,  &
      102.6506024,  &
      104.0963855,  &
      105.5421687,  &
      106.9879518,  &
      108.4337349,  &
      109.8795181,  &
      111.3253012,  &
      112.7710843,  &
      114.2168675,  &
      115.6626506,  &
      117.1084337,  &
      118.5542169,  &
      120.0,  &
      121.4457831,  &
      122.8915663,  &
      124.3373494,  &
      125.7831325,  &
      127.2289157,  &
      128.6746988,  &
      130.1204819,  &
      131.5662651,  &
      133.0120482,  &
      134.4578313,  &
      135.9036145,  &
      137.3493976,  &
      138.7951807,  &
      140.2409639,  &
      141.686747,  &
      143.1325301,  &
      144.5783133,  &
      146.0240964,  &
      147.4698795,  &
      148.9156627,  &
      150.3614458,  &
      151.8072289,  &
      153.253012,  &
      154.6987952,  &
      156.1445783,  &
      157.5903614,  &
      159.0361446,  &
      160.4819277,  &
      161.9277108,  &
      163.373494,  &
      164.8192771,  &
      166.2650602,  &
      167.7108434,  &
      169.1566265,  &
      170.6024096,  &
      172.0481928,  &
      173.4939759,  &
      174.939759,  &
      176.3855422,  &
      177.8313253,  &
      179.2771084,  &
      180.7228916,  &
      182.1686747,  &
      183.6144578,  &
      185.060241,  &
      186.5060241,  &
      187.9518072,  &
      189.3975904,  &
      190.8433735,  &
      192.2891566,  &
      193.7349398,  &
      195.1807229,  &
      196.626506,  &
      198.0722892,  &
      199.5180723,  &
      200.9638554,  &
      202.4096386,  &
      203.8554217,  &
      205.3012048,  &
      206.746988,  &
      208.1927711,  &
      209.6385542,  &
      211.0843373,  &
      212.5301205,  &
      213.9759036,  &
      215.4216867,  &
      216.8674699,  &
      218.313253,  &
      219.7590361,  &
      221.2048193,  &
      222.6506024,  &
      224.0963855,  &
      225.5421687,  &
      226.9879518,  &
      228.4337349,  &
      229.8795181,  &
      231.3253012,  &
      232.7710843,  &
      234.2168675,  &
      235.6626506,  &
      237.1084337,  &
      238.5542169,  &
      240.0,  &
      241.4457831,  &
      242.8915663,  &
      244.3373494,  &
      245.7831325,  &
      247.2289157,  &
      248.6746988,  &
      250.1204819,  &
      251.5662651,  &
      253.0120482,  &
      254.4578313,  &
      255.9036145,  &
      257.3493976,  &
      258.7951807,  &
      260.2409639,  &
      261.686747,  &
      263.1325301,  &
      264.5783133,  &
      266.0240964,  &
      267.4698795,  &
      268.9156627,  &
      270.3614458,  &
      271.8072289,  &
      273.253012,  &
      274.6987952,  &
      276.1445783,  &
      277.5903614,  &
      279.0361446,  &
      280.4819277,  &
      281.9277108,  &
      283.373494,  &
      284.8192771,  &
      286.2650602,  &
      287.7108434,  &
      289.1566265,  &
      290.6024096,  &
      292.0481928,  &
      293.4939759,  &
      294.939759,  &
      296.3855422,  &
      297.8313253,  &
      299.2771084,  &
      300.7228916,  &
      302.1686747,  &
      303.6144578,  &
      305.060241,  &
      306.5060241,  &
      307.9518072,  &
      309.3975904,  &
      310.8433735,  &
      312.2891566,  &
      313.7349398,  &
      315.1807229,  &
      316.626506,  &
      318.0722892,  &
      319.5180723,  &
      320.9638554,  &
      322.4096386,  &
      323.8554217,  &
      325.3012048,  &
      326.746988,  &
      328.1927711,  &
      329.6385542,  &
      331.0843373,  &
      332.5301205,  &
      333.9759036,  &
      335.4216867,  &
      336.8674699,  &
      338.313253,  &
      339.7590361,  &
      341.2048193,  &
      342.6506024,  &
      344.0963855,  &
      345.5421687,  &
      346.9879518,  &
      348.4337349,  &
      349.8795181,  &
      351.3253012,  &
      352.7710843,  &
      354.2168675,  &
      355.6626506,  &
      357.1084337,  &
      358.5542169,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.jerk_x  &
   real_value =   &
      0.0,  &
      1.445783133,  &
      2.891566265,  &
      4.337349398,  &
      5.78313253,  &
      7.228915663,  &
      8.674698795,  &
      10.12048193,  &
      11.56626506,  &
      13.01204819,  &
      14.45783133,  &
      15.90361446,  &
      17.34939759,  &
      18.79518072,  &
      20.24096386,  &
      21.68674699,  &
      23.13253012,  &
      24.57831325,  &
      26.02409639,  &
      27.46987952,  &
      28.91566265,  &
      30.36144578,  &
      31.80722892,  &
      33.25301205,  &
      34.69879518,  &
      36.14457831,  &
      37.59036145,  &
      39.03614458,  &
      40.48192771,  &
      41.92771084,  &
      43.37349398,  &
      44.81927711,  &
      46.26506024,  &
      47.71084337,  &
      49.15662651,  &
      50.60240964,  &
      52.04819277,  &
      53.4939759,  &
      54.93975904,  &
      56.38554217,  &
      57.8313253,  &
      59.27710843,  &
      60.72289157,  &
      62.1686747,  &
      63.61445783,  &
      65.06024096,  &
      66.5060241,  &
      67.95180723,  &
      69.39759036,  &
      70.84337349,  &
      72.28915663,  &
      73.73493976,  &
      75.18072289,  &
      76.62650602,  &
      78.07228916,  &
      79.51807229,  &
      80.96385542,  &
      82.40963855,  &
      83.85542169,  &
      85.30120482,  &
      86.74698795,  &
      88.19277108,  &
      89.63855422,  &
      91.08433735,  &
      92.53012048,  &
      93.97590361,  &
      95.42168675,  &
      96.86746988,  &
      98.31325301,  &
      99.75903614,  &
      101.2048193,  &
      102.6506024,  &
      104.0963855,  &
      105.5421687,  &
      106.9879518,  &
      108.4337349,  &
      109.8795181,  &
      111.3253012,  &
      112.7710843,  &
      114.2168675,  &
      115.6626506,  &
      117.1084337,  &
      118.5542169,  &
      120.0,  &
      121.4457831,  &
      122.8915663,  &
      124.3373494,  &
      125.7831325,  &
      127.2289157,  &
      128.6746988,  &
      130.1204819,  &
      131.5662651,  &
      133.0120482,  &
      134.4578313,  &
      135.9036145,  &
      137.3493976,  &
      138.7951807,  &
      140.2409639,  &
      141.686747,  &
      143.1325301,  &
      144.5783133,  &
      146.0240964,  &
      147.4698795,  &
      148.9156627,  &
      150.3614458,  &
      151.8072289,  &
      153.253012,  &
      154.6987952,  &
      156.1445783,  &
      157.5903614,  &
      159.0361446,  &
      160.4819277,  &
      161.9277108,  &
      163.373494,  &
      164.8192771,  &
      166.2650602,  &
      167.7108434,  &
      169.1566265,  &
      170.6024096,  &
      172.0481928,  &
      173.4939759,  &
      174.939759,  &
      176.3855422,  &
      177.8313253,  &
      179.2771084,  &
      180.7228916,  &
      182.1686747,  &
      183.6144578,  &
      185.060241,  &
      186.5060241,  &
      187.9518072,  &
      189.3975904,  &
      190.8433735,  &
      192.2891566,  &
      193.7349398,  &
      195.1807229,  &
      196.626506,  &
      198.0722892,  &
      199.5180723,  &
      200.9638554,  &
      202.4096386,  &
      203.8554217,  &
      205.3012048,  &
      206.746988,  &
      208.1927711,  &
      209.6385542,  &
      211.0843373,  &
      212.5301205,  &
      213.9759036,  &
      215.4216867,  &
      216.8674699,  &
      218.313253,  &
      219.7590361,  &
      221.2048193,  &
      222.6506024,  &
      224.0963855,  &
      225.5421687,  &
      226.9879518,  &
      228.4337349,  &
      229.8795181,  &
      231.3253012,  &
      232.7710843,  &
      234.2168675,  &
      235.6626506,  &
      237.1084337,  &
      238.5542169,  &
      240.0,  &
      241.4457831,  &
      242.8915663,  &
      244.3373494,  &
      245.7831325,  &
      247.2289157,  &
      248.6746988,  &
      250.1204819,  &
      251.5662651,  &
      253.0120482,  &
      254.4578313,  &
      255.9036145,  &
      257.3493976,  &
      258.7951807,  &
      260.2409639,  &
      261.686747,  &
      263.1325301,  &
      264.5783133,  &
      266.0240964,  &
      267.4698795,  &
      268.9156627,  &
      270.3614458,  &
      271.8072289,  &
      273.253012,  &
      274.6987952,  &
      276.1445783,  &
      277.5903614,  &
      279.0361446,  &
      280.4819277,  &
      281.9277108,  &
      283.373494,  &
      284.8192771,  &
      286.2650602,  &
      287.7108434,  &
      289.1566265,  &
      290.6024096,  &
      292.0481928,  &
      293.4939759,  &
      294.939759,  &
      296.3855422,  &
      297.8313253,  &
      299.2771084,  &
      300.7228916,  &
      302.1686747,  &
      303.6144578,  &
      305.060241,  &
      306.5060241,  &
      307.9518072,  &
      309.3975904,  &
      310.8433735,  &
      312.2891566,  &
      313.7349398,  &
      315.1807229,  &
      316.626506,  &
      318.0722892,  &
      319.5180723,  &
      320.9638554,  &
      322.4096386,  &
      323.8554217,  &
      325.3012048,  &
      326.746988,  &
      328.1927711,  &
      329.6385542,  &
      331.0843373,  &
      332.5301205,  &
      333.9759036,  &
      335.4216867,  &
      336.8674699,  &
      338.313253,  &
      339.7590361,  &
      341.2048193,  &
      342.6506024,  &
      344.0963855,  &
      345.5421687,  &
      346.9879518,  &
      348.4337349,  &
      349.8795181,  &
      351.3253012,  &
      352.7710843,  &
      354.2168675,  &
      355.6626506,  &
      357.1084337,  &
      358.5542169,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.jerk_y  &
   real_value =   &
      4.0929375562E+04,  &
      -1026.6733505936,  &
      -3.8352237695E+04,  &
      1.6208340145E+05,  &
      5.5323588079E+05,  &
      6.8422389636E+05,  &
      6.8825392811E+05,  &
      7.5785605291E+05,  &
      6.8740838597E+05,  &
      3.2348186999E+05,  &
      4.6310226787E+04,  &
      2.0322434153E+05,  &
      2.7760411564E+04,  &
      -4.8993308775E+05,  &
      -6.2741820109E+05,  &
      -5.9622206487E+05,  &
      -6.7004651798E+05,  &
      -7.6870926176E+05,  &
      -5.549296508E+05,  &
      -1.2692305808E+05,  &
      2.2680142841E+04,  &
      -1.6033151523E+04,  &
      -1.5826053386E+04,  &
      -1.2454958827E+04,  &
      -1.7307095798E+04,  &
      -1.6463407781E+04,  &
      -1.850182316E+04,  &
      -1.8574876251E+04,  &
      -2.2801371427E+04,  &
      -1.7750620422E+04,  &
      -2.7596872678E+04,  &
      -2.772588535E+04,  &
      2.2629406089E+04,  &
      -2.2010704875E+05,  &
      -6.9057648313E+05,  &
      -8.4817925721E+05,  &
      -7.3513323655E+05,  &
      -8.0281144781E+05,  &
      -8.897343393E+05,  &
      -3.8210262807E+05,  &
      1.357417595E+05,  &
      1.2514546256E+04,  &
      -6.2071886815E+04,  &
      4.8319205358E+05,  &
      9.2724251474E+05,  &
      7.7140606198E+05,  &
      7.0373193772E+05,  &
      8.1758636984E+05,  &
      5.9049071312E+05,  &
      1.295609852E+05,  &
      -4.725107105E+04,  &
      5913.6401530909,  &
      2931.2780376119,  &
      -2721.0307703457,  &
      1442.1591715792,  &
      -629.5840949562,  &
      247.80941972,  &
      -91.3387827987,  &
      32.1585792485,  &
      -10.9444368753,  &
      3.6281778505,  &
      -1.1778394255,  &
      0.3758768564,  &
      -0.1182509762,  &
      3.6754669331E-02,  &
      -1.1306113821E-02,  &
      3.446691497E-03,  &
      -1.0424694146E-03,  &
      3.131082994E-04,  &
      -9.3460596013E-05,  &
      2.7742489663E-05,  &
      -8.1937684978E-06,  &
      2.4090615506E-06,  &
      -7.0536692082E-07,  &
      2.0574977253E-07,  &
      -5.980749831E-08,  &
      1.7329377149E-08,  &
      -5.0064131487E-09,  &
      1.4423827683E-09,  &
      -4.1450367892E-10,  &
      1.1883531757E-10,  &
      -3.3993796024E-11,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      1.6906761501E-11,  &
      -5.8909711877E-11,  &
      2.0476425348E-10,  &
      -7.0987899142E-10,  &
      2.454090639E-09,  &
      -8.4581564185E-09,  &
      2.9055646904E-08,  &
      -9.9456185862E-08,  &
      3.3910909533E-07,  &
      -1.1513141619E-06,  &
      3.890555869E-06,  &
      -1.3079190037E-05,  &
      4.3717445259E-05,  &
      -1.4519238357E-04,  &
      4.787458329E-04,  &
      -1.565770767E-03,  &
      5.0736109158E-03,  &
      -1.6265370492E-02,  &
      5.1500687233E-02,  &
      -0.160697539,  &
      0.4927442719,  &
      -1.4792014373,  &
      4.3254178544,  &
      -12.2334029011,  &
      33.121176314,  &
      -84.5002768136,  &
      198.02411383,  &
      -407.9612755189,  &
      685.6247907251,  &
      -923.3011946661,  &
      2894.9958712218,  &
      -2.9472335857E+04,  &
      -1.2165063047E+05,  &
      -1.3039881804E+05,  &
      -1.0474481483E+05,  &
      -1.0236087536E+05,  &
      -1.1742927616E+05,  &
      -1.9713373602E+05,  &
      -1.1731094351E+05,  &
      -5.0176515167E+04,  &
      -1.1031229333E+05,  &
      -1.3536040882E+05,  &
      -1.4096213145E+05,  &
      3.0537340033E+04,  &
      9.5319366534E+04,  &
      -4284.0520640028,  &
      -5.6414513017E+04,  &
      -8.3707587628E+04,  &
      7.0879174432E+04,  &
      1.6542018374E+05,  &
      1.063766567E+05,  &
      6.9760218002E+04,  &
      9.2948948845E+04,  &
      1.7360565057E+05,  &
      1.5766279389E+05,  &
      1.0671443958E+05,  &
      1.0622448435E+05,  &
      1.3198486658E+05,  &
      1.377897924E+05,  &
      6.477234119E+04,  &
      6519.0378601267,  &
      2105.1652169668,  &
      4457.7333679944,  &
      4084.185505979,  &
      3890.456383437,  &
      3739.0885330906,  &
      2182.6580086188,  &
      4372.05161975,  &
      4825.7731962592,  &
      2065.0361481936,  &
      2920.185025583,  &
      3797.5891037089,  &
      2719.5899659708,  &
      2749.4127981984,  &
      2606.4026379494,  &
      2602.7342818446,  &
      3369.7227802363,  &
      1645.0313185634,  &
      2036.201200912,  &
      3277.0852250337,  &
      1665.0226018977,  &
      2232.7330808343,  &
      1603.0818803515,  &
      2583.7942945807,  &
      1836.8193555271,  &
      -3971.5924395862,  &
      2.4019424037E+04,  &
      8.340159288E+04,  &
      1.0874826366E+05,  &
      9.4681666427E+04,  &
      1.246406568E+05,  &
      1.4399621977E+05,  &
      8.7730703418E+04,  &
      6.4261625577E+04,  &
      8.1321498678E+04,  &
      1.6045626621E+05,  &
      1.4653775022E+05,  &
      -1.1730062408E+04,  &
      -5.7710558334E+04,  &
      -1.5091253839E+04,  &
      7.4583672358E+04,  &
      2.4781508262E+04,  &
      -8.3443826386E+04,  &
      -4.7624786131E+04,  &
      -5.500047025E+04,  &
      -3.0282324068E+04,  &
      -9.5863366292E+04,  &
      -1.8982116189E+05,  &
      -1.2040626907E+05,  &
      -8.3618937339E+04,  &
      -7.1330795153E+04,  &
      -1.1566244206E+05,  &
      -1.4508582268E+05,  &
      -9.3393300157E+04,  &
      -6.6964165773E+04,  &
      -2.3883175008E+04,  &
      5915.4078838047,  &
      -585.8300927332,  &
      -343.7416876385,  &
      288.6980789131,  &
      -146.7605001791,  &
      62.4031660235,  &
      -24.1057839964,  &
      8.7597010485,  &
      -3.049817425,  &
      1.0285778057,  &
      -0.3384368316,  &
      0.1091779816,  &
      -3.4654099483E-02,  &
      1.085154548E-02,  &
      -3.3591850745E-03,  &
      1.0296264999E-03,  &
      -3.1288770095E-04,  &
      9.4366074148E-05,  &
      -2.8270794127E-05,  &
      8.4191711051E-06,  &
      -2.4938801667E-06,  &
      7.3516627791E-07,  &
      -2.157892302E-07,  &
      6.3164893651E-08,  &
      -1.8739525719E-08,  &
      6.8259992896E-09,  &
      -7.5710297958E-09
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.accl_x  &
   real_value =   &
      0.0,  &
      1.445783133,  &
      2.891566265,  &
      4.337349398,  &
      5.78313253,  &
      7.228915663,  &
      8.674698795,  &
      10.12048193,  &
      11.56626506,  &
      13.01204819,  &
      14.45783133,  &
      15.90361446,  &
      17.34939759,  &
      18.79518072,  &
      20.24096386,  &
      21.68674699,  &
      23.13253012,  &
      24.57831325,  &
      26.02409639,  &
      27.46987952,  &
      28.91566265,  &
      30.36144578,  &
      31.80722892,  &
      33.25301205,  &
      34.69879518,  &
      36.14457831,  &
      37.59036145,  &
      39.03614458,  &
      40.48192771,  &
      41.92771084,  &
      43.37349398,  &
      44.81927711,  &
      46.26506024,  &
      47.71084337,  &
      49.15662651,  &
      50.60240964,  &
      52.04819277,  &
      53.4939759,  &
      54.93975904,  &
      56.38554217,  &
      57.8313253,  &
      59.27710843,  &
      60.72289157,  &
      62.1686747,  &
      63.61445783,  &
      65.06024096,  &
      66.5060241,  &
      67.95180723,  &
      69.39759036,  &
      70.84337349,  &
      72.28915663,  &
      73.73493976,  &
      75.18072289,  &
      76.62650602,  &
      78.07228916,  &
      79.51807229,  &
      80.96385542,  &
      82.40963855,  &
      83.85542169,  &
      85.30120482,  &
      86.74698795,  &
      88.19277108,  &
      89.63855422,  &
      91.08433735,  &
      92.53012048,  &
      93.97590361,  &
      95.42168675,  &
      96.86746988,  &
      98.31325301,  &
      99.75903614,  &
      101.2048193,  &
      102.6506024,  &
      104.0963855,  &
      105.5421687,  &
      106.9879518,  &
      108.4337349,  &
      109.8795181,  &
      111.3253012,  &
      112.7710843,  &
      114.2168675,  &
      115.6626506,  &
      117.1084337,  &
      118.5542169,  &
      120.0,  &
      121.4457831,  &
      122.8915663,  &
      124.3373494,  &
      125.7831325,  &
      127.2289157,  &
      128.6746988,  &
      130.1204819,  &
      131.5662651,  &
      133.0120482,  &
      134.4578313,  &
      135.9036145,  &
      137.3493976,  &
      138.7951807,  &
      140.2409639,  &
      141.686747,  &
      143.1325301,  &
      144.5783133,  &
      146.0240964,  &
      147.4698795,  &
      148.9156627,  &
      150.3614458,  &
      151.8072289,  &
      153.253012,  &
      154.6987952,  &
      156.1445783,  &
      157.5903614,  &
      159.0361446,  &
      160.4819277,  &
      161.9277108,  &
      163.373494,  &
      164.8192771,  &
      166.2650602,  &
      167.7108434,  &
      169.1566265,  &
      170.6024096,  &
      172.0481928,  &
      173.4939759,  &
      174.939759,  &
      176.3855422,  &
      177.8313253,  &
      179.2771084,  &
      180.7228916,  &
      182.1686747,  &
      183.6144578,  &
      185.060241,  &
      186.5060241,  &
      187.9518072,  &
      189.3975904,  &
      190.8433735,  &
      192.2891566,  &
      193.7349398,  &
      195.1807229,  &
      196.626506,  &
      198.0722892,  &
      199.5180723,  &
      200.9638554,  &
      202.4096386,  &
      203.8554217,  &
      205.3012048,  &
      206.746988,  &
      208.1927711,  &
      209.6385542,  &
      211.0843373,  &
      212.5301205,  &
      213.9759036,  &
      215.4216867,  &
      216.8674699,  &
      218.313253,  &
      219.7590361,  &
      221.2048193,  &
      222.6506024,  &
      224.0963855,  &
      225.5421687,  &
      226.9879518,  &
      228.4337349,  &
      229.8795181,  &
      231.3253012,  &
      232.7710843,  &
      234.2168675,  &
      235.6626506,  &
      237.1084337,  &
      238.5542169,  &
      240.0,  &
      241.4457831,  &
      242.8915663,  &
      244.3373494,  &
      245.7831325,  &
      247.2289157,  &
      248.6746988,  &
      250.1204819,  &
      251.5662651,  &
      253.0120482,  &
      254.4578313,  &
      255.9036145,  &
      257.3493976,  &
      258.7951807,  &
      260.2409639,  &
      261.686747,  &
      263.1325301,  &
      264.5783133,  &
      266.0240964,  &
      267.4698795,  &
      268.9156627,  &
      270.3614458,  &
      271.8072289,  &
      273.253012,  &
      274.6987952,  &
      276.1445783,  &
      277.5903614,  &
      279.0361446,  &
      280.4819277,  &
      281.9277108,  &
      283.373494,  &
      284.8192771,  &
      286.2650602,  &
      287.7108434,  &
      289.1566265,  &
      290.6024096,  &
      292.0481928,  &
      293.4939759,  &
      294.939759,  &
      296.3855422,  &
      297.8313253,  &
      299.2771084,  &
      300.7228916,  &
      302.1686747,  &
      303.6144578,  &
      305.060241,  &
      306.5060241,  &
      307.9518072,  &
      309.3975904,  &
      310.8433735,  &
      312.2891566,  &
      313.7349398,  &
      315.1807229,  &
      316.626506,  &
      318.0722892,  &
      319.5180723,  &
      320.9638554,  &
      322.4096386,  &
      323.8554217,  &
      325.3012048,  &
      326.746988,  &
      328.1927711,  &
      329.6385542,  &
      331.0843373,  &
      332.5301205,  &
      333.9759036,  &
      335.4216867,  &
      336.8674699,  &
      338.313253,  &
      339.7590361,  &
      341.2048193,  &
      342.6506024,  &
      344.0963855,  &
      345.5421687,  &
      346.9879518,  &
      348.4337349,  &
      349.8795181,  &
      351.3253012,  &
      352.7710843,  &
      354.2168675,  &
      355.6626506,  &
      357.1084337,  &
      358.5542169,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.accl_y  &
   real_value =   &
      -48.7383218695,  &
      31.3875862629,  &
      -50.7859195907,  &
      41.625574622,  &
      1506.3991525524,  &
      4137.0081996555,  &
      6832.2162800682,  &
      9752.9327840134,  &
      1.2731930505E+04,  &
      1.4881408632E+04,  &
      1.5446316173E+04,  &
      1.5834483759E+04,  &
      1.663368967E+04,  &
      1.5599320302E+04,  &
      1.3207464573E+04,  &
      1.078562825E+04,  &
      8277.9425221877,  &
      5370.4777920062,  &
      2521.8337893944,  &
      1199.9946187724,  &
      1129.6761716851,  &
      1130.0673922914,  &
      1052.9981035418,  &
      1007.1861017092,  &
      941.9499317106,  &
      875.7982173311,  &
      805.8554869272,  &
      729.8202027985,  &
      651.0995305878,  &
      559.0959964532,  &
      488.5818251177,  &
      350.4427210283,  &
      333.4666874587,  &
      139.8465891978,  &
      -1739.3248468774,  &
      -4988.1216088284,  &
      -8189.6953147553,  &
      -1.1134739605E+04,  &
      -1.4663742672E+04,  &
      -1.7485277013E+04,  &
      -1.7719168496E+04,  &
      -1.725317667E+04,  &
      -1.755353522E+04,  &
      -1.6921959735E+04,  &
      -1.3807967838E+04,  &
      -1.0277290169E+04,  &
      -7493.9133425993,  &
      -4381.8146808803,  &
      -1383.3803815335,  &
      48.0517174398,  &
      37.6150435646,  &
      -23.6077993125,  &
      9.9507429068,  &
      -3.6376233017,  &
      1.2349652573,  &
      -0.4006462863,  &
      0.1260391812,  &
      -3.8779084266E-02,  &
      1.1732442596E-02,  &
      -3.5031840728E-03,  &
      1.0349992033E-03,  &
      -3.0313709961E-04,  &
      8.8141082957E-05,  &
      -2.5470399594E-05,  &
      7.3213009379E-06,  &
      -2.0947809222E-06,  &
      5.9694395803E-07,  &
      -1.6950280015E-07,  &
      4.7977628945E-08,  &
      -1.3541380054E-08,  &
      3.812165018E-09,  &
      -1.0707057701E-09,  &
      3.0008832847E-10,  &
      -8.3943639348E-11,  &
      2.3439889808E-11,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      1.2062979284E-11,  &
      -4.3077182477E-11,  &
      1.5351685196E-10,  &
      -5.4587766632E-10,  &
      1.9362721821E-09,  &
      -6.8494377758E-09,  &
      2.4156108671E-08,  &
      -8.4903276259E-08,  &
      2.9727551409E-07,  &
      -1.0363446245E-06,  &
      3.5948672923E-06,  &
      -1.2398037224E-05,  &
      4.2470170096E-05,  &
      -1.4431926207E-04,  &
      4.8568051823E-04,  &
      -1.6150608256E-03,  &
      5.2903203671E-03,  &
      -1.6992594971E-02,  &
      5.3149801264E-02,  &
      -0.1600391763,  &
      0.4542674932,  &
      -1.1616405988,  &
      2.3434730305,  &
      -1.3123556815,  &
      -22.8448160889,  &
      -318.1061648623,  &
      -888.2714412607,  &
      -1319.4324404452,  &
      -1760.7465940135,  &
      -2164.9713963199,  &
      -2790.4811612138,  &
      -3534.8176320027,  &
      -3749.7234712702,  &
      -4108.2169634014,  &
      -4588.7945595814,  &
      -5169.4164831929,  &
      -5483.937265079,  &
      -5066.9980221234,  &
      -4938.3807224325,  &
      -5037.856604209,  &
      -5358.2598300329,  &
      -5466.7263143844,  &
      -4869.3317065335,  &
      -4343.6519120448,  &
      -3984.8778715704,  &
      -3703.2684026836,  &
      -3161.3682778973,  &
      -2438.162218866,  &
      -1941.8618853839,  &
      -1513.4700561731,  &
      -1053.5121801048,  &
      -480.0647630613,  &
      -52.2854190132,  &
      59.9595831498,  &
      72.1505322076,  &
      85.9266945898,  &
      104.3061995821,  &
      118.9721190206,  &
      135.6115541555,  &
      147.1240172622,  &
      158.1574341105,  &
      179.9173745962,  &
      192.6155061662,  &
      201.3445537913,  &
      216.1006005514,  &
      229.22960178,  &
      239.427724935,  &
      251.0818695201,  &
      260.5492206288,  &
      273.0190351858,  &
      284.2796851892,  &
      289.0646162886,  &
      301.7722173676,  &
      311.5673806257,  &
      318.0639288842,  &
      327.8980854575,  &
      333.0958633122,  &
      346.3386190806,  &
      341.0737467258,  &
      359.6851702719,  &
      576.0238069133,  &
      984.0145506704,  &
      1396.7417756773,  &
      1803.4464007427,  &
      2383.6768443997,  &
      2858.8095189658,  &
      3132.2453420986,  &
      3429.222767542,  &
      3868.5290034704,  &
      4593.4588105826,  &
      4852.3003307818,  &
      4649.5591226424,  &
      4507.3692000963,  &
      4591.3370367194,  &
      4919.7185336589,  &
      4712.1749040856,  &
      4442.3175045474,  &
      4271.8222358722,  &
      4043.510280801,  &
      3907.7082722079,  &
      3235.5357650295,  &
      2601.7453570546,  &
      2224.7390313976,  &
      1897.3105275013,  &
      1576.0046760357,  &
      988.2524684315,  &
      519.2455815263,  &
      204.2856701986,  &
      3.6724505716,  &
      -5.3280607061,  &
      2.5916292302,  &
      -1.0063122934,  &
      0.3532105344,  &
      -0.1170349887,  &
      3.7359485032E-02,  &
      -1.1618152963E-02,  &
      3.5438591587E-03,  &
      -1.0650026262E-03,  &
      3.1629550937E-04,  &
      -9.3038509017E-05,  &
      2.7150192758E-05,  &
      -7.869879072E-06,  &
      2.2681594694E-06,  &
      -6.5047114619E-07,  &
      1.8573989014E-07,  &
      -5.283598304E-08,  &
      1.4979194899E-08,  &
      -4.2338729143E-09,  &
      1.1934679588E-09,  &
      -3.3559932912E-10,  &
      9.4160578666E-11,  &
      -2.6367879461E-11,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.toggle_states  &
   string_value = ""
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.dv_optimization  &
   string_value = ""
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.acc_jerk_name  &
   string_value = "Acceleration"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.follower_obj_value  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.func_spl_y  &
   real_value =   &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      2.020791E-03,  &
      2.9681532E-02,  &
      0.124694986,  &
      0.329913592,  &
      0.692411735,  &
      1.259318981,  &
      2.063929165,  &
      3.118599602,  &
      4.426696641,  &
      6.003206837,  &
      7.828032729,  &
      9.866538641,  &
      12.07832569,  &
      14.42339753,  &
      16.85545804,  &
      19.32980713,  &
      21.8249966,  &
      24.33892568,  &
      26.87078753,  &
      29.41974522,  &
      31.98489924,  &
      34.56524972,  &
      37.15972294,  &
      39.76717594,  &
      42.38641567,  &
      45.01610371,  &
      47.65490982,  &
      50.30134174,  &
      52.9539686,  &
      55.61092219,  &
      58.2685719,  &
      60.8965473,  &
      63.4434816,  &
      65.8592148,  &
      68.09366775,  &
      70.09478613,  &
      71.81409045,  &
      73.25118813,  &
      74.40716586,  &
      75.28369062,  &
      75.88754978,  &
      76.27137525,  &
      76.48768828,  &
      76.58396316,  &
      76.60870435,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60869343,  &
      76.60269786,  &
      76.58209442,  &
      76.5404672,  &
      76.47050573,  &
      76.36489173,  &
      76.21513163,  &
      76.00771088,  &
      75.74072603,  &
      75.40677306,  &
      74.99865401,  &
      74.50825396,  &
      73.92897691,  &
      73.26900677,  &
      72.52813708,  &
      71.70615922,  &
      70.79829138,  &
      69.80229019,  &
      68.72866021,  &
      67.58395653,  &
      66.37554005,  &
      65.10732254,  &
      63.78835455,  &
      62.43004158,  &
      61.04000758,  &
      59.62591428,  &
      58.19466633,  &
      56.7556488,  &
      55.31538118,  &
      53.87591512,  &
      52.43760855,  &
      51.00069369,  &
      49.56545817,  &
      48.13214672,  &
      46.70100291,  &
      45.27225954,  &
      43.84604072,  &
      42.42275113,  &
      41.00253563,  &
      39.58559266,  &
      38.17211838,  &
      36.76235233,  &
      35.35643697,  &
      33.95457572,  &
      32.55692293,  &
      31.16365609,  &
      29.77499494,  &
      28.39097277,  &
      27.01184104,  &
      25.6377145,  &
      24.26872968,  &
      22.90502165,  &
      21.54670991,  &
      20.1939213,  &
      18.84675974,  &
      17.50557432,  &
      16.17394447,  &
      14.85818697,  &
      13.56503044,  &
      12.30112216,  &
      11.07537651,  &
      9.895906459,  &
      8.766398275,  &
      7.693083339,  &
      6.681761278,  &
      5.744377195,  &
      4.88480365,  &
      4.099718857,  &
      3.388476025,  &
      2.75045331,  &
      2.19218384,  &
      1.70930598,  &
      1.297998965,  &
      0.956320495,  &
      0.678718831,  &
      0.46479546,  &
      0.302167174,  &
      0.182198111,  &
      9.8226774E-02,  &
      4.4489618E-02,  &
      1.6412611E-02,  &
      3.906034E-03,  &
      2.8223E-04,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0
!
ude modify instance  &
   instance_name = .Project_last.Follower_Motion_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_pro_loc  &
   real_value = ({0, 0, 0})
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_arm_len  &
   real_value = 150.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_arm_rad  &
   real_value = 15.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_cir_end_thi  &
   real_value = (.Project_last.Cam_profile_2.cam_thickness.real_value)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_end_ht  &
   real_value = 25.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_flat_end_wid  &
   real_value = 50.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_flat_thi  &
   real_value = (80.0mm)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_pro_sha  &
   string_value = "disk"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.Fol_end_sha  &
   string_value = "circle"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_mnt_style  &
   string_value = "none"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_cam_conn  &
   string_value = "constraint"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_loading  &
   string_value = "none"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_arrangement  &
   string_value = "inline"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_mnt_part  &
   object_value = .Project_last.ground
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_joint_type  &
   string_value = "translational"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_motion_type  &
   string_value = "translation"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_piv_x_offset  &
   real_value = 400.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_piv_y_offset  &
   real_value = 50.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_piv_z_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_axis_offset  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_offset_along_cam_axis  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.exte_file  &
   string_value = ""
!
variable modify  &
   variable_name = .Project_last.follower_1_1.exte_file_coordinates  &
   string_value = "cartesian"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.angular_offset  &
   real_value = 45.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.radial_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.axial_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_ref_mar  &
   object_value = .Project_last.ground.mar_follower_1_1_cont
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_inertia_chk  &
   string_value = "off"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_mass  &
   real_value = 2.3
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Ixx  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Iyy  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Izz  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_density  &
   real_value = 7.8E-06
!
variable modify  &
   variable_name = .Project_last.follower_1_1.arm_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_inertia_chk  &
   string_value = "off"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_mass  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Ixx  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Iyy  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Izz  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_density  &
   real_value = 7.8E-06
!
variable modify  &
   variable_name = .Project_last.follower_1_1.end_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_i_geo  &
   object_value = .Project_last.follower_1_1.par_fol_end.geo_cyl
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_j_geo  &
   object_value = .Project_last.Cam_profile_2.par_cam.geo_shell
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_stiff  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_damp  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_expo  &
   real_value = 2.2
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_dmax  &
   real_value = 0.1
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fri  &
   string_value = "on"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fric_force  &
   string_value = "coloumb"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fri_mu_sta  &
   real_value = 0.3
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fri_mu_dyn  &
   real_value = 0.1
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fri_sti_tra_vel  &
   real_value = 100.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.con_fri_fri_tra_vel  &
   real_value = 1000.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.joi_cur_j  &
   object_value = .Project_last.Cam_profile_2.cur_cam_pro
!
variable modify  &
   variable_name = .Project_last.follower_1_1.joi_cur_i  &
   object_value = .Project_last.follower_1_1.curve_foll_i
!
variable modify  &
   variable_name = .Project_last.follower_1_1.joi_mar_cur_j  &
   object_value = .Project_last.Cam_profile_2.par_cam.mar_pro_ref
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_i_mar  &
   object_value = (.Project_last.follower_1_1.par_fol_arm.mar_fol_arm_spr_i)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_j_mar  &
   object_value = .Project_last.ground.follower_1_1_spring_attach_j
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_stiffness  &
   real_value = 4.0E-03
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_free_len  &
   real_value = 300.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_damping  &
   real_value = 1.0E-03
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_arm_mnt_i_mar  &
   object_value = .Project_last.follower_1_1.par_fol_arm.mar_fol_arm_mnt_i
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_arm_mnt_j_mar  &
   object_value = .Project_last.ground.follower_1_1_fol_attach_j
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_kx  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_kz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_ktx  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_ktz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_Damp  &
   real_value = (1.0E-03 / UNITS_CONVERSION_FACTOR("sec"))
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_stiff  &
   real_value =   &
      (.Project_last.follower_1_1.fol_bush_kx),  &
      (.Project_last.follower_1_1.fol_bush_kx),  &
      (.Project_last.follower_1_1.fol_bush_kz)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_bush_tstiff  &
   real_value =   &
      (.Project_last.follower_1_1.fol_bush_ktx),  &
      (.Project_last.follower_1_1.fol_bush_ktx),  &
      (.Project_last.follower_1_1.fol_bush_ktz)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_sys_name  &
   string_value = ".Project_last.cam_sys_1"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.num_of_foll  &
   string_value = "one"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_profile_name  &
   object_value = .Project_last.Cam_profile_2
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_profile_name_tmp  &
   string_value = ".Project_last.Cam_profile_2"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_profile_type  &
   string_value = "create"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_mnt_part_type  &
   string_value = "rigid"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_2nd_piv_loc  &
   real_value =   &
      0.0,  &
      0.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_2nd_piv_loc_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_ref_mar_y_dis  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.follower_1_1.fol_tilt_angle  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.cam_disk_min_rad  &
   real_value = 100.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.damp_roller_fol  &
   real_value = 20.0
!
ude modify instance  &
   instance_name = .Project_last.follower_1_1
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
marker create  &
   marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_93  &
   adams_id = 93  &
   location = 325.0, 150.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_106  &
   adams_id = 106  &
   location = 251.2409513471, 83.1766985771, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Project_last.cam_sys_1.cam_profile_name  &
   object_value = .Project_last.Cam_profile_2
!
variable modify  &
   variable_name = .Project_last.cam_sys_1.follower_name  &
   object_value = .Project_last.follower_1_1
!
variable modify  &
   variable_name = .Project_last.cam_sys_1.follower_motion_name  &
   object_value = .Project_last.Follower_Motion_1
!
ude modify instance  &
   instance_name = .Project_last.cam_sys_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.prof_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_pro_sha  &
   string_value = "disk"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_method  &
   string_value = "create"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_no_points  &
   real_value = 500.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_location  &
   real_value =   &
      600.0,  &
      150.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_orientation  &
   real_value =   &
      90.0,  &
      0.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_min_radius  &
   real_value = 100.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_max_radius  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_thickness  &
   real_value = 50.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_offset_along_cam_axis  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_groove_width  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_groove_Depth  &
   real_value = 5.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.exte_file  &
   string_value = ""
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.inde_vari  &
   string_value = "angle"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_method  &
   string_value = "create"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_motion_name  &
   object_value = .Project_last.Follower_Motion_1
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_arrangement  &
   string_value = "inline"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_joint_type  &
   string_value = "translation"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_axis_offset  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_end_sha  &
   string_value = "circle"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_end_ht  &
   real_value = 25.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_piv_loc  &
   real_value = ({0, 0, 0})
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_piv_x_offset  &
   real_value = (400mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_piv_y_offset  &
   real_value = (50mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_piv_z_offset  &
   real_value = (0.0mm)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.fol_end_flat_width  &
   real_value = 50.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_i  &
   object_value = .Project_last.Cam_profile_2.par_cam.mar_axis
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_j  &
   object_value = .Project_last.ground.follower_1_1_cam_attach_j
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.joi_mar_cur_j  &
   object_value = .Project_last.Cam_profile_2.par_cam.mar_pro_ref
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_kx  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_kz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_ktx  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_ktz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_Damp  &
   real_value = (1.0E-03 / UNITS_CONVERSION_FACTOR("sec"))
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_stiff  &
   real_value =   &
      (.Project_last.Cam_profile_2.cam_bush_kx),  &
      (.Project_last.Cam_profile_2.cam_bush_kx),  &
      (.Project_last.Cam_profile_2.cam_bush_kz)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_bush_tstiff  &
   real_value =   &
      (.Project_last.Cam_profile_2.cam_bush_ktx),  &
      (.Project_last.Cam_profile_2.cam_bush_ktx),  &
      (.Project_last.Cam_profile_2.cam_bush_ktz)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_style  &
   string_value = "none"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_joi_type  &
   string_value = "revolute"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_part_type  &
   string_value = "rigid"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mnt_part  &
   object_value = .Project_last.ground
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.con_j_geo  &
   object_value = .Project_last.Cam_profile_2.par_cam.geo_shell
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.matrix_values  &
   real_value =   &
      0.0,  &
      0.0,  &
      0.0,  &
      3.4899496703,  &
      -6.091729809E-02,  &
      0.0,  &
      6.9756473744,  &
      -0.243594974,  &
      0.0,  &
      10.4715834815,  &
      -0.5465261589,  &
      0.0,  &
      14.3038551574,  &
      -0.9542925734,  &
      0.0,  &
      18.7671860809,  &
      -1.4155187784,  &
      0.0,  &
      24.4180782883,  &
      -1.8512117666,  &
      0.0,  &
      31.3053168711,  &
      -1.9756594033,  &
      0.0,  &
      37.319371183,  &
      -1.6897390119,  &
      0.0,  &
      43.3945080685,  &
      -1.0605994536,  &
      0.0,  &
      49.5941636596,  &
      -0.1162746917,  &
      0.0,  &
      55.3586119284,  &
      0.917652682,  &
      0.0,  &
      60.7784399242,  &
      1.9005858613,  &
      0.0,  &
      66.0077559464,  &
      2.7586487317,  &
      0.0,  &
      70.9740247875,  &
      3.3976678647,  &
      0.0,  &
      76.0424574297,  &
      3.8425865318,  &
      0.0,  &
      81.319480323,  &
      4.0898796956,  &
      0.0,  &
      86.7159118362,  &
      4.1196933342,  &
      0.0,  &
      92.2257306305,  &
      3.9216170635,  &
      0.0,  &
      97.8369590758,  &
      3.4853945902,  &
      0.0,  &
      103.5368635213,  &
      2.8011595225,  &
      0.0,  &
      109.3153413488,  &
      1.8594139803,  &
      0.0,  &
      115.1564496578,  &
      0.6515802519,  &
      0.0,  &
      121.0471466214,  &
      -0.8307575747,  &
      0.0,  &
      126.9716693599,  &
      -2.5950104396,  &
      0.0,  &
      132.8396531997,  &
      -4.6346052651,  &
      0.0,  &
      138.2660001134,  &
      -6.8748175842,  &
      0.0,  &
      143.1074833928,  &
      -9.2989090855,  &
      0.0,  &
      147.2994087367,  &
      -11.8869243515,  &
      0.0,  &
      150.7894839532,  &
      -14.5866759036,  &
      0.0,  &
      153.9257545635,  &
      -17.6048640015,  &
      0.0,  &
      156.7095725356,  &
      -20.9411307893,  &
      0.0,  &
      159.1189842733,  &
      -24.5645808305,  &
      0.0,  &
      161.5161048101,  &
      -28.971617927,  &
      0.0,  &
      163.758072709,  &
      -33.9267411068,  &
      0.0,  &
      165.9077794601,  &
      -39.4557885102,  &
      0.0,  &
      167.9531987095,  &
      -45.3860109798,  &
      0.0,  &
      169.7678540845,  &
      -51.3191291622,  &
      0.0,  &
      171.3635418847,  &
      -57.2742703418,  &
      0.0,  &
      172.7502583063,  &
      -63.2807990668,  &
      0.0,  &
      173.9265051484,  &
      -69.332064482,  &
      0.0,  &
      174.8908493353,  &
      -75.4206940526,  &
      0.0,  &
      175.6421159622,  &
      -81.5392697214,  &
      0.0,  &
      176.1793897263,  &
      -87.6803369463,  &
      0.0,  &
      176.5020160424,  &
      -93.836413783,  &
      0.0,  &
      176.60960184,  &
      -100.0,  &
      0.0,  &
      176.5020160424,  &
      -106.163586217,  &
      0.0,  &
      176.1793897263,  &
      -112.3196630537,  &
      0.0,  &
      175.6421159622,  &
      -118.4607302786,  &
      0.0,  &
      174.8908493353,  &
      -124.5793059474,  &
      0.0,  &
      173.9265051484,  &
      -130.667935518,  &
      0.0,  &
      172.7502583063,  &
      -136.7192009332,  &
      0.0,  &
      171.3635418847,  &
      -142.7257296582,  &
      0.0,  &
      169.7680453837,  &
      -148.6802036631,  &
      0.0,  &
      167.9657126702,  &
      -154.5753683384,  &
      0.0,  &
      165.958739609,  &
      -160.404041334,  &
      0.0,  &
      163.7495713875,  &
      -166.1591213098,  &
      0.0,  &
      161.340899537,  &
      -171.8335965874,  &
      0.0,  &
      158.7356586531,  &
      -177.4205536926,  &
      0.0,  &
      155.9370228204,  &
      -182.9131857788,  &
      0.0,  &
      152.9484017457,  &
      -188.30480092,  &
      0.0,  &
      149.7734366034,  &
      -193.5888302636,  &
      0.0,  &
      146.4159955993,  &
      -198.7588360337,  &
      0.0,  &
      142.8801692584,  &
      -203.8085193748,  &
      0.0,  &
      139.1702654401,  &
      -208.7317280255,  &
      0.0,  &
      135.290804091,  &
      -213.5224638144,  &
      0.0,  &
      131.246511737,  &
      -218.174889968,  &
      0.0,  &
      127.0423157255,  &
      -222.6833382216,  &
      0.0,  &
      122.6833382216,  &
      -227.0423157255,  &
      0.0,  &
      118.174889968,  &
      -231.246511737,  &
      0.0,  &
      113.5224638144,  &
      -235.290804091,  &
      0.0,  &
      108.7317280255,  &
      -239.1702654401,  &
      0.0,  &
      103.8085193748,  &
      -242.8801692584,  &
      0.0,  &
      98.7588360337,  &
      -246.4159955993,  &
      0.0,  &
      93.5888302636,  &
      -249.7734366034,  &
      0.0,  &
      88.30480092,  &
      -252.9484017457,  &
      0.0,  &
      82.9131857788,  &
      -255.9370228204,  &
      0.0,  &
      77.4205536926,  &
      -258.7356586531,  &
      0.0,  &
      71.8335965874,  &
      -261.340899537,  &
      0.0,  &
      66.1591213098,  &
      -263.7495713875,  &
      0.0,  &
      60.404041334,  &
      -265.958739609,  &
      0.0,  &
      54.5753683384,  &
      -267.9657126702,  &
      0.0,  &
      48.6802036631,  &
      -269.7680453837,  &
      0.0,  &
      42.7257296582,  &
      -271.3635418847,  &
      0.0,  &
      36.7192009332,  &
      -272.7502583063,  &
      0.0,  &
      30.667935518,  &
      -273.9265051484,  &
      0.0,  &
      24.5793059474,  &
      -274.8908493353,  &
      0.0,  &
      18.4607302786,  &
      -275.6421159622,  &
      0.0,  &
      12.3196630537,  &
      -276.1793897263,  &
      0.0,  &
      6.163586217,  &
      -276.5020160424,  &
      0.0,  &
      0.0,  &
      -276.60960184,  &
      0.0,  &
      -6.163586217,  &
      -276.5020160424,  &
      0.0,  &
      -12.3196630537,  &
      -276.1793897263,  &
      0.0,  &
      -18.4607302786,  &
      -275.6421159622,  &
      0.0,  &
      -24.5793059474,  &
      -274.8908493353,  &
      0.0,  &
      -30.667935518,  &
      -273.9265051484,  &
      0.0,  &
      -36.7192009332,  &
      -272.7502583063,  &
      0.0,  &
      -42.7257296582,  &
      -271.3635418847,  &
      0.0,  &
      -48.6802036631,  &
      -269.7680453837,  &
      0.0,  &
      -54.5753683384,  &
      -267.9657126702,  &
      0.0,  &
      -60.4032594761,  &
      -265.958868652,  &
      0.0,  &
      -66.1360867351,  &
      -263.7540192382,  &
      0.0,  &
      -71.7021665695,  &
      -261.3664548005,  &
      0.0,  &
      -77.0912086436,  &
      -258.7884462747,  &
      0.0,  &
      -82.305996088,  &
      -256.0083103993,  &
      0.0,  &
      -87.3136567382,  &
      -253.03083031,  &
      0.0,  &
      -92.0578827348,  &
      -249.872401706,  &
      0.0,  &
      -96.624235525,  &
      -246.4760794527,  &
      0.0,  &
      -100.9165938736,  &
      -242.8976929443,  &
      0.0,  &
      -104.9260651265,  &
      -239.1361417722,  &
      0.0,  &
      -108.7478038419,  &
      -235.1118191557,  &
      0.0,  &
      -112.3317682926,  &
      -230.8750717552,  &
      0.0,  &
      -115.627717084,  &
      -226.4811838009,  &
      0.0,  &
      -118.6290874497,  &
      -221.9384862499,  &
      0.0,  &
      -121.423248609,  &
      -217.1410317801,  &
      0.0,  &
      -123.9591583548,  &
      -212.1823188415,  &
      0.0,  &
      -126.2339897944,  &
      -207.0868494715,  &
      0.0,  &
      -128.2771554903,  &
      -201.8260980472,  &
      0.0,  &
      -130.0811599322,  &
      -196.4524430114,  &
      0.0,  &
      -131.6512158924,  &
      -190.9935168931,  &
      0.0,  &
      -132.9978102725,  &
      -185.4659260881,  &
      0.0,  &
      -134.1303913638,  &
      -179.8921273863,  &
      0.0,  &
      -135.0384902652,  &
      -174.3545665025,  &
      0.0,  &
      -135.7275889679,  &
      -168.8587314901,  &
      0.0,  &
      -136.2031798374,  &
      -163.4062749724,  &
      0.0,  &
      -136.4697119556,  &
      -158.005881693,  &
      0.0,  &
      -136.5319969912,  &
      -152.6653384664,  &
      0.0,  &
      -136.3951199334,  &
      -147.3922250554,  &
      0.0,  &
      -136.0644996182,  &
      -142.1930574875,  &
      0.0,  &
      -135.5457583071,  &
      -137.0761874066,  &
      0.0,  &
      -134.8446807409,  &
      -132.0472427011,  &
      0.0,  &
      -133.9673604402,  &
      -127.1131968227,  &
      0.0,  &
      -132.9199495695,  &
      -122.2793265747,  &
      0.0,  &
      -131.7089567892,  &
      -117.5519440349,  &
      0.0,  &
      -130.3407404136,  &
      -112.9352451546,  &
      0.0,  &
      -128.8223076303,  &
      -108.4355024944,  &
      0.0,  &
      -127.1600594846,  &
      -104.0558139527,  &
      0.0,  &
      -125.3611567556,  &
      -99.801120081,  &
      0.0,  &
      -123.4325333716,  &
      -95.675116706,  &
      0.0,  &
      -121.3811396647,  &
      -91.6810242006,  &
      0.0,  &
      -119.2140032337,  &
      -87.8217599134,  &
      0.0,  &
      -116.9274732802,  &
      -84.0759688827,  &
      0.0,  &
      -114.5012826114,  &
      -80.3849849566,  &
      0.0,  &
      -111.9566500764,  &
      -76.757473884,  &
      0.0,  &
      -109.3007982396,  &
      -73.1749064088,  &
      0.0,  &
      -106.5457242712,  &
      -69.6222030928,  &
      0.0,  &
      -103.7442335599,  &
      -66.1466541271,  &
      0.0,  &
      -100.8679226766,  &
      -62.6825831087,  &
      0.0,  &
      -97.8977399537,  &
      -59.1648211996,  &
      0.0,  &
      -94.9803917388,  &
      -55.760127542,  &
      0.0,  &
      -92.0852490812,  &
      -52.4288580994,  &
      0.0,  &
      -89.1565576786,  &
      -49.0903465033,  &
      0.0,  &
      -86.246890246,  &
      -45.7989851989,  &
      0.0,  &
      -83.3899696383,  &
      -42.6017538883,  &
      0.0,  &
      -80.5560049379,  &
      -39.4733192457,  &
      0.0,  &
      -77.7345099599,  &
      -36.4098609199,  &
      0.0,  &
      -75.0239470004,  &
      -33.5515005146,  &
      0.0,  &
      -72.3193647314,  &
      -30.8027860779,  &
      0.0,  &
      -69.6171406633,  &
      -28.1749831845,  &
      0.0,  &
      -66.9269807319,  &
      -25.6924044654,  &
      0.0,  &
      -64.2575149275,  &
      -23.3775094304,  &
      0.0,  &
      -61.5580583874,  &
      -21.1926020312,  &
      0.0,  &
      -58.7781729404,  &
      -19.098044605,  &
      0.0,  &
      -55.9192903471,  &
      -17.0962427445,  &
      0.0,  &
      -52.9919264233,  &
      -15.1951903844,  &
      0.0,  &
      -50.0,  &
      -13.3974596216,  &
      0.0,  &
      -46.9471562786,  &
      -11.7052407141,  &
      0.0,  &
      -43.8371146789,  &
      -10.1205953701,  &
      0.0,  &
      -40.6736643076,  &
      -8.6454542357,  &
      0.0,  &
      -37.4606593416,  &
      -7.2816145433,  &
      0.0,  &
      -34.2020143326,  &
      -6.0307379214,  &
      0.0,  &
      -30.9016994375,  &
      -4.8943483705,  &
      0.0,  &
      -27.5637355817,  &
      -3.8738304062,  &
      0.0,  &
      -24.19218956,  &
      -2.9704273724,  &
      0.0,  &
      -20.7911690818,  &
      -2.1852399266,  &
      0.0,  &
      -17.3648177667,  &
      -1.5192246988,  &
      0.0,  &
      -13.917310096,  &
      -0.9731931258,  &
      0.0,  &
      -10.4528463268,  &
      -0.5478104632,  &
      0.0,  &
      -6.9756473744,  &
      -0.243594974,  &
      0.0,  &
      -3.4899496703,  &
      -6.0917298091E-02,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.dis_spl_x  &
   real_value =   &
      0.0,  &
      1.445783133,  &
      2.891566265,  &
      4.337349398,  &
      5.78313253,  &
      7.228915663,  &
      8.674698795,  &
      10.12048193,  &
      11.56626506,  &
      13.01204819,  &
      14.45783133,  &
      15.90361446,  &
      17.34939759,  &
      18.79518072,  &
      20.24096386,  &
      21.68674699,  &
      23.13253012,  &
      24.57831325,  &
      26.02409639,  &
      27.46987952,  &
      28.91566265,  &
      30.36144578,  &
      31.80722892,  &
      33.25301205,  &
      34.69879518,  &
      36.14457831,  &
      37.59036145,  &
      39.03614458,  &
      40.48192771,  &
      41.92771084,  &
      43.37349398,  &
      44.81927711,  &
      46.26506024,  &
      47.71084337,  &
      49.15662651,  &
      50.60240964,  &
      52.04819277,  &
      53.4939759,  &
      54.93975904,  &
      56.38554217,  &
      57.8313253,  &
      59.27710843,  &
      60.72289157,  &
      62.1686747,  &
      63.61445783,  &
      65.06024096,  &
      66.5060241,  &
      67.95180723,  &
      69.39759036,  &
      70.84337349,  &
      72.28915663,  &
      73.73493976,  &
      75.18072289,  &
      76.62650602,  &
      78.07228916,  &
      79.51807229,  &
      80.96385542,  &
      82.40963855,  &
      83.85542169,  &
      85.30120482,  &
      86.74698795,  &
      88.19277108,  &
      89.63855422,  &
      91.08433735,  &
      92.53012048,  &
      93.97590361,  &
      95.42168675,  &
      96.86746988,  &
      98.31325301,  &
      99.75903614,  &
      101.2048193,  &
      102.6506024,  &
      104.0963855,  &
      105.5421687,  &
      106.9879518,  &
      108.4337349,  &
      109.8795181,  &
      111.3253012,  &
      112.7710843,  &
      114.2168675,  &
      115.6626506,  &
      117.1084337,  &
      118.5542169,  &
      120.0,  &
      121.4457831,  &
      122.8915663,  &
      124.3373494,  &
      125.7831325,  &
      127.2289157,  &
      128.6746988,  &
      130.1204819,  &
      131.5662651,  &
      133.0120482,  &
      134.4578313,  &
      135.9036145,  &
      137.3493976,  &
      138.7951807,  &
      140.2409639,  &
      141.686747,  &
      143.1325301,  &
      144.5783133,  &
      146.0240964,  &
      147.4698795,  &
      148.9156627,  &
      150.3614458,  &
      151.8072289,  &
      153.253012,  &
      154.6987952,  &
      156.1445783,  &
      157.5903614,  &
      159.0361446,  &
      160.4819277,  &
      161.9277108,  &
      163.373494,  &
      164.8192771,  &
      166.2650602,  &
      167.7108434,  &
      169.1566265,  &
      170.6024096,  &
      172.0481928,  &
      173.4939759,  &
      174.939759,  &
      176.3855422,  &
      177.8313253,  &
      179.2771084,  &
      180.7228916,  &
      182.1686747,  &
      183.6144578,  &
      185.060241,  &
      186.5060241,  &
      187.9518072,  &
      189.3975904,  &
      190.8433735,  &
      192.2891566,  &
      193.7349398,  &
      195.1807229,  &
      196.626506,  &
      198.0722892,  &
      199.5180723,  &
      200.9638554,  &
      202.4096386,  &
      203.8554217,  &
      205.3012048,  &
      206.746988,  &
      208.1927711,  &
      209.6385542,  &
      211.0843373,  &
      212.5301205,  &
      213.9759036,  &
      215.4216867,  &
      216.8674699,  &
      218.313253,  &
      219.7590361,  &
      221.2048193,  &
      222.6506024,  &
      224.0963855,  &
      225.5421687,  &
      226.9879518,  &
      228.4337349,  &
      229.8795181,  &
      231.3253012,  &
      232.7710843,  &
      234.2168675,  &
      235.6626506,  &
      237.1084337,  &
      238.5542169,  &
      240.0,  &
      241.4457831,  &
      242.8915663,  &
      244.3373494,  &
      245.7831325,  &
      247.2289157,  &
      248.6746988,  &
      250.1204819,  &
      251.5662651,  &
      253.0120482,  &
      254.4578313,  &
      255.9036145,  &
      257.3493976,  &
      258.7951807,  &
      260.2409639,  &
      261.686747,  &
      263.1325301,  &
      264.5783133,  &
      266.0240964,  &
      267.4698795,  &
      268.9156627,  &
      270.3614458,  &
      271.8072289,  &
      273.253012,  &
      274.6987952,  &
      276.1445783,  &
      277.5903614,  &
      279.0361446,  &
      280.4819277,  &
      281.9277108,  &
      283.373494,  &
      284.8192771,  &
      286.2650602,  &
      287.7108434,  &
      289.1566265,  &
      290.6024096,  &
      292.0481928,  &
      293.4939759,  &
      294.939759,  &
      296.3855422,  &
      297.8313253,  &
      299.2771084,  &
      300.7228916,  &
      302.1686747,  &
      303.6144578,  &
      305.060241,  &
      306.5060241,  &
      307.9518072,  &
      309.3975904,  &
      310.8433735,  &
      312.2891566,  &
      313.7349398,  &
      315.1807229,  &
      316.626506,  &
      318.0722892,  &
      319.5180723,  &
      320.9638554,  &
      322.4096386,  &
      323.8554217,  &
      325.3012048,  &
      326.746988,  &
      328.1927711,  &
      329.6385542,  &
      331.0843373,  &
      332.5301205,  &
      333.9759036,  &
      335.4216867,  &
      336.8674699,  &
      338.313253,  &
      339.7590361,  &
      341.2048193,  &
      342.6506024,  &
      344.0963855,  &
      345.5421687,  &
      346.9879518,  &
      348.4337349,  &
      349.8795181,  &
      351.3253012,  &
      352.7710843,  &
      354.2168675,  &
      355.6626506,  &
      357.1084337,  &
      358.5542169,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.dis_spl_y  &
   real_value =   &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      2.020791E-03,  &
      2.9681532E-02,  &
      0.124694986,  &
      0.329913592,  &
      0.692411735,  &
      1.259318981,  &
      2.063929165,  &
      3.118599602,  &
      4.426696641,  &
      6.003206837,  &
      7.828032729,  &
      9.866538641,  &
      12.07832569,  &
      14.42339753,  &
      16.85545804,  &
      19.32980713,  &
      21.8249966,  &
      24.33892568,  &
      26.87078753,  &
      29.41974522,  &
      31.98489924,  &
      34.56524972,  &
      37.15972294,  &
      39.76717594,  &
      42.38641567,  &
      45.01610371,  &
      47.65490982,  &
      50.30134174,  &
      52.9539686,  &
      55.61092219,  &
      58.2685719,  &
      60.8965473,  &
      63.4434816,  &
      65.8592148,  &
      68.09366775,  &
      70.09478613,  &
      71.81409045,  &
      73.25118813,  &
      74.40716586,  &
      75.28369062,  &
      75.88754978,  &
      76.27137525,  &
      76.48768828,  &
      76.58396316,  &
      76.60870435,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60960184,  &
      76.60869343,  &
      76.60269786,  &
      76.58209442,  &
      76.5404672,  &
      76.47050573,  &
      76.36489173,  &
      76.21513163,  &
      76.00771088,  &
      75.74072603,  &
      75.40677306,  &
      74.99865401,  &
      74.50825396,  &
      73.92897691,  &
      73.26900677,  &
      72.52813708,  &
      71.70615922,  &
      70.79829138,  &
      69.80229019,  &
      68.72866021,  &
      67.58395653,  &
      66.37554005,  &
      65.10732254,  &
      63.78835455,  &
      62.43004158,  &
      61.04000758,  &
      59.62591428,  &
      58.19466633,  &
      56.7556488,  &
      55.31538118,  &
      53.87591512,  &
      52.43760855,  &
      51.00069369,  &
      49.56545817,  &
      48.13214672,  &
      46.70100291,  &
      45.27225954,  &
      43.84604072,  &
      42.42275113,  &
      41.00253563,  &
      39.58559266,  &
      38.17211838,  &
      36.76235233,  &
      35.35643697,  &
      33.95457572,  &
      32.55692293,  &
      31.16365609,  &
      29.77499494,  &
      28.39097277,  &
      27.01184104,  &
      25.6377145,  &
      24.26872968,  &
      22.90502165,  &
      21.54670991,  &
      20.1939213,  &
      18.84675974,  &
      17.50557432,  &
      16.17394447,  &
      14.85818697,  &
      13.56503044,  &
      12.30112216,  &
      11.07537651,  &
      9.895906459,  &
      8.766398275,  &
      7.693083339,  &
      6.681761278,  &
      5.744377195,  &
      4.88480365,  &
      4.099718857,  &
      3.388476025,  &
      2.75045331,  &
      2.19218384,  &
      1.70930598,  &
      1.297998965,  &
      0.956320495,  &
      0.678718831,  &
      0.46479546,  &
      0.302167174,  &
      0.182198111,  &
      9.8226774E-02,  &
      4.4489618E-02,  &
      1.6412611E-02,  &
      3.906034E-03,  &
      2.8223E-04,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.angular_offset  &
   real_value = (0.0d)
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.row_cnt  &
   integer_value = 181
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_inertia_chk  &
   string_value = "off"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_mass  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Ixx  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Iyy  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Izz  &
   real_value = 10.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_density  &
   real_value = 7.8E-06
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.cam_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.ref_marker  &
   object_value = .Project_last.ground.Cam_profile_2_ref_marker
!
ude modify instance  &
   instance_name = .Project_last.Cam_profile_2
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
marker create  &
   marker_name = .Project_last.Cam_profile_2.par_cam.MARKER_85  &
   adams_id = 85  &
   location = 600.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
undo end_block
!
!--------------------------- UDE Dependent Objects ----------------------------!
!
!
constraint create joint spherical  &
   joint_name = .Project_last.Sferico_Copler_follower  &
   adams_id = 22  &
   i_marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_106  &
   j_marker_name = .Project_last.coupler.MARKER_107
!
constraint attributes  &
   constraint_name = .Project_last.Sferico_Copler_follower  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Project_last.rotation_cam_ground  &
   adams_id = 14  &
   i_marker_name = .Project_last.Cam_profile_2.par_cam.MARKER_85  &
   j_marker_name = .Project_last.ground.MARKER_86
!
constraint attributes  &
   constraint_name = .Project_last.rotation_cam_ground  &
   name_visibility = off
!
constraint create joint cylindrical  &
   joint_name = .Project_last.cylindrical_follow_ground  &
   adams_id = 18  &
   i_marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_93  &
   j_marker_name = .Project_last.ground.MARKER_94
!
constraint attributes  &
   constraint_name = .Project_last.cylindrical_follow_ground  &
   name_visibility = off
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Project_last.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .Project_last.rotation_cam_ground  &
   function = ""
!
constraint attributes  &
   constraint_name = .Project_last.MOTION_1  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .Project_last.MOTION_2  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   joint_name = .Project_last.follower_1_1.joi_fol_arm_end  &
   function = ""
!
constraint attributes  &
   constraint_name = .Project_last.MOTION_2  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .Project_last.Fx_crank  &
   from_first = yes  &
   object = .Project_last.rotation_crank_ground  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.Fx_crank  &
   color = WHITE
!
measure create object  &
   measure_name = .Project_last.Angular_disp_crank  &
   from_first = yes  &
   object = .Project_last.rotation_crank_ground  &
   characteristic = ax_ay_az_projection_angles  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.Angular_disp_crank  &
   color = WHITE
!
measure create object  &
   measure_name = .Project_last.Fy_crank  &
   from_first = yes  &
   object = .Project_last.rotation_crank_ground  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.Fy_crank  &
   color = WHITE
!
measure create object  &
   measure_name = .Project_last.JOINT_20_MEA_1  &
   from_first = yes  &
   object = .Project_last.rotation_crank_ground  &
   characteristic = angular_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.JOINT_20_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .Project_last.JOINT_14_MEA_1  &
   from_first = yes  &
   object = .Project_last.rotation_cam_ground  &
   characteristic = ax_ay_az_projection_angles  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.JOINT_14_MEA_1  &
   color = WHITE
!
measure create point  &
   measure_name = .Project_last.Omega_z_crank_cm  &
   point = .Project_last.crank.cm  &
   characteristic = angular_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.Omega_z_crank_cm  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Project_last.wizard_state  &
   integer_value = 1
!
variable create  &
   variable_name = .Project_last.pippo  &
   real_value = 150.0
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Project_last.MOTION_1  &
   function = "180.0d * time"
!
constraint modify motion_generator  &
   motion_name = .Project_last.MOTION_2  &
   function = "0"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Project_last.Follower_Motion_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Project_last.follower_1_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Project_last.cam_sys_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Project_last.Cam_profile_2
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Project_last.ground.mar_follower_1_1_cont  &
   location =   &
      (LOC_RELATIVE_TO({.Project_last.follower_1_1.fol_axis_offset, .Project_last.follower_1_1.cam_disk_min_rad, 0.0mm}, .Project_last.ground.Cam_profile_2_ref_marker))  &
   orientation =   &
      (ORI_RELATIVE_TO({.Project_last.follower_1_1.fol_tilt_angle, 0.0d, 0.0d}, .Project_last.ground.Cam_profile_2_ref_marker))
!
marker modify  &
   marker_name = .Project_last.ground.follower_1_1_spring_attach_j  &
   location =   &
      (LOC_RELATIVE_TO({.Project_last.follower_1_1.fol_axis_offset * 0.0, .Project_last.follower_1_1.fol_ref_mar_y_dis + .Project_last.follower_1_1.radial_offset * 0.0 + .Project_last.follower_1_1.fol_end_ht + .Project_last.follower_1_1.fol_arm_len, -.Project_last.follower_1_1.fol_offset_along_cam_axis - .Project_last.follower_1_1.axial_offset}, .Project_last.follower_1_1.fol_ref_mar))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0d, 0.0d, 0.0d}, .Project_last.follower_1_1.fol_ref_mar))
!
marker modify  &
   marker_name = .Project_last.ground.follower_1_1_fol_attach_j  &
   location =   &
      (LOC_RELATIVE_TO({.Project_last.follower_1_1.fol_axis_offset * 0.0, .Project_last.follower_1_1.fol_arm_len / 2 + .Project_last.follower_1_1.fol_end_ht + .Project_last.follower_1_1.fol_ref_mar_y_dis + .Project_last.follower_1_1.radial_offset * 0.0, -.Project_last.follower_1_1.fol_offset_along_cam_axis - .Project_last.follower_1_1.axial_offset}, .Project_last.follower_1_1.fol_ref_mar))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0d, -90.0d, 0.0d}, .Project_last.follower_1_1.fol_ref_mar))
!
marker modify  &
   marker_name = .Project_last.ground.follower_1_1_cam_attach_j  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .Project_last.Cam_profile_2.cam_mnt_i))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0d, 0.0d, 0.0d}, .Project_last.Cam_profile_2.cam_mnt_i))
!
marker modify  &
   marker_name = .Project_last.crank.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({101.54, 0.0, 0.0}, .Project_last.crank.MARKER_1))  &
   relative_to = .Project_last.crank
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
geometry modify shape link  &
   link_name = .Project_last.crank.LINK_1  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Project_last.coupler.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({101.54, 0.0, 0.0}, .Project_last.crank.MARKER_1))  &
   relative_to = .Project_last.coupler
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
marker modify  &
   marker_name = .Project_last.coupler.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({193, 0.0, 0.0}, .Project_last.coupler.MARKER_3))  &
   relative_to = .Project_last.coupler
!
defaults coordinate_system  &
   default_coordinate_system = .Project_last.ground
!
geometry modify shape link  &
   link_name = .Project_last.coupler.LINK_2  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
geometry modify shape ellipsoid  &
   ellipsoid_name = .Project_last.PART_5.ELLIPSOID_17  &
   x_scale_factor = (2 * 4)  &
   y_scale_factor = (2 * 4)  &
   z_scale_factor = (2 * 4)
!
ude modify instance  &
   instance_name = .Project_last.Cam_profile_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Project_last.Cam_profile_2.ref_marker))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .Project_last.Cam_profile_2.ref_marker))
!
variable modify  &
   variable_name = .Project_last.pippo  &
   real_value = (MAX(.Project_last.Last_Run.Cam_profile_2.par_cam_XFORM.Y.values))
!
material modify  &
   material_name = .Project_last.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Project_last
