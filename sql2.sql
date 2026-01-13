SELECT
    s.school,
    s.county,
    s.district,
    ss.avgscrread,
    ss.avgscrmath,
    ss.avgscrwrite
FROM satscores ss
JOIN schools s
    ON ss.cds = s.cdscode
WHERE ss.numtsttakr > 2;