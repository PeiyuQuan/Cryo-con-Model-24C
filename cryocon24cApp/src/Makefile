TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += cryocon24cSupport

# Compile and add code to the support library
cryocon24cSupport_SRCS += xxxRecord.c
cryocon24cSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
cryocon24cSupport_SRCS += dbSubExample.c
cryocon24cSupport_SRCS += devcryocon24cVersion.c
cryocon24cSupport_SRCS += cryocon24cHello.c
cryocon24cSupport_SRCS += initTrace.c

cryocon24cSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = cryocon24cVersion.h
# Macro name
GENVERSIONMACRO = cryocon24cVERSION

# Build the IOC application
PROD_IOC = cryocon24c

# cryocon24c.dbd will be created and installed
DBD += cryocon24c.dbd

# cryocon24c.dbd will include these files:
cryocon24c_DBD += base.dbd
cryocon24c_DBD += xxxSupport.dbd
cryocon24c_DBD += dbSubExample.dbd
cryocon24c_DBD += devcryocon24cVersion.dbd
cryocon24c_DBD += cryocon24cHello.dbd
cryocon24c_DBD += initTrace.dbd
cryocon24c_DBD += asyn.dbd
cryocon24c_DBD += drvAsynIPPort.dbd
cryocon24c_DBD += drvAsynSerialPort.dbd
cryocon24c_DBD += calc.dbd
cryocon24c_DBD += stream-scalcout.dbd
cryocon24c_DBD += stream.dbd
cryocon24c_DBD += asSupport.dbd

# cryocon24c_registerRecordDeviceDriver.cpp derives from cryocon24c.dbd
cryocon24c_SRCS += cryocon24c_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
cryocon24c_SRCS_DEFAULT += cryocon24cMain.cpp
cryocon24c_SRCS_vxWorks += -nil-

# Link in the code from our support library
cryocon24c_LIBS += cryocon24cSupport
cryocon24c_LIBS += asyn
cryocon24c_LIBS += calc
cryocon24c_LIBS += autosave
cryocon24c_LIBS += stream
# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into cryocon24cSupport
    sncExample_SNCFLAGS += +r
    cryocon24c_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    cryocon24cSupport_SRCS += sncExample.stt
    cryocon24cSupport_LIBS += seq pv
    cryocon24c_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    cryocon24c_LIBS += qsrv
    cryocon24c_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    cryocon24c_DBD += PVAServerRegister.dbd
    cryocon24c_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
cryocon24c_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devcryocon24cVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
