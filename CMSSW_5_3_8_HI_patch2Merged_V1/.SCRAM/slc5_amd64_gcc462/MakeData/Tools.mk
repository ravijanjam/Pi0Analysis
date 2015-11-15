alpgen             := alpgen
ALL_TOOLS      += alpgen
alpgen_INIT_FUNC := $$(eval $$(call ProductCommonVars,alpgen,,,alpgen))

boost             := boost
ALL_TOOLS      += boost
boost_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/boost/1.47.0/include
boost_EX_INCLUDE  := $(boost_LOC_INCLUDE)
boost_LOC_LIB := boost_thread boost_signals boost_date_time
boost_EX_LIB  := $(boost_LOC_LIB)
boost_LOC_USE := sockets
boost_EX_USE  := $(boost_LOC_USE)
boost_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost,,,boost))

boost_filesystem             := boost_filesystem
ALL_TOOLS      += boost_filesystem
boost_filesystem_LOC_LIB := boost_filesystem
boost_filesystem_EX_LIB  := $(boost_filesystem_LOC_LIB)
boost_filesystem_LOC_USE := boost_system boost
boost_filesystem_EX_USE  := $(boost_filesystem_LOC_USE)
boost_filesystem_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_filesystem,,,boost_filesystem))

boost_header             := boost_header
ALL_TOOLS      += boost_header
boost_header_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/boost/1.47.0/include
boost_header_EX_INCLUDE  := $(boost_header_LOC_INCLUDE)
boost_header_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_header,,,boost_header))

boost_program_options             := boost_program_options
ALL_TOOLS      += boost_program_options
boost_program_options_LOC_LIB := boost_program_options
boost_program_options_EX_LIB  := $(boost_program_options_LOC_LIB)
boost_program_options_LOC_USE := boost
boost_program_options_EX_USE  := $(boost_program_options_LOC_USE)
boost_program_options_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_program_options,,,boost_program_options))

boost_python             := boost_python
ALL_TOOLS      += boost_python
boost_python_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/boost/1.47.0/include
boost_python_EX_INCLUDE  := $(boost_python_LOC_INCLUDE)
boost_python_LOC_LIB := boost_python
boost_python_EX_LIB  := $(boost_python_LOC_LIB)
boost_python_LOC_USE := elementtree gccxml python
boost_python_EX_USE  := $(boost_python_LOC_USE)
boost_python_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_python,,,boost_python))

boost_regex             := boost_regex
ALL_TOOLS      += boost_regex
boost_regex_LOC_LIB := boost_regex
boost_regex_EX_LIB  := $(boost_regex_LOC_LIB)
boost_regex_LOC_USE := boost
boost_regex_EX_USE  := $(boost_regex_LOC_USE)
boost_regex_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_regex,,,boost_regex))

boost_signals             := boost_signals
ALL_TOOLS      += boost_signals
boost_signals_LOC_LIB := boost_signals
boost_signals_EX_LIB  := $(boost_signals_LOC_LIB)
boost_signals_LOC_USE := boost
boost_signals_EX_USE  := $(boost_signals_LOC_USE)
boost_signals_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_signals,,,boost_signals))

boost_system             := boost_system
ALL_TOOLS      += boost_system
boost_system_LOC_LIB := boost_system
boost_system_EX_LIB  := $(boost_system_LOC_LIB)
boost_system_LOC_USE := boost
boost_system_EX_USE  := $(boost_system_LOC_USE)
boost_system_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_system,,,boost_system))

bz2lib             := bz2lib
ALL_TOOLS      += bz2lib
bz2lib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/bz2lib/1.0.5/include
bz2lib_EX_INCLUDE  := $(bz2lib_LOC_INCLUDE)
bz2lib_LOC_LIB := bz2
bz2lib_EX_LIB  := $(bz2lib_LOC_LIB)
bz2lib_INIT_FUNC := $$(eval $$(call ProductCommonVars,bz2lib,,,bz2lib))

cascade             := cascade
ALL_TOOLS      += cascade
cascade_LOC_LIB := cascade_merged
cascade_EX_LIB  := $(cascade_LOC_LIB)
cascade_LOC_USE := f77compiler cascade_headers
cascade_EX_USE  := $(cascade_LOC_USE)
cascade_INIT_FUNC := $$(eval $$(call ProductCommonVars,cascade,,,cascade))

cascade_headers             := cascade_headers
ALL_TOOLS      += cascade_headers
cascade_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/cascade/2.2.04-cms2/include
cascade_headers_EX_INCLUDE  := $(cascade_headers_LOC_INCLUDE)
cascade_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,cascade_headers,,,cascade_headers))

castor             := castor
ALL_TOOLS      += castor
castor_LOC_LIB := shift castorrfio castorclient castorcommon
castor_EX_LIB  := $(castor_LOC_LIB)
castor_LOC_USE := castor_header uuid
castor_EX_USE  := $(castor_LOC_USE)
castor_INIT_FUNC := $$(eval $$(call ProductCommonVars,castor,,,castor))

castor_header             := castor_header
ALL_TOOLS      += castor_header
castor_header_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/castor/2.1.13.6/include /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/castor/2.1.13.6/include/shift
castor_header_EX_INCLUDE  := $(castor_header_LOC_INCLUDE)
castor_header_INIT_FUNC := $$(eval $$(call ProductCommonVars,castor_header,,,castor_header))

ccompiler             := ccompiler
ALL_TOOLS      += ccompiler
ccompiler_LOC_FLAGS_CFLAGS  := -pthread -O2
ccompiler_EX_FLAGS_CFLAGS   := $(ccompiler_LOC_FLAGS_CFLAGS)
ccompiler_LOC_FLAGS_CDEBUGFLAG  := -g
ccompiler_EX_FLAGS_CDEBUGFLAG   := $(ccompiler_LOC_FLAGS_CDEBUGFLAG)
ccompiler_LOC_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
ccompiler_EX_FLAGS_LDFLAGS   := $(ccompiler_LOC_FLAGS_LDFLAGS)
ccompiler_LOC_FLAGS_SCRAM_COMPILER_NAME  := gcc462
ccompiler_EX_FLAGS_SCRAM_COMPILER_NAME   := $(ccompiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
ccompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE  := C
ccompiler_EX_FLAGS_SCRAM_LANGUAGE_TYPE   := $(ccompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS  := -fPIC
ccompiler_EX_FLAGS_CSHAREDOBJECTFLAGS   := $(ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS)
ccompiler_LOC_FLAGS_CSHAREDFLAGS  := -shared -Wl,-E
ccompiler_EX_FLAGS_CSHAREDFLAGS   := $(ccompiler_LOC_FLAGS_CSHAREDFLAGS)
ccompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,ccompiler,,,ccompiler))

charybdis             := charybdis
ALL_TOOLS      += charybdis
charybdis_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/charybdis/1.003-cms2/include
charybdis_EX_INCLUDE  := $(charybdis_LOC_INCLUDE)
charybdis_LOC_LIB := charybdis
charybdis_EX_LIB  := $(charybdis_LOC_LIB)
charybdis_LOC_USE := f77compiler herwig pythia6
charybdis_EX_USE  := $(charybdis_LOC_USE)
charybdis_INIT_FUNC := $$(eval $$(call ProductCommonVars,charybdis,,,charybdis))

classlib             := classlib
ALL_TOOLS      += classlib
classlib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/classlib/3.1.3-cms3/include
classlib_EX_INCLUDE  := $(classlib_LOC_INCLUDE)
classlib_LOC_LIB := classlib
classlib_EX_LIB  := $(classlib_LOC_LIB)
classlib_LOC_USE := zlib bz2lib pcre openssl
classlib_EX_USE  := $(classlib_LOC_USE)
classlib_LOC_FLAGS_CPPDEFINES  := -D__STDC_LIMIT_MACROS -D__STDC_FORMAT_MACROS
classlib_EX_FLAGS_CPPDEFINES   := $(classlib_LOC_FLAGS_CPPDEFINES)
classlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,classlib,,,classlib))

clhep             := clhep
ALL_TOOLS      += clhep
clhep_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/clhep/2.0.4.6/include
clhep_EX_INCLUDE  := $(clhep_LOC_INCLUDE)
clhep_LOC_LIB := CLHEP
clhep_EX_LIB  := $(clhep_LOC_LIB)
clhep_INIT_FUNC := $$(eval $$(call ProductCommonVars,clhep,,,clhep))

clhepheader             := clhepheader
ALL_TOOLS      += clhepheader
clhepheader_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/clhep/2.0.4.6/include
clhepheader_EX_INCLUDE  := $(clhepheader_LOC_INCLUDE)
clhepheader_INIT_FUNC := $$(eval $$(call ProductCommonVars,clhepheader,,,clhepheader))

cmssw             := cmssw
ALL_TOOLS      += cmssw
ALL_SCRAM_PROJECTS += cmssw
cmssw_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw/CMSSW_5_3_8_HI/src
cmssw_EX_INCLUDE  := $(cmssw_LOC_INCLUDE)
cmssw_LOC_LIBDIR := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw/CMSSW_5_3_8_HI/lib/slc5_amd64_gcc462
cmssw_EX_LIBDIR  := $(cmssw_LOC_LIBDIR)
cmssw_INIT_FUNC := $$(eval $$(call ProductCommonVars,cmssw,,96000,cmssw))

