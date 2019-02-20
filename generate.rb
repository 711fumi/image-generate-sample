require 'gdk3'

base_image = ARGV[0]
add_image = ARGV[1]

# FIXME: Gdk::Pixbuf is deprecated. But can't generate by GdkPixbuf::pixbuf. Why?

# pixbuf = GdkPixbuf::Pixbuf.new(file: 'test.png', width: 320, height: 180)
pixbuf = Gdk::Pixbuf.new(file: add_image, width: 320, height: 180)

surface = Cairo::ImageSurface.from_png(base_image)
context = Cairo::Context.new(surface)

context.move_to(100, 100)
context.select_font_face('Noto Sans CJK JP Regular')
context.set_font_size(20)
context.show_text('テキストが入れられる')
context.move_to(100, 160)
context.show_text('画像も入れられる')

context.translate(40, 200)
context.set_source_pixbuf(pixbuf)
context.paint

surface.write_to_png('img/generated.png')

surface.finish
