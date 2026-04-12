# SDR_Matlab_OFDM_802.11n

This project represents simplified implementation of IEEE802.11n format. The main goal is to explore and recreate worldwide-used standard that is a cornerstone of Wi-Fi 4 technology.

## Transceive scheme
<img src="https://raw.githubusercontent.com/piroggoff/SDR_Matlab_OFDM_IEEE802.11n/master/media/Transcieve_scheme.png" width=800>

# Used hardware

* Development and Evaluation Board "Zedboard Zynq®-7000"
* RF Agile Transceiver Analog Devices AD9361 

# Used software

* Matlab R2025b
* Support package for Xilinx Zynq-Based Radio

# How to run :
Run `Hardware_TX.m` and `Hardware_RX.m` in separate Matlab session one by one (Wait for each instance to initialize).

# Code structure
## Hardware_TX.m
> TX_signal.mat

> OFDM_TX.m
* data_Payload_1.mat
* data_Payload_2.mat
* oversamp.m
* setstate0_TX.m

## Hardware_RX.m
> OFDM_RX.m
* Long_preamble_slot_Frequency.mat
* HTL_k_slot_Frequency.mat
* setstate0_RX.m

## RX_test (Debug mode necessaries)
* RX.mat
* RX2.mat

## TX System Model
<img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model.png" width="500">

> * Short Preamble
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model_Short%20Preamble.png" width="800">

> * Long Preamble
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model_Long%20Preamble.png" width="800">

> * HT-Long Preamble (Tone Interleaving)
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model_HTLong%20Preamble.png" width="800">

> * Payload
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model_Payload.png" width="600">

> * TX signal
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/TX%20System%20Model_Final.png" width="700">

## TX RX Hardware Parameters
| Center Frequency                 | 5 GHz                            |
|:--------------------------------:|:--------------------------------:|
| Baseband Sample Rate (Bandwidth) | 20 MHz                           |
| Ts (Sampling time)               | 50 ns                            |
| Samples Per Frame                | 3500                             |

## RX System Model
<img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model.png" width="300">

> * "Delay and Correlate" algorithm for Packet Detection
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Delay%20and%20Correlate%20algorithm.png" width="500">

> * Packet Detection (normal case) , Threshold=0.75
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Packet%20Detection.png" width="600">

> * Coarse CFO Estimation & Compensation
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Coarse%20CFO%20Estimation.png" width="600">

> * Fine CFO Estimation & Compensation
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Fine%20CFO%20Estimation.png" width="600">

> * MIMO Channel Estimation Diagram (Tone Interleaving)
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Channel%20Estimation.png" width="600">

> * Channel Estimation & Equalizer
> <img src="https://raw.githubusercontent.com/MeowLucian/SDR_Matlab_OFDM_802.11n/master/Picture/RX%20System%20Model_Channel%20Estimation%20%26%20Equalizer.png" width="600">