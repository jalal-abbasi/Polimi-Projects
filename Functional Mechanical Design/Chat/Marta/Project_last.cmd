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
   orientation = 63.4349488229d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_2  &
   adams_id = 2  &
   location = 46.9574275275, 93.914855055, 0.0  &
   orientation = 63.4349488229d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.crank.cm  &
   adams_id = 29  &
   location = 23.4787137638, 46.9574275275, 0.0  &
   orientation = 153.4349488229d, 89.9999999894d, 89.9999999595d
!
marker create  &
   marker_name = .Project_last.crank.MARKER_100  &
   adams_id = 100  &
   location = 46.9574275275, 93.914855055, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
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
   location = 46.9574275275, 93.914855055, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_4  &
   adams_id = 4  &
   location = 239.9574275275, 93.914855055, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.cm  &
   adams_id = 30  &
   location = 143.4574275275, 93.914855055, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_99  &
   adams_id = 99  &
   location = 46.9574275275, 93.914855055, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.coupler.MARKER_91  &
   adams_id = 91  &
   location = 239.9574275275, 93.914855055, 0.0  &
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
constraint create joint revolute  &
   joint_name = .Project_last.JOINT_21  &
   adams_id = 21  &
   i_marker_name = .Project_last.coupler.MARKER_99  &
   j_marker_name = .Project_last.crank.MARKER_100
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_21  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Project_last.JOINT_20  &
   adams_id = 20  &
   i_marker_name = .Project_last.crank.MARKER_97  &
   j_marker_name = .Project_last.ground.MARKER_98
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_20  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Project_last.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Project_last.PART_5.MARKER_17  &
   j_marker_name = .Project_last.crank.MARKER_18
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_4  &
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
              "simulation single_run transient type=auto_select initial_static=no end_time=5.0 number_of_steps=500 model_name=.Project_last"
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
   string_value = "C:/Users/marta/Desktop/magistrale/secondo anno/functional/progetto/ADAMS_project/C_vect_changed_second_time.csv"
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.one_cycle_duration  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.func_spl_x  &
   real_value =   &
      0.7,  &
      1.0,  &
      1.5,  &
      2.162162162,  &
      4.324324324,  &
      6.486486486,  &
      8.648648649,  &
      10.81081081,  &
      12.97297297,  &
      15.13513514,  &
      17.2972973,  &
      19.45945946,  &
      21.62162162,  &
      23.78378378,  &
      25.94594595,  &
      28.10810811,  &
      30.27027027,  &
      32.43243243,  &
      34.59459459,  &
      36.75675676,  &
      38.91891892,  &
      41.08108108,  &
      43.24324324,  &
      45.40540541,  &
      47.56756757,  &
      49.72972973,  &
      51.89189189,  &
      54.05405405,  &
      56.21621622,  &
      58.37837838,  &
      60.54054054,  &
      62.7027027,  &
      64.86486486,  &
      67.02702703,  &
      69.18918919,  &
      71.35135135,  &
      73.51351351,  &
      75.67567568,  &
      77.83783784,  &
      80.0,  &
      82.16216216,  &
      84.32432432,  &
      86.48648649,  &
      88.64864865,  &
      90.81081081,  &
      92.97297297,  &
      95.13513514,  &
      97.2972973,  &
      99.45945946,  &
      101.6216216,  &
      103.7837838,  &
      105.9459459,  &
      108.1081081,  &
      110.2702703,  &
      112.4324324,  &
      114.5945946,  &
      116.7567568,  &
      118.9189189,  &
      121.0810811,  &
      123.2432432,  &
      125.4054054,  &
      127.5675676,  &
      129.7297297,  &
      131.8918919,  &
      134.0540541,  &
      136.2162162,  &
      138.3783784,  &
      140.5405405,  &
      142.7027027,  &
      144.8648649,  &
      147.027027,  &
      149.1891892,  &
      151.3513514,  &
      153.5135135,  &
      155.6756757,  &
      157.8378378,  &
      160.0,  &
      162.1621622,  &
      164.3243243,  &
      166.4864865,  &
      168.6486486,  &
      170.8108108,  &
      172.972973,  &
      175.1351351,  &
      177.2972973,  &
      179.4594595,  &
      181.6216216,  &
      183.7837838,  &
      185.9459459,  &
      188.1081081,  &
      190.2702703,  &
      192.4324324,  &
      194.5945946,  &
      196.7567568,  &
      198.9189189,  &
      201.0810811,  &
      203.2432432,  &
      205.4054054,  &
      207.5675676,  &
      209.7297297,  &
      211.8918919,  &
      214.0540541,  &
      216.2162162,  &
      218.3783784,  &
      220.5405405,  &
      222.7027027,  &
      224.8648649,  &
      227.027027,  &
      229.1891892,  &
      231.3513514,  &
      233.5135135,  &
      235.6756757,  &
      237.8378378,  &
      240.0,  &
      242.1621622,  &
      244.3243243,  &
      246.4864865,  &
      248.6486486,  &
      250.8108108,  &
      252.972973,  &
      255.1351351,  &
      257.2972973,  &
      259.4594595,  &
      261.6216216,  &
      263.7837838,  &
      265.9459459,  &
      268.1081081,  &
      270.2702703,  &
      272.4324324,  &
      274.5945946,  &
      276.7567568,  &
      278.9189189,  &
      281.0810811,  &
      283.2432432,  &
      285.4054054,  &
      287.5675676,  &
      289.7297297,  &
      291.8918919,  &
      294.0540541,  &
      296.2162162,  &
      298.3783784,  &
      300.5405405,  &
      302.7027027,  &
      304.8648649,  &
      307.027027,  &
      309.1891892,  &
      311.3513514,  &
      313.5135135,  &
      315.6756757,  &
      317.8378378,  &
      320.0,  &
      322.1621622,  &
      324.3243243,  &
      326.4864865,  &
      328.6486486,  &
      330.8108108,  &
      332.972973,  &
      335.1351351,  &
      337.2972973,  &
      339.4594595,  &
      341.6216216,  &
      343.7837838,  &
      345.9459459,  &
      348.1081081,  &
      350.2702703,  &
      352.4324324,  &
      354.5945946,  &
      356.7567568,  &
      358.9189189,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.jerk_x  &
   real_value =   &
      0.7,  &
      1.0,  &
      1.5,  &
      2.162162162,  &
      4.324324324,  &
      6.486486486,  &
      8.648648649,  &
      10.81081081,  &
      12.97297297,  &
      15.13513514,  &
      17.2972973,  &
      19.45945946,  &
      21.62162162,  &
      23.78378378,  &
      25.94594595,  &
      28.10810811,  &
      30.27027027,  &
      32.43243243,  &
      34.59459459,  &
      36.75675676,  &
      38.91891892,  &
      41.08108108,  &
      43.24324324,  &
      45.40540541,  &
      47.56756757,  &
      49.72972973,  &
      51.89189189,  &
      54.05405405,  &
      56.21621622,  &
      58.37837838,  &
      60.54054054,  &
      62.7027027,  &
      64.86486486,  &
      67.02702703,  &
      69.18918919,  &
      71.35135135,  &
      73.51351351,  &
      75.67567568,  &
      77.83783784,  &
      80.0,  &
      82.16216216,  &
      84.32432432,  &
      86.48648649,  &
      88.64864865,  &
      90.81081081,  &
      92.97297297,  &
      95.13513514,  &
      97.2972973,  &
      99.45945946,  &
      101.6216216,  &
      103.7837838,  &
      105.9459459,  &
      108.1081081,  &
      110.2702703,  &
      112.4324324,  &
      114.5945946,  &
      116.7567568,  &
      118.9189189,  &
      121.0810811,  &
      123.2432432,  &
      125.4054054,  &
      127.5675676,  &
      129.7297297,  &
      131.8918919,  &
      134.0540541,  &
      136.2162162,  &
      138.3783784,  &
      140.5405405,  &
      142.7027027,  &
      144.8648649,  &
      147.027027,  &
      149.1891892,  &
      151.3513514,  &
      153.5135135,  &
      155.6756757,  &
      157.8378378,  &
      160.0,  &
      162.1621622,  &
      164.3243243,  &
      166.4864865,  &
      168.6486486,  &
      170.8108108,  &
      172.972973,  &
      175.1351351,  &
      177.2972973,  &
      179.4594595,  &
      181.6216216,  &
      183.7837838,  &
      185.9459459,  &
      188.1081081,  &
      190.2702703,  &
      192.4324324,  &
      194.5945946,  &
      196.7567568,  &
      198.9189189,  &
      201.0810811,  &
      203.2432432,  &
      205.4054054,  &
      207.5675676,  &
      209.7297297,  &
      211.8918919,  &
      214.0540541,  &
      216.2162162,  &
      218.3783784,  &
      220.5405405,  &
      222.7027027,  &
      224.8648649,  &
      227.027027,  &
      229.1891892,  &
      231.3513514,  &
      233.5135135,  &
      235.6756757,  &
      237.8378378,  &
      240.0,  &
      242.1621622,  &
      244.3243243,  &
      246.4864865,  &
      248.6486486,  &
      250.8108108,  &
      252.972973,  &
      255.1351351,  &
      257.2972973,  &
      259.4594595,  &
      261.6216216,  &
      263.7837838,  &
      265.9459459,  &
      268.1081081,  &
      270.2702703,  &
      272.4324324,  &
      274.5945946,  &
      276.7567568,  &
      278.9189189,  &
      281.0810811,  &
      283.2432432,  &
      285.4054054,  &
      287.5675676,  &
      289.7297297,  &
      291.8918919,  &
      294.0540541,  &
      296.2162162,  &
      298.3783784,  &
      300.5405405,  &
      302.7027027,  &
      304.8648649,  &
      307.027027,  &
      309.1891892,  &
      311.3513514,  &
      313.5135135,  &
      315.6756757,  &
      317.8378378,  &
      320.0,  &
      322.1621622,  &
      324.3243243,  &
      326.4864865,  &
      328.6486486,  &
      330.8108108,  &
      332.972973,  &
      335.1351351,  &
      337.2972973,  &
      339.4594595,  &
      341.6216216,  &
      343.7837838,  &
      345.9459459,  &
      348.1081081,  &
      350.2702703,  &
      352.4324324,  &
      354.5945946,  &
      356.7567568,  &
      358.9189189,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.jerk_y  &
   real_value =   &
      -2.7562749301E+07,  &
      4.0527089226E+06,  &
      2.2141445231E+06,  &
      -6.5851332478E+05,  &
      5.8339150115E+05,  &
      4.1343673868E+05,  &
      1.722725383E+05,  &
      8.101543465E+04,  &
      -2.300082024E+04,  &
      6.2434027207E+04,  &
      3.0389704596E+04,  &
      4.4643053807E+04,  &
      6.4075811991E+04,  &
      7.3814383961E+04,  &
      -1.3797838373E+05,  &
      -3.8778154055E+05,  &
      -4.4413127577E+05,  &
      -4.4994377179E+05,  &
      -4.8579304086E+05,  &
      -4.9467314287E+05,  &
      -5.1470591305E+05,  &
      -5.3338852563E+05,  &
      -3.3944022409E+05,  &
      -6.6438626155E+04,  &
      -220.6983009926,  &
      -1326.094304543,  &
      9109.511511966,  &
      1.1072122522E+04,  &
      8967.8239360952,  &
      -1.5074001153E+04,  &
      1.4563778386E+05,  &
      4.0545711971E+05,  &
      4.8000434488E+05,  &
      4.7679321062E+05,  &
      3.3476813589E+05,  &
      6.2951351067E+04,  &
      -2.6004955358E+04,  &
      4482.7500916258,  &
      786.7166304404,  &
      -1097.6608105104,  &
      626.6622079753,  &
      -282.450160296,  &
      113.1865846867,  &
      -42.2033910659,  &
      14.979544258,  &
      -5.1285395616,  &
      1.7080194878,  &
      -0.5565243758,  &
      0.1781321898,  &
      -5.6179854607E-02,  &
      1.7498446304E-02,  &
      -5.3923741032E-03,  &
      1.6464326788E-03,  &
      -4.9864898126E-04,  &
      1.4994999727E-04,  &
      -4.4806667867E-05,  &
      1.331290931E-05,  &
      -3.9353483914E-06,  &
      1.1579342902E-06,  &
      -3.3927908065E-07,  &
      9.9028881625E-08,  &
      -2.8803828912E-08,  &
      8.3542479498E-09,  &
      -2.427807797E-09,  &
      7.4545762784E-10,  &
      -3.7338538116E-10,  &
      6.5979748222E-10,  &
      -2.1041294804E-09,  &
      7.2189033311E-09,  &
      -2.4853448589E-08,  &
      8.5326185191E-08,  &
      -2.9188543599E-07,  &
      9.9451908882E-07,  &
      -3.3737722267E-06,  &
      1.1390100195E-05,  &
      -3.8249400905E-05,  &
      1.276864735E-04,  &
      -4.2342709482E-04,  &
      1.3936575688E-03,  &
      -4.5481073528E-03,  &
      1.4697928554E-02,  &
      -4.6962737073E-02,  &
      0.1480688669,  &
      -0.4594914019,  &
      1.3986948923,  &
      -4.1570655051,  &
      11.9839293669,  &
      -33.1777715206,  &
      86.8070066866,  &
      -208.5180133774,  &
      432.0085160028,  &
      -636.2833960093,  &
      -88.4554574754,  &
      5121.0830530245,  &
      -2.0565851862E+04,  &
      -7.3180830894E+04,  &
      -9.2124668937E+04,  &
      -8.3597869954E+04,  &
      -9.4410607757E+04,  &
      -1.0632504628E+05,  &
      -8.8563367631E+04,  &
      -5.5164517874E+04,  &
      -1.5530793073E+04,  &
      -9334.662245692,  &
      -1.9440829399E+04,  &
      9465.9948545,  &
      1.4119807716E+04,  &
      -1963.0956231419,  &
      -1.0719389733E+04,  &
      -1.9162486487E+04,  &
      1.0946248201E+04,  &
      1.8048598279E+04,  &
      3097.4932591535,  &
      -5455.5207178707,  &
      -1.7838276176E+04,  &
      4.6644478177E+04,  &
      1.0804031144E+05,  &
      9.8635754323E+04,  &
      9.331530533E+04,  &
      9.6995220827E+04,  &
      1.0667002409E+05,  &
      1.0544576639E+05,  &
      8.9955053084E+04,  &
      9.129828454E+04,  &
      1.0215669675E+05,  &
      8.9566603495E+04,  &
      7.6000540438E+04,  &
      7.6643750892E+04,  &
      8.1581031089E+04,  &
      6.6530454065E+04,  &
      -9111.6608228652,  &
      -3.4890577318E+04,  &
      -8961.9231643753,  &
      -7161.4335751141,  &
      1.2702904794E+04,  &
      -1.2651247331E+04,  &
      -3.0378798901E+04,  &
      -6801.4337057576,  &
      -5056.7782206859,  &
      1.6028727761E+04,  &
      -8308.8455026904,  &
      -2.5483906338E+04,  &
      -2922.700532761,  &
      -3.5810956757E+04,  &
      -6.2409839778E+04,  &
      -8.7165518712E+04,  &
      -9.8237828326E+04,  &
      -7.2190526629E+04,  &
      -7.6868409357E+04,  &
      -8.0210421525E+04,  &
      -4.0766527897E+04,  &
      -1796.9222335371,  &
      2856.1518513392,  &
      -1124.6091878409,  &
      323.3959338328,  &
      -72.6774353936,  &
      10.4003382621,  &
      1.0722753848,  &
      -1.7039183184,  &
      0.9386505981,  &
      -0.4081560044,  &
      0.15869392,  &
      -5.7717294845E-02,  &
      2.0057869053E-02,  &
      -6.75609925E-03,  &
      2.2068507663E-03,  &
      -7.2223114765E-04,  &
      2.1667613684E-04,  &
      -9.9055763018E-05,  &
      8.4793466837E-04
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.accl_x  &
   real_value =   &
      0.7,  &
      1.0,  &
      1.5,  &
      2.162162162,  &
      4.324324324,  &
      6.486486486,  &
      8.648648649,  &
      10.81081081,  &
      12.97297297,  &
      15.13513514,  &
      17.2972973,  &
      19.45945946,  &
      21.62162162,  &
      23.78378378,  &
      25.94594595,  &
      28.10810811,  &
      30.27027027,  &
      32.43243243,  &
      34.59459459,  &
      36.75675676,  &
      38.91891892,  &
      41.08108108,  &
      43.24324324,  &
      45.40540541,  &
      47.56756757,  &
      49.72972973,  &
      51.89189189,  &
      54.05405405,  &
      56.21621622,  &
      58.37837838,  &
      60.54054054,  &
      62.7027027,  &
      64.86486486,  &
      67.02702703,  &
      69.18918919,  &
      71.35135135,  &
      73.51351351,  &
      75.67567568,  &
      77.83783784,  &
      80.0,  &
      82.16216216,  &
      84.32432432,  &
      86.48648649,  &
      88.64864865,  &
      90.81081081,  &
      92.97297297,  &
      95.13513514,  &
      97.2972973,  &
      99.45945946,  &
      101.6216216,  &
      103.7837838,  &
      105.9459459,  &
      108.1081081,  &
      110.2702703,  &
      112.4324324,  &
      114.5945946,  &
      116.7567568,  &
      118.9189189,  &
      121.0810811,  &
      123.2432432,  &
      125.4054054,  &
      127.5675676,  &
      129.7297297,  &
      131.8918919,  &
      134.0540541,  &
      136.2162162,  &
      138.3783784,  &
      140.5405405,  &
      142.7027027,  &
      144.8648649,  &
      147.027027,  &
      149.1891892,  &
      151.3513514,  &
      153.5135135,  &
      155.6756757,  &
      157.8378378,  &
      160.0,  &
      162.1621622,  &
      164.3243243,  &
      166.4864865,  &
      168.6486486,  &
      170.8108108,  &
      172.972973,  &
      175.1351351,  &
      177.2972973,  &
      179.4594595,  &
      181.6216216,  &
      183.7837838,  &
      185.9459459,  &
      188.1081081,  &
      190.2702703,  &
      192.4324324,  &
      194.5945946,  &
      196.7567568,  &
      198.9189189,  &
      201.0810811,  &
      203.2432432,  &
      205.4054054,  &
      207.5675676,  &
      209.7297297,  &
      211.8918919,  &
      214.0540541,  &
      216.2162162,  &
      218.3783784,  &
      220.5405405,  &
      222.7027027,  &
      224.8648649,  &
      227.027027,  &
      229.1891892,  &
      231.3513514,  &
      233.5135135,  &
      235.6756757,  &
      237.8378378,  &
      240.0,  &
      242.1621622,  &
      244.3243243,  &
      246.4864865,  &
      248.6486486,  &
      250.8108108,  &
      252.972973,  &
      255.1351351,  &
      257.2972973,  &
      259.4594595,  &
      261.6216216,  &
      263.7837838,  &
      265.9459459,  &
      268.1081081,  &
      270.2702703,  &
      272.4324324,  &
      274.5945946,  &
      276.7567568,  &
      278.9189189,  &
      281.0810811,  &
      283.2432432,  &
      285.4054054,  &
      287.5675676,  &
      289.7297297,  &
      291.8918919,  &
      294.0540541,  &
      296.2162162,  &
      298.3783784,  &
      300.5405405,  &
      302.7027027,  &
      304.8648649,  &
      307.027027,  &
      309.1891892,  &
      311.3513514,  &
      313.5135135,  &
      315.6756757,  &
      317.8378378,  &
      320.0,  &
      322.1621622,  &
      324.3243243,  &
      326.4864865,  &
      328.6486486,  &
      330.8108108,  &
      332.972973,  &
      335.1351351,  &
      337.2972973,  &
      339.4594595,  &
      341.6216216,  &
      343.7837838,  &
      345.9459459,  &
      348.1081081,  &
      350.2702703,  &
      352.4324324,  &
      354.5945946,  &
      356.7567568,  &
      358.9189189,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Follower_Motion_1.accl_y  &
   real_value =   &
      1163.9889088066,  &
      -1275.8248956211,  &
      5615.3896743469,  &
      2866.2233039683,  &
      4218.3512588653,  &
      7898.4485702591,  &
      9069.7523860579,  &
      1.0256471688E+04,  &
      1.0018460801E+04,  &
      1.0359081723E+04,  &
      1.0533143316E+04,  &
      1.0816802946E+04,  &
      1.1079764536E+04,  &
      1.1567074926E+04,  &
      1.1522917497E+04,  &
      9833.5797971198,  &
      7252.1752024287,  &
      4599.8452316292,  &
      1787.3115364898,  &
      -1181.5142921467,  &
      -4177.0358693517,  &
      -7361.4648778295,  &
      -1.0158417723E+04,  &
      -1.1280560073E+04,  &
      -1.1370460623E+04,  &
      -1.1417992533E+04,  &
      -1.1363284575E+04,  &
      -1.1325531924E+04,  &
      -1.1238428067E+04,  &
      -1.1261729287E+04,  &
      -1.1049620052E+04,  &
      -9313.9129646639,  &
      -6550.1794008701,  &
      -3703.7673915457,  &
      -1100.8394063852,  &
      57.628211904,  &
      21.4200206924,  &
      -15.6164739003,  &
      6.8309548741,  &
      -2.5394852987,  &
      0.8704655774,  &
      -0.2841542545,  &
      8.9781189634E-02,  &
      -2.7712237031E-02,  &
      8.4049436503E-03,  &
      -2.5145466169E-03,  &
      7.4409366946E-04,  &
      -2.1822227112E-04,  &
      6.3521441573E-05,  &
      -1.8373383226E-05,  &
      5.2856322627E-06,  &
      -1.5134122191E-06,  &
      4.3154381765E-07,  &
      -1.2260553695E-07,  &
      3.4720655774E-08,  &
      -9.8040613812E-09,  &
      2.7611499803E-09,  &
      -7.7579583399E-10,  &
      2.1750608482E-10,  &
      -6.0861515955E-11,  &
      1.6999318293E-11,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      0.0,  &
      -1.4909622503E-11,  &
      5.3341050611E-11,  &
      -1.904782435E-10,  &
      6.7880377618E-10,  &
      -2.4136406675E-09,  &
      8.5611423482E-09,  &
      -3.0283556813E-08,  &
      1.0679822593E-07,  &
      -3.7535725094E-07,  &
      1.3141972868E-06,  &
      -4.5812500683E-06,  &
      1.5890508183E-05,  &
      -5.4799791346E-05,  &
      1.8770497315E-04,  &
      -6.3778633555E-04,  &
      2.1461092225E-03,  &
      -7.1355590916E-03,  &
      2.3369093118E-02,  &
      -7.5043769268E-02,  &
      0.2346448277,  &
      -0.7061880457,  &
      2.002878327,  &
      -5.1137566143,  &
      10.273104037,  &
      -5.454047632,  &
      -290.6741528502,  &
      -817.0933705334,  &
      -1342.2805057398,  &
      -1859.9897969694,  &
      -2478.5474597956,  &
      -3077.7558760149,  &
      -3511.0660669474,  &
      -3727.910493837,  &
      -3764.5642677047,  &
      -3872.6758010577,  &
      -3919.9836538825,  &
      -3807.524731733,  &
      -3791.891302169,  &
      -3816.4375744835,  &
      -3920.0257208907,  &
      -3969.4367469723,  &
      -3834.598083894,  &
      -3796.787829588,  &
      -3784.5819674831,  &
      -3869.9867611189,  &
      -3844.970649056,  &
      -3315.8727526847,  &
      -2688.931660149,  &
      -2122.8825014048,  &
      -1550.0083245467,  &
      -945.7729734838,  &
      -290.5066627955,  &
      292.2813889247,  &
      823.7361014551,  &
      1408.0068842234,  &
      2003.8996086531,  &
      2481.9281007379,  &
      2945.2660228546,  &
      3411.1704879677,  &
      3885.2026116808,  &
      4089.0307372434,  &
      3875.5794613231,  &
      3773.4433647006,  &
      3719.6240995922,  &
      3723.5840018276,  &
      3781.684040057,  &
      3586.8855395365,  &
      3499.4660719673,  &
      3461.4775067664,  &
      3477.4444127277,  &
      3563.0776813491,  &
      3391.9778259007,  &
      3336.5167807847,  &
      3245.8603789924,  &
      2918.9464811492,  &
      2499.8827340146,  &
      1899.3073374834,  &
      1394.1623034819,  &
      970.6419894692,  &
      473.4924677428,  &
      92.8109197909,  &
      -17.1450890516,  &
      2.524500825,  &
      -0.1219139268,  &
      -0.1159175301,  &
      7.0873039548E-02,  &
      -2.9658245537E-02,  &
      1.0805349041E-02,  &
      -3.6612045696E-03,  &
      1.1862422419E-03,  &
      -3.7284535838E-04,  &
      1.1463570217E-04,  &
      -3.4667589727E-05,  &
      1.0343812491E-05,  &
      -3.0586813464E-06,  &
      8.9167722065E-07,  &
      -2.6385553728E-07,  &
      7.2772452986E-08,  &
      -3.2549163398E-08,  &
      1.9044047726E-07
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
      1.56937E-02,  &
      0.1191776,  &
      0.3977118,  &
      0.9389159,  &
      1.8181483,  &
      3.0572492,  &
      4.6617641,  &
      6.6385829,  &
      8.9959742,  &
      11.7434186,  &
      14.8914192,  &
      18.4537187,  &
      22.4288623,  &
      26.7549982,  &
      31.3425448,  &
      36.0956225,  &
      40.9126001,  &
      45.6871219,  &
      50.309723,  &
      54.6697979,  &
      58.6661573,  &
      62.2595486,  &
      65.4431921,  &
      68.2149185,  &
      70.5769423,  &
      72.5306259,  &
      74.0780168,  &
      75.2214744,  &
      75.9692534,  &
      76.3841204,  &
      76.5642415,  &
      76.6081095,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6088472,  &
      76.5969222,  &
      76.5554091,  &
      76.465458,  &
      76.3081959,  &
      76.0616843,  &
      75.7043932,  &
      75.2214204,  &
      74.6040474,  &
      73.8510654,  &
      72.9586204,  &
      71.924719,  &
      70.7538442,  &
      69.4455894,  &
      67.9996266,  &
      66.4126801,  &
      64.6823878,  &
      62.81424,  &
      60.8086078,  &
      58.6661609,  &
      56.3851841,  &
      53.9657424,  &
      51.428014,  &
      48.7925797,  &
      46.080841,  &
      43.3132648,  &
      40.5115087,  &
      37.6993662,  &
      34.8973535,  &
      32.1255043,  &
      29.4040116,  &
      26.7550066,  &
      24.1950728,  &
      21.7415715,  &
      19.4111785,  &
      17.2195818,  &
      15.1754043,  &
      13.2702306,  &
      11.5018141,  &
      9.8679579,  &
      8.367649,  &
      7.0043432,  &
      5.7696484,  &
      4.6617628,  &
      3.6792081,  &
      2.8212735,  &
      2.0925023,  &
      1.4853479,  &
      0.9986844,  &
      0.628949,  &
      0.363227,  &
      0.1883525,  &
      8.12119E-02,  &
      2.52286E-02,  &
      3.7172E-03,  &
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
   string_value = "spring"
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
   real_value = 100.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_free_len  &
   real_value = 300.0