cmsswdata             := cmsswdata
ALL_TOOLS      += cmsswdata
cmsswdata_LOC_FLAGS_CMSSW_DATA_PACKAGE  := CalibTracker/SiPixelESProducers=V01-01-01 DetectorDescription/Schema=V02-02-01 FastSimulation/MaterialEffects=V04-02-08 FastSimulation/PileUpProducer=V04-05-18 Fireworks/Geometry=V06-13-04 GeneratorInterface/ReggeGribovPartonMCInterface=V00-00-02 Geometry/CMSCommonData=V01-09-00 Geometry/CSCGeometryBuilder=V01-08-00 Geometry/CaloEventSetup=V03-11-02 Geometry/DTGeometryBuilder=V00-05-00 Geometry/EcalCommonData=V05-05-00 Geometry/EcalSimData=V01-02-00 Geometry/EcalTestBeam=V00-09-09 Geometry/FP420CommonData=V00-06-00 Geometry/FP420SimData=V00-06-00 Geometry/ForwardCommonData=V01-05-00 Geometry/ForwardSimData=V02-02-00 Geometry/HcalCommonData=V01-05-00 Geometry/HcalSimData=V01-03-00 Geometry/HcalTestBeamData=V01-08-00 Geometry/MTCCTrackerCommonData=V01-01-00 Geometry/MuonCommonData=V01-06-00 Geometry/MuonSimData=V01-03-00 Geometry/RPCGeometryBuilder=V01-04-00 Geometry/TrackerCommonData=V01-08-00 Geometry/TrackerRecoData=V01-05-00 Geometry/TrackerSimData=V01-03-00 Geometry/TwentyFivePercentTrackerCommonData=V00-01-00 L1Trigger/RPCTrigger=V00-15-00 MagneticField/Interpolation=V00-03-11 RecoEgamma/ElectronIdentification=V00-03-35 RecoMuon/MuonIdentification=V01-12-01 RecoParticleFlow/PFBlockProducer=V02-04-02 RecoParticleFlow/PFProducer=V14-08-05 RecoParticleFlow/PFTracking=V12-03-02 RecoTracker/RingESSource=V00-01-14 RecoTracker/RoadMapESSource=V01-01-11 SimG4CMS/Calo=V02-03-07 SimG4CMS/Forward=V02-03-13 Validation/Geometry=V00-07-00
cmsswdata_EX_FLAGS_CMSSW_DATA_PACKAGE   := $(cmsswdata_LOC_FLAGS_CMSSW_DATA_PACKAGE)
cmsswdata_INIT_FUNC := $$(eval $$(call ProductCommonVars,cmsswdata,,,cmsswdata))

coral             := coral
ALL_TOOLS      += coral
ALL_SCRAM_PROJECTS += coral
coral_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/include/LCG
coral_EX_INCLUDE  := $(coral_LOC_INCLUDE)
coral_INIT_FUNC := $$(eval $$(call ProductCommonVars,coral,,98000,coral))

cppunit             := cppunit
ALL_TOOLS      += cppunit
cppunit_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/cppunit/1.12.1/include
cppunit_EX_INCLUDE  := $(cppunit_LOC_INCLUDE)
cppunit_LOC_LIB := cppunit
cppunit_EX_LIB  := $(cppunit_LOC_LIB)
cppunit_LOC_USE := sockets
cppunit_EX_USE  := $(cppunit_LOC_USE)
cppunit_INIT_FUNC := $$(eval $$(call ProductCommonVars,cppunit,,,cppunit))

curl             := curl
ALL_TOOLS      += curl
curl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/curl/7.21.6/include
curl_EX_INCLUDE  := $(curl_LOC_INCLUDE)
curl_LOC_LIB := curl
curl_EX_LIB  := $(curl_LOC_LIB)
curl_INIT_FUNC := $$(eval $$(call ProductCommonVars,curl,,,curl))

cxxcompiler             := cxxcompiler
ALL_TOOLS      += cxxcompiler
cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS  := -fPIC
cxxcompiler_EX_FLAGS_CXXSHAREDOBJECTFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS)
cxxcompiler_LOC_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
cxxcompiler_EX_FLAGS_LDFLAGS   := $(cxxcompiler_LOC_FLAGS_LDFLAGS)
cxxcompiler_LOC_FLAGS_SCRAM_COMPILER_NAME  := gcc462
cxxcompiler_EX_FLAGS_SCRAM_COMPILER_NAME   := $(cxxcompiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
cxxcompiler_LOC_FLAGS_CPPDEFINES  := -DGNU_GCC -D_GNU_SOURCE
cxxcompiler_EX_FLAGS_CPPDEFINES   := $(cxxcompiler_LOC_FLAGS_CPPDEFINES)
cxxcompiler_LOC_FLAGS_CXXFLAGS  := -O2 -pedantic -ansi -pthread -pipe -Wno-vla -Werror=overflow -Wstrict-overflow -std=c++0x -msse3 -ftree-vectorize -Wno-strict-overflow -Werror=array-bounds -Werror=format-contains-nul -Werror=type-limits -fvisibility-inlines-hidden -felide-constructors -fmessage-length=0 -ftemplate-depth-300 -Wall -Wno-non-template-friend -Wno-long-long -Wreturn-type -Wunused -Wparentheses -Wno-deprecated -Werror=return-type -Werror=missing-braces -Werror=unused-value -Werror=address -Werror=format -Werror=sign-compare -Werror=write-strings -fdiagnostics-show-option
cxxcompiler_EX_FLAGS_CXXFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXFLAGS)
cxxcompiler_LOC_FLAGS_LD_UNIT  := -r -m elf_x86_64
cxxcompiler_EX_FLAGS_LD_UNIT   := $(cxxcompiler_LOC_FLAGS_LD_UNIT)
cxxcompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE  := C++
cxxcompiler_EX_FLAGS_SCRAM_LANGUAGE_TYPE   := $(cxxcompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS  := -shared -Wl,-E
cxxcompiler_EX_FLAGS_CXXSHAREDFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS)
cxxcompiler_LOC_FLAGS_CXXDEBUGFLAG  := -g
cxxcompiler_EX_FLAGS_CXXDEBUGFLAG   := $(cxxcompiler_LOC_FLAGS_CXXDEBUGFLAG)
cxxcompiler_LOC_FLAGS_SHAREDSUFFIX  := so
cxxcompiler_EX_FLAGS_SHAREDSUFFIX   := $(cxxcompiler_LOC_FLAGS_SHAREDSUFFIX)
cxxcompiler_LOC_FLAGS_CCCOMPILER  := gcc4
cxxcompiler_EX_FLAGS_CCCOMPILER   := $(cxxcompiler_LOC_FLAGS_CCCOMPILER)
cxxcompiler_LOC_FLAGS_MODULEFLAGS  := -shared -Wl,-E
cxxcompiler_EX_FLAGS_MODULEFLAGS   := $(cxxcompiler_LOC_FLAGS_MODULEFLAGS)
cxxcompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,cxxcompiler,,,cxxcompiler))

das-client             := das-client
ALL_TOOLS      += das-client
das-client_LOC_USE := python
das-client_EX_USE  := $(das-client_LOC_USE)
das-client_INIT_FUNC := $$(eval $$(call ProductCommonVars,das-client,,,das-client))

db4             := db4
ALL_TOOLS      += db4
db4_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/db4/4.4.20/include
db4_EX_INCLUDE  := $(db4_LOC_INCLUDE)
db4_LOC_LIB := db
db4_EX_LIB  := $(db4_LOC_LIB)
db4_INIT_FUNC := $$(eval $$(call ProductCommonVars,db4,,,db4))

dbs-client             := dbs-client
ALL_TOOLS      += dbs-client
dbs-client_INIT_FUNC := $$(eval $$(call ProductCommonVars,dbs-client,,,dbs-client))

dcap             := dcap
ALL_TOOLS      += dcap
dcap_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/dcap/2.47.5.0-cms/include
dcap_EX_INCLUDE  := $(dcap_LOC_INCLUDE)
dcap_LOC_LIB := dcap
dcap_EX_LIB  := $(dcap_LOC_LIB)
dcap_INIT_FUNC := $$(eval $$(call ProductCommonVars,dcap,,,dcap))

dpm             := dpm
ALL_TOOLS      += dpm
dpm_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/dpm/1.8.0.1/include
dpm_EX_INCLUDE  := $(dpm_LOC_INCLUDE)
dpm_LOC_LIB := dpm
dpm_EX_LIB  := $(dpm_LOC_LIB)
dpm_LOC_LIBDIR := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/dpm/1.8.0.1/lib
dpm_EX_LIBDIR  := $(dpm_LOC_LIBDIR)
dpm_INIT_FUNC := $$(eval $$(call ProductCommonVars,dpm,,,dpm))

elementtree             := elementtree
ALL_TOOLS      += elementtree
elementtree_LOC_USE := gccxml python
elementtree_EX_USE  := $(elementtree_LOC_USE)
elementtree_INIT_FUNC := $$(eval $$(call ProductCommonVars,elementtree,,,elementtree))

evtgenlhc             := evtgenlhc
ALL_TOOLS      += evtgenlhc
evtgenlhc_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/evtgenlhc/9.1
evtgenlhc_EX_INCLUDE  := $(evtgenlhc_LOC_INCLUDE)
evtgenlhc_LOC_LIB := evtgenlhc
evtgenlhc_EX_LIB  := $(evtgenlhc_LOC_LIB)
evtgenlhc_LOC_USE := clhep
evtgenlhc_EX_USE  := $(evtgenlhc_LOC_USE)
evtgenlhc_INIT_FUNC := $$(eval $$(call ProductCommonVars,evtgenlhc,,,evtgenlhc))

expat             := expat
ALL_TOOLS      += expat
expat_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/expat/2.0.1/include
expat_EX_INCLUDE  := $(expat_LOC_INCLUDE)
expat_LOC_LIB := expat
expat_EX_LIB  := $(expat_LOC_LIB)
expat_INIT_FUNC := $$(eval $$(call ProductCommonVars,expat,,,expat))

