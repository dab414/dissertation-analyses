data set keys:

	- [pracCued.csv, dst.csv, rapidFire.csv, demo.csv]: raw, identity-masked data
	- [**Clean.csv]: data sets where all bad subjects are dropped
	- [dstCleanChoice.csv]: dst data only, aggregated at choice level with only bad subjects dropped (no choice trial trimming; least conservative)
	- [dstCleanChoice1.csv]: dst choice data with < 10 s and +/- 2 SDs on choice RT trial trimming (middle conservative)
	- [dstCleanChoice2.csv]: dst aggregated with rapid fire. subjects dropped from rapid fire analysis (most conservative)