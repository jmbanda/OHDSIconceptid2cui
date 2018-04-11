####################################################################
### UMLS CUI to OHDSI concept_id mappings V 1.0                  ###
### By Juan M. Banda (https://github.com/jmbanda                 ###
### Repository: https://github.com/jmbanda/OHDSIconceptid2cui    ###
#### USAGE NOTES ###################################################
## OHDSI vocabulary source tables:                               ###
## Find and REPLACE OHDSIVocab  with your own Database           ###
## UMLS source tables:                                           ###
## Find and REPLACE umls2017ab_AC with you own database          ###
##                                                               ###
## Result: a table called OHDSI_to_CUI in your OHDSI             ###
## vocabulary tables                                             ###
####################################################################

DROP TABLE IF EXISTS OHDSIVocab.OHDSI_to_CUI;
CREATE TABLE OHDSIVocab.OHDSI_to_CUI AS (
SELECT AAA.* FROM (
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='RXNORM' AND B.vocabulary_id='RxNorm'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='CPT' AND B.vocabulary_id='CPT4'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='HCPCS' AND B.vocabulary_id='HCPCS'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='ICD10CM' AND B.vocabulary_id='ICD10CM'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='ICD10PCS' AND B.vocabulary_id='ICD10PCS'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='ICD9CM' AND B.vocabulary_id='ICD9CM'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='MDR' AND B.vocabulary_id='MedDRA'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='HCPCS' AND B.vocabulary_id='HCPCS'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='NDFRT' AND B.vocabulary_id='NDFRT'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='SNOMEDCT_US' AND B.vocabulary_id='SNOMED'
) AA GROUP BY AA.CUI
UNION
SELECT AA.* FROM (
SELECT A.CUI, B.concept_id, B.vocabulary_id FROM umls2017ab_AC.MRCONSO as A LEFT JOIN OHDSIVocab.concept as B ON A.CODE=B.concept_code WHERE A.LAT='ENG' AND A.SAB='LNC' AND B.vocabulary_id='LOINC'
) AA GROUP BY AA.CUI
) as AAA
);
ALTER TABLE OHDSIVocab.OHDSI_to_CUI ADD INDEX CUI (CUI), ADD INDEX concept_id (concept_id), ADD INDEX vocabulary_id (vocabulary_id);