Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BDF3AE18B
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324738; cv=none; b=SHe1dS4cDREyToRUeD4J8R5gCVxtcTllKXjKc7YQksBgHnxOHQrpF4xkjlylHaTtfXmKwyKCxy5MfQyjh1ZgbzFlPZ37muKwznA2dvT/OpojenWWA6sadmyywzQ8GcOPVOvQZeFdAUfHI6UUJEecdh92jTzAZhlco7rj20hALwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324738; c=relaxed/simple;
	bh=+CnGQ9TO70FOcTY4MRKaNNO36huxITPaBaCyxApkKOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hshIHJ90kiLcKppnB029YeFEuyKZM+RjqhBz0QYw5+GVeIo12Uof5gPNzP4XhJliBiTMJ7HQmEIKPBcGdeXDnuM5MDDdTqO78Ja9TzmaRMDaMkD/ReFKrUgG+0UNorXD5FsB+R5TGpAkktlOEKlH7wLWW31AxSWR2gI6q6S72kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b0FmVymX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b0FmVymX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780324736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etk1wl0EQA40zfC85KF843N3y3SYchLVXHGTkLkJ2Ts=;
	b=b0FmVymXBWsBLg9mGkAiQtmrQHgY9JyD0OyLJ0fYlZfdkT9awtzQ9ECqlND4f1SxNyKmG2
	+KXYUiHAkGJjKkSLAtQP22iMJDz332+mavJF6V7RKSOs4SIQ31yIl4KEQmIb5Vg1gxwNNQ
	M5g/HU5ywt2StqtLeOaCQedD0/RQPuA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-urf3gBE6PvqL2toUs3N7Fg-1; Mon, 01 Jun 2026 10:38:54 -0400
X-MC-Unique: urf3gBE6PvqL2toUs3N7Fg-1
X-Mimecast-MFC-AGG-ID: urf3gBE6PvqL2toUs3N7Fg_1780324733
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45ef5e38a18so1377469f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 07:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324733; x=1780929533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etk1wl0EQA40zfC85KF843N3y3SYchLVXHGTkLkJ2Ts=;
        b=YoLl7xJdudXptNd5Jb+IbLXxNCEAnYgTCjj5Q5Mo1LXC7fZltYgJEYGqCB7JkkMxm9
         KGEpeVaWzAiHaOf+ql7ScGvlGVZQey0jqlsxhLqHj/KGA3fDgaUYTBS9dwMPvV+pWgjj
         nA9nZb7jC9gFf8MU3/xv7crQ9OiGEPsZ9zl+M+AVNYSOkW37XJQu5WkkFbYE06twEKLH
         Hy0b62bzN1OL+/Wejek7CgFgZyA2IZIjtS+yZ1bXm8E4yiUpUluxgZGUAE6ltR1SkKJM
         a7cMj4Aol0dqwc9qSuKphG6U8oM9+fJvZwW14HRLIusUYDZhDrd3ZtdtlKeIGZh094ex
         HTzA==
X-Gm-Message-State: AOJu0YyDwZgp9vuOh+0rKezKYg7SQ2tLu8V/Gi8R4G/JSkUvBSY2e/Eo
	3bzlctYGGuHzZY2ZNfIzPJUIOkIli13FpqRjG5/DUgpHGUjORywTila2+jZTNa63063RtLVXQmZ
	5EnbJCHj22h91kSOXyXt4wjyRhYcKrAq6fYJxwszInJWHuo9Jpc9KXXhjjki27ykVirgYVw==
X-Gm-Gg: Acq92OE9HTU+F0/0rE0dWKJ8IZjQU7jPN0Ar0HtHv6D+FP+GyXIHYtEkLT7pCU+YgLm
	zcUeqofH3ThrNXLqcWmIE5IhxWHKVYdsN821WHAiL4sQVacV0XdkVNk3BLMDdq/mBhHQCrGMgn/
	wQOjSSI5bIwaAh5j+Mx4IhoD96m07BkA+W3MaUs9L4EtgN+R/aHS+MmflMm8mR2VCpyTUARcWG6
	0abbXdBlvq/1LnYcxYpYRG42py6BZAwh4Yl3mO6qInhP3r2OwzlU8NO4jwCrOnm+MifZpUmReki
	rVIsp94oWf2qDyJCLKWR3temLFChT5kUdc9xKrKlev0Pucw002WlZHbOdU0DUZg9Cqvj+he+V5q
	XlufilAuXNtkDRJbcZZs81ne+vj/a77p2b8eC5kK6pbhWdcEzOWqeXKVeWkpvM9t4Kq62
X-Received: by 2002:a05:6000:26cf:b0:460:1695:89be with SMTP id ffacd0b85a97d-46016958be4mr2527480f8f.17.1780324732794;
        Mon, 01 Jun 2026 07:38:52 -0700 (PDT)
X-Received: by 2002:a05:6000:26cf:b0:460:1695:89be with SMTP id ffacd0b85a97d-46016958be4mr2527437f8f.17.1780324732403;
        Mon, 01 Jun 2026 07:38:52 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25549035f8f.18.2026.06.01.07.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:38:51 -0700 (PDT)
Message-ID: <4bf036ed-cf48-49ef-94df-8d7a03b0cda4@redhat.com>
Date: Mon, 1 Jun 2026 16:38:50 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
To: Linus Walleij <linusw@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
 <20260530004902.BCC381F00898@smtp.kernel.org>
 <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
 <69dfe2a0-ce0f-4a92-98b5-c4cefd30ce49@redhat.com>
 <CAD++jLnZ1h4MpDEZn5FzX7yzGLYGCpt794zNf0OXQmgKnFPWew@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAD++jLnZ1h4MpDEZn5FzX7yzGLYGCpt794zNf0OXQmgKnFPWew@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Puv181WkcxTnB61JiCjVVhl-YyZZUWrLRkGe2b1hIho_1780324733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I'm re-adding netdev to the CC-list which was stripped by the sashiko
bot. I should have checked better in my first reply.
On 6/1/26 3:12 PM, Linus Walleij wrote:
> On Mon, Jun 1, 2026 at 12:41 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 6/1/26 10:09 AM, Linus Walleij wrote:
>>> On Sat, May 30, 2026 at 2:49 AM <sashiko-bot@kernel.org> wrote:
> 
>>>> - [Medium] Silent loss of switch driver functionality on kernel upgrade due to missing Kconfig migration.
>>>
>>> No-one cares.
>>
>> Uhm... I have quite mixed opinion WRT to the above points as try to
>> avoid breaking users in any way. I'd love to ear a 2nd opinion from the
>> DSA crew.
> 
> OK then, I can be less cowboy-coding and try to play it nice.
> 
> Would a phase-over Kconfig option making
> CONFIG_NET_DSA_KS8995 just select NET_DSA_MICROCHIP_KSZ_SPI
> cut it? (Sashiko suggest this I think.)

Yes, will do for me.

Just wait a bit for Andrew's or other DSA maintainer feedback for
confirmation.

Thanks,

Paolo