f77compiler             := f77compiler
ALL_TOOLS      += f77compiler
f77compiler_LOC_LIB := gfortran m
f77compiler_EX_LIB  := $(f77compiler_LOC_LIB)
f77compiler_LOC_FLAGS_FFLAGS  := -fno-second-underscore -Wunused -Wuninitialized -O2 -cpp
f77compiler_EX_FLAGS_FFLAGS   := $(f77compiler_LOC_FLAGS_FFLAGS)
f77compiler_LOC_FLAGS_SCRAM_COMPILER_NAME  := gcc462
f77compiler_EX_FLAGS_SCRAM_COMPILER_NAME   := $(f77compiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
f77compiler_LOC_FLAGS_FCSHAREDOBJECTFLAGS  := -fPIC
f77compiler_EX_FLAGS_FCSHAREDOBJECTFLAGS   := $(f77compiler_LOC_FLAGS_FCSHAREDOBJECTFLAGS)
f77compiler_LOC_FLAGS_FCO2FLAG  := -O2
f77compiler_EX_FLAGS_FCO2FLAG   := $(f77compiler_LOC_FLAGS_FCO2FLAG)
f77compiler_LOC_FLAGS_FCOPTIMISED  := -O2
f77compiler_EX_FLAGS_FCOPTIMISED   := $(f77compiler_LOC_FLAGS_FCOPTIMISED)
f77compiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE  := FORTRAN
f77compiler_EX_FLAGS_SCRAM_LANGUAGE_TYPE   := $(f77compiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
f77compiler_LOC_FLAGS_FCDEBUGFLAG  := -g
f77compiler_EX_FLAGS_FCDEBUGFLAG   := $(f77compiler_LOC_FLAGS_FCDEBUGFLAG)
f77compiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,f77compiler,,,f77compiler))

fastjet             := fastjet
ALL_TOOLS      += fastjet
fastjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fastjet/3.0.1-cms2/include
fastjet_EX_INCLUDE  := $(fastjet_LOC_INCLUDE)
fastjet_LOC_LIB := fastjetplugins fastjettools siscone siscone_spherical fastjet
fastjet_EX_LIB  := $(fastjet_LOC_LIB)
fastjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,fastjet,,,fastjet))

fftjet             := fftjet
ALL_TOOLS      += fftjet
fftjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fftjet/1.3.1-cms/include
fftjet_EX_INCLUDE  := $(fftjet_LOC_INCLUDE)
fftjet_LOC_LIB := fftjet
fftjet_EX_LIB  := $(fftjet_LOC_LIB)
fftjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,fftjet,,,fftjet))

fftw3             := fftw3
ALL_TOOLS      += fftw3
fftw3_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fftw3/3.2.2-cms/include
fftw3_EX_INCLUDE  := $(fftw3_LOC_INCLUDE)
fftw3_LOC_LIB := fftw3
fftw3_EX_LIB  := $(fftw3_LOC_LIB)
fftw3_INIT_FUNC := $$(eval $$(call ProductCommonVars,fftw3,,,fftw3))

frontier_client             := frontier_client
ALL_TOOLS      += frontier_client
frontier_client_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/frontier_client/2.8.5/include
frontier_client_EX_INCLUDE  := $(frontier_client_LOC_INCLUDE)
frontier_client_LOC_LIB := frontier_client
frontier_client_EX_LIB  := $(frontier_client_LOC_LIB)
frontier_client_LOC_USE := zlib openssl expat
frontier_client_EX_USE  := $(frontier_client_LOC_USE)
frontier_client_INIT_FUNC := $$(eval $$(call ProductCommonVars,frontier_client,,,frontier_client))

gccxml             := gccxml
ALL_TOOLS      += gccxml
gccxml_INIT_FUNC := $$(eval $$(call ProductCommonVars,gccxml,,,gccxml))

gdb             := gdb
ALL_TOOLS      += gdb
gdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,gdb,,,gdb))

gdbm             := gdbm
ALL_TOOLS      += gdbm
gdbm_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/gdbm/1.8.3/include
gdbm_EX_INCLUDE  := $(gdbm_LOC_INCLUDE)
gdbm_LOC_LIB := gdbm
gdbm_EX_LIB  := $(gdbm_LOC_LIB)
gdbm_INIT_FUNC := $$(eval $$(call ProductCommonVars,gdbm,,,gdbm))

geant4             := geant4
ALL_TOOLS      += geant4
geant4_LOC_USE := geant4core geant4vis
geant4_EX_USE  := $(geant4_LOC_USE)
geant4_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4,,,geant4))

geant4core             := geant4core
ALL_TOOLS      += geant4core
geant4core_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/geant4/9.4.p03-cms/include
geant4core_EX_INCLUDE  := $(geant4core_LOC_INCLUDE)
geant4core_LOC_LIB := G4digits_hits G4error_propagation G4event G4geometry G4global G4graphics_reps G4intercoms G4interfaces G4materials G4parmodels G4particles G4persistency G4physicslists G4processes G4readout G4run G4tracking G4track
geant4core_EX_LIB  := $(geant4core_LOC_LIB)
geant4core_LOC_USE := clhep
geant4core_EX_USE  := $(geant4core_LOC_USE)
geant4core_LOC_FLAGS_CPPDEFINES  := -DG4USE_STD_NAMESPACE -DGNU_GCC -DG4V9
geant4core_EX_FLAGS_CPPDEFINES   := $(geant4core_LOC_FLAGS_CPPDEFINES)
geant4core_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4core,,,geant4core))

geant4data             := geant4data
ALL_TOOLS      += geant4data
geant4data_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4data,,,geant4data))

geant4vis             := geant4vis
ALL_TOOLS      += geant4vis
geant4vis_LOC_LIB := G4FR G4modeling G4RayTracer G4Tree G4visHepRep G4vis_management G4visXXX G4VRML
geant4vis_EX_LIB  := $(geant4vis_LOC_LIB)
geant4vis_LOC_USE := geant4core
geant4vis_EX_USE  := $(geant4vis_LOC_USE)
geant4vis_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4vis,,,geant4vis))

glimpse             := glimpse
ALL_TOOLS      += glimpse
glimpse_INIT_FUNC := $$(eval $$(call ProductCommonVars,glimpse,,,glimpse))

gmake             := gmake
ALL_TOOLS      += gmake
gmake_INIT_FUNC := $$(eval $$(call ProductCommonVars,gmake,,,gmake))

graphviz             := graphviz
ALL_TOOLS      += graphviz
graphviz_LOC_USE := expat zlib libjpg libpng
graphviz_EX_USE  := $(graphviz_LOC_USE)
graphviz_INIT_FUNC := $$(eval $$(call ProductCommonVars,graphviz,,,graphviz))

gsl             := gsl
ALL_TOOLS      += gsl
gsl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/gsl/1.10/include
gsl_EX_INCLUDE  := $(gsl_LOC_INCLUDE)
gsl_LOC_LIB := gsl gslcblas
gsl_EX_LIB  := $(gsl_LOC_LIB)
gsl_INIT_FUNC := $$(eval $$(call ProductCommonVars,gsl,,,gsl))

hector             := hector
ALL_TOOLS      += hector
hector_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/hector/1_3_4-cms40/include
hector_EX_INCLUDE  := $(hector_LOC_INCLUDE)
hector_LOC_LIB := Hector
hector_EX_LIB  := $(hector_LOC_LIB)
hector_INIT_FUNC := $$(eval $$(call ProductCommonVars,hector,,,hector))

hepmc             := hepmc
ALL_TOOLS      += hepmc
hepmc_LOC_LIB := HepMCfio HepMC
hepmc_EX_LIB  := $(hepmc_LOC_LIB)
hepmc_LOC_USE := hepmc_headers
hepmc_EX_USE  := $(hepmc_LOC_USE)
hepmc_INIT_FUNC := $$(eval $$(call ProductCommonVars,hepmc,,,hepmc))

hepmc_headers             := hepmc_headers
ALL_TOOLS      += hepmc_headers
hepmc_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/hepmc/2.06.07-cms/include
hepmc_headers_EX_INCLUDE  := $(hepmc_headers_LOC_INCLUDE)
hepmc_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,hepmc_headers,,,hepmc_headers))

heppdt             := heppdt
ALL_TOOLS      += heppdt
heppdt_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/heppdt/3.03.00/include
heppdt_EX_INCLUDE  := $(heppdt_LOC_INCLUDE)
heppdt_LOC_LIB := HepPDT HepPID
heppdt_EX_LIB  := $(heppdt_LOC_LIB)
heppdt_INIT_FUNC := $$(eval $$(call ProductCommonVars,heppdt,,,heppdt))

herwig             := herwig
ALL_TOOLS      += herwig
herwig_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/herwig/6.520-cms2/include
herwig_EX_INCLUDE  := $(herwig_LOC_INCLUDE)
herwig_LOC_LIB := herwig herwig_dummy
herwig_EX_LIB  := $(herwig_LOC_LIB)
herwig_LOC_USE := f77compiler lhapdf photos
herwig_EX_USE  := $(herwig_LOC_USE)
herwig_INIT_FUNC := $$(eval $$(call ProductCommonVars,herwig,,,herwig))

herwigpp             := herwigpp
ALL_TOOLS      += herwigpp
herwigpp_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/herwigpp/2.5.0-cms7/include
herwigpp_EX_INCLUDE  := $(herwigpp_LOC_INCLUDE)
herwigpp_INIT_FUNC := $$(eval $$(call ProductCommonVars,herwigpp,,,herwigpp))

histfactory             := histfactory
ALL_TOOLS      += histfactory
histfactory_LOC_LIB := HistFactory
histfactory_EX_LIB  := $(histfactory_LOC_LIB)
histfactory_LOC_USE := roofitcore roofit roostats rootcore roothistmatrix rootgpad rootxml rootfoam
histfactory_EX_USE  := $(histfactory_LOC_USE)
histfactory_INIT_FUNC := $$(eval $$(call ProductCommonVars,histfactory,,,histfactory))

igprof             := igprof
ALL_TOOLS      += igprof
igprof_INIT_FUNC := $$(eval $$(call ProductCommonVars,igprof,,,igprof))

jemalloc             := jemalloc
ALL_TOOLS      += jemalloc
jemalloc_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/jemalloc/2.2.2/include
jemalloc_EX_INCLUDE  := $(jemalloc_LOC_INCLUDE)
jemalloc_LOC_LIB := jemalloc
jemalloc_EX_LIB  := $(jemalloc_LOC_LIB)
jemalloc_INIT_FUNC := $$(eval $$(call ProductCommonVars,jemalloc,,,jemalloc))

