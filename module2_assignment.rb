#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result
  
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.
     def highest_wf_count=(k)
         @highest_wf_count = k
       end
       def highest_wf_count
        @highest_wf_count
       end
      def highest_wf_words=(k)
         @highest_wf_words = k
       end
       def highest_wf_words
        @highest_wf_words
       end
        def line_numbder=(k)
         @line_number = k
       end
       def line_number
        @line_number
       end
       def content=(k)
         @content = k
       end
       def content
        @content
       end
     def  initialize (line, line_nb)
        @content = line
        @line_number = line_nb
        @highest_wf_words = Array.new
        calculate_word_frequency(content)
     end
  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
    def calculate_word_frequency(content)
        freqs = Hash.new(0)
        @highest_wf_count = 0
        content.split(" ").each { |word|  freqs[word.downcase] +=1}  
        @highest_wf_count = freqs.values.max
        freqs.each_key {|key| @highest_wf_words << key if freqs[key] == @highest_wf_count }
    end
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  def analyzers=(k)
         @analyzers = k
       end
       def analyzers
        @analyzers
       end
      def highest_count_across_lines=(k)
         @highest_count_across_lines = k
       end
       def highest_count_across_lines
        @highest_count_across_lines
       end
        def highest_count_words_across_lines=(k)
         @highest_count_words_across_lines = k
       end
       def highest_count_words_across_lines
        @highest_count_words_across_lines
       end


  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file
      def analyze_file()
        @analyzers = Array.new
        
        line_nb = 1
         File.open('test.txt').each do |line|
              curr_line= LineAnalyzer.new(line,line_nb)
              @analyzers << curr_line
              line_nb +=1
          end
      end
  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
   def calculate_line_with_highest_frequency()
       @highest_count_across_lines = 0
       @highest_count_words_across_lines = Array.new
       analyzers.each do |analyzer|
            @highest_count_across_lines = analyzer.highest_wf_count if analyzer.highest_wf_count > @highest_count_across_lines
      end
      analyzers.each do |analyzer|
            @highest_count_words_across_lines.concat(analyzer.highest_wf_words) if analyzer.highest_wf_count == @highest_count_across_lines
      end
    end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
