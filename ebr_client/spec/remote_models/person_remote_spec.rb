require 'spec_helper'

require 'drb'

class DRbActiveRecord < DRbObject
  def id
    method_missing(:id)
  end
end

describe Person do
  before do
    @person = Person.create(:first_name => "Joe", :last_name => "Smith")
  end

  before :all do
    @drb_factory = DRbObject.new(nil, 'druby://localhost:9000')
  end

  before do
    remote_person_port = @drb_factory.get_port_for_factory_product(:person)
    @remote_person = DRbActiveRecord.new(nil, "druby://localhost:#{remote_person_port}")
  end

  after(:each) do
#    @drb_factory.truncate_tables
  end

  it 'retrieves a remote person' do
    p = Person.find(@remote_person.id)
    p.first_name.should == @remote_person.first_name
  end

  it 'creates Person with first and last name' do
    @person.should_not be_nil
    @person.first_name.should == 'Joe'
    @person.last_name.should == 'Smith'
  end

  it 'can update first and last name' do
    @person.first_name = 'Peter'
    @person.last_name  = 'Miller'
    @person.save
    @person.reload
    @person.first_name.should == 'Peter'
    @person.last_name.should == 'Miller'
  end

end
