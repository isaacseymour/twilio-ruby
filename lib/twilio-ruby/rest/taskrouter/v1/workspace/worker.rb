##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class WorkerList < ListResource
      ##
      # Initialize the WorkerList
      def initialize(version, workspace_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers"
        
        # Components
        @statistics = nil
      end
      
      ##
      # Reads WorkerInstance records from the API as a list.
      def read(activity_name: nil, activity_sid: nil, available: nil, friendly_name: nil, target_workers_expression: nil, task_queue_name: nil, task_queue_sid: nil, limit: nil, page_size: nil)
        @version.read(
            activity_sid: nil,
            available: nil,
            friendly_name: nil,
            target_workers_expression: nil,
            task_queue_name: nil,
            task_queue_sid: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of WorkerInstance records from the API.
      def page(activity_name: nil, activity_sid: nil, available: nil, friendly_name: nil, target_workers_expression: nil, task_queue_name: nil, task_queue_sid: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'ActivityName' => activity_name,
            'ActivitySid' => activity_sid,
            'Available' => available,
            'FriendlyName' => friendly_name,
            'TargetWorkersExpression' => target_workers_expression,
            'TaskQueueName' => task_queue_name,
            'TaskQueueSid' => task_queue_sid,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return WorkerPage.new(
            @version,
            response,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Create a new WorkerInstance
      def create(friendly_name, activity_sid: nil, attributes: nil)
        data = {
            'FriendlyName' => friendly_name,
            'ActivitySid' => activity_sid,
            'Attributes' => attributes,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return WorkerInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Access the statistics
      def statistics
        @statistics ||= WorkersStatisticsList.new(@version, @solution)
      end
      
      ##
      # Constructs a WorkerContext
      def get(sid)
        WorkerContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.WorkerList>'
      end
    end
  
    class WorkerContext < InstanceContext
      def initialize(version, workspace_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
            'sid' => sid,
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:sid]}"
        
        # Dependents
        @statistics = nil
      end
      
      ##
      # Fetch a WorkerInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return WorkerInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the WorkerInstance
      def update(activity_sid: nil, attributes: nil, friendly_name: nil)
        data = {
            'ActivitySid' => activity_sid,
            'Attributes' => attributes,
            'FriendlyName' => friendly_name,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return WorkerInstance(
            self._version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the WorkerInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      def statistics
        unless @statistics
          @statistics = WorkerStatisticsList.new(
              @version,
              workspace_sid: @solution[:workspace_sid],
              worker_sid: @solution[:sid],
          )
        end
        @statistics
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Taskrouter.V1.WorkerContext #{context}>"
      end
    end
  
    class WorkerInstance < InstanceResource
      def initialize(version, payload, workspace_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'activity_name' => payload['activity_name'],
            'activity_sid' => payload['activity_sid'],
            'attributes' => payload['attributes'],
            'available' => payload['available'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_status_changed' => Time.iso8601(payload['date_status_changed']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'friendly_name' => payload['friendly_name'],
            'sid' => payload['sid'],
            'workspace_sid' => payload['workspace_sid'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'workspace_sid' => workspace_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = WorkerContext(
              @version,
              @params['workspace_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def activity_name
        @properties['activity_name']
      end
      
      def activity_sid
        @properties['activity_sid']
      end
      
      def attributes
        @properties['attributes']
      end
      
      def available
        @properties['available']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_status_changed
        @properties['date_status_changed']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def sid
        @properties['sid']
      end
      
      def workspace_sid
        @properties['workspace_sid']
      end
      
      ##
      # Fetch a WorkerInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the WorkerInstance
      def update(activity_sid: nil, attributes: nil, friendly_name: nil)
        @context.update(
            attributes: nil,
            friendly_name: nil,
        )
      end
      
      ##
      # Deletes the WorkerInstance
      def delete
        @context.delete()
      end
      
      def statistics
        @context.statistics
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Taskrouter.V1.WorkerInstance #{context}>"
      end
    end
  end
end