describe 'Eligible::Icd' do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.get' do
    it 'should call Eligible.request with proper url if type present' do
      params[:type] = 'icd10pcs2018'
      allow(Eligible).to receive(:request).with(:get, '/icds/icd10pcs2018', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.list(params, api_key)).to eq 'success'
    end

    it 'should call Eligible.request with proper url if type and search present' do
      params[:search] = '6a751z4'
      params[:type] = 'icd10pcs2018'
      allow(Eligible).to receive(:request).with(:get, '/icds/icd10pcs2018', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.list(params, api_key)).to eq 'success'
    end

    it 'should call Eligible.request with proper url if type, search and internal params present' do
      params[:search] = '6a751z4'
      params[:type] = 'icd10pcs2018'
      params[:internal] = true
      allow(Eligible).to receive(:request).with(:get, '/icds/icd10pcs2018', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.list(params, api_key)).to eq 'success'
    end

    it 'should call Eligible.request with proper url' do
      params[:code] = '6A751Z4'
      params[:type] = 'icd10pcs2018'
      allow(Eligible).to receive(:request).with(:get, '/icds/icd10pcs2018/describe/6A751Z4', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.describe(params, api_key)).to eq 'success'
    end

    it 'should call Eligible.request with proper url' do
      params[:code] = '6A751Z4'
      params[:type] = 'icd10pcs2018'
      allow(Eligible).to receive(:request).with(:get, '/icds/icd10pcs2018/describe/6A751Z4', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.describe(params, api_key)).to eq 'success'
    end

    it 'should call Eligible.request with proper url' do
      params[:code] = '00.01'
      params[:type] = 'icd9pcs'
      allow(Eligible).to receive(:request).with(:get, '/icds/icd9pcs/crosswalk/00.01', api_key, params).and_return([response, api_key])
      expect(Eligible::Icd.crosswalk(params, api_key)).to eq 'success'
    end
  end
end