!
variable modify  &
   variable_name = .Project_last.follower_1_1.spr_damping  &
   real_value = 1.0
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
   marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_92  &
   adams_id = 92  &
   location = 239.9574275275, 93.914855055, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_93  &
   adams_id = 93  &
   location = 325.0, 150.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
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
      3.6335906045,  &
      -5.4881925677E-02,  &
      0.0,  &
      7.5699391129,  &
      -0.1782337804,  &
      0.0,  &
      11.7237330466,  &
      -0.3314310214,  &
      0.0,  &
      16.4370849139,  &
      -0.4564344529,  &
      0.0,  &
      21.969188958,  &
      -0.4750642425,  &
      0.0,  &
      27.849334672,  &
      -0.2943184154,  &
      0.0,  &
      32.9682282397,  &
      1.4322066598E-02,  &
      0.0,  &
      38.3370909403,  &
      0.4702345657,  &
      0.0,  &
      43.7770550138,  &
      1.0499221294,  &
      0.0,  &
      49.3174588658,  &
      1.7397262454,  &
      0.0,  &
      54.978889754,  &
      2.5240903554,  &
      0.0,  &
      60.7963768516,  &
      3.3896148089,  &
      0.0,  &
      66.8025949789,  &
      4.3226591814,  &
      0.0,  &
      72.9491145157,  &
      5.2831747101,  &
      0.0,  &
      79.0885766388,  &
      6.18395795,  &
      0.0,  &
      85.2166836385,  &
      6.9558316404,  &
      0.0,  &
      91.3627710559,  &
      7.5444780949,  &
      0.0,  &
      97.4199718809,  &
      7.8786493573,  &
      0.0,  &
      103.3880280284,  &
      7.9131508868,  &
      0.0,  &
      109.2954829317,  &
      7.6184371166,  &
      0.0,  &
      114.8619051357,  &
      6.9648850199,  &
      0.0,  &
      120.1345586252,  &
      5.9377127404,  &
      0.0,  &
      125.0935488556,  &
      4.5375971657,  &
      0.0,  &
      129.8921430436,  &
      2.7359679313,  &
      0.0,  &
      134.4811182916,  &
      0.5529324528,  &
      0.0,  &
      138.8250004294,  &
      -1.9879592914,  &
      0.0,  &
      142.9177893944,  &
      -4.8741265042,  &
      0.0,  &
      146.729226638,  &
      -8.0781356308,  &
      0.0,  &
      150.2449737916,  &
      -11.5809030828,  &
      0.0,  &
      153.4523480455,  &
      -15.3637828509,  &
      0.0,  &
      156.3202468739,  &
      -19.3874298704,  &
      0.0,  &
      158.9533759958,  &
      -23.7744490596,  &
      0.0,  &
      161.4337440562,  &
      -28.6293666024,  &
      0.0,  &
      163.7468019215,  &
      -33.882307208,  &
      0.0,  &
      165.9353676348,  &
      -39.53363248,  &
      0.0,  &
      167.9573957891,  &
      -45.3989877009,  &
      0.0,  &
      169.7676859567,  &
      -51.3185425249,  &
      0.0,  &
      171.3635419429,  &
      -57.2742703272,  &
      0.0,  &
      172.750258365,  &
      -63.2807990543,  &
      0.0,  &
      173.9265052075,  &
      -69.3320644716,  &
      0.0,  &
      174.8908493947,  &
      -75.4206940443,  &
      0.0,  &
      175.6421160218,  &
      -81.5392697151,  &
      0.0,  &
      176.1793897861,  &
      -87.6803369421,  &
      0.0,  &
      176.5020161024,  &
      -93.8364137809,  &
      0.0,  &
      176.6096019,  &
      -100.0,  &
      0.0,  &
      176.5020161024,  &
      -106.1635862191,  &
      0.0,  &
      176.1793897861,  &
      -112.3196630579,  &
      0.0,  &
      175.6421160218,  &
      -118.4607302849,  &
      0.0,  &
      174.8908493947,  &
      -124.5793059557,  &
      0.0,  &
      173.9265052075,  &
      -130.6679355284,  &
      0.0,  &
      172.750258365,  &
      -136.7192009457,  &
      0.0,  &
      171.3635419429,  &
      -142.7257296728,  &
      0.0,  &
      169.7680454414,  &
      -148.6802036796,  &
      0.0,  &
      167.9657127273,  &
      -154.5753683569,  &
      0.0,  &
      165.9587396654,  &
      -160.4040413545,  &
      0.0,  &
      163.7495714431,  &
      -166.1591213323,  &
      0.0,  &
      161.3408995918,  &
      -171.8335966118,  &
      0.0,  &
      158.735658707,  &
      -177.4205537189,  &
      0.0,  &
      155.9370228734,  &
      -182.913185807,  &
      0.0,  &
      152.9484017977,  &
      -188.30480095,  &
      0.0,  &
      149.7734366542,  &
      -193.5888302954,  &
      0.0,  &
      146.4159956491,  &
      -198.7588360673,  &
      0.0,  &
      142.8801693069,  &
      -203.8085194101,  &
      0.0,  &
      139.1702654874,  &
      -208.7317280624,  &
      0.0,  &
      135.2908041369,  &
      -213.522463853,  &
      0.0,  &
      131.2465117816,  &
      -218.1748900081,  &
      0.0,  &
      127.0423157686,  &
      -222.6833382633,  &
      0.0,  &
      122.6833382633,  &
      -227.0423157686,  &
      0.0,  &
      118.1748900081,  &
      -231.2465117816,  &
      0.0,  &
      113.522463853,  &
      -235.290804137,  &
      0.0,  &
      108.7317280624,  &
      -239.1702654874,  &
      0.0,  &
      103.8085194101,  &
      -242.8801693069,  &
      0.0,  &
      98.7588360673,  &
      -246.4159956491,  &
      0.0,  &
      93.5888302954,  &
      -249.7734366542,  &
      0.0,  &
      88.30480095,  &
      -252.9484017977,  &
      0.0,  &
      82.913185807,  &
      -255.9370228734,  &
      0.0,  &
      77.4205537189,  &
      -258.735658707,  &
      0.0,  &
      71.8335966118,  &
      -261.3408995918,  &
      0.0,  &
      66.1591213323,  &
      -263.7495714431,  &
      0.0,  &
      60.4040413545,  &
      -265.9587396654,  &
      0.0,  &
      54.5753683569,  &
      -267.9657127273,  &
      0.0,  &
      48.6802036796,  &
      -269.7680454414,  &
      0.0,  &
      42.7257296728,  &
      -271.3635419429,  &
      0.0,  &
      36.7192009457,  &
      -272.750258365,  &
      0.0,  &
      30.6679355284,  &
      -273.9265052075,  &
      0.0,  &
      24.5793059557,  &
      -274.8908493947,  &
      0.0,  &
      18.4607302849,  &
      -275.6421160218,  &
      0.0,  &
      12.3196630579,  &
      -276.1793897861,  &
      0.0,  &
      6.1635862191,  &
      -276.5020161024,  &
      0.0,  &
      0.0,  &
      -276.6096019,  &
      0.0,  &
      -6.1635862191,  &
      -276.5020161024,  &
      0.0,  &
      -12.3196630579,  &
      -276.1793897861,  &
      0.0,  &
      -18.4607302849,  &
      -275.6421160218,  &
      0.0,  &
      -24.5793059557,  &
      -274.8908493947,  &
      0.0,  &
      -30.6679355284,  &
      -273.9265052075,  &
      0.0,  &
      -36.7192009457,  &
      -272.750258365,  &
      0.0,  &
      -42.7257296727,  &
      -271.3635419429,  &
      0.0,  &
      -48.6802036796,  &
      -269.7680454414,  &
      0.0,  &
      -54.5753683569,  &
      -267.9657127273,  &
      0.0,  &
      -60.4027132322,  &
      -265.9589588819,  &
      0.0,  &
      -66.1410056461,  &
      -263.7528894108,  &
      0.0,  &
      -71.7388239328,  &
      -261.3586845549,  &
      0.0,  &
      -77.1781593709,  &
      -258.7741473084,  &
      0.0,  &
      -82.4617295151,  &
      -255.9897997825,  &
      0.0,  &
      -87.56722125,  &
      -253.0078117479,  &
      0.0,  &
      -92.4677142269,  &
      -249.8332066476,  &
      0.0,  &
      -97.1564100284,  &
      -246.461677584,  &
      0.0,  &
      -101.6390500786,  &
      -242.8838697837,  &
      0.0,  &
      -105.9079498739,  &
      -239.1019519488,  &
      0.0,  &
      -109.9715396325,  &
      -235.1093128175,  &
      0.0,  &
      -113.8035566203,  &
      -230.9300548774,  &
      0.0,  &
      -117.3900164523,  &
      -226.578936331,  &
      0.0,  &
      -120.7429417982,  &
      -222.0465673092,  &
      0.0,  &
      -123.8436017924,  &
      -217.3603122006,  &
      0.0,  &
      -126.6762171696,  &
      -212.5457921971,  &
      0.0,  &
      -129.2345404135,  &
      -207.6166761364,  &
      0.0,  &
      -131.5046562349,  &
      -202.5998284049,  &
      0.0,  &
      -133.4912249258,  &
      -197.4916952163,  &
      0.0,  &
      -135.1974690945,  &
      -192.2950395475,  &
      0.0,  &
      -136.6077152781,  &
      -187.0598925165,  &
      0.0,  &
      -137.7244437108,  &
      -181.7904987283,  &
      0.0,  &
      -138.5436287927,  &
      -176.5144605229,  &
      0.0,  &
      -139.0639070123,  &
      -171.2528158036,  &
      0.0,  &
      -139.3018803169,  &
      -165.942639358,  &
      0.0,  &
      -139.2640648336,  &
      -160.6164733714,  &
      0.0,  &
      -138.9606574154,  &
      -155.3017435503,  &
      0.0,  &
      -138.4038740366,  &
      -150.0185405778,  &
      0.0,  &
      -137.6072295889,  &
      -144.7874138014,  &
      0.0,  &
      -136.5835708225,  &
      -139.5879191108,  &
      0.0,  &
      -135.3558284406,  &
      -134.4785800779,  &
      0.0,  &
      -133.9371953278,  &
      -129.4529108353,  &
      0.0,  &
      -132.3415753983,  &
      -124.5011675076,  &
      0.0,  &
      -130.5923914872,  &
      -119.649775951,  &
      0.0,  &
      -128.701371027,  &
      -114.8802821833,  &
      0.0,  &
      -126.6948973578,  &
      -110.2209667987,  &
      0.0,  &
      -124.5824547904,  &
      -105.6526238894,  &
      0.0,  &
      -122.380670056,  &
      -101.1733835482,  &
      0.0,  &
      -120.1037950693,  &
      -96.7753682911,  &
      0.0,  &
      -117.7684183901,  &
      -92.4569808541,  &
      0.0,  &
      -115.4190679852,  &
      -88.2903489142,  &
      0.0,  &
      -113.0501508427,  &
      -84.2575701477,  &
      0.0,  &
      -110.6450145151,  &
      -80.316824141,  &
      0.0,  &
      -108.2171637884,  &
      -76.4817476668,  &
      0.0,  &
      -105.755237974,  &
      -72.7209691162,  &
      0.0,  &
      -103.2675101233,  &
      -69.0358925053,  &
      0.0,  &
      -100.7863725047,  &
      -65.476081453,  &
      0.0,  &
      -98.2716388797,  &
      -61.9750113365,  &
      0.0,  &
      -95.736710891,  &
      -58.5464509852,  &
      0.0,  &
      -93.1810935789,  &
      -55.1850284343,  &
      0.0,  &
      -90.5789193548,  &
      -51.8446213555,  &
      0.0,  &
      -87.9850537895,  &
      -48.5985327818,  &
      0.0,  &
      -85.3710090884,  &
      -45.4099840382,  &
      0.0,  &
      -82.7244788384,  &
      -42.2608407706,  &
      0.0,  &
      -80.0870157244,  &
      -39.2085121552,  &
      0.0,  &
      -77.4487236957,  &
      -36.2504634804,  &
      0.0,  &
      -74.825486187,  &
      -33.4192010718,  &
      0.0,  &
      -72.2162875376,  &
      -30.7292667084,  &
      0.0,  &
      -69.5803154866,  &
      -28.1472163249,  &
      0.0,  &
      -66.9317117024,  &
      -25.6978465442,  &
      0.0,  &
      -64.2623101535,  &
      -23.381739766,  &
      0.0,  &
      -61.5586810577,  &
      -21.1930889105,  &
      0.0,  &
      -58.7785252292,  &
      -19.0983005625,  &
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
      0.7,  &
      1.0,  &
      1.5,  &
      2.162162162,  &
      4.324324324,  &
      6.486486486,  &
      8.648648649,  &
      10.81081081,  &
      12.97297297,  &
      15.13513514,  &
      17.2972973,  &
      19.45945946,  &
      21.62162162,  &
      23.78378378,  &
      25.94594595,  &
      28.10810811,  &
      30.27027027,  &
      32.43243243,  &
      34.59459459,  &
      36.75675676,  &
      38.91891892,  &
      41.08108108,  &
      43.24324324,  &
      45.40540541,  &
      47.56756757,  &
      49.72972973,  &
      51.89189189,  &
      54.05405405,  &
      56.21621622,  &
      58.37837838,  &
      60.54054054,  &
      62.7027027,  &
      64.86486486,  &
      67.02702703,  &
      69.18918919,  &
      71.35135135,  &
      73.51351351,  &
      75.67567568,  &
      77.83783784,  &
      80.0,  &
      82.16216216,  &
      84.32432432,  &
      86.48648649,  &
      88.64864865,  &
      90.81081081,  &
      92.97297297,  &
      95.13513514,  &
      97.2972973,  &
      99.45945946,  &
      101.6216216,  &
      103.7837838,  &
      105.9459459,  &
      108.1081081,  &
      110.2702703,  &
      112.4324324,  &
      114.5945946,  &
      116.7567568,  &
      118.9189189,  &
      121.0810811,  &
      123.2432432,  &
      125.4054054,  &
      127.5675676,  &
      129.7297297,  &
      131.8918919,  &
      134.0540541,  &
      136.2162162,  &
      138.3783784,  &
      140.5405405,  &
      142.7027027,  &
      144.8648649,  &
      147.027027,  &
      149.1891892,  &
      151.3513514,  &
      153.5135135,  &
      155.6756757,  &
      157.8378378,  &
      160.0,  &
      162.1621622,  &
      164.3243243,  &
      166.4864865,  &
      168.6486486,  &
      170.8108108,  &
      172.972973,  &
      175.1351351,  &
      177.2972973,  &
      179.4594595,  &
      181.6216216,  &
      183.7837838,  &
      185.9459459,  &
      188.1081081,  &
      190.2702703,  &
      192.4324324,  &
      194.5945946,  &
      196.7567568,  &
      198.9189189,  &
      201.0810811,  &
      203.2432432,  &
      205.4054054,  &
      207.5675676,  &
      209.7297297,  &
      211.8918919,  &
      214.0540541,  &
      216.2162162,  &
      218.3783784,  &
      220.5405405,  &
      222.7027027,  &
      224.8648649,  &
      227.027027,  &
      229.1891892,  &
      231.3513514,  &
      233.5135135,  &
      235.6756757,  &
      237.8378378,  &
      240.0,  &
      242.1621622,  &
      244.3243243,  &
      246.4864865,  &
      248.6486486,  &
      250.8108108,  &
      252.972973,  &
      255.1351351,  &
      257.2972973,  &
      259.4594595,  &
      261.6216216,  &
      263.7837838,  &
      265.9459459,  &
      268.1081081,  &
      270.2702703,  &
      272.4324324,  &
      274.5945946,  &
      276.7567568,  &
      278.9189189,  &
      281.0810811,  &
      283.2432432,  &
      285.4054054,  &
      287.5675676,  &
      289.7297297,  &
      291.8918919,  &
      294.0540541,  &
      296.2162162,  &
      298.3783784,  &
      300.5405405,  &
      302.7027027,  &
      304.8648649,  &
      307.027027,  &
      309.1891892,  &
      311.3513514,  &
      313.5135135,  &
      315.6756757,  &
      317.8378378,  &
      320.0,  &
      322.1621622,  &
      324.3243243,  &
      326.4864865,  &
      328.6486486,  &
      330.8108108,  &
      332.972973,  &
      335.1351351,  &
      337.2972973,  &
      339.4594595,  &
      341.6216216,  &
      343.7837838,  &
      345.9459459,  &
      348.1081081,  &
      350.2702703,  &
      352.4324324,  &
      354.5945946,  &
      356.7567568,  &
      358.9189189,  &
      360.0
