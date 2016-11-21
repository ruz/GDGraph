use GD::Graph::lines;
require 'save.pl';

# Test "x_tick_number => 'auto'" without a numeric range.  This particular case
# used to draw off the right edge of the data area.  -- rgr, 18-May-16.

print STDERR "Processing sample56c (experimental)\n";

my $path = $ENV{GDGRAPH_SAMPLES_PATH} ? $ENV{GDGRAPH_SAMPLES_PATH} : '';
my $data = [ ['0', '2', '4', '6.25', '8', '10', '12', '14'],
	     ['432.318842651988', '446.217819254983', '723.746891012408',
	      '598.379509269257', undef, '265.615817796314',
	      '471.286904550713', '492.229626240883'],
	     ['13485.2274536207', '10957.7888732859', '11508.8740865655',
	      '10904.206172456', undef, '12383.6613029203',
	      '11969.5663825213', '10364.6735122806'],
	     ['96570.0967171216', '87353.7950170576', '96274.433424145',
	      '97911.3638330277', undef, '95467.382370267',
	      '98499.4608101706', '82889.9385557332'],
	     ['110487.643013394', '98757.8017095985', '108507.054401723',
	      '109413.949514753', undef, '108116.659490984',
	      '110940.314097243', '93746.8416942547']
    ];

$my_graph = new GD::Graph::lines();

$my_graph->set( 
	title => 'Non-numerical X axis',
	x_label => 'Time (hours)',
	y_label => 'Mass units',
        skip_undef => 1,

	x_tick_number => 'auto',
	x_ticks     => 1,
	x_tick_length => -4,

	line_width => 2,
	x_label_position => 1/2,
	r_margin => 15,

	transparent => 0,
);

$my_graph->set(legend_placement => 'RC');
$my_graph->set_legend(qw(344.16 702.75 358.18 Sum));
$my_graph->plot($data);
save_chart($my_graph);

1;
