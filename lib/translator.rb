# require modules here
require "yaml"
require 'pry'

# file=YAML.load_file('./lib/emoticons.yml')
# new_hash={}
# eng=:English
# yap=:Japanese
# file.each do |k,v|
# puts k
#   new_hash[k]={eng=>v[0], yap=>v[1]}
#   v.each do |emo|
#     new_hash[k]={eng=>emo} if new_hash[k]==nil
#     new_hash[k][yap]=[emo] if new_hash[k][yap]==nil
#   end
#   p new_hash
# end

def load_library(file)
  # code goes here
  file=YAML.load_file(file)
  new_hash={}
  eng=:english
  yap=:japanese
  file.each do |k,v|
  # puts k
    new_hash[k]={eng=>v[0], yap=>v[1]}
  end
  new_hash
end

# x= load_library('./lib/emoticons.yml')
# p x["angel"][:english].kind_of?String
def get_english_meaning(file,emotion)
  # code goes here
  answer="Sorry, that emoticon was not found"
  x = load_library(file)
  #puts x
  x.each do|k,v|
    # puts "the answer we want is #{k}"
    #we need to go deeper!
    v.each do|lang,emo|
      # puts "the emo is #{emo}"
      answer=k if emotion==emo
    end
  end
  answer
end
# p get_english_meaning('./lib/emoticons.yml',":O")

def get_japanese_emoticon(file,emotion)
  # code goes here
  answer="Sorry, that emoticon was not found"
  x = load_library(file)
  feeling=""
  flip_switch=100000
  x.each do|k,v|
    # puts "the feeling we want is #{k}"
     #we need to go deeper!
     v.each do|lang,emo|
       if flip_switch==1
         answer=emo
         flip_switch+=1
       elsif emotion==emo
         flip_switch=1
       else
         flip_switch+=1
       end
     end
  end
  answer
end

 p get_japanese_emoticon('./lib/emoticons.yml',":)")
#(＾ｖ＾)
