# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module API
    module Rollup
      module Actions
        # Deletes an existing rollup job.
        # This functionality is Experimental and may be changed or removed
        # completely in a future release. Elastic will take a best effort approach
        # to fix any issues, but experimental features are not subject to the
        # support SLA of official GA features.
        #
        # @option arguments [String] :id The ID of the job to delete
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rollup-delete-job.html
        #
        def delete_job(arguments = {})
          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

          headers = arguments.delete(:headers) || {}

          arguments = arguments.clone

          _id = arguments.delete(:id)

          method = Elasticsearch::API::HTTP_DELETE
          path   = "_rollup/job/#{Utils.__listify(_id)}"
          params = {}

          body = nil
          perform_request(method, path, params, body, headers).body
        end
      end
    end
  end
end
