%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SERIAL DATA LOGGER          
%
% Politecnico di Milano
% Dipartimento di Meccanica
% damiano.milani@polimi.it
%
% Data Logger for ArduPilot 2.5/2.6 board
% MATLAB plotter and logger from serial input (USB or XBee)
% This script must be used with ArduCopter Simulink programs
% Select the proper serial COM port (unix users: uncomment config line)
% Select which channels to plot, the verbose mode and the save to file mode
%
% Damiano Milani - Nov 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%% GENERAL CONFIG
verbose = 'on';                 % display streaming data in the command window
save_to_file = 'on';            % save to file all the data acquired

%% ARDUPILOT CHANNELS CONFIG
% Choose channel(s) to plot:
ch_to_plot = [3:5];

% ch 1: time elapsed [ms]
% ch 2: realtime [bool]
% ch 3: IMU-GYRO p [deg/s]
% ch 4: IMU-GYRO q [deg/s]
% ch 5: IMU-GYRO r [deg/s]
% ch 6: IMU-ACC x [g]
% ch 7: IMU-ACC y [g]
% ch 8: IMU-ACC z [g]
% ch 9: IMU-TMP T [°C]
% ch 10: PWM ch 1 [us]
% ch 11: PWM ch 2 [us]
% ch 12: PWM ch 3 [us]
% ch 13: PWM ch 4 [us]
% ch 14: safe mode [bool]
n_ch=14;
head={'t [ms]' 'realtime' 'p [deg/s]' 'q [deg/s]' 'r [deg/s]' 'x [g]' 'y [g]' 'z [g]'...
        'T [°C]' 'PWM 1 [us]' 'PWM 2 [us]' 'PWM 3 [us]' 'PWM 4 [us]'};

 
%% SERIAL PORT CONFIG
serialPort = 'COM3';            % serial COM port name (win)
%!sudo ln /dev/ttyACM0 /dev/ttyS101
%serialPort = '/dev/ttyS101';    % serial port name (linux)
baud = 57600;                   % baudrate
bits = 8;                       % bits
parity = 'none';                % parity check
stopbits = 1;                   % stop bits
timeout = 0.1;            % serial timeout
flow = 'none';                  % flow control
buffer = 1024;                  % input buffer [byte]
delay = .001;                   % must be less than data freq rate (if too low may cause high CPU usage)

%% PLOT CONFIG
plotTitle = 'ArduCopter Data Logger';   % plot title
xLabel = 'Time (s)';                    % x-axis label
yLabel = 'Data';                        % y-axis label
plotGrid = 'on';                        % on/off plot grid
Ymin = -1.5;                            % y min
Ymax = 1.5;                             % y max
scrollWidth = 10;                       % display period in plot (plot entire data if <= 0) [s]
refresh = 50;                           % update rate of the plot




%% INITIALIZATION
disp('---------------------------------------')
disp('        ArduCopter Data Logger')
disp('---------------------------------------')
disp(' ')

%initial variables
time = 0;
data = zeros(1,length(ch_to_plot));
i = 0;
saved_daq=zeros(1,n_ch);

%plot
set(0,'DefaultAxesFontName', 'AvantGarde')

plotGraph = plot(time,data,'LineWidth',1.2);
             
title(plotTitle,'FontSize',12);
xlabel(xLabel,'FontSize',10);
ylabel(yLabel,'FontSize',10);
legend(head(ch_to_plot))
hold on

axis([0 10 Ymin Ymax]);
grid(plotGrid);

ann=annotation('textbox', [.15 0.8, .1, .1],'String', ' Real Time');
set(ann,'BackgroundColor','y')


pause(0.1)

%serial port
s = serial(serialPort,'BaudRate',baud,'DataBits',bits,'Parity',parity,'StopBits',stopbits,...
    'FlowControl',flow,'InputBufferSize',buffer);

fopen(s);

disp(['Serial port ',serialPort,' is now open']);
disp(' ')
disp('Reading incoming data...');


%real time check

%% ACQUISITION
while ishandle(plotGraph)           %loop while plot window is open
%     try                                 %if any problem occurs always close serial port
        raw_daq = fscanf(s,'%f');           %read data from serial and convert in float
        
        if(~isempty(raw_daq) && isfloat(raw_daq) && length(raw_daq)==n_ch) %data check 
            if strcmp(verbose,'on')
                disp(raw_daq')
            end
            if size(raw_daq,1)==n_ch
                saved_daq=[saved_daq;raw_daq'];
            end
             
            i = i + 1;    
            time(i,1) = raw_daq(1)./1000;       %time vector
            data(i,:) = raw_daq(ch_to_plot);    %data matrix
            
            if raw_daq(2)<1
                set(ann,'BackgroundColor','r')
            else
                set(ann,'BackgroundColor','g')
            end
      
            %update plot
            if mod(i,refresh)==0     %update every n sample
                Ymin=min(min(data))-0.5;
                Ymax=max(max(data))+0.5;

                if(scrollWidth > 0)
                    %set(plotGraph,'XData',time(time > time(i)-scrollWidth),'YData',data((time > time(i)-scrollWidth)));
                    lu=length(time(time > time(i)-scrollWidth));
                    plot(time(end-lu+1:end),data((end-lu+1:end),:),'LineWidth',1.2)
                    axis([time(i)-scrollWidth time(i) Ymin Ymax]);
                else
                    %set(plotGraph,'XData',time,'YData',data);
                    plotGraph=plot(time,data,'LineWidth',1.2);
                    axis([0 time(i) Ymin Ymax]);
                end
            end

        end
        pause(delay); %fscanf delay
%     end
end


%% FINALIZATION
% Close serial COM port and delete all variables except time and data
fclose(s);
disp(' '); disp(' '); 
disp(['Serial port ',serialPort,' successfully closed']);
disp(' ');
disp('Data have been stored in current Workspace');
disp(' ');

% eventually save data to file
if strcmp(save_to_file,'on')
    nome=['ArduCopterLOG ',datestr(clock),'.txt']; %file name + timestamp
    nome=strrep(nome,':','-');
    save(nome,'saved_daq','-ascii');
    disp(['Data have been saved in the file ',nome]) 
end

clearvars -except time data saved_daq

disp(' ');
disp('Goodbye!');
disp('---------------------------------------')
