library verilog;
use verilog.vl_types.all;
entity random_gen is
    generic(
        BITS            : integer := 64
    );
    port(
        clk             : in     vl_logic;
        sample          : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITS : constant is 1;
end random_gen;
