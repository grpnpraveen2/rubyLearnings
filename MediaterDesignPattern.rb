# dataset reading and storing it as an array
wf=File.open("words.txt",'r')
l=Array.new
for i in wf.readlines
    l.push(i.chomp)
end

# Creating necessary classes 
class List
    attr_accessor :words, :filteredWords
    
    def initialize(words)
        @words = words
        @filteredWords=[]
    end
end

class TextField
    attr_accessor :value

    def initialize
      @value = ""
    end
end

class TextFieldWithObserver < TextField
    attr_reader :observers

    def initialize
        @observers = []
        super
    end

    def value=(value)
        observers.each { |observer| observer.text_field_changed(value) }
    end
end

class ListSearchMediator
    def initialize(text_field, list)
        @text_field = text_field
        @text_field.observers << self
        @list = list
    end

    def text_field_changed(value)
        # p "Value: "+value
       @list.filteredWords =@list.words.inject([]) do |narrowed_list, word|
      
        if word.start_with?(value)
            narrowed_list.push(word)
        end
        narrowed_list
        end
    end
end
# helper method 

def Show(tf,iv,ll)
    tf.value = iv
    f=File.open('test.txt','w+')
    if ll.filteredWords.length == 0
        f.write("No Data Found")
    elsif
    ll.filteredWords.each  { |ele| f.puts(ele)} 
    end
    f.close
end

# instances 
list = List.new(l)  
text_field = TextFieldWithObserver.new 
mediator = ListSearchMediator.new(text_field, list)

# user input 
b=true
initValue=""
#loop
while b
    system "clear"
    print initValue.to_sym
    inp=gets.chomp
    if inp=="-2"
        b=false
        f=File.open('test.txt','w+')
        f.close
    else
        if inp=="-1"
            initValue=initValue[0,initValue.length-1]
        else
            initValue=initValue + inp.chomp
        end
        Show(text_field,initValue,list)
    end
end