jimmy             := jimmy
ALL_TOOLS      += jimmy
jimmy_LOC_LIB := jimmy
jimmy_EX_LIB  := $(jimmy_LOC_LIB)
jimmy_LOC_USE := f77compiler herwig jimmy_headers
jimmy_EX_USE  := $(jimmy_LOC_USE)
jimmy_INIT_FUNC := $$(eval $$(call ProductCommonVars,jimmy,,,jimmy))

jimmy_headers             := jimmy_headers
ALL_TOOLS      += jimmy_headers
jimmy_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/jimmy/4.2-cms2/include
jimmy_headers_EX_INCLUDE  := $(jimmy_headers_LOC_INCLUDE)
jimmy_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,jimmy_headers,,,jimmy_headers))

ktjet             := ktjet
ALL_TOOLS      += ktjet
ktjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/ktjet/1.06/include
ktjet_EX_INCLUDE  := $(ktjet_LOC_INCLUDE)
ktjet_LOC_LIB := KtEvent
ktjet_EX_LIB  := $(ktjet_LOC_LIB)
ktjet_LOC_FLAGS_CPPDEFINES  := -DKTDOUBLEPRECISION
ktjet_EX_FLAGS_CPPDEFINES   := $(ktjet_LOC_FLAGS_CPPDEFINES)
ktjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,ktjet,,,ktjet))

lapack             := lapack
ALL_TOOLS      += lapack
lapack_INIT_FUNC := $$(eval $$(call ProductCommonVars,lapack,,,lapack))

lhapdf             := lhapdf
ALL_TOOLS      += lhapdf
lhapdf_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/lhapdf/5.8.5-cms2/include
lhapdf_EX_INCLUDE  := $(lhapdf_LOC_INCLUDE)
lhapdf_LOC_LIB := LHAPDF
lhapdf_EX_LIB  := $(lhapdf_LOC_LIB)
lhapdf_LOC_USE := f77compiler
lhapdf_EX_USE  := $(lhapdf_LOC_USE)
lhapdf_INIT_FUNC := $$(eval $$(call ProductCommonVars,lhapdf,,,lhapdf))

lhapdfwrap             := lhapdfwrap
ALL_TOOLS      += lhapdfwrap
lhapdfwrap_LOC_LIB := LHAPDFWrap
lhapdfwrap_EX_LIB  := $(lhapdfwrap_LOC_LIB)
lhapdfwrap_LOC_USE := lhapdf
lhapdfwrap_EX_USE  := $(lhapdfwrap_LOC_USE)
lhapdfwrap_INIT_FUNC := $$(eval $$(call ProductCommonVars,lhapdfwrap,,,lhapdfwrap))

libhepml             := libhepml
ALL_TOOLS      += libhepml
libhepml_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libhepml/0.2.1/interface
libhepml_EX_INCLUDE  := $(libhepml_LOC_INCLUDE)
libhepml_LOC_LIB := hepml
libhepml_EX_LIB  := $(libhepml_LOC_LIB)
libhepml_INIT_FUNC := $$(eval $$(call ProductCommonVars,libhepml,,,libhepml))

libjpg             := libjpg
ALL_TOOLS      += libjpg
libjpg_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libjpg/8b/include
libjpg_EX_INCLUDE  := $(libjpg_LOC_INCLUDE)
libjpg_LOC_LIB := jpeg
libjpg_EX_LIB  := $(libjpg_LOC_LIB)
libjpg_INIT_FUNC := $$(eval $$(call ProductCommonVars,libjpg,,,libjpg))

libpng             := libpng
ALL_TOOLS      += libpng
libpng_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libpng/1.2.46/include
libpng_EX_INCLUDE  := $(libpng_LOC_INCLUDE)
libpng_LOC_LIB := png
libpng_EX_LIB  := $(libpng_LOC_LIB)
libpng_LOC_USE := zlib
libpng_EX_USE  := $(libpng_LOC_USE)
libpng_INIT_FUNC := $$(eval $$(call ProductCommonVars,libpng,,,libpng))

libtiff             := libtiff
ALL_TOOLS      += libtiff
libtiff_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libtiff/3.9.4/include
libtiff_EX_INCLUDE  := $(libtiff_LOC_INCLUDE)
libtiff_LOC_LIB := tiff
libtiff_EX_LIB  := $(libtiff_LOC_LIB)
libtiff_LOC_USE := libjpg zlib
libtiff_EX_USE  := $(libtiff_LOC_USE)
libtiff_INIT_FUNC := $$(eval $$(call ProductCommonVars,libtiff,,,libtiff))

libungif             := libungif
ALL_TOOLS      += libungif
libungif_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libungif/4.1.4/include
libungif_EX_INCLUDE  := $(libungif_LOC_INCLUDE)
libungif_LOC_LIB := ungif
libungif_EX_LIB  := $(libungif_LOC_LIB)
libungif_LOC_USE := libjpg zlib
libungif_EX_USE  := $(libungif_LOC_USE)
libungif_INIT_FUNC := $$(eval $$(call ProductCommonVars,libungif,,,libungif))

llvm             := llvm
ALL_TOOLS      += llvm
llvm_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/llvm/3.2/include
llvm_EX_INCLUDE  := $(llvm_LOC_INCLUDE)
llvm_LOC_LIB := clang
llvm_EX_LIB  := $(llvm_LOC_LIB)
llvm_LOC_FLAGS_LDFLAGS  := -Wl,-undefined -Wl,suppress
llvm_EX_FLAGS_LDFLAGS   := $(llvm_LOC_FLAGS_LDFLAGS)
llvm_LOC_FLAGS_CXXFLAGS  := -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -fPIC -Wno-enum-compare -Wno-strict-aliasing -fno-rtti
llvm_EX_FLAGS_CXXFLAGS   := $(llvm_LOC_FLAGS_CXXFLAGS)
llvm_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm,,,llvm))

mcdb             := mcdb
ALL_TOOLS      += mcdb
mcdb_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/mcdb/1.0.2/interface
mcdb_EX_INCLUDE  := $(mcdb_LOC_INCLUDE)
mcdb_LOC_LIB := mcdb
mcdb_EX_LIB  := $(mcdb_LOC_LIB)
mcdb_LOC_USE := xerces-c
mcdb_EX_USE  := $(mcdb_LOC_USE)
mcdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,mcdb,,,mcdb))

meschach             := meschach
ALL_TOOLS      += meschach
meschach_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/meschach/1.2.pCMS1/include
meschach_EX_INCLUDE  := $(meschach_LOC_INCLUDE)
meschach_LOC_LIB := meschach
meschach_EX_LIB  := $(meschach_LOC_LIB)
meschach_INIT_FUNC := $$(eval $$(call ProductCommonVars,meschach,,,meschach))

millepede             := millepede
ALL_TOOLS      += millepede
millepede_LOC_USE := sockets pcre zlib
millepede_EX_USE  := $(millepede_LOC_USE)
millepede_INIT_FUNC := $$(eval $$(call ProductCommonVars,millepede,,,millepede))

mimetic             := mimetic
ALL_TOOLS      += mimetic
mimetic_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/mimetic/0.9.6/include
mimetic_EX_INCLUDE  := $(mimetic_LOC_INCLUDE)
mimetic_LOC_LIB := mimetic
mimetic_EX_LIB  := $(mimetic_LOC_LIB)
mimetic_INIT_FUNC := $$(eval $$(call ProductCommonVars,mimetic,,,mimetic))

opengl             := opengl
ALL_TOOLS      += opengl
opengl_LOC_LIB := GL GLU
opengl_EX_LIB  := $(opengl_LOC_LIB)
opengl_LOC_USE := x11
opengl_EX_USE  := $(opengl_LOC_USE)
opengl_INIT_FUNC := $$(eval $$(call ProductCommonVars,opengl,,,opengl))

openldap             := openldap
ALL_TOOLS      += openldap
openldap_LOC_USE := openssl db4
openldap_EX_USE  := $(openldap_LOC_USE)
openldap_INIT_FUNC := $$(eval $$(call ProductCommonVars,openldap,,,openldap))

openssl             := openssl
ALL_TOOLS      += openssl
openssl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/openssl/0.9.8e/include
openssl_EX_INCLUDE  := $(openssl_LOC_INCLUDE)
openssl_LOC_LIB := ssl crypto
openssl_EX_LIB  := $(openssl_LOC_LIB)
openssl_INIT_FUNC := $$(eval $$(call ProductCommonVars,openssl,,,openssl))

oracle             := oracle
ALL_TOOLS      += oracle
oracle_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/oracle/11.2.0.3.0__10.2.0.4.0/include
oracle_EX_INCLUDE  := $(oracle_LOC_INCLUDE)
oracle_LOC_LIB := clntsh
oracle_EX_LIB  := $(oracle_LOC_LIB)
oracle_LOC_USE := sockets
oracle_EX_USE  := $(oracle_LOC_USE)
oracle_INIT_FUNC := $$(eval $$(call ProductCommonVars,oracle,,,oracle))

oracleocci             := oracleocci
ALL_TOOLS      += oracleocci
oracleocci_LOC_LIB := occi
oracleocci_EX_LIB  := $(oracleocci_LOC_LIB)
oracleocci_LOC_USE := oracle
oracleocci_EX_USE  := $(oracleocci_LOC_USE)
oracleocci_INIT_FUNC := $$(eval $$(call ProductCommonVars,oracleocci,,,oracleocci))

pcre             := pcre
ALL_TOOLS      += pcre
pcre_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pcre/7.9/include
pcre_EX_INCLUDE  := $(pcre_LOC_INCLUDE)
pcre_LOC_LIB := pcre
pcre_EX_LIB  := $(pcre_LOC_LIB)
pcre_INIT_FUNC := $$(eval $$(call ProductCommonVars,pcre,,,pcre))

