Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798523AEF34
	for <sashiko-reviews@lists.linux.dev>; Tue,  6 Oct 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286261; cv=none; b=G1nzAwxAIKswp8cYTeVJ9BCHh//9eGY9fsCTMJh5LYlHCjPca3TOAzgqO1O/MVkQ7WFEhFobFYWuQgnQA8b+WlSmdiFm9AI/l5QjWcUaSJewf7uomxjXGRHepn/FzH7svwgF0i6LTrEdorDaKwMY30/5mxebKsnslj+GwK53Jus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286261; c=relaxed/simple;
	bh=R4Q6Oufor1a5QGPX/ia8OLnOebta9NNQBwUAa7to8wY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zt1ZerNxI++buQpUvUp4M42O1rQUxDNrRC0LY5IWZR28DYnM40GU34GtPwJ3jF7z5scKdfRJahmMXN16pZwJkDsZdymhRsfgcIBCrJDr7lJlmURJn2LbO20hM67vdJ5iHVx20r37G10NZjzim/W34sjml32eOOsuqV//dk1EbuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLFE8bzo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLFE8bzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791286258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3R29e74OCsihxaScB7A5LszBTHN9x/Z//RuBavLbJ3M=;
	b=eLFE8bzoW1uB4tGWVkCxhMgO0KWTzlnbRxk94NAkejnCobAA6NPncZ1GI2WQ7nemZQ2JL2
	ly6sOh6zhP3Md6ORsZLXX+rBzdWbNt4K4QwSiHlAnT1IzVJEawqMScZaEBaaMw4hgrrO2M
	0JYFxegEnISCZ8iiqqHOijKZCsGJkSA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-m1m5E-rSO72kRe6afyK8BQ-1; Tue, 06 Oct 2026 07:30:57 -0400
X-MC-Unique: m1m5E-rSO72kRe6afyK8BQ-1
X-Mimecast-MFC-AGG-ID: m1m5E-rSO72kRe6afyK8BQ_1791286256
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a178ca6072so5300675e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 04:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286256; x=1791891056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R29e74OCsihxaScB7A5LszBTHN9x/Z//RuBavLbJ3M=;
        b=LAgOTgBPSscp00N2LyUHlpJM8xBe4m6JxL/e3e7MomPk3Iyil56WodNHZ16f9O6fNf
         WFoNpD/DUoj358KBjot3Vph5KaITs1xt0cCh7nk03yuhwm6uxxshKuQ3lP0+JvDIACzP
         usDaN1H0kQz0QV+j9ctaecqjmj4h7BXSY5ykIwef7ly+oO3YjqQotU7YWrkDQEWUUhZs
         Itd9dDoP4VJM+6HQQmQSeoPmB1FqjcaBjruVDWIuQN6VXKhjTJ2/yiEs9iMLtr2cvyi/
         TD2iO0yws5OH4JJj6zmI053QNDQ2xNzHIX8znBRfumvRsCd+VOlwjemASm0eHHT3/7nZ
         vKVg==
X-Gm-Message-State: AFuF++k2HoGQd2ZPZdso9t15wwzzo1pgkrOUHkiYdH7eTV8KpkhesdLI
	IW/3AkZwtU4QvU9p4j/u7PX7IFFl9TcDvZF+yMJEn+H8hkmFTLE7XKoQZ/2CQGFlDa6rO035kW6
	qubnb2k22QuhJWgowsCtmohAdxJzXebaUqVRTvpCL5MGCVSdidZiKuLaomAlGnymuIs9eFG8QkX
	fW2c0EDw2T9UWMQ2SciMXwY4dsqT9tp16Op0LakFuULMUvJNhBAw==
X-Gm-Gg: AYBFou3G5zUC65zxHn1MbJF2QAf2kpMgK8nVGNweryscn370Q/I6V5JCc4dbivebqyn
	T7tg1UAHlC7Q4sbEknAD7JG7fta+9C6GkM8znpFNSBif0gyQM9YDzCOiqakdEJmGUrQ3eyF5rpS
	ww83MnGUUtqqfWYonGAcvi/ldS5mr7b1ZyFiMG7xY1ECV+B2UXdY8S276WEa7YCTNOoXl33C+a/
	clNn7x56RBKcwmaxs7uRMphVjSUSmGgQzMGlOJ+SG7j5F/fv+ydwRAXCDO1UcfMcpBuSXDH9k4c
	+yeykf4+l5gc/WRkmuyKAPXQ9E4O5SxOQpF8cHIti/ADudhIRwL+LZTVXkWfGg==
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-4a168105ddfmr171529495e9.31.1791286255755;
        Tue, 06 Oct 2026 04:30:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-4a168105ddfmr171528815e9.31.1791286254840;
        Tue, 06 Oct 2026 04:30:54 -0700 (PDT)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef174bsm257722415e9.2.2026.10.06.04.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:30:54 -0700 (PDT)
