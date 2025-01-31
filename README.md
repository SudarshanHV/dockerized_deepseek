# Dockerized DeepSeek

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites Setup](#prerequisites-to-run)
3. [How to Run?](#how-to-run)
4. [Pending Improvements](#limitations-and-pending-improvements)
5. [More Info on DeepSeek](#deepseek)

## General Overview
This small scale project is intended to make it easy for complete beginners to run the latest DeepSeek R1 models on their local machines by deploying the container. While my initial idea was to toy around with the open source model, I felt it would be helpful to document and containerize my work so that it can be used for folks who just want to get hands-on with these models and gain insights. By no means is this elegant code, but it is sufficient to get started as we can keep making improvements along the way! Leave a star if you find this useful!

## Prerequisite Setup
You'll need three things installed on your local machine:
1) Docker
2) Git
3) Python/any other tool you'd like to use for the POST requests

## How to Run?

Clone the repo to a desired location, change the directory.
```bash
   git clone https://github.com/SudarshanHV/dockerized_deepseek.git
   cd dockerized-deepseek
```
Run these commands to build a docker image and run the container respectively.

```bash
docker build -t sample_img .
docker run -p 5000:5000 sample_img
```

Enter your prompt in this requestHandler python scrit and run it to request the model. (Basically a POST request using the format mentioned in the script)
```bash
python3 requestHandler.py
```

NOTE: Depending on the hardware you are using, you may need to meddle with the size of the model that you'd need to pull. You can change the model size in the 'entrypoint.sh' script and rebuild the images. Change the below line and replace 7b with 1.5b, 8b, 14b, 32b, 70b or 671b. Start with the lower numbers. Default is 7b.
```bash
ollama pull deepseek-r1:7b
```

## Pending Improvements

This is a list of improvements (not exhaustive) that I'd like to work on if I get some time. Feel free to contribute if you'd like to! Would greatly appreciate it!

1) Definitely need an option to input the model size to the docker command. We dont want to run the 671b model or a 7b model by default.
2) If you are a good observer, you'd have noticed that the container pulls the DeepSeek model every single time. I have attempted, but not yet found an effective way to pull and store the model inside an image. The bottleneck is that docker runs one process at a time, and we need a separate ollama process running to pull that image.
3) Would love to add more customizations to input hardware specs. Currently, I believe it runs on whatever default hardware it finds. It'd be great if we could somehow specify a GPU/CPU to run this.
4) Improve the docker commands and storage part a little bit.
5) A user friendly UI for the prompts.


## More Info on DeepSeek

Adding this section as it's useful to know why this project's being made: to explore the DeepSeek models. In specific, the DeepSeek R1 model is what we are interested in (which itself is built on top of the DeepSeek v3 open source distilled model).

The models themselves can be found here at Ollama: https://ollama.com/library/deepseek-r1

There are 7 checkpoints (1.5b, 7b, 8b, 14b, 32b, 70b, 671b)

The DeepSeek research paper that elaborates further on the techniques used, including distillation and Reinforcement Learning: https://github.com/deepseek-ai/DeepSeek-R1/blob/main/DeepSeek_R1.pdf

The DeepSeek repository: https://github.com/deepseek-ai/DeepSeek-R1

HuggingFace: https://huggingface.co/deepseek-ai/DeepSeek-R1