photos             := photos
ALL_TOOLS      += photos
photos_LOC_LIB := photos
photos_EX_LIB  := $(photos_LOC_LIB)
photos_LOC_USE := photos_headers f77compiler
photos_EX_USE  := $(photos_LOC_USE)
photos_INIT_FUNC := $$(eval $$(call ProductCommonVars,photos,,,photos))

photos_headers             := photos_headers
ALL_TOOLS      += photos_headers
photos_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/photos/215.5/include
photos_headers_EX_INCLUDE  := $(photos_headers_LOC_INCLUDE)
photos_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,photos_headers,,,photos_headers))

professor             := professor
ALL_TOOLS      += professor
professor_INIT_FUNC := $$(eval $$(call ProductCommonVars,professor,,,professor))

protobuf             := protobuf
ALL_TOOLS      += protobuf
protobuf_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/protobuf/2.4.1/include
protobuf_EX_INCLUDE  := $(protobuf_LOC_INCLUDE)
protobuf_LOC_LIB := protobuf
protobuf_EX_LIB  := $(protobuf_LOC_LIB)
protobuf_INIT_FUNC := $$(eval $$(call ProductCommonVars,protobuf,,,protobuf))

py2-cjson             := py2-cjson
ALL_TOOLS      += py2-cjson
py2-cjson_LOC_USE := python
py2-cjson_EX_USE  := $(py2-cjson_LOC_USE)
py2-cjson_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-cjson,,,py2-cjson))

py2-cx-oracle             := py2-cx-oracle
ALL_TOOLS      += py2-cx-oracle
py2-cx-oracle_LOC_USE := python oracle
py2-cx-oracle_EX_USE  := $(py2-cx-oracle_LOC_USE)
py2-cx-oracle_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-cx-oracle,,,py2-cx-oracle))

py2-ipython             := py2-ipython
ALL_TOOLS      += py2-ipython
py2-ipython_LOC_USE := python
py2-ipython_EX_USE  := $(py2-ipython_LOC_USE)
py2-ipython_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-ipython,,,py2-ipython))

py2-matplotlib             := py2-matplotlib
ALL_TOOLS      += py2-matplotlib
py2-matplotlib_LOC_USE := python zlib libpng py2-numpy
py2-matplotlib_EX_USE  := $(py2-matplotlib_LOC_USE)
py2-matplotlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-matplotlib,,,py2-matplotlib))

py2-numpy             := py2-numpy
ALL_TOOLS      += py2-numpy
py2-numpy_LOC_USE := python zlib lapack
py2-numpy_EX_USE  := $(py2-numpy_LOC_USE)
py2-numpy_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-numpy,,,py2-numpy))

py2-pycurl             := py2-pycurl
ALL_TOOLS      += py2-pycurl
py2-pycurl_LOC_USE := python
py2-pycurl_EX_USE  := $(py2-pycurl_LOC_USE)
py2-pycurl_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-pycurl,,,py2-pycurl))

py2-scipy             := py2-scipy
ALL_TOOLS      += py2-scipy
py2-scipy_LOC_USE := python py2-numpy lapack
py2-scipy_EX_USE  := $(py2-scipy_LOC_USE)
py2-scipy_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-scipy,,,py2-scipy))

pydata             := pydata
ALL_TOOLS      += pydata
pydata_LOC_FLAGS_LDFLAGS  := $(PYDATA_BASE)/lib/pydata.o
pydata_EX_FLAGS_LDFLAGS   := $(pydata_LOC_FLAGS_LDFLAGS)
pydata_LOC_FLAGS_NO_RECURSIVE_EXPORT  := 1
pydata_EX_FLAGS_NO_RECURSIVE_EXPORT   := $(pydata_LOC_FLAGS_NO_RECURSIVE_EXPORT)
pydata_INIT_FUNC := $$(eval $$(call ProductCommonVars,pydata,,,pydata))

pyminuit2             := pyminuit2
ALL_TOOLS      += pyminuit2
pyminuit2_INIT_FUNC := $$(eval $$(call ProductCommonVars,pyminuit2,,,pyminuit2))

pyqt             := pyqt
ALL_TOOLS      += pyqt
pyqt_LOC_USE := python qt sip
pyqt_EX_USE  := $(pyqt_LOC_USE)
pyqt_INIT_FUNC := $$(eval $$(call ProductCommonVars,pyqt,,,pyqt))

pythia6             := pythia6
ALL_TOOLS      += pythia6
pythia6_LOC_LIB := pythia6 pythia6_dummy pythia6_pdfdummy
pythia6_EX_LIB  := $(pythia6_LOC_LIB)
pythia6_LOC_USE := pythia6_headers f77compiler
pythia6_EX_USE  := $(pythia6_LOC_USE)
pythia6_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia6,,,pythia6))

pythia6_headers             := pythia6_headers
ALL_TOOLS      += pythia6_headers
pythia6_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pythia6/426/include
pythia6_headers_EX_INCLUDE  := $(pythia6_headers_LOC_INCLUDE)
pythia6_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia6_headers,,,pythia6_headers))

pythia8             := pythia8
ALL_TOOLS      += pythia8
pythia8_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pythia8/153-cms2/include
pythia8_EX_INCLUDE  := $(pythia8_LOC_INCLUDE)
pythia8_LOC_LIB := pythia8 hepmcinterface
pythia8_EX_LIB  := $(pythia8_LOC_LIB)
pythia8_LOC_USE := cxxcompiler hepmc pythia6 clhep lhapdf
pythia8_EX_USE  := $(pythia8_LOC_USE)
pythia8_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia8,,,pythia8))

python-ldap             := python-ldap
ALL_TOOLS      += python-ldap
python-ldap_LOC_USE := openssl openldap python
python-ldap_EX_USE  := $(python-ldap_LOC_USE)
python-ldap_INIT_FUNC := $$(eval $$(call ProductCommonVars,python-ldap,,,python-ldap))

python             := python
ALL_TOOLS      += python
python_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/python/2.6.4/include/python2.6
python_EX_INCLUDE  := $(python_LOC_INCLUDE)
python_LOC_LIB := python2.6
python_EX_LIB  := $(python_LOC_LIB)
python_LOC_USE := sockets
python_EX_USE  := $(python_LOC_USE)
python_INIT_FUNC := $$(eval $$(call ProductCommonVars,python,,,python))

qt             := qt
ALL_TOOLS      += qt
qt_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtOpenGL /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtGui
qt_EX_INCLUDE  := $(qt_LOC_INCLUDE)
qt_LOC_LIB := QtOpenGL QtGui
qt_EX_LIB  := $(qt_LOC_LIB)
qt_LOC_USE := qtbase qt3support x11 opengl
qt_EX_USE  := $(qt_LOC_USE)
qt_INIT_FUNC := $$(eval $$(call ProductCommonVars,qt,,,qt))

qt3support             := qt3support
ALL_TOOLS      += qt3support
qt3support_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/Qt3Support
qt3support_EX_INCLUDE  := $(qt3support_LOC_INCLUDE)
qt3support_LOC_LIB := Qt3Support
qt3support_EX_LIB  := $(qt3support_LOC_LIB)
qt3support_LOC_USE := qtbase
qt3support_EX_USE  := $(qt3support_LOC_USE)
qt3support_LOC_FLAGS_CPPDEFINES  := -DQT3_SUPPORT
qt3support_EX_FLAGS_CPPDEFINES   := $(qt3support_LOC_FLAGS_CPPDEFINES)
qt3support_INIT_FUNC := $$(eval $$(call ProductCommonVars,qt3support,,,qt3support))

qtbase             := qtbase
ALL_TOOLS      += qtbase
qtbase_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/Qt /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtCore /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtXml
qtbase_EX_INCLUDE  := $(qtbase_LOC_INCLUDE)
qtbase_LOC_LIB := QtCore QtXml
qtbase_EX_LIB  := $(qtbase_LOC_LIB)
qtbase_LOC_USE := zlib
qtbase_EX_USE  := $(qtbase_LOC_USE)
qtbase_LOC_FLAGS_CPPDEFINES  := -DQT_ALTERNATE_QTSMANIP -DQT_CLEAN_NAMESPACE -DQT_THREAD_SUPPORT
qtbase_EX_FLAGS_CPPDEFINES   := $(qtbase_LOC_FLAGS_CPPDEFINES)
qtbase_INIT_FUNC := $$(eval $$(call ProductCommonVars,qtbase,,,qtbase))

qtdesigner             := qtdesigner
ALL_TOOLS      += qtdesigner
qtdesigner_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtDesigner
qtdesigner_EX_INCLUDE  := $(qtdesigner_LOC_INCLUDE)
qtdesigner_LOC_LIB := QtDesigner
qtdesigner_EX_LIB  := $(qtdesigner_LOC_LIB)
qtdesigner_LOC_USE := qtbase qt
qtdesigner_EX_USE  := $(qtdesigner_LOC_USE)
qtdesigner_INIT_FUNC := $$(eval $$(call ProductCommonVars,qtdesigner,,,qtdesigner))

qtextra             := qtextra
ALL_TOOLS      += qtextra
qtextra_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtScript
qtextra_EX_INCLUDE  := $(qtextra_LOC_INCLUDE)
qtextra_LOC_LIB := QtScript
qtextra_EX_LIB  := $(qtextra_LOC_LIB)
qtextra_LOC_USE := qtbase
qtextra_EX_USE  := $(qtextra_LOC_USE)
qtextra_INIT_FUNC := $$(eval $$(call ProductCommonVars,qtextra,,,qtextra))

rivet             := rivet
ALL_TOOLS      += rivet
rivet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/rivet/1.5.1-cms10/include
rivet_EX_INCLUDE  := $(rivet_LOC_INCLUDE)
rivet_LOC_LIB := Rivet
rivet_EX_LIB  := $(rivet_LOC_LIB)
rivet_INIT_FUNC := $$(eval $$(call ProductCommonVars,rivet,,,rivet))

