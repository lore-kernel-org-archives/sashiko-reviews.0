Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD142D76A
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007716; cv=none; b=UBaZa7HVlxfz5/YvKEzYBhozVaista165W5ExsiF6kC8XOlgi8Rjmw3cjz6KrZBn3fjmr9oWG6/bNq83/87QI0aoZxYdQBwu5O5qwjKljKLvlcvVuLJ1UcqZ/PGddexgxcGQHOgLDz9VUpjUbZJV4sZkSDit5+begyNQEYGw39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007716; c=relaxed/simple;
	bh=qzNuBPozfFIkdZOuS/fLxMETJ0Kd83A2UR9sybGyKyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wq7Exr5M+tOqh2gMPO3RP8N9GMitvi0pVkvOf6Xd5FiSHFGtyh8t9i4038Q7dsaFl3Dj9T3XeEe8TrNKHW5w7avSH94D3EIayPtaNtImLGshKWPvtv7fYFTZB8gpaO/ds58ZUrK//iTuty2H6XRWR9M8pyJy2FiB+Cdi1nxl2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIgIczcV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIgIczcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786007713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1p/WqP5zNmyTteiVasVWjR72E6WFiVRU2GjHHBSa5c=;
	b=HIgIczcVznM/PvVO3WSanKAnsj07yqxutA+c0qD6W7KLAX8sbER67wo9jFQsXuofoJp0/B
	HSBivg8cl1+otxci0Ww/V/gbi+/7g4SukEv3JNqh5UMv90cICz6R9+Bvj6/5P+xXsCnIPy
	CE6BpTG9rTiqqWxmwEluDWBUS6gIoZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-gK3OrCBrM7GtDaOzpPbd4A-1; Thu, 06 Aug 2026 05:15:11 -0400
X-MC-Unique: gK3OrCBrM7GtDaOzpPbd4A-1
X-Mimecast-MFC-AGG-ID: gK3OrCBrM7GtDaOzpPbd4A_1786007711
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so1097752f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 02:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007710; x=1786612510;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1p/WqP5zNmyTteiVasVWjR72E6WFiVRU2GjHHBSa5c=;
        b=X75gjsgv/u2MQDpwjfsYf88OekQnjJiAOFTXiKw44N+dAQup7y+VORNgGscF+nNqyi
         Z6bkuxHuiSGYXwWEi8raTXMlXis7DTiqeU0mQYnwt+HzrKWSVrlerqaOOG2AcCRLkoMx
         5sVSWT7u1gLbgyhpgfvHbSLAT7aUiJU/JnpPrI/wDF88exxA4/+F4L62qnbLjTq7hG0e
         9X1SyS1csdgdjxZwVKclf1/RdoWgGrI24/CxG1KzgVWKtUksY36a87LqIf3U4KnxNG0z
         esEbDB6uc/ecRPBAa043sHyyBey3VNLDRE/1gZ3npmeP+kotkEe/u8qkd7vhkNSS7/5y
         c5cQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhWj9ReME9c5KcWqPscJ26nHJubpOkRLd1LetLidjNM0A2s9kEqffjkN2nzlrnv5QR2fE2QVR71yNrp4/wy4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUTwRBWRWJ8pSqmKTm4pQ2HJjuqDAwddLpzhBUw6Q8dtE5Mmn/
	NVQgJFFZIBhZUSIRCYTmx2Sbs+mOuhR+hw8rr3/CsLYSqvOok/84dQ8M/j28vnQkDy/OoSnKbOq
	X/wOBfUpCCeMZCGI6aQRRsb4Ygi635iNsFajBEJm/bOWvpRw5NLdZJVlqP3Sh6ZxF4oB/gA==
X-Gm-Gg: AR+sD12uWbyMAp1YfIMqXhHhhpMpXZlRafJ3+e9dvyN5sswpZtGooCS/3GHJPiwsxc0
	pK9mF0uJ8VEJxEF40NDoYzReICEPr9G8kVKxa+I1gmRj7w15T8gaL7VLeWfyHytphi9u9mLHFol
	BXYntwArF5ZHn9q0eegqWtRXfYqtmw1rAFtT1OemB/ABL6Oi0bfaRvTgWnGApCh15AW0RMbK/z6
	L47WtiHNXQ/p7nkpVIncqmg7GBq+C75PM/1SkLKMB7jdT8NpBUGBfxNO3+V0ktsN9G4ZfHoR5Vr
	xY/p73Vt3Vt8KR7ykVnk3dWmktDYaVvs5iHZ3y7BmyWW1DsA4jAX9GYifT6tffjRV3jlMzX4kwk
	Cb7jzcIi6iXa2JlSgJS6akrPXylNAJUEunRLO4WWxfLxsIhXx1+soSEdqqfQczQjmCIsZMvhIs2
	c=
