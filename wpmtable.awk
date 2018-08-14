#!/usr/bin/awk -f

BEGIN {
	str_race = "Race";
	str_wpm = "WPM";
	str_accuracy = "Accuracy";
	str_rank = "Rank";
	str_racers = "Racers";
	str_text_id = "Text";
	str_timestamp = "Timestamp";
	str_database = "Database";
	str_tag = "Tag";

	FS = ",";

	printf "%s\n│ %5s │ %12s │ %12s │ %10s │ %19s │ %10s │ %15s │\n%s\n",
	       "┌───────┬──────────────┬──────────────┬────────────┬─────────────────────┬────────────┬─────────────────┐",
	       str_race,
	       str_wpm,
	       str_accuracy,
	       str_text_id,
	       str_timestamp,
	       str_database,
	       str_tag,
	       "├───────┼──────────────┼──────────────┼────────────┼─────────────────────┼────────────┼─────────────────┤";
}

{
	printf "│ %5d │ %12f │ %12f │ %10d │ %19s │ %10s │ %15s │\n",
	       $1, $2, $3, $6, substr($7, 1, 19), $8, $9;
}

END {
	printf "%s\n",
	       "└───────┴──────────────┴──────────────┴────────────┴─────────────────────┴────────────┴─────────────────┘";
}