roofit             := roofit
ALL_TOOLS      += roofit
roofit_LOC_LIB := RooFit
roofit_EX_LIB  := $(roofit_LOC_LIB)
roofit_LOC_USE := roofitcore rootcore rootmath roothistmatrix
roofit_EX_USE  := $(roofit_LOC_USE)
roofit_INIT_FUNC := $$(eval $$(call ProductCommonVars,roofit,,,roofit))

roofitcore             := roofitcore
ALL_TOOLS      += roofitcore
roofitcore_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/roofit/5.32.03-cms16/include
roofitcore_EX_INCLUDE  := $(roofitcore_LOC_INCLUDE)
roofitcore_LOC_LIB := RooFitCore
roofitcore_EX_LIB  := $(roofitcore_LOC_LIB)
roofitcore_LOC_USE := rootcore roothistmatrix rootgpad rootminuit
roofitcore_EX_USE  := $(roofitcore_LOC_USE)
roofitcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,roofitcore,,,roofitcore))

roostats             := roostats
ALL_TOOLS      += roostats
roostats_LOC_LIB := RooStats
roostats_EX_LIB  := $(roostats_LOC_LIB)
roostats_LOC_USE := roofitcore roofit rootcore roothistmatrix rootgpad
roostats_EX_USE  := $(roostats_LOC_USE)
roostats_INIT_FUNC := $$(eval $$(call ProductCommonVars,roostats,,,roostats))

root             := root
ALL_TOOLS      += root
root_LOC_USE := rootphysics
root_EX_USE  := $(root_LOC_USE)
root_INIT_FUNC := $$(eval $$(call ProductCommonVars,root,,,root))

root_interface             := root_interface
ALL_TOOLS      += root_interface
root_interface_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/root/5.32.00-cms21/include
root_interface_EX_INCLUDE  := $(root_interface_LOC_INCLUDE)
root_interface_INIT_FUNC := $$(eval $$(call ProductCommonVars,root_interface,,,root_interface))

rootcint             := rootcint
ALL_TOOLS      += rootcint
rootcint_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/root/5.32.00-cms21/cint
rootcint_EX_INCLUDE  := $(rootcint_LOC_INCLUDE)
rootcint_LOC_LIB := Core Cint
rootcint_EX_LIB  := $(rootcint_LOC_LIB)
rootcint_LOC_USE := root_interface sockets pcre zlib
rootcint_EX_USE  := $(rootcint_LOC_USE)
rootcint_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcint,,,rootcint))

rootcintex             := rootcintex
ALL_TOOLS      += rootcintex
rootcintex_LOC_LIB := Cintex
rootcintex_EX_LIB  := $(rootcintex_LOC_LIB)
rootcintex_LOC_USE := rootrflx rootcint
rootcintex_EX_USE  := $(rootcintex_LOC_USE)
rootcintex_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcintex,,,rootcintex))

rootcore             := rootcore
ALL_TOOLS      += rootcore
rootcore_LOC_LIB := Tree Net
rootcore_EX_LIB  := $(rootcore_LOC_LIB)
rootcore_LOC_USE := rootmathcore rootthread
rootcore_EX_USE  := $(rootcore_LOC_USE)
rootcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcore,,,rootcore))

rooteg             := rooteg
ALL_TOOLS      += rooteg
rooteg_LOC_LIB := EG
rooteg_EX_LIB  := $(rooteg_LOC_LIB)
rooteg_LOC_USE := rootgraphics
rooteg_EX_USE  := $(rooteg_LOC_USE)
rooteg_INIT_FUNC := $$(eval $$(call ProductCommonVars,rooteg,,,rooteg))

rooteve             := rooteve
ALL_TOOLS      += rooteve
rooteve_LOC_LIB := Eve
rooteve_EX_LIB  := $(rooteve_LOC_LIB)
rooteve_LOC_USE := rootgeompainter rootrgl
rooteve_EX_USE  := $(rooteve_LOC_USE)
rooteve_INIT_FUNC := $$(eval $$(call ProductCommonVars,rooteve,,,rooteve))

rootfoam             := rootfoam
ALL_TOOLS      += rootfoam
rootfoam_LOC_LIB := Foam
rootfoam_EX_LIB  := $(rootfoam_LOC_LIB)
rootfoam_LOC_USE := roothistmatrix
rootfoam_EX_USE  := $(rootfoam_LOC_USE)
rootfoam_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootfoam,,,rootfoam))

rootgeom             := rootgeom
ALL_TOOLS      += rootgeom
rootgeom_LOC_LIB := Geom
rootgeom_EX_LIB  := $(rootgeom_LOC_LIB)
rootgeom_LOC_USE := rootrio rootmathcore
rootgeom_EX_USE  := $(rootgeom_LOC_USE)
rootgeom_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgeom,,,rootgeom))

rootgeompainter             := rootgeompainter
ALL_TOOLS      += rootgeompainter
rootgeompainter_LOC_LIB := GeomPainter
rootgeompainter_EX_LIB  := $(rootgeompainter_LOC_LIB)
rootgeompainter_LOC_USE := rootgeom rootgraphics
rootgeompainter_EX_USE  := $(rootgeompainter_LOC_USE)
rootgeompainter_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgeompainter,,,rootgeompainter))

rootgpad             := rootgpad
ALL_TOOLS      += rootgpad
rootgpad_LOC_LIB := Gpad Graf
rootgpad_EX_LIB  := $(rootgpad_LOC_LIB)
rootgpad_LOC_USE := roothistmatrix
rootgpad_EX_USE  := $(rootgpad_LOC_USE)
rootgpad_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgpad,,,rootgpad))

rootgraphics             := rootgraphics
ALL_TOOLS      += rootgraphics
rootgraphics_LOC_LIB := TreePlayer Graf3d Postscript
rootgraphics_EX_LIB  := $(rootgraphics_LOC_LIB)
rootgraphics_LOC_USE := rootgpad
rootgraphics_EX_USE  := $(rootgraphics_LOC_USE)
rootgraphics_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgraphics,,,rootgraphics))

rootguihtml             := rootguihtml
ALL_TOOLS      += rootguihtml
rootguihtml_LOC_LIB := GuiHtml
rootguihtml_EX_LIB  := $(rootguihtml_LOC_LIB)
rootguihtml_LOC_USE := rootinteractive
rootguihtml_EX_USE  := $(rootguihtml_LOC_USE)
rootguihtml_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootguihtml,,,rootguihtml))

roothistmatrix             := roothistmatrix
ALL_TOOLS      += roothistmatrix
roothistmatrix_LOC_LIB := Hist Matrix
roothistmatrix_EX_LIB  := $(roothistmatrix_LOC_LIB)
roothistmatrix_LOC_USE := rootcore
roothistmatrix_EX_USE  := $(roothistmatrix_LOC_USE)
roothistmatrix_INIT_FUNC := $$(eval $$(call ProductCommonVars,roothistmatrix,,,roothistmatrix))

roothtml             := roothtml
ALL_TOOLS      += roothtml
roothtml_LOC_LIB := Html
roothtml_EX_LIB  := $(roothtml_LOC_LIB)
roothtml_LOC_USE := rootgpad
roothtml_EX_USE  := $(roothtml_LOC_USE)
roothtml_INIT_FUNC := $$(eval $$(call ProductCommonVars,roothtml,,,roothtml))

rootinteractive             := rootinteractive
ALL_TOOLS      += rootinteractive
rootinteractive_LOC_LIB := Gui
rootinteractive_EX_LIB  := $(rootinteractive_LOC_LIB)
rootinteractive_LOC_USE := libjpg libpng rootgpad rootrint
rootinteractive_EX_USE  := $(rootinteractive_LOC_USE)
rootinteractive_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootinteractive,,,rootinteractive))

rootmath             := rootmath
ALL_TOOLS      += rootmath
rootmath_LOC_LIB := GenVector MathMore
rootmath_EX_LIB  := $(rootmath_LOC_LIB)
rootmath_LOC_USE := rootcore gsl
rootmath_EX_USE  := $(rootmath_LOC_USE)
rootmath_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmath,,,rootmath))

rootmathcore             := rootmathcore
ALL_TOOLS      += rootmathcore
rootmathcore_LOC_LIB := MathCore
rootmathcore_EX_LIB  := $(rootmathcore_LOC_LIB)
rootmathcore_LOC_USE := rootcint
rootmathcore_EX_USE  := $(rootmathcore_LOC_USE)
rootmathcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmathcore,,,rootmathcore))

rootminuit             := rootminuit
ALL_TOOLS      += rootminuit
rootminuit_LOC_LIB := Minuit
rootminuit_EX_LIB  := $(rootminuit_LOC_LIB)
rootminuit_LOC_USE := rootgpad
rootminuit_EX_USE  := $(rootminuit_LOC_USE)
rootminuit_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootminuit,,,rootminuit))

rootminuit2             := rootminuit2
ALL_TOOLS      += rootminuit2
rootminuit2_LOC_LIB := Minuit2
rootminuit2_EX_LIB  := $(rootminuit2_LOC_LIB)
rootminuit2_LOC_USE := rootgpad
rootminuit2_EX_USE  := $(rootminuit2_LOC_USE)
rootminuit2_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootminuit2,,,rootminuit2))

rootmlp             := rootmlp
ALL_TOOLS      += rootmlp
rootmlp_LOC_LIB := MLP
rootmlp_EX_LIB  := $(rootmlp_LOC_LIB)
rootmlp_LOC_USE := rootgraphics
rootmlp_EX_USE  := $(rootmlp_LOC_USE)
rootmlp_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmlp,,,rootmlp))

rootphysics             := rootphysics
ALL_TOOLS      += rootphysics
rootphysics_LOC_LIB := Physics
rootphysics_EX_LIB  := $(rootphysics_LOC_LIB)
rootphysics_LOC_USE := roothistmatrix
rootphysics_EX_USE  := $(rootphysics_LOC_USE)
rootphysics_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootphysics,,,rootphysics))