Message-ID: <ba8144c2-10f5-4448-80f5-d10d786bd8bb@redhat.com>
Date: Tue, 6 Oct 2026 13:30:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 07/10] ice: take the switch rule AQ error from the
 response descriptor
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org
References: <20261002130752.2597259-1-poros@redhat.com>
 <20261002130752.2597259-8-poros@redhat.com>
 <20261002132739.B6C0F1F000FF@smtp.kernel.org>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261002132739.B6C0F1F000FF@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rc_Y0vn1NF3hdFC_hL3C9Tu8_AeCqYspWfIX7rjfhN0_1791286256
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/26 15:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: conflated -ENOSPC causes silent MAC filter drop on queue full
> --
>
> commit 5b00f3f5a2fd8517b295e1041c4e6854bbdcfd81
> Author: Petr Oros <poros@redhat.com>
>
> ice: take the switch rule AQ error from the response descriptor
>
> This commit modifies how the driver extracts switch rule AQ errors by directly
> reading the return code from the descriptor that ice_aq_send_cmd() copies back,
> rather than from hw->adminq.sq_last_status. This avoids races when other
> commands complete and overwrite the shared last status variable.
>
>> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
>> --- a/drivers/net/ethernet/intel/ice/ice_main.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> [ ... ]
>> @@ -450,7 +448,7 @@ static int ice_vsi_sync_fltr(struct ice_vsi *vsi)
>>   		 * should go into promiscuous mode. There should be some
>>   		 * space reserved for promiscuous filters.
>>   		 */
>> -		if (hw->adminq.sq_last_status == LIBIE_AQ_RC_ENOSPC &&
>> +		if (err == -ENOSPC &&
>>   		    !test_and_set_bit(ICE_FLTR_OVERFLOW_PROMISC,
>>   				      vsi->state)) {
>>   			promisc_forced_on = true;
> [Severity: High]
> Does this change unintentionally catch transient software queue exhaustion
> errors?
>
> If ice_sq_send_cmd() returns a native software -ENOSPC because the control
> send queue is temporarily full (e.g., under heavy administrative queue load),
> this fallback block will now catch it.
>
> Previously, this block was gated behind the hardware-specific
> hw->adminq.sq_last_status == LIBIE_AQ_RC_ENOSPC check. By changing it to
> check err == -ENOSPC, a temporary queue-full condition could be misidentified
> as a permanent hardware MAC filter limit.
>
> This would cause the driver to erroneously set the overflow state bit and
> return success, dropping MAC filters and leaving the hardware permanently out
> of sync with the OS.
The send queue can not be temporarily full. Commands are sent one at a
time under sq_lock and each one waits for its completion, and the queue
is reclaimed from the FW head pointer. It only fills up once the FW has
stopped processing the AQ for 191 commands in a row, and at that point
no filter can be programmed either way.
>
>> diff --git a/drivers/net/ethernet/intel/ice/ice_switch.c b/drivers/net/ethernet/intel/ice/ice_switch.c
>> --- a/drivers/net/ethernet/intel/ice/ice_switch.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_switch.c
> [ ... ]
>> +	if (status) {
>> +		enum libie_aq_err aq_err = le16_to_cpu(desc.retval) & 0xff;
>> +
>> +		if (opc != ice_aqc_opc_add_sw_rules &&
>> +		    aq_err == LIBIE_AQ_RC_ENOENT)
>> +			status = -ENOENT;
>> +		else if (opc == ice_aqc_opc_add_sw_rules &&
>> +			 aq_err == LIBIE_AQ_RC_ENOSPC)
>> +			status = -ENOSPC;
>> +	}
> [Severity: High]
> Will this translation ignore hardware MAC filter exhaustion during rule
> updates?
>
> Because the error translation is strictly gated behind
> opc == ice_aqc_opc_add_sw_rules, if a rule update command (e.g., expanding
> a VSI list) triggers hardware exhaustion, it appears it will return a generic
> -EIO rather than -ENOSPC.
An update modifies an existing rule and the FW does not allocate
anything for it. The VSI list allocation in that path goes through
ice_aq_alloc_free_res(), not through ice_aq_sw_rules(), so the
translation is limited to add on purpose, the same way ca1fdb885e5f
limited ENOENT to the non-add commands.

>
> Additionally, native software -ENOSPC errors returned directly by
> ice_sq_send_cmd() will pass through unchanged, leading to the conflation
> issue mentioned above in ice_vsi_sync_fltr().
  See above, that needs a send queue the FW stopped draining.

