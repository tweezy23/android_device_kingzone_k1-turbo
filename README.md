# Build

* Working
  * RIL (Second SIM)
  * Wifi
  * Bluetooth
  * Audio
  * Sensors
  * Camera (picture recording)
  * GPS
  * NFC
  * OTG

* Not Working
  * Camera (video recording)
  * Video en/decoding
  * Dual SIM (first SIM doesn't work)


* init

        # repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
        
        # repo sync
        
        # source build/envsetup.sh
        
        # lunch cm_k1_turbo-eng

* recoveries

        # . build/tools/device/makerecoveries.sh cm_k1_turbo-eng
    
        # mka bootimage

* full build

        # brunch cm_k1_turbo-eng

# MTK

Few words about mtk related binaries, services and migration peculiarities.

# Limitations

Services requires root:

`system/core/rootdir/init.rd`

  * surfaceflinger depends on sched_setscheduler calls, unable to change process priority from 'system' user (default user 'system')

  * mediaserver depends on /data/nvram folder access, unable to do voice calls from 'media' user (default user 'media')
