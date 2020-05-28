module AvaTax
  class Client
    module Reports 


      # Download a report
      #
      # This API downloads the file associated with a report.
      #
      # If the report is not yet complete, you will receive a `ReportNotFinished` error. To check if a report is complete,
      # use the `GetReport` API.
      #
      # Reports are run as asynchronous report tasks on the server. When complete, the report file will be available for download
      # for up to 30 days after completion. To run an asynchronous report, you should follow these steps:
      #
      # * Begin a report by calling the report's Initiate API. There is a separate initiate API call for each report type.
      # * In the result of the Initiate API, you receive back a report's `id` value.
      # * Check the status of a report by calling `GetReport` and passing in the report's `id` value.
      # * When a report's status is `Completed`, call `DownloadReport` to retrieve the file.
      #
      # This API works for all report types.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param id [Integer] The unique ID number of this report
      # @return [Object]
      def download_report(id)        path = "/api/v2/reports/#{id}/attachment"
        get(path)      end

      # Retrieve a single report
      #
      # Retrieve a single report by its unique ID number.
      #
      # Reports are run as asynchronous report tasks on the server. When complete, the report file will be available for download
      # for up to 30 days after completion. To run an asynchronous report, you should follow these steps:
      #
      # * Begin a report by calling the report's Initiate API. There is a separate initiate API call for each report type.
      # * In the result of the Initiate API, you receive back a report's `id` value.
      # * Check the status of a report by calling `GetReport` and passing in the report's `id` value.
      # * When a report's status is `Completed`, call `DownloadReport` to retrieve the file.
      #
      # This API call returns information about any report type.
      # @param id [Integer] The unique ID number of the report to retrieve
      # @return [Object]
      def get_report(id)        path = "/api/v2/reports/#{id}"
        get(path)      end

      # Initiate an ExportDocumentLine report task
      #
      # Begins running an `ExportDocumentLine` report task and returns the identity of the report.
      #
      # Reports are run as asynchronous report tasks on the server. When complete, the report file will be available for download
      # for up to 30 days after completion. To run an asynchronous report, you should follow these steps:
      #
      # * Begin a report by calling the report's Initiate API. There is a separate initiate API call for each report type.
      # * In the result of the Initiate API, you receive back a report's `id` value.
      # * Check the status of a report by calling `GetReport` and passing in the report's `id` value.
      # * When a report's status is `Completed`, call `DownloadReport` to retrieve the file.
      #
      # The `ExportDocumentLine` report produces information about invoice lines recorded within your account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param companyId [Integer] The unique ID number of the company to report on.
      # @param model [Object] Options that may be configured to customize the report.
      # @return [ReportModel[]]
      def initiate_export_document_line_report(companyId, model)        path = "/api/v2/companies/#{companyId}/reports/exportdocumentline/initiate"
        post(path, model)      end

      # List all report tasks for account
      #
      # List all report tasks for your account.
      #
      # Reports are run as asynchronous report tasks on the server. When complete, the report file will be available for download
      # for up to 30 days after completion. To run an asynchronous report, you should follow these steps:
      #
      # * Begin a report by calling the report's Initiate API. There is a separate initiate API call for each report type.
      # * In the result of the Initiate API, you receive back a report's `id` value.
      # * Check the status of a report by calling `GetReport` and passing in the report's `id` value.
      # * When a report's status is `Completed`, call `DownloadReport` to retrieve the file.
      #
      # This API call returns information about all report types across your entire account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param companyId [Integer] The id of the company for which to get reports.
      # @param pageKey [String] Provide a page key to retrieve the next page of results.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @return [FetchResult]
      def list_reports(options={})        path = "/api/v2/reports"
        get(path, options)      end
    end
  end
end