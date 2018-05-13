load_aapl= load '$input1' using PigStorage(',') as (date:chararray,
open:int,
high:double,
low:double,
close:double,
adj_close:double,
vol:double,
industry:chararray
);

load_goog= load '$input2' using PigStorage(',') as (date:chararray,
open:double,
high:double,
low:double,
close:double,
adj_close:double,
vol:double,
industry:chararray
);

load_sams= load '$input3' using PigStorage(',') as (date:chararray,
open:double,
high:double,
low:double,
close:double,
adj_close:double,
vol:double,
industry:chararray
);

eq_time_interval_aapl= LIMIT load_aapl $lim;
eq_time_interval_goog= LIMIT load_goog $lim;
eq_time_interval_sams= LIMIT load_sams $lim;

group_aapl= group eq_time_interval_aapl all;
group_goog= group eq_time_interval_goog all;
group_sams= group eq_time_interval_sams all;

avg_open_aapl= foreach group_aapl generate AVG(eq_time_interval_aapl.open);
avg_open_goog= foreach group_goog generate AVG(eq_time_interval_goog.open);
avg_open_sams= foreach group_sams generate AVG(eq_time_interval_sams.open);

avg_close_aapl= foreach group_aapl generate AVG(eq_time_interval_aapl.close);
avg_close_goog= foreach group_goog generate AVG(eq_time_interval_goog.close);
avg_close_sams= foreach group_sams generate AVG(eq_time_interval_sams.close);

avg_high_aapl= foreach group_aapl generate AVG(eq_time_interval_aapl.high);
avg_high_goog= foreach group_goog generate AVG(eq_time_interval_goog.high);
avg_high_sams= foreach group_sams generate AVG(eq_time_interval_sams.high);

avg_low_aapl= foreach group_aapl generate AVG(eq_time_interval_aapl.low);
avg_low_goog= foreach group_goog generate AVG(eq_time_interval_goog.low);
avg_low_sams= foreach group_sams generate AVG(eq_time_interval_sams.low);

store avg_open_aapl into 'stocks_avg_open_output1';
store avg_open_goog into 'stocks_avg_open_output2';
store avg_open_sams into 'stocks_avg_open_output3';





