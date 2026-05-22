Received: from mail-m32117.qiye.163.com (mail-m32117.qiye.163.com [220.197.32.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F9221FB6
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417800; cv=none; b=T1XyV5jVrGnLHd2yp80ycngwUfQk4I/ScwSZ8PWzjz+3+1FZHK27xNPhpakomlV+IcBR3POXFfm9jiXYCbZ+eaN0RSfDaSqBTUtn0ww3M1ROJVB5QIewK3Kk3Hvk8hkpSSCTwdJcXQF+2B0QzLhyf+x4vxRt3I1kFF2iVQo0zO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417800; c=relaxed/simple;
	bh=8ZhuWj1aSq3I7cHYWm7u1lPbQrRDI40Ey14IF2Www3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNimHEUftRxdUA7+ptsLbl6wIU0F1hVgj9z0bsBH3yd6uOUgQqmLVrxmp8bn+JkWxW8n/jGWlMwVZPjvAm5KrhU6SWmD4hrGf/Ww+GmwwXesKtBuZhxrVjAECFzQQQzjV2LOfxhCrWr9PaTvfraLt1X68LoWcMdDXE4ETpyJQkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=VxhoZe2C; arc=none smtp.client-ip=220.197.32.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="VxhoZe2C"
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f62c0fdb;
	Fri, 22 May 2026 10:37:53 +0800 (GMT+08:00)
Message-ID: <f689af63-f438-492e-8e80-bea3cdbbc700@rock-chips.com>
Date: Fri, 22 May 2026 10:37:50 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/rockchip: cdn-dp: Add multiple bridges to support
 PHY port selection
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, olteanv@gmail.com,
 Heiko Stuebner <heiko@sntech.de>
References: <20260521032854.103-6-kernel@airkyi.com>
 <20260521062223.913FB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260521062223.913FB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e4d8be1f203abkunm6f37287ad7698
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQx0dQlZDHUhDQhhDHx
	0fTUJWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0tVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=VxhoZe2CRRNAKZw+uIws9B2CvF2ZmiSCNvGG4tqFgS5omibZZNlGWQdunzj8YFq8MjlV8UiA4OQWGM4f3dRzKqSUtBQgKWWjEHeMFN0jW3AnvlBJ4GfBjw8P67WoF4650grp7NfcT6l6W4hZN2ypWGOMAcdZJwq1wIcg6GpAR+E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0eeInbuY3d/9JgEtpw0Rxtt7tF0qmwV2KEd8Yiw46CM=;
	h=date:mime-version:subject:message-id:from;

Oh! Interesting AI. It really did uncover some issues.

On 5/21/2026 2:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [High] Prematurely dropping the reference count of the last bridge in `cdn_bridge_add()` will cause a use-after-free.
> - [High] The `prev_port` pointer is used uninitialized in `cdn_dp_bridge_edid_read()`, leading to a kernel crash.
> - [High] `cdn_dp_connected_port()` ignores connection status for extcon configurations, breaking hotplug detection.
> - [High] Missing bounds check in `cdn_dp_parse_next_bridge_dt()` allows an out-of-bounds write to the `next_bridge_list` array.
> - [High] The `lanes` stack array is read out-of-bounds or uninitialized in `cdn_dp_connected_port()`.
> - [High] DRM bridge references are leaked on error paths during DT parsing and driver binding.
> - [High] If link training fails in `cdn_dp_switch_port()`, it returns an error but leaves the DP controller erroneously marked as active.
> - [High] `cdn_dp_switch_port()` incorrectly aborts hardware switching when the DP controller is active, causing EDID reads from the wrong port.
> - [High] Disabling an inactive bridge erroneously disables the active DP controller for another bridge.
> - [Medium] Overwriting `connector->fwnode` in `cdn_bridge_add()` causes a memory leak.
> - [Medium] Incorrect check for the active port treats valid index 0 as invalid.
> --
> 
> Hi,
> 
> I have reviewed the patch and found some potential issues to share.
> 
> commit 082c705aa7547b521ad9df20ac76e0592b41864f
> Author: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
>     drm/rockchip: cdn-dp: Add multiple bridges to support PHY port selection
> 
> This commit adds support for multiple bridges to the Rockchip cdn-dp driver
> to allow switching between two USB/DP combo PHYs. It changes the driver to
> use the DRM AUX HPD bridge and adds DT parsing logic to register multiple
> bridges.
> 
>> @@ -192,14 +193,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
>>  static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
>>  {
>>  	struct cdn_dp_port *port;
>> -	int i, lanes;
>> +	int i, lanes[MAX_PHY];
>>  
>>  	for (i = 0; i < dp->ports; i++) {
>>  		port = dp->port[i];
>> -		lanes = cdn_dp_get_port_lanes(port);
>> -		if (lanes)
>> +		lanes[i] = cdn_dp_get_port_lanes(port);
>> +		if (!dp->next_bridge_valid)
>>  			return port;
> 
> [Severity: High]
> Does this unconditionally return the first port without checking if it is
> actually connected? If dp->next_bridge_valid is false (which is the case for
> extcon setups), it appears to return port on the first iteration regardless
> of lanes[i], completely breaking hotplug detection.
> 
>>  	}

No.

>> +
>> +	if (dp->next_bridge_valid) {
>> +		/* If more than one port is available, pick the last active port */
>> +		if (dp->active_port > 0 && lanes[dp->active_port])
> 
> [Severity: Medium]
> Since dp->active_port is initialized to -1, valid port indices are 0 and 1.
> Does the check dp->active_port > 0 incorrectly evaluate to false when the
> active port is 0, skipping the active port?
> 

That's right. Will fix in v2.

>> +			return dp->port[dp->active_port];
>> +
>> +		/* If the last active port is not available, pick an available port in order */
>> +		for (i = 0; i < dp->bridge_count; i++) {
>> +			if (lanes[i])
> 
> [Severity: High]
> Can this read uninitialized stack memory? The lanes stack array is populated
> in a loop bounded by dp->ports, but accessed here in a loop bounded by
> dp->bridge_count.
> 
> If dp->bridge_count > dp->ports, this will read uninitialized values.
> Furthermore, since lanes is sized to MAX_PHY, if dp->bridge_count > MAX_PHY,
> it will perform an out-of-bounds stack read.
> 

No.

>> +				return dp->port[i];
>> +		}
>> +	}
>> +
>>  	return NULL;
>>  }
> 
> [ ... ]
> 
>> @@ -254,12 +268,45 @@ static const struct drm_edid *
>>  cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
>>  {
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> -	const struct drm_edid *drm_edid;
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>> +	struct cdn_dp_port *port = dp->port[dp_bridge->id];
>> +	struct cdn_dp_port *prev_port;
>> +	const struct drm_edid *drm_edid = NULL;
>>  	int i, ret;
>>  
>>  	mutex_lock(&dp->lock);
>> +
>> +	/* More than one port is available */
>> +	if (dp->bridge_count > 1 && !port->phy_enabled) {
>> +		for (i = 0; i < dp->bridge_count; i++) {
>> +			/* Another port already enable */
>> +			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
>> +				goto get_cache;
>> +			/* Find already enabled port */
>> +			if (dp->port[i]->phy_enabled)
>> +				prev_port = dp->port[i];
>> +		}
>> +
>> +		/* Switch to current port */
>> +		if (prev_port) {
> 
> [Severity: High]
> Can this lead to a kernel crash by dereferencing an uninitialized pointer?
> The prev_port variable is not initialized. If no ports are currently enabled
> (which is common at boot), the for loop will complete without assigning
> anything to prev_port.
> 
> Then if (prev_port) evaluates garbage memory, and calling cdn_dp_switch_port
> with it will cause a kernel panic.
>

No.

>> +			ret = cdn_dp_switch_port(dp, prev_port, port);
>> +			if (ret)
>> +				goto get_cache;
>> +		}
>> +	}
> 
> [ ... ]
> 
>> @@ -551,6 +599,54 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
>>  	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
>>  }
>>  
>> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
>> +			      struct cdn_dp_port *port)
>> +{
>> +	int ret;
>> +
>> +	if (dp->active)
>> +		return 0;
> 
> [Severity: High]
> Does this incorrectly abort hardware switching? If the DP controller is
> already active but currently on a different port, returning 0 skips the
> actual port switch. The caller cdn_dp_bridge_edid_read() will proceed with
> reading EDID from the wrong (already-active) port and caching it for the
> new port.
>

Actually, this is a redundant check. When dp->active is true, 
this function is never called at all.

>> +
>> +	ret = cdn_dp_disable_phy(dp, prev_port);
>> +	if (ret)
>> +		goto out;
>> +	ret = cdn_dp_enable_phy(dp, port);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = cdn_dp_get_sink_capability(dp);
>> +	if (ret) {
>> +		cdn_dp_disable_phy(dp, port);
>> +		goto out;
>> +	}
>> +
>> +	dp->active = true;
>> +	dp->lanes = port->lanes;
>> +
>> +	if (!cdn_dp_check_link_status(dp)) {
>> +		dev_info(dp->dev, "Connected with sink; re-train link\n");
>> +
>> +		ret = cdn_dp_train_link(dp);
>> +		if (ret) {
>> +			dev_err(dp->dev, "Training link failed: %d\n", ret);
>> +			goto out;
> 
> [Severity: High]
> If link training fails, this jumps to out and returns the error code, but
> leaves dp->active = true. Does this trap the port in a permanently broken,
> untrained state since subsequent calls to cdn_dp_switch_port() will
> immediately return 0?
>

The redundant assignment, as mentioned above, should be removed.

>> +		}
> 
> [ ... ]
> 
>> @@ -639,9 +740,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
>>  static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>>  {
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>  	int ret;
>>  
>>  	mutex_lock(&dp->lock);
>> +	dp_bridge->enabled = false;
>>  
>>  	if (dp->active) {
>>  		ret = cdn_dp_disable(dp);
> 
> [Severity: High]
> Does this accidentally disable the active DP controller when another inactive
> bridge is disabled? If dp->active is true, the entire DP controller is
> disabled, without checking if the bridge being disabled (dp_bridge) is
> actually the one driving the active DP port. This would break an active
> Bridge A if userspace disables an inactive Bridge B.
> 
> [ ... ]
>

No.

>> @@ -967,28 +1085,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
>>  	return NOTIFY_DONE;
>>  }
>>  
>> -static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +static int cdn_bridge_add(struct device *dev,
>> +			  struct drm_bridge *bridge,
>> +			  struct drm_bridge *next_bridge,
>> +			  struct drm_encoder *encoder)
>>  {
>>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>> -	struct drm_encoder *encoder;
>> +	struct drm_device *drm_dev = dp->drm_dev;
>> +	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
> 
> [Severity: High]
> Will this cause a reference count underflow and a use-after-free
> vulnerability? The last_bridge pointer is populated by
> drm_bridge_chain_get_last_bridge(), which returns a raw pointer without
> incrementing the bridge's reference count. When last_bridge goes out of
> scope, the automatic drm_bridge_put() will prematurely decrement the
> refcount.
> 

No.

>>  	struct drm_connector *connector;
>> -	struct cdn_dp_port *port;
>> -	struct drm_device *drm_dev = data;
>> -	int ret, i;
>> -
> 
> [ ... ]
> 
>> +	if (next_bridge) {
>> +		ret = drm_bridge_attach(encoder, next_bridge, bridge,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +		if (ret)
>> +			return ret;
>> +
>> +		last_bridge = drm_bridge_chain_get_last_bridge(bridge->encoder);
>> +	}
>> +
>>  	connector = drm_bridge_connector_init(drm_dev, encoder);
>>  	if (IS_ERR(connector)) {
>>  		ret = PTR_ERR(connector);
>> @@ -1030,8 +1145,99 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>  		return ret;
>>  	}
>>  
>> +	if (last_bridge)
>> +		connector->fwnode = fwnode_handle_get(of_fwnode_handle(last_bridge->of_node));
> 
> [Severity: Medium]
> Is this assignment leaking an fwnode reference? drm_bridge_connector_init()
> automatically sets connector->fwnode using the of_node of the last bridge
> and acquires a reference via fwnode_handle_get(). Overwriting it here without
> dropping the original reference will cause a memory leak.
>

Yes, the old fwnode should be put.

>> +
>>  	drm_connector_attach_encoder(connector, encoder);
>>  
>> +	return 0;
>> +}
>> +
>> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
>> +{
>> +	struct device_node *np = dp->dev->of_node;
>> +	struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
>> +	struct drm_bridge *bridge;
>> +	int count = 0;
>> +	int ret = 0;
>> +	int i;
>> +
>> +	/* If device use extcon, do not use hpd bridge */
>> +	for (i = 0; i < dp->ports; i++) {
>> +		if (dp->port[i]->extcon) {
>> +			dp->bridge_count = 1;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	/* One endpoint may correspond to one next bridge. */
>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>> +		struct device_node *next_bridge_node __free(device_node) =
>> +			of_graph_get_remote_port_parent(dp_ep);
>> +
>> +		bridge = of_drm_find_bridge(next_bridge_node);
>> +		if (!bridge) {
>> +			ret = -EPROBE_DEFER;
>> +			goto out;
> 
> [Severity: High]
> Does this leak the DRM bridge references acquired in earlier loop iterations?
> If of_drm_find_bridge() returns NULL on a subsequent iteration, it jumps to
> out and returns -EPROBE_DEFER without releasing the references previously
> obtained with drm_bridge_get().
>

Yes, it should be put.

>> +		}
>> +
>> +		dp->next_bridge_valid = true;
>> +		dp->next_bridge_list[count] = drm_bridge_get(bridge);
>> +		count++;
> 
> [Severity: High]
> Could this overflow the next_bridge_list array? next_bridge_list is sized to
> MAX_PHY (2). If a device tree specifies more than two endpoints, count will
> exceed the array bounds and corrupt adjacent fields in the cdn_dp_device
> struct.
>

No.

>> +	}
>> +
>> +out:
>> +	dp->bridge_count = count ? count : 1;
>> +	return ret;
>> +}
>> +
>> +static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +{
> 
> [ ... ]
> 
>> +	for (i = 0; i < dp->bridge_count; i++) {
>> +		encoder = &dp->bridge_list[i]->encoder.encoder;
>> +		bridge = &dp->bridge_list[i]->bridge;
>> +		next_bridge = dp->next_bridge_list[i];
>> +		ret = cdn_bridge_add(dev, bridge, next_bridge, encoder);
>> +		if (ret)
>> +			return ret;
> 
> [Severity: High]
> Does this leak the bridge references acquired in cdn_dp_parse_next_bridge_dt
> if cdn_bridge_add() fails? Returning directly without a cleanup path means
> drm_bridge_put() is never called for dp->next_bridge_list.
> 
>> +	}
> 

Yes, it should be put.

-- 
Best, 
Chaoyi
