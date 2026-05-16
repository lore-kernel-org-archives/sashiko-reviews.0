Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFA30DECC
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958759; cv=none; b=oqZ0180WD7SJsCh/zbQEYKlXPsObsepTNlfOiDYJ8xJTW9ljrNDHrDqQ1UQLtag0RtXGBW8yY3ov8dj8l/ZMO2zvD73WfDaxtEfgIsUy4EnMcqLyE8DGm1VFY4z8OVGDydyMBqmFmUPBR1JWzKJUPTk5i0X3TrB3ZPrlmVXRp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958759; c=relaxed/simple;
	bh=hG0Yhe9R0tYlEtNEFtvbCQm6+gcTS41hol9HDbNl7FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEnXWHY1hjazrdNteOVrKhr7vOdFaebY+ZuKw/wdDcozMqMLgMM004y5Pszi1Y2jL1OVwWz1aMcxaEiPqcZSFuCcMrnjJMYnQ9gb6o0Cet9qj933XWUxaPXWam4sfoMuvMxGYgErsKWMwGI4XURbgu31+L2F+yodg8JyIGA4yW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=E7kOyevS; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="E7kOyevS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778958758;
 bh=YHX7S/DsNwm3hpSpTHdSzp6yqTOTSjeCJp/lmLO+M4A=;
 b=E7kOyevSa/tWAWrFq7EAMWW+BghqoyMU9FR5PNws3O2NZhIJQinDGe2aEdMr8wldWhOCicYJq
 X8aFNKViZasPsw1lF5xivUUNGk1i6BcFCzDChwPPBqiw/JqOQCP0Ni4iyo4qOanaOBqoayYk1Ub
 UiOysQfSpmGaC/OvMylCn/RdM1kMDqPEcMkwiXaTf5IWWw6B0EKuArtIARbk7jLEN32qyDR8XJB
 y6EPz3I7lS/2r5Gs/kC0LFEP5eYrgrhp/GmRe636MQdKBqW1fPOPTsWmQYMryQtCLRhewsTmZgS
 bS+20kP4eJ11Exw9NwyEUxa1G5Hdww07320dMump96qg==
X-Forward-Email-ID: 6a08c19e5c12e46019b1e950
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7122628f-a397-4407-86c7-a3612dc67cb4@kwiboo.se>
Date: Sat, 16 May 2026 21:12:27 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
References: <20260516183838.2024991-10-jonas@kwiboo.se>
 <20260516190705.AEFC3C19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516190705.AEFC3C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/2026 9:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Moving CEC physical address invalidation exclusively to dw_hdmi_connector_detect breaks CEC functionality when dw_hdmi operates purely as a DRM bridge.
> --
> 
> commit 05206110d2cbe02dc5e2cae3b6c3e7d2d8cdbe48
> Author: Jonas Karlman <jonas@kwiboo.se>
> Subject: drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
> 
> This commit delays the CEC physical address invalidation from the IRQ
> handler until the connector detect operation is called.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 5fd26ff8f55b4..aae1b890167b1 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>>  {
>>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>>  					     connector);
>> -	return dw_hdmi_detect(hdmi);
>> +	enum drm_connector_status status;
>> +
>> +	status = dw_hdmi_detect(hdmi);
>> +
>> +	if (status == connector_status_disconnected) {
>> +		mutex_lock(&hdmi->cec_notifier_mutex);
>> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> +		mutex_unlock(&hdmi->cec_notifier_mutex);
>> +	}
>> +
>> +	return status;
>>  }
> 
> Does moving the invalidation exclusively to dw_hdmi_connector_detect break
> CEC functionality when the hardware operates purely as a DRM bridge?

No, hdmi->cec_notifier is going to be NULL when the hardware operates
purely as a DRM bridge, CEC notifier was only created for the dw-hdmi
connector prior to this series.

Regards,
Jonas

> Before this change, cec_notifier_phys_addr_invalidate was called directly
> from the hardware interrupt handler, guaranteeing execution on disconnect
> regardless of how the driver was configured.
> 
> In bridge-only mode, the connector is created externally and
> dw_hdmi_connector_detect is never executed. The DRM core or downstream
> component instead calls dw_hdmi_bridge_detect, which was not updated here
> to include the CEC invalidation logic. The CEC physical address might not
> be invalidated on unplug in bridge mode, which would be a regression.
> 
> I see this is addressed later in the series by commit 795c172faddab (drm:
> bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()), but
> this intermediate patch appears to introduce a functional regression that
> might affect bisection.
> 
> [ ... ]
> 
>> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  				       phy_stat & HDMI_PHY_HPD,
>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>  
>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>> -			mutex_lock(&hdmi->cec_notifier_mutex);
>> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> -			mutex_unlock(&hdmi->cec_notifier_mutex);
>> -		}
>> -
>>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>>  		    (phy_stat & HDMI_PHY_HPD))
>>  			status = connector_status_connected;
> 

