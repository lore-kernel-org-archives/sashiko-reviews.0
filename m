Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9D4A68A4
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061255; cv=none; b=Jfl5RjmMWcRp4KzMaOAc0fvq1BKsw8mG+mgi7Q70B/lf7OK87hSaUxD4JMviwNHlPeTMh85OEMHIaCNjCZb1KyEjIiEh7z/8cyZ8wIah+lwMHpi0QKM+A5/JWDhgIF6E2USELgVgVjVzAp+k/uHSKF4tLaIqV1kfShM+y2ueBfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061255; c=relaxed/simple;
	bh=HK/VKSZ9I1yE6VDmueS5K2eeeMr+BnuxKv2J2PDLOzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eec5HtGJvDinOPU37dlpiME5MYDsEDL/jggYQnOMlAw4NyGuzNjS+kVpDLrUslc6Gs+DiDGouDtmbQiW9m/cynacezFWm0OmgmttcTy5yJnMuQruNX1aDm6fESmjqsWNkPNqp9tHOiteYTmMmtI7DmwbLVEHDewVs/cHM6YERUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WILv/zek; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WILv/zek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792061253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9hzkWLgr2h8+XXGOMdqXKN0tQBywnbSugVvavE02rY=;
	b=WILv/zekkQEVFOlJ84ozD7ZHyCh+a+vhI5RDdEmTPQO419zpRs9Hr6tmGvt05iG377uZpd
	2ujgVktdj93KRL/8HL260oXj199zEBKLsetTuNwPmN+m8aTG0qJ4xj31B6eo9B1nRW62o1
	VreK3TiXzOLvYroeoxtDYj+gbrcNppI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-q-82cxVRMGS_HDXSeOsYKA-1; Thu, 15 Oct 2026 10:47:32 +0000
X-MC-Unique: q-82cxVRMGS_HDXSeOsYKA-1
X-Mimecast-MFC-AGG-ID: q-82cxVRMGS_HDXSeOsYKA_1792061251
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so28775805e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 03:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061251; x=1792666051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9hzkWLgr2h8+XXGOMdqXKN0tQBywnbSugVvavE02rY=;
        b=SbgadBkU2ScY5frFj2JlOcIoiSMZunmXwi1eLxZXiAbmBCnDxuAnF/jLgabzLfGM7Y
         gmIJcn/ERjxEF+3n4OuHDDHdyGUYcr+7pD8I4SR1e2mooqTJ0h4QS/l0XD6ZANK+ZdgR
         /4b9LkHoMGqVWQMdIWI+32Zgp85jqbFsdKtvUVTIlGeA5d/d18qzeGAj2f5xTvj52cj5
         xx7UAM8S+SoZYkbjasjFAF1qGuKf4uVK9kWlrYXWg5Q5DeM0RvYupprR96FvH4TWCia3
         WdorbRDU12glV53m/Kvh54r4PBA7+LQFbLDV5TdxNsdKEh3/E0W9P4PREOX7PKny4f7P
         yP6g==
X-Forwarded-Encrypted: i=1; AKwUvBxx/Y/Ic8f9Nz4T/t9nCoS8W7yIbkUUoCOFPVGpeNfPPT9kSpudI9mxYR1n7z5/FLaNDIwW63vNXq90hqtU1EE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLB4tr91cKkIl/+YyXxIPRkK3iuQBMqg1gs84jEyu6md+5qQrLv
	xF7pciW2ihJLaj0tuG1eQVcW3spZWvkK4dz5fblCCEhwfYHEVXrdcG+ey28C04/VigEIjNfxmR2
	HFHbayqKx0Kj9VPeEnzH7ncy+PuEaUUHprhcbs0lL6vn75j9W0V/G3P3FoB170wgBJ1w4ow==
