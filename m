Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303930;
	b=nKd+Aid1nY01EAlWx1oVLBQKQZwgG2qqRAhpSqAFVgrsj645qC0NZ+Op8h0JdQVaYyY6
	 JrM4U5tiww580oniav3gHd7tMrIAxMXHeBLpH+IHF8jKDTNQ19nsxVk0CrZcwXo5CclYI
	 kJek4Y40ClAIlPBSHvkY635gMUvOHjNrklo3Z4TtoI0G22cTIo+b4zR+T8AcisdeO/xmA
	 /A+EyycW6CZatYJrET1tvvVKVGYXw6khyjMNs29NdMjgz2Jv/UZXKcNja80IqYkHPVh4G
	 bYAwfrwsOwFic0oGWs+xLj6qfzv2EeiuvOpWt3xAADgR+0fjRd4+ROsOS14wP59uutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303930;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=I0aHNpYYYJjXnks0yXtv3vruSoxZWqR1NIB39pb6v0Q=;
	b=IHZFTiWslJsf16hGXPp05+t8ICy/fhjrW0LSbbzaWXKaQ/v+92dSQKsh0C6aR+yKIQd8
	 r37QTZkMPYv92Mz+szpOZ+t4cVneFyTd6tEMxw215BKPWnG01Gltl2l+1wGmzt26tu5XB
	 TxLWjKfXr5u3ii13VJJ6NpzYxfH/iKJeVoS1aJHC9GvtjpJRyVIf7y2FYmhG+nM3wvX4u
	 /cOP1edBo8kfoiKZ6Rn8DkyyyxlO0Wgpvh9I7W2OdwMwsOl/l9qkBu9tNuNMbsk36Q0ch
	 Cd/YRZr4faYJ+2mPhc3l+gNsaqYM0lCRQiuh1g/7B5T13EScmfXs96+661wP7nStgjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G70RrlbR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F2606B9D7
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 09:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584F2606B9D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G70RrlbR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794303929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0aHNpYYYJjXnks0yXtv3vruSoxZWqR1NIB39pb6v0Q=;
	b=G70RrlbRKA2CrmAUY1woke1HyZZpdVeM4cg0vRIlzyP8LOgPm5FG4yKMLAyErNgyTIoNdc
	UeHhQg3DsFTjLiSTV9mA9dkOEKjO3QYtqPZrX6lgPiWGBEjzlGHmfBhVQoZxFOUc5wOQbA
	JGN/TfrMFNavsetrkel6OUnmqrvOOx0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-M3SqPeGFPAiHztvTxAVf4g-1; Tue,
 10 Nov 2026 04:45:23 -0500
X-MC-Unique: M3SqPeGFPAiHztvTxAVf4g-1
X-Mimecast-MFC-AGG-ID: M3SqPeGFPAiHztvTxAVf4g_1794303922
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A52619560B7;
	Tue, 10 Nov 2026 09:45:22 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B840A1956086;
	Tue, 10 Nov 2026 09:45:21 +0000 (UTC)
Message-ID: <d5acc725-dd95-4e96-89ca-364db2444b61@redhat.com>
Date: Tue, 10 Nov 2026 10:45:20 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/10] ice: dpll: serialize changes of the SyncE
 CGU registers
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-3-ivecera@redhat.com>
 <sashiko-outbox-202874@kernel.org>
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <sashiko-outbox-202874@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: dSXeFKkqgguE5geC2YlREh5d2IpQ2Q5UJkTRXBZy7J8_1794303922
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 13:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ice: ptp: unconditional R10 write and lock scope in
>    ice_ptp_link_change()
> - [Low] ice: dpll: missing Fixes trailer for commit ad1df4f2d591
> --
> 
> commit 6fdc60cccd47bebe7d61ff60807ee77303bf58bd
> Author: Ivan Vecera <ivecera@redhat.com>
> 
>> ice: dpll: serialize changes of the SyncE CGU registers
>>
>> On dual complex E825 only complex 0 has a functional CGU and the second
>> complex reaches it through cgu_peer, so PFs of both complexes share the
>> CGU registers R10 and R11. They read, modify and write them when the
>> state of an RCLK pin changes, and ice_ptp_link_change() rewrites R10 when
>> a link changes, under the pf->dplls.lock of their own PF only.
>>
>> ice_ptp_link_change() does not hold dpll_lock, so it can already overwrite
>> an update of another PF. RCLK callbacks are serialized by dpll_lock, but
>> the DPLL core is going to serialize callbacks per (module, clock_id), and
>> each complex has its own DSN and so its own clock_id. With that change, a
>> test toggling RCLK pins of both complexes lost an update.
>>
>> Add a mutex to struct ice_adapter, which all E825C PFs share, and hold it
>> around these sequences.
>>
>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> 
> [Severity: Low]
> Since this fixes concurrent CGU register updates in E825-C SyncE support,
> should it include:
> 
>    Fixes: ad1df4f2d591 ("ice: dpll: Support E825-C SyncE and dynamic pin discovery")
> 

Yes, the race with ice_ptp_link_change() is there since that commit. The
patch now goes to net with this tag:

https://lore.kernel.org/netdev/20261110094350.184185-1-ivecera@redhat.com/

v2 of this series will drop it.

> [ ... ]
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> index 3df08714510da..4d4b6aaaf30c2 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> @@ -1395,7 +1395,9 @@ void ice_ptp_link_change(struct ice_pf *pf, bool linkup)
>>   				break;
>>   			}
>>   
>> +			mutex_lock(&pf->adapter->cgu_synce_lock);
>>   			err = ice_tspll_cfg_synce_ethdiv_e825c(hw, clk_pin);
>> +			mutex_unlock(&pf->adapter->cgu_synce_lock);
>>   			if (active && err) {
>>   				dev_err_once(ice_pf_to_dev(pf),
>>   					     "Failed to configure SyncE ETH divider for pin %d, err %d\n",
> 
> [Severity: Medium]
> Should cgu_synce_lock also cover ice_tspll_bypass_mux_active_e825c(), and
> should ice_tspll_cfg_synce_ethdiv_e825c() be skipped when active is false?

Yes to both, also there since ad1df4f2d591. Patch 2 of the net posting
skips the outputs the port does not drive and checks the mux under
cgu_synce_lock.

Thanks,
Ivan

