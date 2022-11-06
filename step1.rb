b=true

initValue=""
while b
    system "clear"
    print initValue.to_sym
    inp=gets.chomp
    if inp=="-1"
        b=false
    else
        initValue=initValue + inp.chomp
    end
end