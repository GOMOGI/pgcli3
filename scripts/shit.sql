 SELECT component, version, platform, release_date, parent, 'NOT INSTALLED' as status 
   FROM versions 
  WHERE is_current = 1 
    AND release_date > 20181205 
    AND component NOT IN (SELECT component FROM components) 
UNION ALL 
 SELECT component, version, platform, release_date, parent, 'INSTALLED' as status
   FROM versions
  WHERE is_current = 1 
    AND release_date > 20181205 
    AND component IN (SELECT component FROM components) 
ORDER BY 6 DESC, 1, 2;
