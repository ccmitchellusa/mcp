#!/bin/bash

# Login to IBM Cloud
/app/ibmcloud config --check-version=false > /dev/null
/app/ibmcloud login --apikey $IBMCLOUD_API_KEY -r $IBMCLOUD_REGION -g $IBMCLOUD_RESOURCE_GROUP > /dev/null

# Determine transport mode
case "$IBMCLOUD_MCP_TRANSPORT" in
    sse)
        transport_mode="http://0.0.0.0:4141"
        ;;
    *)
        transport_mode="stdio"
        ;;
esac

# Start building arguments
args="--mcp-transport $transport_mode"

# Check if CONFIG_PROFILE is set
if [ -n "$CONFIG_PROFILE" ]; then
    # Look for corresponding config file
    config_file="/app/configs/mcp.${CONFIG_PROFILE}.json"
    
    if [ -f "$config_file" ]; then
        # Extract args from JSON config using jq
        # Get the args array and format it properly
        json_args=$(jq -r '.mcpServers.ibmcloud.args | join(" ")' "$config_file" 2>/dev/null)
        
        if [ -n "$json_args" ]; then
            # Parse the JSON args to extract relevant MCP options
            mcp_tools=""
            
            # Parse through the args
            while read -r arg; do
                case "$arg" in
                    --mcp-tools)
                        read -r tools_value
                        mcp_tools="$tools_value"
                        ;;
                esac
            done < <(echo "$json_args" | tr ' ' '\n')
            
            # Add the extracted options
            [ -n "$mcp_tools" ] && args+=" --mcp-tools $mcp_tools"
        fi
    else
        # Config profile not found, fall back to IBMCLOUD_MCP_TOOLS
        [ -n "$IBMCLOUD_MCP_TOOLS" ] && args+=" --mcp-tools $IBMCLOUD_MCP_TOOLS"
    fi
else
    # No CONFIG_PROFILE, use IBMCLOUD_MCP_TOOLS if set
    [ -n "$IBMCLOUD_MCP_TOOLS" ] && args+=" --mcp-tools $IBMCLOUD_MCP_TOOLS"
fi

/app/ibmcloud $args