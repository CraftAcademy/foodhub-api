# frozen_string_literal: true

# Usage in console
# load Rails.root.join('app/services/book_generator_service.rb')


module BookGeneratorService
  def self.generate_book(recipes)
    template = Rails.public_path.join('fh_cover.jpeg')

    pdf_options = {
      page_size: 'A4', page_layout: :landscape,
      left_margin: 0, right_margin: 0,
      top_margin: 0, bottom_margin: 0, skip_encoding: true
    }

    pdf = Prawn::Document.new(pdf_options)
    pdf.canvas do
      pdf.image(template, scale: 0.3, at: pdf.bounds.top_left)
    end

    pdf.font_families.update('Futura' => {
                               bold: Rails.public_path
                               .join('futura_medium.ttf'),
                               medium: Rails.public_path
                               .join('futura_medium.ttf'),
                               normal: Rails.public_path
                               .join('futura_light.ttf')
                             })

    pdf.font_families.update('AbrilFatface' => {
                               normal: Rails.public_path
                               .join('abril_fatface_regular.ttf')
                             })

    pdf.font_families.update('Condiment' => {
                               normal: Rails.public_path
                               .join('condiment_regular.ttf')
                             })

    # Cover
    pdf.move_down 215
    pdf.font 'Condiment'
    pdf.text 'Social Cooking', size: 110, align: :center, color: 'FCFCFC'
    pdf.move_down -25
    pdf.font 'Condiment'
    pdf.text 'by', size: 40, align: :center, color: 'FCFCFC'
    pdf.move_down 35
    pdf.font 'AbrilFatface'
    pdf.text 'FoodHub', size: 78, align: :center, color: 'FCFCFC'
    pdf.move_down -2
    pdf.font 'Futura'
    pdf.text 'www.foodhub.recipes', size: 22, style: :medium, leading: 10, character_spacing: 1, align: :center, color: 'FCFCFC'
    # insert blank page
    pdf.start_new_page left_margin: 150, right_margin: 50
    
    # Intro page
    pdf.start_new_page left_margin: 150, right_margin: 50
    pdf.move_down (pdf.bounds.height / 2) - 180
    pdf.font 'Futura'
    random_text = 'Lorem <b>ipsum dolor</b> sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    pdf.text 'Food is awesome!', size: 28, style: :medium, leading: 20, align: :right, color: '383838'
    pdf.text random_text * 3, inline_format: true, size: 18, style: :normal, leading: 10, character_spacing: 1, final_gap: true, align: :right, color: '383838'
    pdf.text random_text, inline_format: true, size: 18, style: :normal, leading: 10, character_spacing: 1, align: :right, color: '383838'
    pdf.move_down 5
    pdf.text 'Bon Appétit!', size: 18, style: :medium, leading: 20, align: :right, color: '383838'

    # Recipe pages
    #  binding.pry

    recipes.each do |recipe|
      # ingredients + beackground image
      pdf.start_new_page left_margin: 150, right_margin: 70
      pdf.canvas do
        pdf.image(open(recipe.image.service_url), width: pdf.bounds.width, at: pdf.bounds.top_left)
      end
      pdf.move_down 49
      pdf.font 'Condiment'
      pdf.text recipe.title,indent_paragraphs: -100, size: 60, align: :left, color: 'FCFCFC'

      pdf.transparent(0.7) do
        pdf.fill_color 'FCFCFC'
        pdf.fill_rectangle [pdf.bounds.right - 350, pdf.bounds.top - 50], 350, pdf.bounds.height - 100
      end
      pdf.font 'Futura'
      pdf.fill_color '383838'
      pdf.text_box "<b>Ingredients</b><br/><br/>#{recipe.ingredients}", at: [pdf.bounds.right - 330, pdf.bounds.top - 70], inline_format: true, size: 12, style: :normal, leading: 10, character_spacing: 0
      # directions
      pdf.start_new_page left_margin: 150, right_margin: 50
      pdf.move_down (pdf.bounds.height / 2) - 180
      pdf.font 'Futura'
      pdf.text 'Directions', size: 18, style: :medium, leading: 20, align: :right, color: '383838'
      pdf.text recipe.directions, inline_format: true, size: 12, style: :normal, leading: 5, character_spacing: 0, align: :left, color: '383838'
    end

    # generate footer with page number
    pdf.page_count.times do |i|
      next if (i + 1) == 1

      pdf.go_to_page(i + 1)
      pdf.bounding_box([0, pdf.bounds.bottom + 25], width: pdf.bounds.width) do
        pdf.font 'Futura'
        pdf.draw_text 'www.foodhub.recipes', at: [pdf.bounds.left - 100, pdf.bounds.height - 10], size: 10, style: :normal, leading: 20, color: '383838'
        pdf.draw_text "#{i} / #{pdf.page_count - 1}", at: [pdf.bounds.right + 10, pdf.bounds.height - 10], size: 10, style: :normal, leading: 20, color: '383838'
      end
    end

    # Back
    pdf.start_new_page left_margin: 0, right_margin: 0
    pdf.canvas do
      pdf.fill_color '202D38'
      pdf.fill_rectangle [pdf.bounds.left, pdf.bounds.top], pdf.bounds.right, pdf.bounds.top
    end
    pdf.move_down (pdf.bounds.height / 2) - 20
    pdf.font 'Futura'
    pdf.text 'Get your own cookbook at', size: 22, style: :normal, leading: 10, character_spacing: 1, align: :center, color: 'FCFCFC'
    pdf.text 'www.foodhub.recipes', size: 22, style: :medium, leading: 10, character_spacing: 1, align: :center, color: 'FCFCFC'
    pdf.render_file 'food_hub_template_draft.pdf'
  end
end
