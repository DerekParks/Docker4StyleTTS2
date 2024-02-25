# Dockerfile for StyleTTS2

This dockerfile packages up the [StyleTTS2 notebook](https://github.com/yl4579/StyleTTS2/blob/main/Demo/Inference_LJSpeech.ipynb) into a container thats makes it quick and easy to run [StyleTTS2 inference](https://github.com/NeuralVox/StyleTTS2/tree/main?tab=readme-ov-file#inference) using a pretrained single speaker model.

Per upstream liscense you must notify users that the output is AI generated.

## Building

```
docker build -t stylett2 .
```

## Running

```
mkdir ./output
echo "This is awesome text to speech" | docker run --rm -v ./output:/output -i stylett2
```
will produce a file in the `output` directory called `output.wav`

## Enabling docker GPUs

Follow the [setup instructions from nvidia](https://developer.nvidia.com/blog/gpu-containers-runtime/)

And then add the `--gpus all` argument

```
echo "This is awesome text to speech using a gpu" | docker run --gpus all --rm -v ./output:/output -i stylett2
```

# License

This coontaier uses `phonemizer`, which is GPL licensed. [Check out the original repository for a MIT-licensed version!](https://github.com/yl4579/StyleTTS2)

All of my modifications are reworkings of the orginal MIT Licensed code.