X-Received: by 2002:a05:6000:29d5:b0:47f:90df:4ec6 with SMTP id ffacd0b85a97d-47fec4e761bmr17445730f8f.6.1786007710481;
        Thu, 06 Aug 2026 02:15:10 -0700 (PDT)
X-Received: by 2002:a05:6000:29d5:b0:47f:90df:4ec6 with SMTP id ffacd0b85a97d-47fec4e761bmr17445663f8f.6.1786007710038;
        Thu, 06 Aug 2026 02:15:10 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b26879sm4650653f8f.30.2026.08.06.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:15:09 -0700 (PDT)
Message-ID: <1f36d5be-906a-4ba5-8679-24cbcf899254@redhat.com>
Date: Thu, 6 Aug 2026 11:15:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] tcp: honor BPF_SOCK_OPS_RWND_INIT on the
 active connect path
To: Tejas Birajdar <tejasbirajdar@meta.com>,
 Eric Dumazet <edumazet@google.com>
Cc: bpf@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 sashiko-reviews@lists.linux.dev
References: <20260730220055.2946171-1-tejasbirajdar@meta.com>
 <20260731220124.B0C621F00AC4@smtp.kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260731220124.B0C621F00AC4@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v5Y05nw7MRYbfX2DDvaD6Tn9LUvFmzhNhMpTVnc0Qx4_1786007711
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/26 12:01 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] The `SOCK_RCVBUF_LOCK` check executes before the BPF program runs and before `full_space` is inflated, silently defeating BPF-requested windows and bypassing dynamic `SO_RCVBUF` adjustments.
> --
> 
> --- Patch [1]: [PATCH net-next v3] tcp: honor BPF_SOCK_OPS_RWND_INIT on the active connect path ---
> commit 2cf5d1d17ae1c7488533ecaa0fcbb83ae4591ec8
> Author: Tejas Birajdar <tejasbirajdar@meta.com>
> 
> tcp: honor BPF_SOCK_OPS_RWND_INIT on the active connect path
> 
> This commit updates tcp_connect_init() to honor the initial TCP receive
> window requested by a BPF_SOCK_OPS_RWND_INIT program on the active connect
> path. It inflates full_space if the program returns a non-zero window,
> matching the listener path's behavior, and uses u64 arithmetic to prevent
> overflows.
> 
> Link: https://lore.kernel.org/netdev/20260723214208.3655474-1-tejasbirajdar@meta.com/
> Link: https://lore.kernel.org/netdev/20260722170033.2763794-1-tejasbirajdar@meta.com/
> 
>> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
>> index d7c1444b5e304..fcaa04e65189b 100644
>> --- a/net/ipv4/tcp_output.c
>> +++ b/net/ipv4/tcp_output.c
> 
> [ ... ]
> 
>> @@ -4137,10 +4138,13 @@ static void tcp_connect_init(struct sock *sk)
>>  		WRITE_ONCE(tp->window_clamp, tcp_full_space(sk));
>>  
>>  	rcv_wnd = tcp_rwnd_init_bpf(sk);
>> +	full_space = tcp_full_space(sk);
>>  	if (rcv_wnd == 0)
>>  		rcv_wnd = dst_metric(dst, RTAX_INITRWND);
>> +	else if (full_space < (u64)rcv_wnd * tp->advmss)
>> +		full_space = min_t(u64, (u64)rcv_wnd * tp->advmss, INT_MAX);
> 
> [Severity: Medium]
> This is a pre-existing issue, but does the SOCK_RCVBUF_LOCK check happening
> before the BPF program runs defeat the purpose of allowing BPF to adjust
> the receive window?
> 
> If an application sets SO_RCVBUF prior to connect(), SOCK_RCVBUF_LOCK is
> set. In tcp_connect_init(), this caps tp->window_clamp to the old
> tcp_full_space() before tcp_rwnd_init_bpf() is invoked.
> 
> When the BPF program returns a large requested window and full_space is
> inflated, tcp_select_initial_window() bounds space by
> min(window_clamp, space).
> 
> This caps it right back to the pre-BPF full_space and discards the BPF
> request.
> 
> Conversely, if the application did not set SO_RCVBUF but the BPF program
> adjusts it dynamically (which sets SOCK_RCVBUF_LOCK), 

I read the above alike: 'a badly written bpf program could be
ineffective'; not much relevant.

This version LGTM; Eric do you have some comments?

Thanks,

Paolo

