

cdef enum AT_VersionInfoId:
    #// Using large numbers to force size to an integer
    AT_SDKVersion = 0x40000000
    AT_DeviceDriverVersion = 0x40000001

#//Channel enumeration
cdef enum AT_DDGLiteChannelId:
    #// Using large numbers to force size to an integer
    AT_DDGLite_ChannelA = 0x40000000
    AT_DDGLite_ChannelB = 0x40000001
    AT_DDGLite_ChannelC = 0x40000002

cdef struct SYSTEMTIME:
    unsigned short wYear
    unsigned short wMonth
    unsigned short wDayOfWeek
    unsigned short wDay
    unsigned short wHour
    unsigned short wMinute
    unsigned short wSecond
    unsigned short wMilliseconds

cdef struct AndorCapabilities:
    unsigned int ulSize
    unsigned int ulAcqModes
    unsigned int ulReadModes
    unsigned int ulTriggerModes
    unsigned int ulCameraType
    unsigned int ulPixelMode
    unsigned int ulSetFunctions
    unsigned int ulGetFunctions
    unsigned int ulFeatures
    unsigned int ulPCICard
    unsigned int ulEMGainCapability
    unsigned int ulFTReadModes

cdef struct ColorDemosaicInfo:
    int iX
    int iY
    int iAlgorithm
    int iXPhase
    int iYPhase
    int iBackground

cdef struct WhiteBalanceInfo:
    int iSize
    int iX
    int iY
    int iAlgorithm
    int iROI_left
    int iROI_right
    int iROI_top
    int iROI_bottom
    int iOperation


