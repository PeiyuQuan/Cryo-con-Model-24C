####################################################
## save_restore setup
save_restoreSet_Debug(0)

# status-PV prefix, so save_restore can find its status PV's.
save_restoreSet_status_prefix("$(PREFIX)")

# Ok to save/restore save sets with missing values (no CA connection to PV)?  
save_restoreSet_IncompleteSetsOk(1)
# Save dated backup files?
save_restoreSet_DatedBackupFiles(1)

# Number of sequenced backup files to write
save_restoreSet_NumSeqFiles(1)
# Time interval between sequenced backups
save_restoreSet_SeqPeriodInSeconds(300)

# specify where save files should be
#set_savefile_path(${TOP}, "autosaveSaves")
set_savefile_path("${TOP}/iocBoot/ioccryocon24c", "autosave")

# specify what save files should be restored.  Note these files must be
# in the directory specified in set_savefile_path(), or, if that function
# has not been called, from the directory current when iocInit is invoked
# example: set_pass0_restoreFile("autosave_geiger.sav")

# specify directories in which to to search for included request files
# set_requestfile_path(${TOP}, "autosaveReqs")

set_requestfile_path("${TOP}/iocBoot/ioccryocon24c", "")


save_restoreSet_CAReconnect(1)

