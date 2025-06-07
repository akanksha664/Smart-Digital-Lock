library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity smart_lock is
    Port (
        clk          : in  STD_LOGIC;
        rst          : in  STD_LOGIC;
        digit_in     : in  STD_LOGIC_VECTOR(3 downto 0);
        enter_pressed: in  STD_LOGIC;
        reset_pressed: in  STD_LOGIC;
        unlock       : out STD_LOGIC;
        alert        : out STD_LOGIC
    );
end smart_lock;

architecture Behavioral of smart_lock is
    type state_type is (IDLE, ENTER, CHECK, UNLOCKED, ALERT);
    signal state : state_type := IDLE;
    signal code : STD_LOGIC_VECTOR(15 downto 0) := "0001001000110100"; -- 1234
    signal entered_code : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal digit_count : integer range 0 to 3 := 0;
    signal wrong_attempts : integer range 0 to 2 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
            entered_code <= (others => '0');
            digit_count <= 0;
            wrong_attempts <= 0;
            unlock <= '0';
            alert <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    unlock <= '0';
                    alert <= '0';
                    if enter_pressed = '1' then
                        entered_code(3 downto 0) <= digit_in;
                        digit_count <= 1;
                        state <= ENTER;
                    end if;
                    
                when ENTER =>
                    if enter_pressed = '1' then
                        entered_code((digit_count*4)+3 downto digit_count*4) <= digit_in;
                        digit_count <= digit_count + 1;
                        if digit_count = 3 then
                            state <= CHECK;
                        end if;
                    end if;
                    
                when CHECK =>
                    if entered_code = code then
                        unlock <= '1';
                        wrong_attempts <= 0;
                        state <= UNLOCKED;
                    else
                        wrong_attempts <= wrong_attempts + 1;
                        if wrong_attempts = 2 then
                            alert <= '1';
                            state <= ALERT;
                        else
                            state <= IDLE;
                        end if;
                    end if;
                    
                when UNLOCKED =>
                    if reset_pressed = '1' then
                        unlock <= '0';
                        state <= IDLE;
                    end if;
                    
                when ALERT =>
                    if reset_pressed = '1' then
                        alert <= '0';
                        wrong_attempts <= 0;
                        state <= IDLE;
                    end if;
                    
                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