cdef extern from "atmcdLXd.h" :
    unsigned int AbortAcquisition()
    unsigned int CancelWait()
    unsigned int CoolerOFF()
    unsigned int CoolerON()
    unsigned int DemosaicImage(unsigned short *grey, unsigned short *red, unsigned short *green, unsigned short *blue,
                               ColorDemosaicInfo *info)
    unsigned int EnableKeepCleans(int iMode)
    unsigned int EnableSensorCompensation(int iMode)
    unsigned int SetIRIGModulation(char mode)
    unsigned int FreeInternalMemory()
    unsigned int GetAcquiredData(int *arr, unsigned int size)
    unsigned int GetAcquiredData16(unsigned short *arr, unsigned int size)
    unsigned int GetAcquiredFloatData(float *arr, unsigned int size)
    unsigned int GetAcquisitionProgress(int *acc, int *series)
    unsigned int GetAcquisitionTimings(float *exposure, float *accumulate, float *kinetic)
    unsigned int GetAdjustedRingExposureTimes(int inumTimes, float *fptimes)
    unsigned int GetAllDMAData(int *arr, unsigned int size)
    unsigned int GetAmpDesc(int index, char *name, int length)
    unsigned int GetAmpMaxSpeed(int index, float *speed)
    unsigned int GetAvailableCameras(int *totalCameras)
    unsigned int GetBackground(int *arr, unsigned int size)
    unsigned int GetBaselineClamp(int *state)
    unsigned int GetBitDepth(int channel, int *depth)
    unsigned int GetCameraEventStatus(unsigned int *camStatus)
    unsigned int GetCameraHandle(int cameraIndex, int *cameraHandle)
    unsigned int GetCameraInformation(int index, int *information)
    unsigned int GetCameraSerialNumber(int *number)
    unsigned int GetCapabilities(AndorCapabilities *caps)
    unsigned int GetControllerCardModel(char *controllerCardModel)
    unsigned int GetCountConvertWavelengthRange(float *minval, float *maxval)
    unsigned int GetCurrentCamera(int *cameraHandle)
    unsigned int GetCYMGShift(int *iXshift, int *iYShift)
    unsigned int GetDDGExternalOutputEnabled(unsigned int uiIndex, unsigned int *puiEnabled)
    unsigned int GetDDGExternalOutputPolarity(unsigned int uiIndex, unsigned int *puiPolarity)
    unsigned int GetDDGExternalOutputStepEnabled(unsigned int uiIndex, unsigned int *puiEnabled)
    unsigned int GetDDGExternalOutputTime(unsigned int uiIndex, unsigned long *puiDelay, unsigned long *puiWidth)
    unsigned int GetDDGTTLGateWidth(unsigned long opticalWidth, unsigned long *ttlWidth)
    unsigned int GetDDGGateTime(unsigned long *puiDelay, unsigned long *puiWidth)
    unsigned int GetDDGInsertionDelay(int *piState)
    unsigned int GetDDGIntelligate(int *piState)
    unsigned int GetDDGIOC(int *state)
    unsigned int GetDDGIOCFrequency(double *frequency)
    unsigned int GetDDGIOCNumber(unsigned long *numberPulses)
    unsigned int GetDDGIOCNumberRequested(unsigned int *pulses)
    unsigned int GetDDGIOCPeriod(unsigned long *period)
    unsigned int GetDDGIOCPulses(int *pulses)
    unsigned int GetDDGIOCTrigger(unsigned int *trigger)
    unsigned int GetDDGOpticalWidthEnabled(unsigned int *puiEnabled)

    #// DDG Lite functions
    unsigned int GetDDGLiteGlobalControlByte(unsigned char *control)
    unsigned int GetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char *control)
    unsigned int GetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float *fDelay)
    unsigned int GetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float *fWidth)
    unsigned int GetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float *fDelay)
    unsigned int GetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, unsigned int *ui32Pulses)

    unsigned int GetDDGPulse(double wid, double resolution, double *Delay, double *Width)
    unsigned int GetDDGStepCoefficients(unsigned int mode, double *p1, double *p2)
    unsigned int GetDDGWidthStepCoefficients(unsigned int mode, double *p1, double *p2)
    unsigned int GetDDGStepMode(unsigned int *mode)
    unsigned int GetDDGWidthStepMode(unsigned int *mode)
    unsigned int GetDetector(int *xpixels, int *ypixels)
    unsigned int GetDICameraInfo(void *info)
    unsigned int GetEMAdvanced(int *state)
    unsigned int GetEMCCDGain(int *gain)
    unsigned int GetEMGainRange(int *low, int *high)
    unsigned int GetExternalTriggerTermination(unsigned int *puiTermination)
    unsigned int GetFastestRecommendedVSSpeed(int *index, float *speed)
    unsigned int GetFIFOUsage(int *FIFOusage)
    unsigned int GetFilterMode(int *mode)
    unsigned int GetFKExposureTime(float *time)
    unsigned int GetFKVShiftSpeed(int index, int *speed)
    unsigned int GetFKVShiftSpeedF(int index, float *speed)
    unsigned int GetFrontEndStatus(int *piFlag)
    unsigned int GetGateMode(int *piGatemode)
    unsigned int GetHardwareVersion(unsigned int *PCB, unsigned int *Decode, unsigned int *dummy1, unsigned int *dummy2,
                                    unsigned int *CameraFirmwareVersion, unsigned int *CameraFirmwareBuild)
    unsigned int GetHeadModel(char *name)
    unsigned int GetHorizontalSpeed(int index, int *speed)
    unsigned int GetHSSpeed(int channel, int typ, int index, float *speed)
    unsigned int GetHVflag(int *bFlag)
    unsigned int GetID(int devNum, int *id)
    unsigned int GetImageFlip(int *iHFlip, int *iVFlip)
    unsigned int GetImageRotate(int *iRotate)
    unsigned int GetImages(int first, int last, int *arr, unsigned int size, int *validfirst, int *validlast)
    unsigned int GetImages16(int first, int last, unsigned short *arr, unsigned int size, int *validfirst,
                             int *validlast)
    unsigned int GetImagesPerDMA(unsigned int *images)
    unsigned int GetIRQ(int *IRQ)
    unsigned int GetKeepCleanTime(float *KeepCleanTime)
    unsigned int GetMaximumBinning(int ReadMode, int HorzVert, int *MaxBinning)
    unsigned int GetMaximumExposure(float *MaxExp)
    unsigned int GetMaximumNumberRingExposureTimes(int *number)
    unsigned int GetMCPGain(int *piGain)
    unsigned int GetMCPGainRange(int *iLow, int *iHigh)
    unsigned int GetMCPGainTable(int iNum, int *piGain, float *pfPhotoepc)
    unsigned int GetMCPVoltage(int *iVoltage)
    unsigned int GetMinimumImageLength(int *MinImageLength)
    unsigned int GetMinimumNumberInSeries(int *number)
    unsigned int GetMostRecentColorImage16(unsigned int size, int algorithm, unsigned short *red, unsigned short *green,
                                           unsigned short *blue)
    unsigned int GetMostRecentImage(int *arr, unsigned int size)
    unsigned int GetMostRecentImage16(unsigned short *arr, unsigned int size)
    #// unsigned int GetMSTimingsData(SYSTEMTIME * TimeOfStart, float * pfDifferences, int inoOfImages)
    unsigned int GetMetaDataInfo(SYSTEMTIME *TimeOfStart, float *pfTimeFromStart, unsigned int index)
    unsigned int GetMSTimingsEnabled()
    unsigned int GetNewData(int *arr, unsigned int size)
    unsigned int GetNewData16(unsigned short *arr, unsigned int size)
    unsigned int GetNewData8(unsigned char *arr, unsigned int size)
    unsigned int GetNewFloatData(float *arr, unsigned int size)
    unsigned int GetNumberADChannels(int *channels)
    unsigned int GetNumberAmp(int *amp)
    unsigned int GetNumberAvailableImages(int *first, int *last)
    unsigned int GetNumberDDGExternalOutputs(unsigned int *puiCount)
    unsigned int GetNumberDevices(int *numDevs)
    unsigned int GetNumberFKVShiftSpeeds(int *number)
    unsigned int GetNumberHorizontalSpeeds(int *number)
    unsigned int GetNumberHSSpeeds(int channel, int typ, int *speeds)
    unsigned int GetNumberMissedExternalTriggers(unsigned int first, unsigned int last, unsigned short *arr,
                                                 unsigned int size)
    unsigned int GetIRIGData(unsigned char *_uc_irigData, unsigned int _ui_index)
    unsigned int GetNumberNewImages(int *first, int *last)
    unsigned int GetNumberPhotonCountingDivisions(unsigned int *noOfDivisions)
    unsigned int GetNumberPreAmpGains(int *noGains)
    unsigned int GetNumberRingExposureTimes(int *ipnumTimes)
    unsigned int GetNumberIO(int *iNumber)
    unsigned int GetNumberVerticalSpeeds(int *number)
    unsigned int GetNumberVSAmplitudes(int *number)
    unsigned int GetNumberVSSpeeds(int *speeds)
    unsigned int GetOldestImage(int *arr, unsigned int size)
    unsigned int GetOldestImage16(unsigned short *arr, unsigned int size)
    unsigned int GetPhosphorStatus(int *piFlag)
    unsigned int GetPhysicalDMAAddress(unsigned int *Address1, unsigned int *Address2)
    unsigned int GetPixelSize(float *xSize, float *ySize)
    unsigned int GetPreAmpGain(int index, float *gain)
    unsigned int GetPreAmpGainText(int index, char *name, int length)
    unsigned int GetDualExposureTimes(float *exposure1, float *exposure2)
    unsigned int GetQE(char *sensor, float wavelength, unsigned int mode, float *QE)
    unsigned int GetReadOutTime(float *ReadOutTime)
    unsigned int GetRegisterDump(int *mode)
    unsigned int GetRelativeImageTimes(unsigned int first, unsigned int last, unsigned long *arr, unsigned int size)
    unsigned int GetRingExposureRange(float *fpMin, float *fpMax)
    unsigned int GetSDK3Handle(int *Handle)
    unsigned int GetSensitivity(int channel, int horzShift, int amplifier, int pa, float *sensitivity)
    unsigned int GetShutterMinTimes(int *minclosingtime, int *minopeningtime)
    unsigned int GetSizeOfCircularBuffer(int *index)
    unsigned int GetSlotBusDeviceFunction(unsigned int *dwslot, unsigned int *dwBus, unsigned int *dwDevice,
                                          unsigned int *dwFunction)
    unsigned int GetSoftwareVersion(unsigned int *eprom, unsigned int *coffile, unsigned int *vxdrev,
                                    unsigned int *vxdver, unsigned int *dllrev, unsigned int *dllver)
    unsigned int GetSpoolProgress(int *index)
    unsigned int GetStartUpTime(float *time)
    unsigned int GetStatus(int *status)
    unsigned int GetTECStatus(int *piFlag)
    unsigned int GetTemperature(int *temperature)
    unsigned int GetTemperatureF(float *temperature)
    unsigned int GetTemperatureRange(int *mintemp, int *maxtemp)
    unsigned int GetTemperaturePrecision(int *precision)
    unsigned int GetTemperatureStatus(float *SensorTemp, float *TargetTemp, float *AmbientTemp, float *CoolerVolts)
    unsigned int GetTotalNumberImagesAcquired(int *index)
    unsigned int GetIODirection(int index, int *iDirection)
    unsigned int GetIOLevel(int index, int *iLevel)
    unsigned int GetUSBDeviceDetails(unsigned short *VendorID, unsigned short *ProductID,
                                     unsigned short *FirmwareVersion, unsigned short *SpecificationNumber)
    unsigned int GetVersionInfo(AT_VersionInfoId arr, char *szVersionInfo, unsigned int ui32BufferLen)
    unsigned int GetVerticalSpeed(int index, int *speed)
    unsigned int GetVirtualDMAAddress(void ** Address1, void ** Address2)
    unsigned int GetVSAmplitudeString(int index, char *text)
    unsigned int GetVSAmplitudeFromString(char *text, int *index)
    unsigned int GetVSAmplitudeValue(int index, int *value)
    unsigned int GetVSSpeed(int index, float *speed)
    unsigned int GPIBReceive(int id, short address, char *text, int size)
    unsigned int GPIBSend(int id, short address, char *text)
    unsigned int I2CBurstRead(unsigned char i2cAddress, int nBytes, unsigned char *data)
    unsigned int I2CBurstWrite(unsigned char i2cAddress, int nBytes, unsigned char *data)
    unsigned int I2CRead(unsigned char deviceID, unsigned char intAddress, unsigned char *pdata)
    unsigned int I2CReset()
    unsigned int I2CWrite(unsigned char deviceID, unsigned char intAddress, unsigned char data)
    unsigned int IdAndorDll()
    unsigned int InAuxPort(int port, int *state)
    unsigned int Initialize(char *dir)
    unsigned int InitializeDevice(char *dir)
    unsigned int IsAmplifierAvailable(int iamp)
    unsigned int IsCoolerOn(int *iCoolerStatus)
    unsigned int IsCountConvertModeAvailable(int mode)
    unsigned int IsInternalMechanicalShutter(int *InternalShutter)
    unsigned int IsPreAmpGainAvailable(int channel, int amplifier, int index, int pa, int *status)
    unsigned int IsReadoutFlippedByAmplifier(int iAmplifier, int *iFlipped)
    unsigned int IsTriggerModeAvailable(int iTriggerMode)
    unsigned int Merge(const int *arr, int nOrder, int nPoint, int nPixel, float *coeff, int fit, int hbin, int *output,
                       float *start, float *step_Renamed)
    unsigned int OutAuxPort(int port, int state)
    unsigned int PrepareAcquisition()
    unsigned int SaveAsBmp(const char *path, const char *palette, int ymin, int ymax)
    unsigned int SaveAsCommentedSif(char *path, char *comment)
    unsigned int SaveAsEDF(char *szPath, int iMode)
    unsigned int SaveAsFITS(char *szFileTitle, int typ)
    unsigned int SaveAsRaw(char *szFileTitle, int typ)
    unsigned int SaveAsSif(char *path)
    #// unsigned int SaveAsSPC(char * path)
    unsigned int SaveAsTiff(char *path, char *palette, int position, int typ)
    unsigned int SaveAsTiffEx(char *path, char *palette, int position, int typ, int mode)
    unsigned int SaveEEPROMToFile(char *cFileName)
    unsigned int SaveToClipBoard(char *palette)
    unsigned int SelectDevice(int devNum)
    unsigned int SendSoftwareTrigger()
    unsigned int SetAccumulationCycleTime(float time)
    #// unsigned int SetAcqStatusEvent(HANDLE statusEvent)
    unsigned int SetAcquisitionMode(int mode)
    unsigned int SetSensorPortMode(int mode)
    unsigned int SelectSensorPort(int port)
    unsigned int SetAcquisitionType(int typ)
    unsigned int SetADChannel(int channel)
    unsigned int SetAdvancedTriggerModeState(int iState)
    unsigned int SetBackground(int *arr, unsigned int size)
    unsigned int SetBaselineClamp(int state)
    unsigned int SetBaselineOffset(int offset)
    unsigned int SetCameraLinkMode(int mode)
    unsigned int SetCameraStatusEnable(unsigned long Enable)
    unsigned int SetChargeShifting(unsigned int NumberRows, unsigned int NumberRepeats)
    unsigned int SetComplexImage(int numAreas, int *areas)
    unsigned int SetCoolerMode(int mode)
    unsigned int SetCountConvertMode(int Mode)
    unsigned int SetCountConvertWavelength(float wavelength)
    unsigned int SetCropMode(int active, int cropHeight, int reserved)
    unsigned int SetCurrentCamera(int cameraHandle)
    unsigned int SetCustomTrackHBin(int bin)
    unsigned int SetDataType(int typ)
    unsigned int SetDACOutput(int iOption, int iResolution, int iValue)
    unsigned int SetDACOutputScale(int iScale)
    unsigned int SetDDGAddress(unsigned char t0, unsigned char t1, unsigned char t2, unsigned char t3,
                               unsigned char address)
    unsigned int SetDDGExternalOutputEnabled(unsigned int uiIndex, unsigned int uiEnabled)
    unsigned int SetDDGExternalOutputPolarity(unsigned int uiIndex, unsigned int uiPolarity)
    unsigned int SetDDGExternalOutputStepEnabled(unsigned int uiIndex, unsigned int uiEnabled)
    unsigned int SetDDGExternalOutputTime(unsigned int uiIndex, unsigned long uiDelay, unsigned long uiWidth)
    unsigned int SetDDGGain(int gain)
    unsigned int SetDDGGateStep(double step_Renamed)
    unsigned int SetDDGGateTime(unsigned long uiDelay, unsigned long uiWidth)
    unsigned int SetDDGInsertionDelay(int state)
    unsigned int SetDDGIntelligate(int state)
    unsigned int SetDDGIOC(int state)
    unsigned int SetDDGIOCFrequency(double frequency)
    unsigned int SetDDGIOCNumber(unsigned long numberPulses)
    unsigned int SetDDGIOCPeriod(unsigned long period)
    unsigned int SetDDGIOCTrigger(unsigned int trigger)
    unsigned int SetDDGOpticalWidthEnabled(unsigned int uiEnabled)

    #// DDG Lite functions
    #unsigned int SetDDGLiteGlobalControlByte(unsigned char control)
    #unsigned int SetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char control)
    #unsigned int SetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float fDelay)
    #unsigned int SetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float fWidth)
    #unsigned int SetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float fDelay)
    #unsigned int SetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, unsigned int ui32Pulses)

    #unsigned int SetDDGStepCoefficients(unsigned int mode, double p1, double p2)
    #unsigned int SetDDGWidthStepCoefficients(unsigned int mode, double p1, double p2)
    #unsigned int SetDDGStepMode(unsigned int mode)
    #unsigned int SetDDGWidthStepMode(unsigned int mode)
    #unsigned int SetDDGTimes(double t0, double t1, double t2)
    #unsigned int SetDDGTriggerMode(int mode)
    #unsigned int SetDDGVariableGateStep(int mode, double p1, double p2)
    #unsigned int SetDelayGenerator(int board, short address, int typ)
    #unsigned int SetDMAParameters(int MaxImagesPerDMA, float SecondsPerDMA)
    #// unsigned int SetDriverEvent(HANDLE driverEvent)
    unsigned int SetEMAdvanced(int state)
    unsigned int SetEMCCDGain(int gain)
    unsigned int SetEMClockCompensation(int EMClockCompensationFlag)
    unsigned int SetEMGainMode(int mode)
    unsigned int SetExposureTime(float time)
    unsigned int SetExternalTriggerTermination(unsigned int uiTermination)
    unsigned int SetFanMode(int mode)
    unsigned int SetFastExtTrigger(int mode)
    unsigned int SetFastKinetics(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin)
    unsigned int SetFastKineticsEx(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin,
                                   int offset)
    unsigned int SetFastKineticsStorageMode(int mode)
    unsigned int SetFastKineticsTimeScanMode(int rows, int tracks, int mode)
    unsigned int SetFilterMode(int mode)
    unsigned int SetFilterParameters(int width, float sensitivity, int range, float accept, int smooth, int noise)
    unsigned int SetFKVShiftSpeed(int index)
    unsigned int SetFPDP(int state)
    unsigned int SetFrameTransferMode(int mode)
    #// unsigned int SetFrontEndEvent(HANDLE driverEvent)
    unsigned int SetFullImage(int hbin, int vbin)
    unsigned int SetFVBHBin(int bin)
    unsigned int SetGain(int gain)
    unsigned int SetGate(float delay, float width, float stepRenamed)
    unsigned int SetGateMode(int gatemode)
    unsigned int SetHighCapacity(int state)
    unsigned int SetHorizontalSpeed(int index)
    unsigned int SetHSSpeed(int typ, int index)
    unsigned int SetImage(int hbin, int vbin, int hstart, int hend, int vstart, int vend)
    unsigned int SetImageFlip(int iHFlip, int iVFlip)
    unsigned int SetImageRotate(int iRotate)
    unsigned int SetIsolatedCropMode(int active, int cropheight, int cropwidth, int vbin, int hbin)
    unsigned int SetIsolatedCropModeEx(int active, int cropheight, int cropwidth, int vbin, int hbin, int cropleft,
                                       int cropbottom)
    unsigned int SetKineticCycleTime(float time)
    unsigned int SetMCPGain(int gain)
    unsigned int SetMCPGating(int gating)
    unsigned int SetMessageWindow(int wnd)
    unsigned int SetMetaData(int state)
    unsigned int SetMultiTrack(int number, int height, int offset, int *bottom, int *gap)
    unsigned int SetMultiTrackHBin(int bin)
    unsigned int SetMultiTrackHRange(int iStart, int iEnd)
    unsigned int SetMultiTrackScan(int trackHeight, int numberTracks, int iSIHStart, int iSIHEnd, int trackHBinning,
                                   int trackVBinning, int trackGap, int trackOffset, int trackSkip, int numberSubFrames)
    unsigned int SetNextAddress(int *data, int lowAdd, int highAdd, int length, int physical)
    unsigned int SetNextAddress16(int *data, int lowAdd, int highAdd, int length, int physical)
    unsigned int SetNumberAccumulations(int number)
    unsigned int SetNumberKinetics(int number)
    unsigned int SetNumberPrescans(int iNumber)
    unsigned int SetOutputAmplifier(int typ)
    unsigned int SetOverlapMode(int mode)
    unsigned int SetPCIMode(int mode, int value)
    unsigned int SetPhotonCounting(int state)
    unsigned int SetPhotonCountingThreshold(int min, int max)
    #// unsigned int SetPhosphorEvent(HANDLE driverEvent)
    unsigned int SetPhotonCountingDivisions(unsigned int noOfDivisions, int *divisions)
    unsigned int SetPixelMode(int bitdepth, int colormode)
    unsigned int SetPreAmpGain(int index)
    unsigned int SetDualExposureTimes(float expTime1, float expTime2)
    unsigned int SetDualExposureMode(int mode)
    unsigned int SetRandomTracks(int numTracks, int *areas)
    unsigned int SetReadMode(int mode)
    unsigned int SetReadoutRegisterPacking(unsigned int mode)
    unsigned int SetRegisterDump(int mode)
    unsigned int SetRingExposureTimes(int numTimes, float *times)
    #// unsigned int SetSaturationEvent(HANDLE saturationEvent)
    unsigned int SetShutter(int typ, int mode, int closingtime, int openingtime)
    unsigned int SetShutterEx(int typ, int mode, int closingtime, int openingtime, int extmode)
    unsigned int SetShutters(int typ, int mode, int closingtime, int openingtime, int exttype, int extmode, int dummy1,
                             int dummy2)
    unsigned int SetSifComment(char *comment)
    unsigned int SetSingleTrack(int centre, int height)
    unsigned int SetSingleTrackHBin(int bin)
    unsigned int SetSpool(int active, int method, char *path, int framebuffersize)
    unsigned int SetSpoolThreadCount(int count)
    unsigned int SetStorageMode(int mode)
    #// unsigned int SetTECEvent(HANDLE driverEvent)
    unsigned int SetTemperature(int temperature)
    #// unsigned int SetTemperatureEvent(HANDLE temperatureEvent)
    unsigned int SetTriggerMode(int mode)
    unsigned int SetTriggerInvert(int mode)
    unsigned int GetTriggerLevelRange(float *minimum, float *maximum)
    unsigned int SetTriggerLevel(float f_level)
    unsigned int SetIODirection(int index, int iDirection)
    unsigned int SetIOLevel(int index, int iLevel)
    #// unsigned int SetUserEvent(HANDLE userEvent)
    unsigned int SetUSGenomics(int width, int height)
    unsigned int SetVerticalRowBuffer(int rows)
    unsigned int SetVerticalSpeed(int index)
    unsigned int SetVirtualChip(int state)
    unsigned int SetVSAmplitude(int index)
    unsigned int SetVSSpeed(int index)
    unsigned int ShutDown()
    unsigned int StartAcquisition()
    unsigned int UnMapPhysicalAddress()
    unsigned int UpdateDDGTimings()
    unsigned int WaitForAcquisition()
    unsigned int WaitForAcquisitionByHandle(int cameraHandle)
    unsigned int WaitForAcquisitionByHandleTimeOut(long cameraHandle, int iTimeOutMs)
    unsigned int WaitForAcquisitionTimeOut(int iTimeOutMs)
    #unsigned int WhiteBalance(unsigned short * wRed, unsigned short * wGreen, unsigned short * wBlue, float * fRelR, float * fRelB, WhiteBalanceInfo * info)

    #unsigned int OA_Initialize(const char * const pcFilename, unsigned int uiFileNameLen)
    #unsigned int OA_EnableMode(const char * const pcModeName)
    #unsigned int OA_GetModeAcqParams(const char * const pcModeName, char * const pcListOfParams)
    #unsigned int OA_GetUserModeNames(char * pcListOfModes)
    #unsigned int OA_GetPreSetModeNames(char * pcListOfModes)
    #unsigned int OA_GetNumberOfUserModes(unsigned int * const puiNumberOfModes)
    #unsigned int OA_GetNumberOfPreSetModes(unsigned int * const puiNumberOfModes)
    #unsigned int OA_GetNumberOfAcqParams(const char * const pcModeName, unsigned int * const puiNumberOfParams)
    #unsigned int OA_AddMode(char * pcModeName, unsigned int uiModeNameLen, char * pcModeDescription, unsigned int uiModeDescriptionLen)
    #unsigned int OA_WriteToFile(const char * const pcFileName, unsigned int uiFileNameLen)
    #unsigned int OA_DeleteMode(const char * const pcModeName, unsigned int uiModeNameLen)
    #unsigned int OA_SetInt(const char * const pcModeName, const char * pcModeParam, const int iIntValue)
    #unsigned int OA_SetFloat(const char * const pcModeName, const char * pcModeParam, const float fFloatValue)
    #unsigned int OA_SetString(const char * const pcModeName, const char * pcModeParam, char * pcStringValue, const unsigned int uiStringLen)
    #unsigned int OA_GetInt(const char * const pcModeName, const char * const pcModeParam, int * iIntValue)
    #unsigned int OA_GetFloat(const char * const pcModeName, const char * const pcModeParam, float * fFloatValue)
    #unsigned int OA_GetString(const char * const pcModeName, const char * const pcModeParam, char * pcStringValue, const unsigned int uiStringLen)

    #unsigned int Filter_SetMode(unsigned int mode)
    #unsigned int Filter_GetMode(unsigned int * mode)
    #unsigned int Filter_SetThreshold(float threshold)
    #unsigned int Filter_GetThreshold(float * threshold)
    #unsigned int Filter_SetDataAveragingMode(int mode)
    #unsigned int Filter_GetDataAveragingMode(int * mode)
    #unsigned int Filter_SetAveragingFrameCount(int frames)
    #unsigned int Filter_GetAveragingFrameCount(int * frames)
    #unsigned int Filter_SetAveragingFactor(int averagingFactor)
    #unsigned int Filter_GetAveragingFactor(int * averagingFactor)

    #unsigned int PostProcessNoiseFilter(int * pInputImage, int * pOutputImage, int iOutputBufferSize, int iBaseline, int iMode, float fThreshold, int iHeight, int iWidth)
    #unsigned int PostProcessCountConvert(int * pInputImage, int * pOutputImage, int iOutputBufferSize, int iNumImages, int iBaseline, int iMode, int iEmGain, float fQE, float fSensitivity, int iHeight, int iWidth)
    #unsigned int PostProcessPhotonCounting(int * pInputImage, int * pOutputImage, int iOutputBufferSize, int iNumImages, int iNumframes, int iNumberOfThresholds, float * pfThreshold, int iHeight, int iWidth)
    #unsigned int PostProcessDataAveraging(int * pInputImage, int * pOutputImage, int iOutputBufferSize, int iNumImages, int iAveragingFilterMode, int iHeight, int iWidth, int iFrameCount, int iAveragingFactor)
