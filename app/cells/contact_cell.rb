class ContactCell < Cell::Rails

  def show(args)
    ctq = args[:query_object] || So::ContactTimeQuery.new
    st  = (args[:supervision_time] || Vo::CoscaAdultSupervisionTime)
    @zone = args[:zone]
    @total_zone = ctq.total_time(@zone)
    @unsupervised_contact_time = ctq.unsupervised_contact_time(@zone)
    @st = st.from_minutes(@unsupervised_contact_time)
    render
  end

end
