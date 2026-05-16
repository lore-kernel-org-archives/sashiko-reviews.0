Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BDA367F54
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 19:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961367; cv=none; b=rqr6NLByaBEx2qILBiLfqfI5lZGajz1dO4hNVbzHyUyiybUQ1mBW6tb67eC4/GxN/umPf2/oLc3uZorumhRyO/Do2+shJZIG1TXAgVSPV7tnBnh6ydOuG7Q+hzZ9OTy6MLaeghPRNZtlVRPDNSrx+MlnnddBGhCyw6no0xPdxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961367; c=relaxed/simple;
	bh=JfD9Hlu97LqqJV9hlPrlm1V5es7eRWmhU7ujIh/pYg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eay0ixjTCn6gohUFtQFWMV8HBWVHSFQRIeYJ9s49J7H55KyrZpzlDS+E2j+Tpdgmg+kELrIxRhsAkUS8qMMMlcflJuYww+f8nLy/WmoACyxQiwzlE5jaT561LBawcYVlaIC3H8b/hGnv+QF5riCluMkDu7HiKKVuoWgUYAnPFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=m2kPke8l; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="m2kPke8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778961341;
 bh=7KwXbsoQkt5g3Yq+y4zPwYLzcJYd55j756I8OfP4haw=;
 b=m2kPke8l5Eqc/a7eWSK1ADZc/qi+2wGdwDYFdX8BjQPv4K3/T5eoStEqHUOLiZJ7FvkfdKSyy
 Ls0CqMOAW4Ms+ORKvEcKaBSMPjNTrE2ia8DV/Z8XljnehSCmQBMie1/dssyPDLcXmO1IawFqRbq
 kkLaure1cWqFeTohL/JSO9alTVYH1si81QHDvztTaIYvu7MQenhoJ8Npm1E5P/p46LkjkY5zzh/
 CsFfY1w7KsmN2C/D5z5CYD4cnrXVBMVFV70Sz3CADmRPHLrxkQPBJ2C92zaLhkLPmBvEeSsSBF7
 f2zUV3NSXUEu1Jz5OGRnDCnwTbVzGuoRQx/d/JrpuO5w==
X-Forward-Email-ID: 6a08cbb4c8d8ef6421a41898
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <bd537b77-405e-480e-8056-6516505ff4da@kwiboo.se>
Date: Sat, 16 May 2026 21:55:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/22] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
References: <20260516183838.2024991-20-jonas@kwiboo.se>
 <20260516194314.4211FC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516194314.4211FC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/2026 9:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Clearing the W1C HPD interrupt after reading the live status and setting the new polarity creates a race condition that can permanently break hotplug detection.
> --
> 
> commit 40973548d3ce7bfe1722c0d53b828f8ef0ca4d81
> Author: Jonas Karlman <jonas@kwiboo.se>
> 
> drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling
> 
> This commit removes RXSENSE handling to simplify the HPD interrupt
> handling, depending instead on a delayed work to detect connection
> status or EDID changes. It also ensures the initial HPD interrupt
> polarity is based on the current HPD status.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 300dac4a6c358..39e94d22249b2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> 
> [ ... ]
> 
>> @@ -3060,78 +3011,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
>>  
>>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  {
>>  	struct dw_hdmi *hdmi = dev_id;
>> -	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
>> -	enum drm_connector_status status = connector_status_unknown;
>> -
>> -	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>> -	phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
>> -	phy_stat = hdmi_readb(hdmi, HDMI_PHY_STAT0);
>> -
>> -	phy_pol_mask = 0;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD)
>> -		phy_pol_mask |= HDMI_PHY_HPD;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE0)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE0;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE1)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE1;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE2)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE2;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE3)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE3;
>> -
>> -	if (phy_pol_mask)
>> -		hdmi_modb(hdmi, ~phy_int_pol, phy_pol_mask, HDMI_PHY_POL0);
>> +	u8 intr_stat;
>>  
>>  	/*
>> -	 * RX sense tells us whether the TDMS transmitters are detecting
>> -	 * load - in other words, there's something listening on the
>> -	 * other end of the link.  Use this to decide whether we should
>> -	 * power on the phy as HPD may be toggled by the sink to merely
>> -	 * ask the source to re-read the EDID.
>> +	 * Interrupt generation is accomplished in the following way:
>> +	 *   interrupt = (mask == 0) && (polarity == status)
>> +	 * All interrupts are forwarded to the Interrupt Handler sticky bit
>> +	 * register ih_phy_stat0 and muted using the register ih_mute_phy_stat0.
>>  	 */
>> -	if (intr_stat &
>> -	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD)) {
>> -		dw_hdmi_setup_rx_sense(hdmi,
>> -				       phy_stat & HDMI_PHY_HPD,
>> -				       phy_stat & HDMI_PHY_RX_SENSE);
>> -
>> -		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>> -		    (phy_stat & HDMI_PHY_HPD))
>> -			status = connector_status_connected;
>> +	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>> +	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>> +		enum drm_connector_status status;
>>  
>> -		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
>> -			status = connector_status_disconnected;
>> -	}
>> +		/* Set HPD interrupt polarity based on current HPD status. */
>> +		status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
>> +		hdmi_modb(hdmi, status == connector_status_connected ?
>> +			  0 : HDMI_PHY_HPD, HDMI_PHY_HPD, HDMI_PHY_POL0);
>>  
>> -	if (status != connector_status_unknown) {
>>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
>>  			status == connector_status_connected ?
>>  			"plugin" : "plugout");
>> @@ -3141,8 +3043,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  	}
>>  
>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> 
> Can this sequence create a race condition that breaks hotplug detection?
> 
> If the HPD line toggles (for example, due to contact bounce) after
> dw_hdmi_phy_read_hpd() but before this final hdmi_writeb(), the hardware
> could generate a new interrupt and set the sticky bit again.
> 
> Since the final hdmi_writeb() writes the original intr_stat (which has the
> HPD bit set) back to the register, and the register is write-1-to-clear, it
> will clear this newly generated interrupt.

No, the sticky bit is muted, meaning that no interrupt should be generated
until this run has completed, the sticky bit is cleared and then unmuted.

Regards,
Jonas

> This could leave the driver and hardware out of sync, with the hardware
> waiting for a polarity transition that has already occurred, causing all
> future plug/unplug events to be ignored.
> 
> Should the interrupt status be cleared before reading the live state and
> updating the polarity to close this race window?
> 
>> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
>> -		    HDMI_IH_MUTE_PHY_STAT0);
>> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
>>  
>>  	return IRQ_HANDLED;
>>  }
> 

