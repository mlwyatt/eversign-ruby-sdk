require 'kartograph'
require_relative '../models/document'

module EversignClient
	module Mappings
		class File
			include Kartograph::DSL

			kartograph do
		    mapping EversignClient::Models::File

		    property :name, :file_id, :file_url, :file_base64
		  end
		end

		class Signer
			include Kartograph::DSL

			kartograph do
		    mapping EversignClient::Models::Signer

		    property :id, :name, :email, :order, :pin, :message, :deliver_email
		  end
		end

		class Field
			include Kartograph::DSL

			kartograph do
		    mapping EversignClient::Models::Field

		    property :name, :type, :x, :y, :width, :height, :page, :signer, :identifier, :required, :readonly,
		    					:validation_type, :text_style, :text_font, :text_size, :text_color, :value, :options, :group
		  end
		end

		class Recipient
			include Kartograph::DSL

			kartograph do
		    mapping EversignClient::Models::Recipient

		    property :name, :email
		  end
		end

		class Document
			include Kartograph::DSL

			kartograph do
		    mapping EversignClient::Models::Document

		    property :document_hash, :sandbox, :is_draft, :title, :message, :use_signer_order, :reminders, :require_all_signers,
		    				  :redirect, :redirect_decline, :client, :expires, :embedded_signing_enabled, :fields
		    property :files, plural: true, include: File
		    property :signers, plural: true, include: Signer
		    property :recipients, plural: true, include: Recipient

		  end
		end
	end
end