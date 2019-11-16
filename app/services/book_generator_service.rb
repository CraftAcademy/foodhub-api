# frozen_string_literal: true

# Usage in console
# load Rails.root.join('app/services/book_generator_service.rb')

module BookGeneratorService
  include Rails.application.routes.url_helpers

  def self.generate_book(recipes)
    template = Rails.public_path.join('fh_cover.jpeg')

    pdf_options = {
      page_size: 'A4', page_layout: :landscape,
      left_margin: 0, right_margin: 0,
      top_margin: 50, bottom_margin: 20, skip_encoding: true
    }

    pdf = Prawn::Document.new(pdf_options)
    pdf.state.store.root.data[:Names] = 'Test'
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
    pdf.canvas do
      pdf.move_down 210
      pdf.font 'Condiment'
      pdf.text 'Social Cooking',
               size: 110, align: :center, color: 'FCFCFC'
      pdf.move_down -35
      pdf.text 'by',
               size: 40, align: :center, color: 'FCFCFC'
      pdf.move_down 60
      pdf.font 'AbrilFatface'
      pdf.text 'FoodHub',
               size: 78, align: :center, color: 'FCFCFC'
      pdf.move_down -20
      pdf.font 'Futura'
      pdf.text 'www.foodhub.recipes',
               size: 22, style: :medium, leading: 10,
               character_spacing: 1, align: :center, color: 'FCFCFC'
    end
    # insert blank page
    pdf.start_new_page left_margin: 150, right_margin: 50
    pdf.canvas do
      pdf.text_box 'Yes, this page is blank',
                   at: pdf.bounds.top_left, width: pdf.bounds.width, height: pdf.bounds.height,
                   valign: :center, align: :center, size: 16
    end

    # Intro page
    pdf.start_new_page left_margin: 150, right_margin: 50
    pdf.move_down (pdf.bounds.height / 2) - 180
    pdf.font 'Futura'
    random_text = 'Lorem <b>ipsum dolor</b> sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    pdf.text 'Food is awesome!',
             size: 28, style: :medium, leading: 20,
             align: :right, color: '383838'
    pdf.text random_text * 3,
             inline_format: true, size: 18, style: :normal,
             leading: 10, character_spacing: 1, final_gap: true, align: :right, color: '383838'
    pdf.text random_text,
             inline_format: true, size: 18, style: :normal,
             leading: 10, character_spacing: 1, align: :right, color: '383838'
    pdf.move_down 5
    pdf.text 'Bon Appétit!',
             size: 18, style: :medium,
             leading: 20, align: :right, color: '383838'

    # Generate recipe pages
    unless recipes.empty?
      recipes.each do |recipe|
        # ingredients + background image
        pdf.start_new_page left_margin: 150, right_margin: 50
        pdf.canvas do
          pdf.image(Rails.env.test? ?
            File.open(recipe.image.blob.service.send(:path_for, recipe.image.key)) :
            open(recipe.image.service_url),
                    width: pdf.bounds.width,
                    height: pdf.bounds.height,
                    at: pdf.bounds.top_left)
        end

        pdf.bounding_box [pdf.bounds.left - 100, pdf.bounds.top], width: 325 do
          pdf.font 'Condiment'
          pdf.text recipe.title, size: 55, align: :left, color: 'FCFCFC'
          pdf.font 'Futura'
            pdf.text 'Every recipe has a history. Here we want to present a little bit of background about this one',
                     size: 18, style: :medium,
                     leading: 10, character_spacing: 0, align: :left, 
                     mode: :fill_stroke, color: 'FCFCFC', stroke_color: '383838'
        end

        pdf.bounding_box [pdf.bounds.right - 350, pdf.bounds.top - 10], width: 350 do
          pdf.indent 20 do
            pdf.font 'Futura'
            pdf.fill_color '383838'
            pdf.move_down 20
            pdf.text "<b>Ingredients</b><br/><br/>#{recipe.ingredients}",
                     inline_format: true, size: 12,
                     style: :normal, leading: 10, character_spacing: 0
            pdf.move_down 20
          end

          pdf.transparent(0.7) do
            pdf.stroke do
              pdf.fill_color 'FCFCFC'
              pdf.fill_rectangle [pdf.bounds.right - 350, pdf.bounds.top], 350, pdf.bounds.height
            end
          end

          pdf.indent 20 do
            pdf.font 'Futura'
            pdf.fill_color '383838'
            pdf.move_up pdf.bounds.height - 20
            pdf.text "<b>Ingredients</b><br/><br/>#{recipe.ingredients}",
                     inline_format: true, size: 12,
                     style: :normal, leading: 10, character_spacing: 0
          end
        end
        add_page_number(pdf, 'light')

        # directions page
        pdf.start_new_page left_margin: 150, right_margin: 50
        pdf.font 'Futura'

        pdf.column_box [pdf.bounds.left, pdf.bounds.top - 50],
                       width: 650, height: pdf.bounds.height - 110,
                       reflow_margins: true, columns: 2, spacer: 40 do
          pdf.image Rails.env.test? ?
          File.open(recipe.image.blob.service.send(:path_for, recipe.image.key)) :
          open(recipe.image.service_url),
                    fit: [pdf.bounds.width_of_column, 200]

          pdf.move_down 20

          pdf.text 'Directions',
                   size: 18, style: :medium,
                   leading: 20, align: :center, color: '383838'

          pdf.text recipe.directions * 4,
                   inline_format: true, size: 12, style: :normal,
                   leading: 5, character_spacing: 0, align: :left, color: '383838'
        end
        add_page_number(pdf, 'dark')
      end
    end

    # generate footer with page number
    # pdf.page_count.times do |i|
    #   pdf.go_to_page(i + 1)
    #   next if pdf.page_number == 1

    #   pdf.bounding_box([pdf.bounds.left - 100, pdf.bounds.bottom + 20], width: pdf.bounds.width + 100) do
    #     pdf.font 'Futura'
    #     color = pdf.page_number.even? ? 'FCFCFC' : '383838'

    #     pdf.text 'www.foodhub.recipes',
    #              size: 10, style: :normal, align: :left,
    #              leading: 20, color: color
    #     pdf.move_up 30

    #     pdf.text "#{pdf.page_number} / #{pdf.page_count}",
    #              size: 10, style: :normal, align: :right,
    #              color: color
    #   end
    # end

    # Back
    pdf.start_new_page left_margin: 0, right_margin: 0
    pdf.canvas do
      pdf.fill_color '202D38'
      pdf.fill_rectangle [pdf.bounds.left, pdf.bounds.top], pdf.bounds.right, pdf.bounds.top
    end
    pdf.move_down (pdf.bounds.height / 2) - 20
    pdf.font 'Futura'
    pdf.text 'Get your own cookbook at',
             size: 22, style: :normal,
             leading: 10, character_spacing: 1, align: :center, color: 'FCFCFC'
    pdf.text 'www.foodhub.recipes',
             size: 22, style: :medium,
             leading: 10, character_spacing: 1, align: :center, color: 'FCFCFC'

    pdf.render_file 'food_hub_template_draft.pdf'
  end

  def self.add_page_number(pdf, mode)
    pdf.bounding_box([pdf.bounds.left - 100, pdf.bounds.bottom + 20], width: pdf.bounds.width + 100) do
      pdf.font 'Futura'
      color = mode == 'light' ? 'FCFCFC' : '383838'

      pdf.text 'www.foodhub.recipes',
               size: 10, style: :normal, align: :left,
               leading: 20, color: color
      pdf.move_up 30

      pdf.text "Page #{pdf.page_number}",
               size: 10, style: :normal, align: :right,
               color: color
    end
    pdf
  end
end
