# putting oh my zsh in the terminal 
# cloning repo into oh my zsh and than putting
from transformers import AutoModelForCausalLM, AutoTokenizer

checkpoint = "Salesforce/codegen-350M-mono"
model = AutoModelForCausalLM.from_pretrained(checkpoint)
tokenizer = AutoTokenizer.from_pretrained(checkpoint)

text = "# list all files from directory"

completion = model.generate(**tokenizer(text, return_tensors="pt"))

print(tokenizer.decode(completion[0]))
#def hello_world():
#    print("Hello World")

#hello_world()


# display all the files in the directory in bash

