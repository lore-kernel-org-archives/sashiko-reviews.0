Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90E3F58CC
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793090; cv=none; b=q9dK1LJQhO/ccoq92c2rMZGYF3d+pL+VRlkwVv5At8ofF6WT50dpXSz5F4dWz7+NM2RzFA37+ynSGoRbdpEGmqWgHkqcDoS41I+8veTjcDnIDjY6VOqthKxBNibwy1tJSNF9VtTzpI3MRuL4J/0soY9cBNF+HWI31C6JIdXYvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793090; c=relaxed/simple;
	bh=SNsUozUZWFKiCkN7Jy0qN4XIwMvqhfqRrgc2sGc6wkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZh6lJczDJUZ+3gWfeGrjKD2OttaWkSKyQC8as6tUIaRPedYpYFaVN2mlQUrsHx+67d9PYOIp4D39ZDoxSkCzTkBgj28iwqXWC0ldIqmYAfPSNrI/wO+k3Pd0r3Ca6smTDjOsJUDN9ipXTc4LDaZmVvYWFx9WnJyzOyEmDA4qyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MB/eVKfC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MB/eVKfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784793087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sqak6NzeK3N9HwY2qRwknbGUvJUZRzXhr8+SM9jOMpE=;
	b=MB/eVKfCqk4ouMn4NoLBGjOSGXoOHBm7orXRaygsnW5f37DwbSudhLHWZE2sJtC+M2Idex
	1KbV+ZQ0DMr1IPO8L/voLeUAkh0WEno9OYt/XYhmEKQWftoB1hfiI4Ha9pZm9jabJA9rWF
	wIMKmn0o2J2IB9aQsUl9o3w1VbTDnSY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-NoUHEy9vNwSPDhy_9qDXFQ-1; Thu, 23 Jul 2026 03:51:26 -0400
X-MC-Unique: NoUHEy9vNwSPDhy_9qDXFQ-1
X-Mimecast-MFC-AGG-ID: NoUHEy9vNwSPDhy_9qDXFQ_1784793085
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f90dbaf84so257828f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 00:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784793085; x=1785397885;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sqak6NzeK3N9HwY2qRwknbGUvJUZRzXhr8+SM9jOMpE=;
        b=Ne4fmat4VgV/IVdIRT2FUJNFHQxgTKtHirJx45ecaHYLmHvyQ0Ds0lPqQJ0HaVcEny
         MO+lxs/2xL5uCLKUQWRgZJZpGA5cufyzzrnTJPwmsjw9kv9NOePRZXfqFhGqKvExQ6wi
         iT1k2Uxr/RMG9Zw5WeMxayeUEE8AcYRIgREMc+/4AoSj9oQQj6nXOrQkrX3ZPU70VcY/
         cHvBlIww9Q3G+Fe+hV7QIMcuBMW6+WtmLcXGuxsGgsMWUfl9zIxwVuugEDJ+/UUOCBF9
         gu7LJHP+bULfUzBhIKJdNm2f+Bk4k76xFGv7z6XHYQXnJeS+bXbHvTnU4/VPMc3piAkM
         00sQ==
X-Gm-Message-State: AOJu0Yx6nYWyxBmjQhUz2HE0xYhaf53y3KiAb/Q8gGCju6QceKoWGIBI
	/GlTo9iDXWUELNQ5VPCLyYZyuLJUnzA2SzxP+gCc6Rg5W9MFsHXhSLzDzgGwpT6vy0hkTSfPhR9
	1WcJlExzhFm5Bz9nqLxgWrPbWLEd6hEy+w0wBfQWT+wxqJ2QsYq3FnDKRYE0HIP90n/LCEZeWN+
	hvgmUneNBATo4BaHovsTJ6wmt/9lH636W4sm4mz5bzTawPTcDK6ec=
X-Gm-Gg: AR+sD11757ruZ3icQLhLpSpSOtWcz9VF5kjrSvg0Cno2BqOiW5e1DrWKj2U2JKjUZLg
	b+kxYHZHhUv/gsJEYJ02J3/qkc20NDQt5C8RQdMXJBNfuyPb8WvOvW8akrIol4WPkKR5lk96/rQ
	i+aYblpMjlphyayhsYhAsl0NkMIJozHTQxr8Np4Lt+Qee38adS1AgypEt13ofRav9kvNbM8G2fl
	7cpsoi09iVODGII49IqNBHlwCf0SqeCyz9BWnsLcIn2wIUcVjztB83EUu/eP8s/axP13g+qlHOp
	iwr7+/BEW8WTIEXWP1+piNLHGDHZH7Rulvb5f6nCQ3dOzbkQoHNWbKYLsanjawzwVBNYnRRMHBf
	8FZSZ5amu2pMLd0JxJUCzOOw4ZZke/ZmbOvBXL/1jOanRYxPWgcxFL4BBxeBoGoBBi5Nufic6Ev
	PPaQ==
X-Received: by 2002:a05:6000:1ac9:b0:47f:3e80:7c3b with SMTP id ffacd0b85a97d-47f8d76ae47mr2447063f8f.48.1784793085293;
        Thu, 23 Jul 2026 00:51:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac9:b0:47f:3e80:7c3b with SMTP id ffacd0b85a97d-47f8d76ae47mr2447020f8f.48.1784793084810;
        Thu, 23 Jul 2026 00:51:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm13269952f8f.35.2026.07.23.00.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:51:24 -0700 (PDT)
Message-ID: <3678f78e-f2e7-4520-84fb-d78b10dc00c5@redhat.com>
Date: Thu, 23 Jul 2026 09:51:23 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: atlantic: convert RX path to page_pool
To: sashiko-reviews@lists.linux.dev, Yangyu Chen <cyy@cyyself.name>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: bpf@vger.kernel.org
References: <tencent_7DB01BE7F8FA056BB5F11D3570CF636C4309@qq.com>
 <tencent_164779DC8B18AB10B9C636BE23C178ED5907@qq.com>
 <20260710173815.DE08B1F00A3A@smtp.kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260710173815.DE08B1F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DqALVhPqLYlyltMOJumj8bKKMCm8UB4Idz1m_45Q4Wo_1784793085
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/26 7:38 PM, sashiko-bot@kernel.org wrote:
>> +		return -ENOMEM;
>> +	}
>>  
>> -	if (!rxbuf->rxdata.page) {
>> -		ret = aq_alloc_rxpages(&rxbuf->rxdata, self);
>> -		if (ret) {
>> -			u64_stats_update_begin(&self->stats.rx.syncp);
>> -			self->stats.rx.alloc_fails++;
>> -			u64_stats_update_end(&self->stats.rx.syncp);
>> -		}
>> -		return ret;
>> -	}
>> +	rxbuf->rxdata.page = page;
>> +	rxbuf->rxdata.daddr = page_pool_get_dma_addr(page);
>> +	rxbuf->rxdata.pg_off = pg_off + self->page_offset;
> 
> [Severity: Critical]
> Can this cause severe DMA memory corruption during RX buffer refill?
> 
> The initialization of buff->pa appears to be missing or was removed here,
> but the hardware callback still executes immediately after and
> unconditionally overwrites the descriptor's physical address:
> 
> hw_atl_b0_hw_ring_rx_fill() {
>     ...
>     rxd->buf_addr = buff->pa;
>     rxd->hdr_addr = 0U;
>     ...
> }

FTR, AFAICS the above is AI sloop (and quite an unexpected one!) as
buff->pa is actually always initialized by:

	buff->pa = aq_buf_daddr(&buff->rxdata);

that comes after the aq_get_rxpages() call. All other issues are
pre-existing ones.

/P

