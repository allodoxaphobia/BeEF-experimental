#
#   Copyright 2011 Wade Alcorn wade@bindshell.net
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
class Detect_tor < BeEF::Core::Command
  
  def initialize
    super({
      'Name' => 'Detect Tor',
      'Description' => 'This module will detect if the zombie is currently using TOR (The Onion Router).',
      'Category' => 'Recon',
      'Author' => ['pdp', 'wade', 'bm', 'xntrik'],
      'Data' => [
        {'name'=>'timeout', 'ui_label' =>'Detection timeout','value'=>'10000'}
      ],
      'File' => __FILE__
    })

    set_target({
      'verified_status' =>  VERIFIED_WORKING, 
      'browser_name' =>     ALL
    })
    
    use 'beef.net.local'
    use_template!
  end
  
  def callback
    return if @datastore['result'].nil?
    
    save({'result' => @datastore['result']})
  end
  
end