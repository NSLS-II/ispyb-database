/* Example call:
select upsert_dc(NULL, 158917, 403, 113, NULL, NULL, NULL, 1, now() - 1, now(), 
		'DataCollection Successful', 0, 1, 90, 0, 3, 1, 1, 1.0, '/tmp', 'prefix', 'cbf', 'BLAHBLAH-1-####.cbf',
		1.0, 1.9, 100.0, 121, 121, 'Karl\'s comments and thoughts', 110, 110, 100, NULL, 
        '/tmp/pic1.png', '/tmp/pic2.png', '/tmp/pic3.png', '/tmp/pic4.png', NULL, 0, 0, 0, 0.0, 1.0,
		100, 100, 100, 50, 50, 20, NULL, NULL,
        10, 10, 1, 1,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

Tested OK
*/

DELIMITER $$
CREATE OR REPLACE DEFINER=`ispyb_root`@`%` FUNCTION `upsert_dc` (
     p_Id int(11) unsigned,
     p_parentId int(11) unsigned,
     p_visitId int(11) unsigned,
     p_sampleId int(11) unsigned, 
     p_detectorid int(11) unsigned, 
     p_positionid int(11) unsigned,
     p_apertureid int(11) unsigned, 
     p_datacollectionNumber int(10) unsigned,
     p_starttime datetime,
     p_endtime datetime,
     p_runStatus varchar(45),  
     p_axisStart float, 
     p_axisEnd float, 
     p_axisRange float, 
     p_overlap float, 
     p_numberOfImages int(10) unsigned, 
     p_startImageNumber int(10) unsigned, 
     p_numberOfPasses int(10) unsigned, 
     p_exposureTime float, 
     p_imageDirectory varchar(255), 
     p_imagePrefix varchar(45), 
     p_imageSuffix varchar(45), 
     p_fileTemplate varchar(255), 
     p_wavelength float, 
     p_resolution float, 
     p_detectorDistance float, 
     p_xbeam float, 
     p_ybeam float,
     p_comments varchar(1024),
     p_slitgapVertical float, 
     p_slitgapHorizontal float, 
     p_transmission float, 
     p_synchrotronMode varchar(20), 
     p_xtalSnapshotFullPath1 varchar(255), 
     p_xtalSnapshotFullPath2 varchar(255), 
     p_xtalSnapshotFullPath3 varchar(255),
     p_xtalSnapshotFullPath4 varchar(255),
     p_rotationAxis enum('Omega','Kappa','Phi'), 
     p_phistart float, 
     p_kappastart float, 
     p_omegastart float, 
     p_resolutionAtCorner float, 
     p_detector2theta float, 
     p_undulatorGap1 float, 
     p_undulatorGap2 float, 
     p_undulatorGap3 float, 
     p_beamSizeAtSampleX float, 
     p_beamSizeAtSampleY float, 
     p_averageTemperature float, 
     p_actualCenteringPosition varchar(255), 
     p_beamShape varchar(45), 
     p_focalSpotSizeAtSampleX float, 
     p_focalSpotSizeAtSampleY float, 
     p_polarisation float, 
     p_flux float, 
-- new params
     p_processedDataFile varchar(255), 
     p_datFullPath varchar(255),
     p_magnification int(11),
     p_totalAbsorbedDose float,
     p_binning tinyint(1), -- 1x or 2x 
     p_particleDiameter float, -- in nm
     p_boxSize_CTF float,
     p_minResolution float, -- in A  
     p_minDefocus float, -- in A
     p_maxDefocus float, -- in A
     p_defocusStepSize float, -- in A
     p_amountAstigmatism float, -- in A
     p_extractSize float, -- in nm
     p_bgRadius float, -- in nm
     p_voltage float,
     p_objAperture float,
     p_c1aperture float,
     p_c2aperture float,
     p_c3aperture float,
     p_c1lens float,
     p_c2lens float,
     p_c3lens float
)
     RETURNS int
     MODIFIES SQL DATA
  BEGIN
    INSERT INTO DataCollection (datacollectionId, datacollectiongroupid, sessionId, blsampleId, detectorid, positionid, apertureid, datacollectionNumber, starttime, endtime, 
        runStatus, axisStart, axisEnd, axisRange, overlap, numberOfImages, startImageNumber, numberOfPasses, exposureTime, imageDirectory, imagePrefix, imageSuffix, fileTemplate, 
        wavelength, resolution, detectorDistance, xbeam, ybeam, comments,slitgapVertical, slitgapHorizontal, transmission, synchrotronMode, 
        xtalSnapshotFullPath1, xtalSnapshotFullPath2, xtalSnapshotFullPath3, xtalSnapshotFullPath4, rotationAxis, phistart, kappastart, omegastart, resolutionAtCorner, detector2theta, 
        undulatorGap1, undulatorGap2, undulatorGap3, beamSizeAtSampleX, beamSizeAtSampleY, averageTemperature, actualCenteringPosition, beamShape, 
        focalSpotSizeAtSampleX, focalSpotSizeAtSampleY, polarisation, flux, 
        processedDataFile, datFullPath, magnification, totalAbsorbedDose, binning, particleDiameter, boxSize_CTF, minResolution, minDefocus, maxDefocus, defocusStepSize, 
        amountAstigmatism, extractSize, bgRadius, voltage, objAperture, c1aperture, c2aperture, c3aperture, c1lens, c2lens, c3lens
    ) 
      VALUES (p_Id, p_parentId, p_visitId, p_sampleId, p_detectorid, p_positionid, p_apertureid, p_datacollectionNumber, p_starttime, p_endtime, 
      p_runStatus, p_axisStart, p_axisEnd, p_axisRange, p_overlap, p_numberOfImages, p_startImageNumber, p_numberOfPasses, p_exposureTime, p_imageDirectory, p_imagePrefix, p_imageSuffix, p_fileTemplate, 
      p_wavelength, p_resolution, p_detectorDistance, p_xbeam, p_ybeam, p_comments, p_slitgapVertical, p_slitgapHorizontal, p_transmission, p_synchrotronMode, 
      p_xtalSnapshotFullPath1, p_xtalSnapshotFullPath2, p_xtalSnapshotFullPath3, p_xtalSnapshotFullPath4, p_rotationAxis, p_phistart, p_kappastart, p_omegastart, p_resolutionAtCorner, p_detector2theta, 
      p_undulatorGap1, p_undulatorGap2, p_undulatorGap3, p_beamSizeAtSampleX, p_beamSizeAtSampleY, p_averageTemperature, p_actualCenteringPosition, p_beamShape, 
      p_focalSpotSizeAtSampleX, p_focalSpotSizeAtSampleY, p_polarisation, p_flux, 
      p_processedDataFile, p_datFullPath, p_magnification, p_totalAbsorbedDose, p_binning, p_particleDiameter, p_boxSize_CTF, p_minResolution, p_minDefocus, p_maxDefocus, p_defocusStepSize, 
      p_amountAstigmatism, p_extractSize, p_bgRadius, p_voltage, p_objAperture, p_c1aperture, p_c2aperture, p_c3aperture, p_c1lens, p_c2lens, p_c3lens
      )
      ON DUPLICATE KEY UPDATE
		datacollectiongroupid = IFNULL(p_parentId, datacollectiongroupid),
        sessionId = IFNULL(p_visitId, sessionId),
        blsampleId = IFNULL(p_sampleId, blsampleId),
        detectorid = IFNULL(p_detectorid, detectorid),
        positionid = IFNULL(p_positionid, positionid),
        apertureid = IFNULL(p_apertureid, apertureid),
        datacollectionNumber = IFNULL(p_datacollectionNumber, datacollectionNumber),
        starttime = IFNULL(p_starttime, starttime),
        endtime = IFNULL(p_endtime, endtime),
        runStatus = IFNULL(p_runStatus, runStatus),
        axisStart = IFNULL(p_axisStart, axisStart),
        axisEnd = IFNULL(p_axisEnd, axisEnd),
        axisRange = IFNULL(p_axisRange, axisRange),
        overlap = IFNULL(p_overlap, overlap),
        numberOfImages = IFNULL(p_numberOfImages, numberOfImages),
        startImageNumber = IFNULL(p_startImageNumber, startImageNumber),
        numberOfPasses = IFNULL(p_numberOfPasses, numberOfPasses),
        exposureTime = IFNULL(p_exposureTime, exposureTime),
        imagedirectory = IFNULL(p_imageDirectory, imagedirectory),
        imageprefix = IFNULL(p_imagePrefix, imageprefix),
        imagesuffix = IFNULL(p_imageSuffix, imagesuffix),
        fileTemplate = IFNULL(p_fileTemplate, fileTemplate),
        wavelength = IFNULL(p_wavelength, wavelength),
        resolution = IFNULL(p_resolution, resolution),
        detectorDistance = IFNULL(p_detectorDistance, detectorDistance),
        xbeam = IFNULL(p_xbeam, xbeam),
        ybeam = IFNULL(p_ybeam, ybeam),
        comments = IFNULL(p_comments, comments),
        slitgapVertical = IFNULL(p_slitgapVertical, slitgapVertical),
        slitgapHorizontal = IFNULL(p_slitgapHorizontal, slitgapHorizontal),
        transmission = IFNULL(p_transmission, transmission),
        synchrotronMode = IFNULL(p_synchrotronMode, synchrotronMode),
        xtalSnapshotFullPath1 = IFNULL(p_xtalSnapshotFullPath1, xtalSnapshotFullPath1),
        xtalSnapshotFullPath2 = IFNULL(p_xtalSnapshotFullPath2, xtalSnapshotFullPath2),
        xtalSnapshotFullPath3 = IFNULL(p_xtalSnapshotFullPath3, xtalSnapshotFullPath3),
        xtalSnapshotFullPath4 = IFNULL(p_xtalSnapshotFullPath4, xtalSnapshotFullPath4),
        rotationAxis = IFNULL(p_rotationAxis, rotationAxis),
        phistart = IFNULL(p_phistart, phistart),
        kappastart = IFNULL(p_kappastart, kappastart),
        omegastart = IFNULL(p_omegastart, omegastart),
        resolutionAtCorner = IFNULL(p_resolutionAtCorner, resolutionAtCorner),
        detector2theta = IFNULL(p_detector2theta, detector2theta),
        undulatorGap1 = IFNULL(p_undulatorGap1, undulatorGap1),
        undulatorGap2 = IFNULL(p_undulatorGap2, undulatorGap2),
        undulatorGap3 = IFNULL(p_undulatorGap3, undulatorGap3),
        beamSizeAtSampleX = IFNULL(p_beamSizeAtSampleX, beamSizeAtSampleX),
        beamSizeAtSampleY = IFNULL(p_beamSizeAtSampleY, beamSizeAtSampleY),
        averageTemperature = IFNULL(p_averageTemperature, averageTemperature),
        actualCenteringPosition = IFNULL(p_actualCenteringPosition, actualCenteringPosition),
        beamShape = IFNULL(p_beamShape, beamShape),
        focalSpotSizeAtSampleX = IFNULL(p_focalSpotSizeAtSampleX, focalSpotSizeAtSampleX),
        focalSpotSizeAtSampleY = IFNULL(p_focalSpotSizeAtSampleY, focalSpotSizeAtSampleY),
        polarisation = IFNULL(p_polarisation, polarisation),
        flux = IFNULL(p_flux, flux),
        processedDataFile = IFNULL(p_processedDataFile, processedDataFile),
        datFullPath = IFNULL(p_datFullPath, datFullPath),
        magnification = IFNULL(p_magnification, magnification),
        totalAbsorbedDose = IFNULL(p_totalAbsorbedDose, totalAbsorbedDose),
        binning = IFNULL(p_binning, binning),
        particleDiameter = IFNULL(p_particleDiameter, particleDiameter),
        boxSize_CTF = IFNULL(p_boxSize_CTF, boxSize_CTF),
        minResolution = IFNULL(p_minResolution, minResolution),
        minDefocus = IFNULL(p_minDefocus, minDefocus),
        maxDefocus = IFNULL(p_maxDefocus, maxDefocus),
        defocusStepSize = IFNULL(p_defocusStepSize, defocusStepSize),
        amountAstigmatism = IFNULL(p_amountAstigmatism, amountAstigmatism),
        extractSize = IFNULL(p_extractSize, extractSize),
        bgRadius = IFNULL(p_bgRadius, bgRadius),
        voltage = IFNULL(p_voltage, voltage),
        objAperture = IFNULL(p_objAperture, objAperture),
        c1aperture = IFNULL(p_c1aperture, c1aperture),
        c2aperture = IFNULL(p_c2aperture, c2aperture),
        c3aperture = IFNULL(p_c3aperture, c3aperture),
        c1lens = IFNULL(p_c1lens, c1lens),
        c2lens = IFNULL(p_c2lens, c2lens),
        c3lens = IFNULL(p_c3lens, c3lens);

	IF p_id IS NULL THEN 
		RETURN LAST_INSERT_ID();
    ELSE 
		RETURN p_id;
    END IF;
  END$$
DELIMITER ;
