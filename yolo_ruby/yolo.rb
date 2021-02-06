require 'mini_magick'
require 'numo/narray'
require 'onnxruntime'

SFloat = Numo::SFloat

input_path = ARGV[0]

model = OnnxRuntime::Model.new('yolov3.onnx')
labels = File.readlines('coco-labels-2014_2017.txt')

img = MiniMagick::Image.open(input_path)
image_size = [[img.height, img.width]]
img.combine_options do |b|
  b.resize '416x416'
  b.gravity 'center'
  b.background 'transparent'
  b.extent '416x416'
end
img_data = SFloat.cast(img.get_pixels)
img_data /= 255.0
image_data = img_data.transpose(2, 0, 1)
                     .expand_dims(0)
                     .to_a

output = model.predict({input_1: image_data, image_shape: image_size})

boxes, scores, indices = output.values
results = indices.map do |idx|
  { label: labels[idx[1]].chomp,
    score: scores[idx[0]][idx[1]][idx[2]],
    box: boxes[idx[0]][idx[2]] }
end

p results
