#!/usr/bin/awk -f

BEGIN {
	str_race = "Race";
	str_wpm = "WPM";
	str_accuracy = "Acc";
	str_rank = "Rank";
	str_racers = "Racers";
	str_text_id = "Text";
	str_timestamp = "Timestamp";
	str_database = "Database";
	str_tag = "Tag";

	str_avg_total = "Total Average";
	str_avg_tag = "Average by Tag";

	FS = ",";
}

{
	nr++;
	t_nr[$9]++;
	t_wpm[$9] += $2;
	t_acc[$9] += $3;
	wpm += $2;
	acc += $3;
}

END {
	printf "%s:\n%10s: %12f\n%10s: %12f\n\n",
		str_avg_total,
		str_wpm,
		wpm / nr,
		str_accuracy,
		acc / nr;

	printf "%s:\n", str_avg_tag;
	for (i in t_nr) {
		printf "   %s\n%10s: %12f\n%10s: %12f\n\n",
			i,
			str_wpm,
			t_wpm[i] / t_nr[i],
			str_accuracy,
			t_acc[i] / t_nr[i];
	}
}
