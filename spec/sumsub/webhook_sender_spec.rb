# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Sumsub::WebhookSender do
  describe ".get_payload" do
    let(:params) do
      {
        applicantId: '99112f57c8321e000114e4d6',
        applicantType: 'individual',
        clientId: 'website.com_27055',
        correlationId: 'req-b3a4d8f0-653f-4b7b-ba22-a582bf7fc78b',
        createdAt: '2025-09-29 07:37:56+0000',
        createdAtMs: '2025-09-29 07:37:56.835',
        externalUserId: 'dash-c3210c32-4b8f-4407-8854-861a376565dc',
        inspectionId: '99112f57c8321e000114e4d7',
        levelName: 'basic',
        reviewResult: {
          buttonIds: ['badDocument', 'badDocument_digitalId'],
          rejectLabels: ['DIGITAL_DOCUMENT'],
          reviewAnswer: 'RED',
          reviewRejectType: 'RETRY'
        },
        reviewStatus: 'completed',
        sandboxMode: false,
        type: 'applicantReviewed'
      }
    end

    it "checks the payload properly" do
      expected_payload = "{\n  \"applicantId\" : \"99112f57c8321e000114e4d6\",\n  \"applicantType\" : \"individual\",\n  \"clientId\" : \"website.com_27055\",\n  \"correlationId\" : \"req-b3a4d8f0-653f-4b7b-ba22-a582bf7fc78b\",\n  \"createdAt\" : \"2025-09-29 07:37:56+0000\",\n  \"createdAtMs\" : \"2025-09-29 07:37:56.835\",\n  \"externalUserId\" : \"dash-c3210c32-4b8f-4407-8854-861a376565dc\",\n  \"inspectionId\" : \"99112f57c8321e000114e4d7\",\n  \"levelName\" : \"basic\",\n  \"reviewResult\" : {\n    \"buttonIds\" : [ \"badDocument\",\n      \"badDocument_digitalId\" ],\n    \"rejectLabels\" : [ \"DIGITAL_DOCUMENT\" ],\n    \"reviewAnswer\" : \"RED\",\n    \"reviewRejectType\" : \"RETRY\"\n  },\n  \"reviewStatus\" : \"completed\",\n  \"sandboxMode\" : false,\n  \"type\" : \"applicantReviewed\"\n}"

      payload = described_class.get_payload(params)

      expect(payload).to eq expected_payload
    end
  end
end
