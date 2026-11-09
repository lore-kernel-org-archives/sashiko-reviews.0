Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234434;
	b=JJIAvA80QRvUfrcozibodpS5Qu5Pq0HfgyfYt7MVLjC64KJfjI40BHM+P0sMX3Jvoxw3
	 vXGNHuHRq94Fk6LXGeI71KAOhLSkYB662399TvQINSqg7KW6uoTQBOk2FmPY40fBMmNgU
	 Jni0Ciw/Vi47GZMVpKQlNzfNeI6LysDxtIqfqkVRgAhyYp8w5hAZobZlCXifwSVeDeu/k
	 zteTfcPEQTISKjB1UyyeGg1fKkwhvbu7dT0GFQVbT2FAEhVOdAqJt1MDg92e2YMFC/kp0
	 tlmknvEu/2C/jteaWZa83hfoqH8n40boJxheboSVjoi2VnYKSil5jEsIdoz1lKgtTtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234434;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=2a9O4U63fsuMYqHsEdZ9Qq4gLKRczWAJUt2zqX6vIfI=;
	b=apGI0KbBQiq+pVMlDVPaSms1Ka5tICNwiJsA0hdDktb1MYfXWHLAIxqP6urG+zGB7Hll
	 TKAdeB/cpsYS53vFBndyKT5s3kOTvcQKCaqryPv7Kxx3ltTMjNOx+tm0iTvfFaTCUJJTE
	 8VNB7VFrKLCQ5cCmMSfnb0aE+GN7GOdMPRIYGk02r05wmoJtkxPD1zirAOzKnnmOiVy0r
	 jEwovFNm/8c6vPBzRYr0h2ffiwm7nWZ/xeftZBytRkNSfy001mUCcZ5XIcSm09yIXvWMX
	 axd+AMIJ69bE6wPvIHoSDfvIymdVtVYlY49byvjzxLuEYCqwYCrIaYBo/P9SC0/gGjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C5sj+Mtl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC951606A33B
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 14:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC951606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C5sj+Mtl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794234432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2a9O4U63fsuMYqHsEdZ9Qq4gLKRczWAJUt2zqX6vIfI=;
	b=C5sj+MtlACwz9wrLb5t2H0bMgakF0e4H/WBZEpeG/jD6kKFu0rRVss6V6znBNOiYWocrrp
	n4eMhrjCBPM5Rjyghsn5GL3e9/QBF+8n52GEpExNqvNgiswHnLCm3UkZzDLyEvussJnCYR
	xWnH2dhRxvWCOmURJKXitLkkCli45Es=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-aK-KvS8IO9uiaEIZ0pV--g-1; Mon,
 09 Nov 2026 09:27:10 -0500
X-MC-Unique: aK-KvS8IO9uiaEIZ0pV--g-1
X-Mimecast-MFC-AGG-ID: aK-KvS8IO9uiaEIZ0pV--g_1794234430
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0C53195609D;
	Mon,  9 Nov 2026 14:27:09 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C58F26C;
	Mon,  9 Nov 2026 14:27:08 +0000 (UTC)
Message-ID: <48237720-6de1-4927-89ce-6d7dcac99abf@redhat.com>
Date: Mon, 9 Nov 2026 15:27:07 +0100
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
Subject: Re: [PATCH net-next 04/10] dpll: take domain locks around driver
 callbacks
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-5-ivecera@redhat.com>
 <sashiko-outbox-202876@kernel.org>
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <sashiko-outbox-202876@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NF2xwouTRNxXlJ5vippuWGrPVijQ2yvbOycyddpriLs_1794234430
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 13:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] dpll: broken NLM_F_ECHO in dpll_pin_event_send() [1]
> --
> 
> commit 1d6bef1472d6edb1fb63ca2b725c77cbbc70a8da
> Author: Ivan Vecera <ivecera@redhat.com>
> 
> dpll: take domain locks around driver callbacks
> 
> This commit acquires the object's domain lock around driver callbacks in
> netlink requests, dumps, and notifications.
> 
>> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>> index e5380d95f238b..1b4e3a0166a74 100644
>> --- a/drivers/dpll/dpll_netlink.c
>> +++ b/drivers/dpll/dpll_netlink.c
> 
> [ ... ]
> 
>> @@ -941,27 +955,39 @@ dpll_pin_event_send(enum dpll_cmd event, struct dpll_pin *pin)
>>   
>>   int dpll_pin_create_ntf(struct dpll_pin *pin, u64 src_clock_id)
>>   {
>> +	int ret;
>> +
>> +	mutex_lock(&pin->domain->lock);
>>   	dpll_pin_notify(pin, src_clock_id, DPLL_PIN_CREATED);
>> -	return dpll_pin_event_send(DPLL_CMD_PIN_CREATE_NTF, pin);
>> +	ret = dpll_pin_event_send(DPLL_CMD_PIN_CREATE_NTF, pin);
>> +	mutex_unlock(&pin->domain->lock);
>> +
>> +	return ret;
>>   }
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does dpll_pin_event_send()
> break NLM_F_ECHO on pin SET requests [1]?
> 
> drivers/dpll/dpll_netlink.c:dpll_pin_event_send() {
> 	...
> 	hdr = genlmsg_put(msg, 0, 0, &dpll_nl_family, 0, event);
> 	...
> 	genlmsg_end(msg, hdr);
> 	genlmsg_multicast(&dpll_nl_family, msg, 0, 0, GFP_KERNEL);
> 	...
> }
> 
> When a user-space SET request triggers a pin change notification,
> dpll_pin_event_send() is called without the request's genl_info context.
> Passing a portid of 0 to genlmsg_put() and calling genlmsg_multicast()
> instead of genl_notify() drops the originating socket information, so user
> space never receives the requested NLM_F_ECHO notification.
> 
> [1] https://sashiko.dev/#/bug/linux-14884b2c-eeea-47fd-87fe-40bc535d32cc

No. The DPLL family has never supported NLM_F_ECHO, so nothing is
broken here. Echo is an optional per-family feature:
Documentation/userspace-api/netlink/intro.rst says "this feature is not
universally implemented". Most genetlink families (devlink, ethtool,
netdev, nl80211) also send their notifications with genlmsg_multicast()
and no echo. A SET request with NLM_F_ECHO is still ACKed normally.

Adding echo support would be a new feature for net-next, not a fix, and
it is unrelated to this series.

Thanks,
Ivan

