Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827725B099
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961655; cv=none; b=P77bR5u94mi4Lm7rNznbYUHRe10PVArHcg2mGBSmcW9G8Z5nNx/oe7grsUuvbfoaqEeno3B7vTBi2L8aGqsy7A+YpDuNXOD7dgt3Z99OEffSpxDQWmYudWajjV2fhKZTL/n0g85+RCuPM6GXN3sWg0Jur1mkxtxFyiV38GdzE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961655; c=relaxed/simple;
	bh=lYofOrRJCtEReyJfejE0Rov1Uh7hUo2eVXSluoQHin8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQiYB43tFBvzTu9OZDygOK+BvjBNO6pBLUrx0sUfOkmMVvE+4mfAEAsGah6tX1wsXWmyJt5VNpiAQ4ehniNP8Qtyz8ffjacMHUgWe04tdZnLVMiDwnRlmKGAOgItVVWajto3ym8dNlmCSll0JxrhHhnZet8qCJFknP6wnYQxKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=SSgJCf26; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="SSgJCf26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778961641;
 bh=vlHCAIotM5Ww/YlAnImpQ9bOoYRl3nXprmzP151Dkbk=;
 b=SSgJCf26IHWzViC4Mqjp7kaHw4Voe24xcDlLfPNaGVaIEBl9u2cUje+522Bwh/z/5YEubA1YL
 JnUAz9iBXwgWU1KtLT7yzVoRGwxOTKjmXssAyu0oACHwvCGuOv6vLSvcwyTAvgH7NzoKFoTA7cc
 cEsZVwGxYSdQU3EohWtGiPKLnjckM0Y64bJ6CfdBXFOkUR1Djxpf6P+bG/E/sgxC1syQC3re8nJ
 Zj+61N1mmlAm9VRPTrg71OLIvSWD1WJVtt7w95CtJuoNhVAzIraNah/pbaP8wPcDRLnCOdx5tJd
 jnxJdKizPqUciktoKFSpDv6RmAy26FiIZn0mjXvt+VJg==
X-Forward-Email-ID: 6a08cce65c12e46019b2272e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2ff890b4-ee97-467d-ba27-a3471861ef48@kwiboo.se>
Date: Sat, 16 May 2026 22:00:36 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/22] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
References: <20260516183838.2024991-18-jonas@kwiboo.se>
 <20260516195224.9E2CBC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516195224.9E2CBC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/2026 9:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Removing drm_bridge_hpd_notify() violates the DRM bridge API contract and causes hotplug events to be permanently lost during system suspend.
> --
> 
> commit 6b3491e39082015ab62431ea0c93c74c9344b995
> Author: Jonas Karlman <jonas@kwiboo.se>
> 
> drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()
> 
> This commit removes the drm_bridge_hpd_notify() call from the dw_hdmi IRQ
> handler, relying instead only on drm_helper_hpd_irq_event() to avoid sending
> duplicate hotplug uevents to userspace.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index e9c4e24c090ca..6cc7b2a860bd8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3101,10 +3101,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  			status == connector_status_connected ?
>>  			"plugin" : "plugout");
>>  
>> -		if (hdmi->bridge.dev) {
>> +		if (hdmi->bridge.dev)
>>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>> -			drm_bridge_hpd_notify(&hdmi->bridge, status);
>> -		}
>>  	}
> 
> Will removing drm_bridge_hpd_notify() cause hotplug events to be permanently
> lost if they occur during system suspend?

No, drm_mode_config_helper_resume() is called at resume.

> Since the driver advertises DRM_BRIDGE_OP_HPD, does the DRM bridge API
> contract still require it to call drm_bridge_hpd_notify() to properly
> propagate hotplug events to the rest of the bridge chain?

No, hpd_notify() funcs are still called from bridge connector detect().

> Looking at drm_helper_hpd_irq_event(), it aborts early if polling is
> disabled:
> 
> drivers/gpu/drm/drm_probe_helper.c:drm_helper_hpd_irq_event() {
> 	struct drm_connector *connector, *first_changed_connector = NULL;
> 	struct drm_connector_list_iter conn_iter;
> 	int changed = 0;
> 
> 	if (!dev->mode_config.poll_enabled)
> 		return false;
> ...
> }
> 
> During system suspend, drm_kms_helper_poll_disable() sets poll_enabled
> to false. If an HPD interrupt fires while the system is suspended, won't
> drm_helper_hpd_irq_event() silently drop the event without updating the
> connector status or scheduling any deferred work?

No, drm_mode_config_helper_suspend/resume() will call hpd_enable/disable()
to signal when the connector/bridge should start listening for HPD. I.e.
not during suspend.

> Furthermore, when the system resumes, output_poll_execute() explicitly skips
> connectors that use the DRM_CONNECTOR_POLL_HPD flag, and the dw_hdmi resume
> handler does not appear to manually trigger a hotplug event check.
> 
> Could this result in the system being completely unaware of any display
> connections or disconnections that happened while suspended, at least until
> a manual reprobe is forced by userspace?

No, drm_mode_config_helper_resume() is called at resume.

Regards,
Jonas
