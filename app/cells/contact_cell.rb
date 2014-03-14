class ContactCell < Cell::Rails

  def show(args)
    ctq = So::ContactTimeQuery.new
    @zone = args[:zone]
    @total_zone = ctq.total_time(@zone)
    @unsupervised_contact_time = ctq.unsupervised_contact_time(@zone)
    @message = args[:supervision_time].from_minutes(@unsupervised_contact_time)
    render
  end

end
