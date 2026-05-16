Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF8E2EA749
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960638; cv=none; b=r0Y7KmLOaz9nZJHFZk+3mj9LwaRai/WFSf28g2CKLCGVUY1To0vx6OKkLrodLhFO4fUrhcrgYbUpJ+YhzA7XJ+mxssN/DPDVLZB/RiS4NA2NNzelwrBXIiIhNc+WozrYHmt6VbIBw9sSxD6bB6v+mCiXSMZbqwtrCM0o8LDR7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960638; c=relaxed/simple;
	bh=bYlta0w20xk/enusfdwKFxIvCllKKtiNmuIAyRU2IW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hed8esACog5HH8PJeT+OzUJq/ow31S5bm0/oHQySxpF0sCb0pGuH3eQ4yIvW8TjMZBYbTlBEUu49kCqk8PyP1FrxF3+07q4ay+iWXiGmP4LqRts0r9Km2a3eQsby6ATvL9WW5i/eEXGpGOzxH9pWwqkk4v4H7rxoELWocWZ9qWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Xp3pneCg; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Xp3pneCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778960619;
 bh=qdqxexX5mOstRuzAbF9sWFbFUGmWoYy5Hp06rH3GWRM=;
 b=Xp3pneCgND0iDDekkEXi+CyWIhP5OmpgD6IU1NBw4wWiUpILGfywM68+4eEuX50lxOpLeMOMh
 ndtkGfnx48H3d530NY8NwSDUfxYBzfnPpttZBo8oxY5sjd4c8OnSPBrUWyU+TRXoqW1czr7PIvt
 kwPIf9OwyZeW7yAiW7ungzGA9685Md/w0XUAwY43eZgZ9yeWKbxrMoFmbDiebananQjUg4qwvZn
 S4u+sp/wVQw6QWhNak/BujhaXkItVa14KB7oukGYZ0ZpJH8KNMx6cVZ07Cl1avjvAhKaY6jvy4V
 xmBbkn4epdXTrvXBuYr9whMIUr0nXhvcslwDMz5Ohcrw==
X-Forward-Email-ID: 6a08c8e55c12e46019b2216b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <533dd01f-9516-4267-9376-1e5ba42ba124@kwiboo.se>
Date: Sat, 16 May 2026 21:43:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/22] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260516183838.2024991-14-jonas@kwiboo.se>
 <20260516192001.27E4EC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516192001.27E4EC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/2026 9:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-After-Free and Memory Leak in CEC notifier cleanup due to drmm and manual lifecycle mismatch
> --
> 
> commit eb59f6fe976b03aa5f719b79a28355b27f403bfe
> Author: Jonas Karlman <jonas@kwiboo.se>
> Subject: drm: bridge: dw_hdmi: Use generic CEC notifier helpers
> 
> This commit replaces open-coded CEC notifier handling with generic CEC
> helpers using drmm_connector_hdmi_cec_notifier_register. It also removes
> the manual notifier unregistration from dw_hdmi_connector_destroy.
> 
>> The drmm release action for the generic CEC notifier should run just
>> before dw_hdmi_connector_destroy(), closely matching the lifetime of
>> the replaced CEC notifier and the connector.
> 
> Is this lifecycle assumption accurate for drivers that do not use drmm
> for mode config?

Yes, drm_mode_config_init() was converted to call its drmm_ variant in
v5.8-rc1, with commit c3b790ea07a1 ("drm: Manage drm_mode_config_init
with drmm_"). Effectively meaning that all drm drivers use drmm for mode
config.

>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> [ ... ]
>> @@ -2547,9 +2543,6 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>>  {
>>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>>  
>> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
>> -	hdmi->cec_notifier = NULL;
>> -
>>  	drm_connector_cleanup(connector);
>>  	drm_bridge_put(&hdmi->bridge);
>>  }
> 
> Since drm_connector_cleanup() zeroes the connector memory, and
> drm_bridge_put() can drop the final reference to the bridge (which frees
> the dw_hdmi structure and its embedded connector), could this lead to a
> use-after-free?

It should not, destroy() is the last call made for the connector, and
the drm_bridge_put() is here to ensure that the struct dw_hdmi is still
around when drm_connector_cleanup() is called, to avoid a use-after-free.

> If a user-space application holds an open file descriptor to the DRM device
> during driver unbind, the DRM device remains alive. The deferred drmm
> release action will only execute later when the file descriptor is closed
> and the DRM device's refcount drops to zero.
> 
> When the drmm action eventually runs, it will dereference the freed
> connector pointer.
> 
> Additionally, because drm_connector_cleanup() executes
> memset(connector, 0, sizeof(*connector)), won't connector->cec.data become
> NULL? This would cause the delayed drmm release action to silently skip
> unregistration, leaking the cec_notifier object.

It should not, drmm release actions are called in reverse order, and
drmm_connector_hdmi_cec_notifier_register() is called last, meaning its
release action should be called before drm_mode_config_cleanup() is
called by the the release action for drmm_mode_config_init().

Regards,
Jonas

> [ ... ]
>> @@ -2609,15 +2600,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
> [ ... ]
>> -	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
>> -	if (!notifier)
>> -		return -ENOMEM;
>> -
>> -	hdmi->cec_notifier = notifier;
>> -
>> -	return 0;
>> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
>> +							 hdmi->dev);
>>  }
> 

