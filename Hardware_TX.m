function Hardware_TX
    clearvars; close all; clc;

    Parameters_struct = Global_Parameters;

    % Hardware Parameters
    tx_object = sdrtx('AD936x', ...
               'IPAddress',            Parameters_struct.IPAddress, ...
               'CenterFrequency',      Parameters_struct.CenterFrequency, ...
               'BasebandSampleRate',   Parameters_struct.Bandwidth, ...
               'Gain',                 0, ...
               'ChannelMapping',       [1,2]);

    % UI & Button setup
    command_window = figure('Name', 'TX', 'NumberTitle', 'off', 'Units', 'normalized', ...
                            'Position',[0.4 0.4 0.2 0.2], ...
                            'MenuBar','none', ...
                            'CloseRequestFcn', @onClose);
    
    statement_text = uicontrol(command_window, 'Style', 'text', 'Units', 'normalized', ...
                                    'Position',[0.1 0.65 0.8 0.2], ...
                                    'String', 'Stopped', ...
                                    'FontSize', 20,'HorizontalAlignment', 'center', ...
                                    'BackgroundColor',[0.9 0.9 0.9]);
    
    button = uicontrol(command_window, 'Style', 'pushbutton',...
                       'Units','normalized','Position', [0.3 0.2 0.4 0.3],...
                       'String', 'START', 'Callback', @onToggle);
    
    % Data existence check
    
    tx1File = 'TX_signal.mat';
    tx2File = 'TX_signal_2.mat';
    
    if ~(exist(tx1File,'file')==2 || exist(tx2File,'file')==2)  
        run('OFDM_TX.m');
    end
    
    % TX Data Load
    load(tx1File, 'TX_signal'); % [1x1248]
    load(tx2File, 'TX_signal_2'); % [1x1248]
    
    % transmitRepeat Mode Frame
    TX_Hardware = repmat(TX_signal.',4,1);      % Transmit Data must be >= 4096 % [4992x1]
    TX_Hardware_2 = repmat(TX_signal_2.',4,1);  % Transmit Data must be >= 4096 % [4992x1]
    TX_Frame = [TX_Hardware, TX_Hardware_2];
    
    isTxOn = false;
    
    % Callback functions
    
    function onToggle(src,~)
        if ~isTxOn
            transmitRepeat(tx_object, TX_Frame);
            isTxOn = true;
            if isgraphics(src)
                set(src,'String','STOP');
                set(statement_text,'String','Transmitting');
            end
        else
            if exist('tx_object','var')
                release(tx_object);
            end
            isTxOn = false;
            if isgraphics(src)
                set(src,'String','START');
                set(statement_text,'String','Stopped');
            end
        end
    end
    
    function onClose(src,~)
        if exist('tx_object','var')
            release(tx_object);
        end
        if isgraphics(src)
            delete(src);
        end
    end
end