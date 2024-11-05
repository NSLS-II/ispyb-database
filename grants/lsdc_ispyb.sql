-- Create the acquisition application role.
CREATE ROLE IF NOT EXISTS lsdc_ispyb;

-- You must also create a database user and grant this role to them, e.g.
-- CREATE USER gda@'%' IDENTIFIED BY 'the_gda_password';
-- GRANT lsdc_ispyb to gda@'%';
-- SET DEFAULT ROLE lsdc_ispyb FOR gda@'%';

-- Grants for lsdc_ispyb
GRANT SELECT ON `AdminVar` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_test TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_ls_position TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_info TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_on_gonio TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_container_ls_position TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_container_status TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_containers_on_beamline_with_status TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE finish_container TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_container_unqueue TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_ls_queue TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_queue_timestamp TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_queue_most_recent_completed_timestamp TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_container_subsamples TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE insert_container_error TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE clear_container_error TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_session_id TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dc_infos_for_subsample TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_group TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_main TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_dc_experiment TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_dc_machine TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_sample_image_analysis TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_grid_v2 TO 'lsdc_ispyb';


GRANT EXECUTE ON PROCEDURE `update_dc_experiment_v2` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `upsert_dc_main_v2` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `upsert_dc_main_v3` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `retrieve_container_subsamples_v2` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_dc_group TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dc_group_v2 TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_sleeve TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_sleeves TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_sleeve TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_sample TO 'lsdc_ispyb';

GRANT SELECT,INSERT ON ImageQualityIndicators TO 'lsdc_ispyb'; -- Needed for bulk insertion of aggregated IQIs
GRANT SELECT,INSERT,UPDATE ON BLSampleImage TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON BLSampleImageAnalysis TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON BLSampleImage_has_AutoScoreClass TO 'lsdc_ispyb';
GRANT SELECT,INSERT ON PDB TO 'lsdc_ispyb';
GRANT SELECT,INSERT ON Protein_has_PDB TO 'lsdc_ispyb';

GRANT SELECT,INSERT,UPDATE ON AutoProcProgram TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON AutoProcProgramAttachment TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON MXMRRun TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON MXMRRunBlob TO 'lsdc_ispyb';

GRANT SELECT,INSERT,UPDATE ON CryoemInitialModel TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON ParticleClassification TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON ParticleClassificationGroup TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON ParticlePicker TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON ParticleClassification_has_CryoemInitialModel TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON MotionCorrection TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON RelativeIceThickness TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON CTF TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON Movie TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON BFactorFit TO 'lsdc_ispyb';

GRANT SELECT,INSERT,UPDATE ON Tomogram TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON TiltImageAlignment TO 'lsdc_ispyb';

GRANT SELECT,INSERT,UPDATE ON Atlas TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON GridSquare TO 'lsdc_ispyb';
GRANT SELECT,INSERT,UPDATE ON FoilHole TO 'lsdc_ispyb';

GRANT SELECT, INSERT, UPDATE ON ProcessingJob TO 'lsdc_ispyb';
GRANT SELECT, INSERT, UPDATE ON ProcessingJobParameter TO 'lsdc_ispyb';

GRANT SELECT, INSERT, UPDATE ON XrayCentring TO 'lsdc_ispyb';
GRANT SELECT, INSERT, UPDATE ON XrayCentringResult TO 'lsdc_ispyb';

GRANT EXECUTE ON FUNCTION retrieve_visit_id TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `retrieve_dc_main` TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_sample TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_dcgroup TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_image TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_program_run TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_processing TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_integration TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION insert_scaling TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_mrrun TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION upsert_mrrun_blob TO 'lsdc_ispyb';
GRANT EXECUTE ON FUNCTION retrieve_proposal_title TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_dc_group_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dc_group_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_group_v3 TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_current_sessions TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_current_cm_sessions TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_current_sessions_for_person TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_sessions_for_beamline_and_run TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_expired_sessions_for_instrument_and_period TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `retrieve_sessions_for_person_login` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `retrieve_persons_for_proposal` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_most_recent_session TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_containers_submitted_non_ls TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `insert_screening` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE insert_screening_input TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_output` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_output_v2` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_output_lattice` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_strategy` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_strategy_wedge` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_screening_strategy_sub_wedge` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `update_container_assign` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE finish_container_for_id TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `retrieve_reprocessing_by_dc` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `update_reprocessing_status` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `upsert_processing_program` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `upsert_processing_program_attachment` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_processing_program_attachment_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_processing_program_message TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `upsert_processing` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_processing_scaling` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `insert_processing_scaling_v2` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `upsert_processing_integration` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `insert_quality_indicators` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_mrrun TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_mrrun_blob TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_quality_indicators TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_programs_for_job_id TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_program_attachments_for_dc_group_and_program TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_program_attachments_for_program_id TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE `upsert_processing_job` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `upsert_processing_job_parameter` TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE `upsert_processing_job_image_sweep` TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_movie TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_dewar TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_session_for_proposal_code_number TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_robot_action TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_fluo_mapping TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_fluo_mapping_roi TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_xfe_fluo_spectrum TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_energy_scan TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_file_attachment TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dewars_for_proposal_code_number TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_person TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_proposal_has_person TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_session_has_person TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_dc TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_grid_info_for_dcg TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE update_container_unassign_all_for_beamline TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_sample TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dewar_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_session_id_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_proposal_title TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_programs_for_job_id_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_program_attachments_for_program_id_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_program_attachments_for_dc_group_program_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_job_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_job_parameters_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_job_image_sweeps_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_processing_job_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_grid_info_for_dcg_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_grid_info_for_dc TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_grid_info_for_dc_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dewars_for_proposal_code_number_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dc_main_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_dc TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_samples_not_loaded_for_container_reg_barcode TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_dcg_grid TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_dc_grid TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_motion_correction TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE retrieve_persons_for_session TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_proposal TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_dc_append_comments TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE update_dc_position TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_ctf TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE upsert_sample_image_auto_score TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE retrieve_container_for_sample_id TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE insert_phasing_analysis_results TO 'lsdc_ispyb';

GRANT EXECUTE ON PROCEDURE insert_cryoem_initial_model TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_particle_classification TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_particle_classification_v2 TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_particle_classification_group TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_particle_picker TO 'lsdc_ispyb';
GRANT EXECUTE ON PROCEDURE upsert_particle_picker_v2 TO 'lsdc_ispyb';