X-Gm-Gg: AYBFou3mFAk4I8cXuIJCvEFgp+chwt3fR2QxzuI9mzVLZkijT5C4wFnzSd2vg9TbnB0
	5Gy8M6DsZ6DPjUJh1mBOrlqXHogiRWmbVVyH8AyuVbOSMjdfU3Bf5IeD5v3FXeHSv6qbvdTPKE7
	h4/Ani4wqxD5mxdHGLpd9OiT4tYcfloUzo4xW84FgtM7vpn2V9m5ds7Zb8sRZ5GC6MeYKeKeq8M
	LPx7yv8fwJS3pvZOgLY8598LDz5nGrxCxRitKAObJvYyLLsMskVZo0MnCco4izJbS7E2q0ULuhx
	dkoFD03kserxYeMjOaLMkggxOW1L+4RIhohVH6HehJhDap91Y9uQ9zKzZE2bwYLCFeRhKA17k+l
	he3MzBG45IzXCQDUEzkWuXe4n5GjYG3DfnQtezgT9fpXYor5xXawdLJPD5Cp7m4Tl4S6QmAxrXg
	==
X-Received: by 2002:a05:600c:1e0f:b0:4a1:7b87:8d34 with SMTP id 5b1f17b1804b1-4a18e4b46e1mr384264595e9.21.1792061250946;
        Thu, 15 Oct 2026 03:47:30 -0700 (PDT)
X-Received: by 2002:a05:600c:1e0f:b0:4a1:7b87:8d34 with SMTP id 5b1f17b1804b1-4a18e4b46e1mr384264005e9.21.1792061250509;
        Thu, 15 Oct 2026 03:47:30 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1beb77054sm39793815e9.1.2026.10.15.03.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:47:30 -0700 (PDT)
Message-ID: <852c9fb6-6217-440a-968c-b5ab3e22dbc8@redhat.com>
Date: Thu, 15 Oct 2026 12:47:28 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] calipso: update payload_len when removing the
 CALIPSO option
To: Paul Moore <paul@paul-moore.com>, sashiko-reviews@lists.linux.dev
Cc: linux-security-module@vger.kernel.org,
 Joas Antonio dos Santos <joasantonio108@gmail.com>,
 network dev <netdev@vger.kernel.org>
References: <179147329205.58079.5847298721173675285@gmail.com>
 <sashiko-outbox-165773@kernel.org>
 <CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGO6K6BpRb7iUQB7MgVPI0b1eCknigKbR3ubPHe1qTQ_1792061251
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 16:02, Paul Moore wrote:
> On Fri, Oct 9, 2026 at 11:32 AM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] ipv6: calipso_skbuff_delattr corrupts MAC header on bridged packets
>> --
>>
>> commit 9797bee2d14350b4afedb726df3172b004b7badd
>> Author: Joas Antonio dos Santos <joasantonio108@gmail.com>
>>
>> calipso: update payload_len when removing the CALIPSO option
>>
>> This commit updates calipso_skbuff_delattr() to adjust the IPv6 payload
>> length after removing a CALIPSO option. The patch prevents forwarded packets
>> from being dropped as truncated by subtracting the removed length, while
>> leaving BIG TCP packets unchanged.
>>
>>> diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
>>> index c6a34334e657e..5a42db4f87472 100644
>>> --- a/net/ipv6/calipso.c
>>> +++ b/net/ipv6/calipso.c
>>> @@ -1428,6 +1428,10 @@ static int calipso_skbuff_delattr(struct sk_buff *skb)
>>>                skb_pull(skb, delta);
>>>                memmove((char *)ip6_hdr + delta, ip6_hdr, size);
>>>                skb_reset_network_header(skb);
>>
>> [Severity: High]
>> When a bridged IPv6 packet with a CALIPSO option is forwarded, br_netfilter
>> feeds it to the NF_INET_FORWARD hook where SELinux may call
>> calipso_skbuff_delattr() in net/ipv6/calipso.c. Does shifting the IPv6 header
>> forward by delta bytes here without repositioning the MAC header create a gap
>> that corrupts the MAC header on bridged packets?
> 
> I haven't chased down the bridging code to confirm if the problem
> identified by Sashiko is true, but I do think that in the bridging
> case we don't want to change the label on the packet as we might do in
> the routing case (depending on the runtime config).
> 
> This would need to be tested, but I believe we could simply add a
> nf_bridge_info_exists() check to selinux_ip_forward() prior to calling
> into selinux_netlbl_skbuff_setsid().  We would need to add dummy
> nf_bridge_info_exists() when CONFIG_BRIDGE_NETFILTER=n to
> netfilter_bridge.h but I can't imagine the netdev folks being opposed
> to such a change; I'm sure they will let us know either way.
The above looks like a pre-exiting issue, the patch itself looks
correct, right?

/P