!
variable modify  &
   variable_name = .Project_last.Cam_profile_2.dis_spl_y  &
   real_value =   &
      0.0,  &
      0.0,  &
      0.0,  &
      1.56937E-02,  &
      0.1191776,  &
      0.3977118,  &
      0.9389159,  &
      1.8181483,  &
      3.0572492,  &
      4.6617641,  &
      6.6385829,  &
      8.9959742,  &
      11.7434186,  &
      14.8914192,  &
      18.4537187,  &
      22.4288623,  &
      26.7549982,  &
      31.3425448,  &
      36.0956225,  &
      40.9126001,  &
      45.6871219,  &
      50.309723,  &
      54.6697979,  &
      58.6661573,  &
      62.2595486,  &
      65.4431921,  &
      68.2149185,  &
      70.5769423,  &
      72.5306259,  &
      74.0780168,  &
      75.2214744,  &
      75.9692534,  &
      76.3841204,  &
      76.5642415,  &
      76.6081095,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6096019,  &
      76.6088472,  &
      76.5969222,  &
      76.5554091,  &
      76.465458,  &
      76.3081959,  &
      76.0616843,  &
      75.7043932,  &
      75.2214204,  &
      74.6040474,  &
      73.8510654,  &
      72.9586204,  &
      71.924719,  &
      70.7538442,  &
      69.4455894,  &
      67.9996266,  &
      66.4126801,  &
      64.6823878,  &
      62.81424,  &
      60.8086078,  &
      58.6661609,  &
      56.3851841,  &
      53.9657424,  &
      51.428014,  &
      48.7925797,  &
      46.080841,  &
      43.3132648,  &
      40.5115087,  &
      37.6993662,  &
      34.8973535,  &
      32.1255043,  &
      29.4040116,  &
      26.7550066,  &
      24.1950728,  &
      21.7415715,  &
      19.4111785,  &
      17.2195818,  &
      15.1754043,  &
      13.2702306,  &
      11.5018141,  &
      9.8679579,  &
      8.367649,  &
      7.0043432,  &
      5.7696484,  &
      4.6617628,  &
      3.6792081,  &
      2.8212735,  &
      2.0925023,  &
      1.4853479,  &
      0.9986844,  &
      0.628949,  &
      0.363227,  &
      0.1883525,  &
      8.12119E-02,  &
      2.52286E-02,  &
      3.7172E-03,  &
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
   joint_name = .Project_last.JOINT_17  &
   adams_id = 17  &
   i_marker_name = .Project_last.coupler.MARKER_91  &
   j_marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_92
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_17  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Project_last.JOINT_14  &
   adams_id = 14  &
   i_marker_name = .Project_last.Cam_profile_2.par_cam.MARKER_85  &
   j_marker_name = .Project_last.ground.MARKER_86
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_14  &
   name_visibility = off
!
constraint create joint cylindrical  &
   joint_name = .Project_last.JOINT_18  &
   adams_id = 18  &
   i_marker_name = .Project_last.follower_1_1.par_fol_arm.MARKER_93  &
   j_marker_name = .Project_last.ground.MARKER_94
!
constraint attributes  &
   constraint_name = .Project_last.JOINT_18  &
   name_visibility = off
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Project_last.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .Project_last.JOINT_14  &
   function = ""
!
constraint attributes  &
   constraint_name = .Project_last.MOTION_1  &
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
   object = .Project_last.JOINT_20  &
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
   object = .Project_last.JOINT_20  &
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
   object = .Project_last.JOINT_20  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Project_last.Fy_crank  &
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
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Project_last.MOTION_1  &
   function = "360.0d * time"
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
      (LOC_RELATIVE_TO({105, 0.0, 0.0}, .Project_last.crank.MARKER_1))  &
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
material modify  &
   material_name = .Project_last.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Project_last