rootpy             := rootpy
ALL_TOOLS      += rootpy
rootpy_LOC_LIB := PyROOT
rootpy_EX_LIB  := $(rootpy_LOC_LIB)
rootpy_LOC_USE := rootgraphics
rootpy_EX_USE  := $(rootpy_LOC_USE)
rootpy_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootpy,,,rootpy))

rootrflx             := rootrflx
ALL_TOOLS      += rootrflx
rootrflx_LOC_LIB := Reflex
rootrflx_EX_LIB  := $(rootrflx_LOC_LIB)
rootrflx_LOC_USE := gccxml root_interface
rootrflx_EX_USE  := $(rootrflx_LOC_USE)
rootrflx_LOC_FLAGS_GENREFLEX_CPPFLAGS  := -DCMS_DICT_IMPL -D_REENTRANT -DGNUSOURCE
rootrflx_EX_FLAGS_GENREFLEX_CPPFLAGS   := $(rootrflx_LOC_FLAGS_GENREFLEX_CPPFLAGS)
rootrflx_LOC_FLAGS_GENREFLEX_GCCXMLOPT  := -m64
rootrflx_EX_FLAGS_GENREFLEX_GCCXMLOPT   := $(rootrflx_LOC_FLAGS_GENREFLEX_GCCXMLOPT)
rootrflx_LOC_FLAGS_GENREFLEX_ARGS  := --deep
rootrflx_EX_FLAGS_GENREFLEX_ARGS   := $(rootrflx_LOC_FLAGS_GENREFLEX_ARGS)
rootrflx_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrflx,,,rootrflx))

rootrgl             := rootrgl
ALL_TOOLS      += rootrgl
rootrgl_LOC_LIB := RGL
rootrgl_EX_LIB  := $(rootrgl_LOC_LIB)
rootrgl_LOC_USE := rootinteractive rootgraphics
rootrgl_EX_USE  := $(rootrgl_LOC_USE)
rootrgl_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrgl,,,rootrgl))

rootrint             := rootrint
ALL_TOOLS      += rootrint
rootrint_LOC_LIB := Rint
rootrint_EX_LIB  := $(rootrint_LOC_LIB)
rootrint_LOC_USE := rootcint
rootrint_EX_USE  := $(rootrint_LOC_USE)
rootrint_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrint,,,rootrint))

rootrio             := rootrio
ALL_TOOLS      += rootrio
rootrio_LOC_LIB := RIO
rootrio_EX_LIB  := $(rootrio_LOC_LIB)
rootrio_LOC_USE := rootcint
rootrio_EX_USE  := $(rootrio_LOC_USE)
rootrio_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrio,,,rootrio))

rootspectrum             := rootspectrum
ALL_TOOLS      += rootspectrum
rootspectrum_LOC_LIB := Spectrum
rootspectrum_EX_LIB  := $(rootspectrum_LOC_LIB)
rootspectrum_LOC_USE := roothistmatrix
rootspectrum_EX_USE  := $(rootspectrum_LOC_USE)
rootspectrum_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootspectrum,,,rootspectrum))

rootthread             := rootthread
ALL_TOOLS      += rootthread
rootthread_LOC_LIB := Thread
rootthread_EX_LIB  := $(rootthread_LOC_LIB)
rootthread_LOC_USE := rootrio
rootthread_EX_USE  := $(rootthread_LOC_USE)
rootthread_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootthread,,,rootthread))

roottmva             := roottmva
ALL_TOOLS      += roottmva
roottmva_LOC_LIB := TMVA
roottmva_EX_LIB  := $(roottmva_LOC_LIB)
roottmva_LOC_USE := rootmlp rootminuit
roottmva_EX_USE  := $(roottmva_LOC_USE)
roottmva_INIT_FUNC := $$(eval $$(call ProductCommonVars,roottmva,,,roottmva))

rootxml             := rootxml
ALL_TOOLS      += rootxml
rootxml_LOC_LIB := XMLParser
rootxml_EX_LIB  := $(rootxml_LOC_LIB)
rootxml_LOC_USE := rootcore
rootxml_EX_USE  := $(rootxml_LOC_USE)
rootxml_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootxml,,,rootxml))

rootxmlio             := rootxmlio
ALL_TOOLS      += rootxmlio
rootxmlio_LOC_LIB := XMLIO
rootxmlio_EX_LIB  := $(rootxmlio_LOC_LIB)
rootxmlio_LOC_USE := rootrio
rootxmlio_EX_USE  := $(rootxmlio_LOC_USE)
rootxmlio_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootxmlio,,,rootxmlio))

self             := self
ALL_TOOLS      += self
self_LOC_INCLUDE := /gpfs22/home/janjamrk/CMSSW_5_3_8_HI_patch2Merged_V1/src /gpfs22/home/janjamrk/CMSSW_5_3_8_HI_patch2Merged_V1/include/LCG /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw-patch/CMSSW_5_3_8_HI_patch2/src /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw-patch/CMSSW_5_3_8_HI_patch2/include/LCG
self_EX_INCLUDE  := $(self_LOC_INCLUDE)
self_LOC_LIBDIR := /gpfs22/home/janjamrk/CMSSW_5_3_8_HI_patch2Merged_V1/lib/slc5_amd64_gcc462 /gpfs22/home/janjamrk/CMSSW_5_3_8_HI_patch2Merged_V1/external/slc5_amd64_gcc462/lib /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw-patch/CMSSW_5_3_8_HI_patch2/lib/slc5_amd64_gcc462 /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/cmssw-patch/CMSSW_5_3_8_HI_patch2/external/slc5_amd64_gcc462/lib
self_EX_LIBDIR  := $(self_LOC_LIBDIR)
self_LOC_LIBDIR += $(cmssw_EX_LIBDIR)
self_EX_LIBDIR  += $(cmssw_EX_LIBDIR)
self_LOC_FLAGS_SYMLINK_DEPTH_CMSSW_SEARCH_PATH  := 2
self_EX_FLAGS_SYMLINK_DEPTH_CMSSW_SEARCH_PATH   := $(self_LOC_FLAGS_SYMLINK_DEPTH_CMSSW_SEARCH_PATH)
self_LOC_FLAGS_SKIP_TOOLS_SYMLINK  := cxxcompiler ccompiler x11 dpm
self_EX_FLAGS_SKIP_TOOLS_SYMLINK   := $(self_LOC_FLAGS_SKIP_TOOLS_SYMLINK)
self_LOC_FLAGS_EXTERNAL_SYMLINK  := PATH LIBDIR CMSSW_SEARCH_PATH
self_EX_FLAGS_EXTERNAL_SYMLINK   := $(self_LOC_FLAGS_EXTERNAL_SYMLINK)
self_LOC_FLAGS_NO_EXTERNAL_RUNTIME  := LD_LIBRARY_PATH PATH CMSSW_SEARCH_PATH
self_EX_FLAGS_NO_EXTERNAL_RUNTIME   := $(self_LOC_FLAGS_NO_EXTERNAL_RUNTIME)
self_INIT_FUNC := $$(eval $$(call ProductCommonVars,self,,20000,self))

sherpa             := sherpa
ALL_TOOLS      += sherpa
sherpa_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/sherpa/1.4.2/include/SHERPA-MC
sherpa_EX_INCLUDE  := $(sherpa_LOC_INCLUDE)
sherpa_LOC_LIB := AhadicDecays AhadicFormation AhadicMain AhadicTools Amegic AmegicCluster AmegicPSGen Amisic AmisicModel AmisicTools Amplitude Beam CSCalculators CSMain CSShowers CSTools CTEQ6Sherpa Comix ComixAmplitude ComixCluster ComixPhasespace CT10Sherpa DipoleSubtraction ExtraXS ExtraXS1_2 ExtraXS1_3 ExtraXS2_2 ExtraXSCluster ExtraXSNLO GRVSherpa HadronsCurrents HadronsMEs HadronsMain HadronsPSs LHAPDFSherpa LundTools MCatNLOCalculators MCatNLOMain MCatNLOShowers MCatNLOTools METoolsColors METoolsCurrents METoolsExplicit METoolsLoops METoolsMain METoolsSpinCorrelations METoolsVertices MRST01LOSherpa MRST04QEDSherpa MRST99Sherpa MSTW08Sherpa ModelInteractions ModelMain PDF PDFESherpa POWHEGCalculators POWHEGMain POWHEGShowers POWHEGTools PhasicChannels PhasicDecays PhasicEnhance PhasicMain PhasicProcess PhasicScales PhasicSelectors PhotonsMEs PhotonsMain PhotonsPhaseSpace PhotonsTools Remnant SherpaAnalyses SherpaAnalysis SherpaAnalysisTools SherpaAnalysisTrigger SherpaInitialization SherpaMain SherpaObservables SherpaPerturbativePhysics SherpaSingleEvents SherpaSoftPhysics SherpaTools ShrimpsBeamRemnants ShrimpsEikonals ShrimpsEvents ShrimpsMain ShrimpsTools ShrimpsXsecs String ToolsMath ToolsOrg ToolsPhys Zfunctions
sherpa_EX_LIB  := $(sherpa_LOC_LIB)
sherpa_LOC_USE := hepmc lhapdf
sherpa_EX_USE  := $(sherpa_LOC_USE)
sherpa_INIT_FUNC := $$(eval $$(call ProductCommonVars,sherpa,,,sherpa))

sigcpp             := sigcpp
ALL_TOOLS      += sigcpp
sigcpp_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/sigcpp/2.2.10/include/sigc++-2.0
sigcpp_EX_INCLUDE  := $(sigcpp_LOC_INCLUDE)
sigcpp_LOC_LIB := sigc-2.0
sigcpp_EX_LIB  := $(sigcpp_LOC_LIB)
sigcpp_INIT_FUNC := $$(eval $$(call ProductCommonVars,sigcpp,,,sigcpp))

