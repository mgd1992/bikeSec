class ServicePdf < Prawn::Document
  def initialize(user, services)
    super(top_margin: 60, bottom_margin: 50, page_size: 'A4')
    @user = user
    @services = services

    header
    user_info
    move_down 20
    service_table
    footer
  end

  def header
    text "BikeSec - Factura", size: 20, style: :bold, align: :center
    text "Carrer del Poeta Cabanyes, 45, Poble-sec, 08004 Barcelona", size: 8, align: :center, style: :italic
    text "Telefono: 658236333", size: 8, align: :center, style: :italic
    move_down 5
    stroke_horizontal_rule
  end

  def user_info
    move_down 20
    text "Cliente:", size: 14, style: :bold
    text "#{@user.nombre} #{@user.apellido}", size: 12
    text "Email: #{@user.email}", size: 12, style: :italic
    text "Telefono: #{@user.email}", size: 12, style: :italic
    text "Fecha: #{I18n.l(Date.today)}", size: 10, style: :italic
  end

  def service_table
    move_down 20
    table_data = [["Descripción", "Fecha", "Precio"]]
    total = 0

    @services.each do |s|
      total += s.cost
      table_data << [
        s.descripcion,
        s.date.strftime("%d/%m/%Y"),
        "$#{'%.2f' % s.cost}"
      ]
    end

    table_data << [
      { content: "Total", colspan: 2, align: :right }, "$#{'%.2f' % total}"
    ]

    table(table_data, header: true, width: bounds.width) do
      row(0).font_style = :bold
      row(0).background_color = 'cccccc'
      self.row_colors = ['f0f0f0', 'ffffff']
      self.cell_style = { borders: [:bottom], padding: [8, 12, 8, 12] }
      row(-1).font_style = :bold
      row(-1).background_color = 'eeeeee'
    end
  end

  def footer
    bounding_box([bounds.left, 30], width: bounds.width) do
      stroke_horizontal_rule
      move_down 10
      text "- Gracias por confiar en BikeSec -", size: 10, align: :center, style: :italic

    end
  end
end
