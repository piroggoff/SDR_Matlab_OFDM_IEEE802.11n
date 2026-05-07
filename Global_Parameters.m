function Parameters_struct = Global_Parameters()  

    % Parameters
    Parameters_struct.CenterFrequency = 5e9; % 5 GHz
    Parameters_struct.Bandwidth = 20e6; % 20 MHz
    Parameters_struct.Ts = 1/Parameters_struct.Bandwidth; % 50 ns

    % Load Given data
    load('Long_preamble_slot_Frequency.mat', 'Long_preamble_slot_Frequency'); % [1x64]
    load('HTL_k_slot_Frequency.mat', 'HTL_k_slot_Frequency'); % [1x64]
    load('data_Payload_1.mat', 'data_Payload_1'); % [1x48]
    load('data_Payload_2.mat', 'data_Payload_2'); % [1x48]
    Parameters_struct.Long_preamble_slot_Frequency = Long_preamble_slot_Frequency;
    Parameters_struct.HTL_k_slot_Frequency = HTL_k_slot_Frequency;
    Parameters_struct.data_Payload_1 = data_Payload_1;
    Parameters_struct.data_Payload_2 = data_Payload_2;
    Parameters_struct.IPAddress = '169.254.111.67';
end