sip             := sip
ALL_TOOLS      += sip
sip_LOC_USE := python
sip_EX_USE  := $(sip_LOC_USE)
sip_INIT_FUNC := $$(eval $$(call ProductCommonVars,sip,,,sip))

sockets             := sockets
ALL_TOOLS      += sockets
sockets_LOC_LIB := nsl crypt dl rt
sockets_EX_LIB  := $(sockets_LOC_LIB)
sockets_INIT_FUNC := $$(eval $$(call ProductCommonVars,sockets,,,sockets))

sqlite             := sqlite
ALL_TOOLS      += sqlite
sqlite_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/sqlite/3.6.23/include
sqlite_EX_INCLUDE  := $(sqlite_LOC_INCLUDE)
sqlite_LOC_LIB := sqlite3
sqlite_EX_LIB  := $(sqlite_LOC_LIB)
sqlite_INIT_FUNC := $$(eval $$(call ProductCommonVars,sqlite,,,sqlite))

tauola             := tauola
ALL_TOOLS      += tauola
tauola_LOC_LIB := pretauola tauola
tauola_EX_LIB  := $(tauola_LOC_LIB)
tauola_LOC_USE := f77compiler tauola_headers
tauola_EX_USE  := $(tauola_LOC_USE)
tauola_INIT_FUNC := $$(eval $$(call ProductCommonVars,tauola,,,tauola))

tauola_headers             := tauola_headers
ALL_TOOLS      += tauola_headers
tauola_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tauola/27.121.5/include
tauola_headers_EX_INCLUDE  := $(tauola_headers_LOC_INCLUDE)
tauola_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,tauola_headers,,,tauola_headers))

tauolapp             := tauolapp
ALL_TOOLS      += tauolapp
tauolapp_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tauolapp/1.0.5-cms2/include
tauolapp_EX_INCLUDE  := $(tauolapp_LOC_INCLUDE)
tauolapp_LOC_LIB := TauolaCxxInterface TauolaFortran
tauolapp_EX_LIB  := $(tauolapp_LOC_LIB)
tauolapp_LOC_USE := hepmc f77compiler
tauolapp_EX_USE  := $(tauolapp_LOC_USE)
tauolapp_INIT_FUNC := $$(eval $$(call ProductCommonVars,tauolapp,,,tauolapp))

tcmalloc             := tcmalloc
ALL_TOOLS      += tcmalloc
tcmalloc_LOC_LIB := tcmalloc
tcmalloc_EX_LIB  := $(tcmalloc_LOC_LIB)
tcmalloc_INIT_FUNC := $$(eval $$(call ProductCommonVars,tcmalloc,,,tcmalloc))

tcmalloc_minimal             := tcmalloc_minimal
ALL_TOOLS      += tcmalloc_minimal
tcmalloc_minimal_LOC_LIB := tcmalloc_minimal
tcmalloc_minimal_EX_LIB  := $(tcmalloc_minimal_LOC_LIB)
tcmalloc_minimal_INIT_FUNC := $$(eval $$(call ProductCommonVars,tcmalloc_minimal,,,tcmalloc_minimal))

thepeg             := thepeg
ALL_TOOLS      += thepeg
thepeg_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/thepeg/1.7.0-cms7/include
thepeg_EX_INCLUDE  := $(thepeg_LOC_INCLUDE)
thepeg_LOC_LIB := ThePEG LesHouches
thepeg_EX_LIB  := $(thepeg_LOC_LIB)
thepeg_LOC_USE := lhapdf gsl
thepeg_EX_USE  := $(thepeg_LOC_USE)
thepeg_INIT_FUNC := $$(eval $$(call ProductCommonVars,thepeg,,,thepeg))

tkonlinesw             := tkonlinesw
ALL_TOOLS      += tkonlinesw
tkonlinesw_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tkonlinesw/2.7.0-cms9/include
tkonlinesw_EX_INCLUDE  := $(tkonlinesw_LOC_INCLUDE)
tkonlinesw_LOC_LIB := ICUtils Fed9UUtils
tkonlinesw_EX_LIB  := $(tkonlinesw_LOC_LIB)
tkonlinesw_LOC_USE := xerces-c
tkonlinesw_EX_USE  := $(tkonlinesw_LOC_USE)
tkonlinesw_INIT_FUNC := $$(eval $$(call ProductCommonVars,tkonlinesw,,,tkonlinesw))

tkonlineswdb             := tkonlineswdb
ALL_TOOLS      += tkonlineswdb
tkonlineswdb_LOC_LIB := DeviceDescriptions Fed9UDeviceFactory
tkonlineswdb_EX_LIB  := $(tkonlineswdb_LOC_LIB)
tkonlineswdb_LOC_USE := tkonlinesw oracle oracleocci
tkonlineswdb_EX_USE  := $(tkonlineswdb_LOC_USE)
tkonlineswdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,tkonlineswdb,,,tkonlineswdb))

toprex             := toprex
ALL_TOOLS      += toprex
toprex_LOC_LIB := toprex
toprex_EX_LIB  := $(toprex_LOC_LIB)
toprex_LOC_USE := toprex_headers f77compiler
toprex_EX_USE  := $(toprex_LOC_USE)
toprex_INIT_FUNC := $$(eval $$(call ProductCommonVars,toprex,,,toprex))

toprex_headers             := toprex_headers
ALL_TOOLS      += toprex_headers
toprex_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/toprex/4.23/include
toprex_headers_EX_INCLUDE  := $(toprex_headers_LOC_INCLUDE)
toprex_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,toprex_headers,,,toprex_headers))

uuid             := uuid
ALL_TOOLS      += uuid
uuid_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/uuid/1.38/include
uuid_EX_INCLUDE  := $(uuid_LOC_INCLUDE)
uuid_LOC_LIB := uuid
uuid_EX_LIB  := $(uuid_LOC_LIB)
uuid_LOC_USE := sockets
uuid_EX_USE  := $(uuid_LOC_USE)
uuid_INIT_FUNC := $$(eval $$(call ProductCommonVars,uuid,,,uuid))

valgrind             := valgrind
ALL_TOOLS      += valgrind
valgrind_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/valgrind/3.6.1/include
valgrind_EX_INCLUDE  := $(valgrind_LOC_INCLUDE)
valgrind_INIT_FUNC := $$(eval $$(call ProductCommonVars,valgrind,,,valgrind))

x11             := x11
ALL_TOOLS      += x11
x11_LOC_USE := sockets
x11_EX_USE  := $(x11_LOC_USE)
x11_INIT_FUNC := $$(eval $$(call ProductCommonVars,x11,,,x11))

xdaq             := xdaq
ALL_TOOLS      += xdaq
xdaq_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xdaq/VR17173/include /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xdaq/VR17173/include/linux
xdaq_EX_INCLUDE  := $(xdaq_LOC_INCLUDE)
xdaq_LOC_LIB := toolbox xdaq config xoap xgi xdata cgicc log4cplus xcept logudpappender peer logxmlappender asyncresolv ptfifo pthttp pttcp i2outils xdaq2rc xoapfilter xalan-c xalanMsg wsaddressing wsclientsubscriber wseventing wsserviceeventing
xdaq_EX_LIB  := $(xdaq_LOC_LIB)
xdaq_LOC_USE := xerces-c sockets mimetic uuid
xdaq_EX_USE  := $(xdaq_LOC_USE)
xdaq_LOC_FLAGS_CPPDEFINES  := -DSOAP__ -DLITTLE_ENDIAN__ -Dlinux
xdaq_EX_FLAGS_CPPDEFINES   := $(xdaq_LOC_FLAGS_CPPDEFINES)
xdaq_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaq,,,xdaq))

xdaqheader             := xdaqheader
ALL_TOOLS      += xdaqheader
xdaqheader_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xdaq/VR17173/include
xdaqheader_EX_INCLUDE  := $(xdaqheader_LOC_INCLUDE)
xdaqheader_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaqheader,,,xdaqheader))

xdaqsentinelutils             := xdaqsentinelutils
ALL_TOOLS      += xdaqsentinelutils
xdaqsentinelutils_LOC_LIB := sentinelutils
xdaqsentinelutils_EX_LIB  := $(xdaqsentinelutils_LOC_LIB)
xdaqsentinelutils_LOC_USE := xdaq
xdaqsentinelutils_EX_USE  := $(xdaqsentinelutils_LOC_USE)
xdaqsentinelutils_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaqsentinelutils,,,xdaqsentinelutils))

xerces-c             := xerces-c
ALL_TOOLS      += xerces-c
xerces-c_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xerces-c/2.8.0/include
xerces-c_EX_INCLUDE  := $(xerces-c_LOC_INCLUDE)
xerces-c_LOC_LIB := xerces-c
xerces-c_EX_LIB  := $(xerces-c_LOC_LIB)
xerces-c_INIT_FUNC := $$(eval $$(call ProductCommonVars,xerces-c,,,xerces-c))

xrootd             := xrootd
ALL_TOOLS      += xrootd
xrootd_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xrootd/3.1.0-cms2/include/xrootd
xrootd_EX_INCLUDE  := $(xrootd_LOC_INCLUDE)
xrootd_LOC_LIB := XrdUtils XrdClient
xrootd_EX_LIB  := $(xrootd_LOC_LIB)
xrootd_INIT_FUNC := $$(eval $$(call ProductCommonVars,xrootd,,,xrootd))

xz             := xz
ALL_TOOLS      += xz
xz_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xz/5.0.3-cms/include
xz_EX_INCLUDE  := $(xz_LOC_INCLUDE)
xz_LOC_LIB := lzma
xz_EX_LIB  := $(xz_LOC_LIB)
xz_INIT_FUNC := $$(eval $$(call ProductCommonVars,xz,,,xz))

zlib             := zlib
ALL_TOOLS      += zlib
zlib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/zlib/1.2.3/include
zlib_EX_INCLUDE  := $(zlib_LOC_INCLUDE)
zlib_LOC_LIB := z
zlib_EX_LIB  := $(zlib_LOC_LIB)
zlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,zlib,,,zlib))

