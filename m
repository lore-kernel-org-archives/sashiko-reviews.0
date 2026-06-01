Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAF14A8B
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310284; cv=none; b=e784ugJqgTGt1ExJwLFtuDckkoUJF+8MTNI6PjHgH9OjvHHoHqyDUBdyoiSk5+Yv3W0p3SIkwkxYTSH6DkQvk8hoH11dS8h8a+oVWKeSjsVdingbU7b5qLDjrRI41ouvhBtIqgOORUWEAeuErSw7J0qS3BP1X3BygJBZlittFgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310284; c=relaxed/simple;
	bh=MBwOgbgAEgMPfLyydXuXFSj6sMutCvNP/2Fnwvx0eiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsFGNWd0atS+3ZowsQa61pBGDclR12bzFTS+3kfi3vZ27429dBXA70ilFdQgZsXuJEH600t+NEOemFPhPLKK+IGAw2hx7k/0ww4TcTDGPAK0JLpHaHlVq7eLt6I2VEJKEt/Hj9LyBFZWUu/JNkOqOZRnzwjRM+Zy+NVtPMifJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1OWqflB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1OWqflB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780310282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y62kcYp7lTf6WUC3Smiih8ZORr7i9aLk8qruViyqnYg=;
	b=K1OWqflBKtdLMXZb+ngw+nxeuVFQyVMbpQjxAW/z2awsflDafD++wXUkSexji212tjCRWk
	A1R0M9pYkgQRHoiaZqfeUdSkCZ6KsIxwqDBROp4yOJS8O5c2VWAyvA5k4v/qqvghz69oom
	t1KKRz7hJ1kaW74AxP3KaiN6UTEMqIU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-BoPJBLanNCu3CaS2ILRZcg-1; Mon, 01 Jun 2026 06:30:22 -0400
X-MC-Unique: BoPJBLanNCu3CaS2ILRZcg-1
X-Mimecast-MFC-AGG-ID: BoPJBLanNCu3CaS2ILRZcg_1780309822
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-460129ef947so401851f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 03:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309821; x=1780914621;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y62kcYp7lTf6WUC3Smiih8ZORr7i9aLk8qruViyqnYg=;
        b=RH4t8qdhdu2lrANHukZGYTI9cP70inIFkvlXKNXBeMVqGxbCquIi4sUuEtCuXA2gUG
         bzlhlkXNYvcMYscljg3gZdB+tjip9UzHboLii732ht4MQnaJrS6SSSiknNRfvWIJD12b
         o3Z3GxEDYcat+msNKyBTh9nZA2p56ENX1ZwqZmJiSVV8shiymA2LPkVZF3gGnQr/4IGF
         FvQXNSb22I0Pe3VD42KwEE6zOG1OBASZYEUqDc5B7Drcp8E0ZIJi/w4YKQUxZYv2hqLP
         HJwjCrvJdfe59ZtlZVjztIo+kCqoc6K6Qq/YZC8zgg6VsCmGz2hgmwFvbQe4lzLiE1XP
         Ojhg==
X-Forwarded-Encrypted: i=1; AFNElJ9bnaXYoCECd6hQeHyvFUZXd0GgIM23ho+r07ntKrPPKn2RwbjXRs5clcXESze94mQHezci5qWoSsHaLrff86Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/VZHhK3GwK98rVYTntp8qa5sOYn3f0viwEYLeyGwYLnFokh0o
	sG6GKvS18Hj+JYA1iQ8hq1E5CazAvKKliTP/is5MO43QEWIUDH9iZonfSNp8UKEUZ5S0Nmp+qQq
	KW/ieu89I6izx10WhgZKXLtacwuoMOHYdX99Ms37zDQMut1XI/ee0KHFJrLCA/Gq+w41yhw==
X-Gm-Gg: Acq92OHg/B10u4OwXD/wGCRauTBTCeHtW4hzlKX2h+PC34VYjn4qm2Ywaki3KN3mlyd
	P8lUKSLP6uhY93pZK4X1xrA1FThEm5QKosVZgDw+P7+YX+hBTbQT9DkkXeSvkjmxHhRILl2kem0
	JLssPvUIUcG8EXCO3hrTC2eAplngXMUNkB/iVtn55IrYhlvZjDnEvkJHuZFagMsfijzac+lQyvq
	unfdFv2mDgc/+7VZG4peUNUbUQf2oCU5j5eGfm+Qq09LwG3jqnAeaCmWj+EFxGco+GI5M2iUzND
	ACvwLwPMUk4W+xOR4W9ZQAjlsRHdDrUJB13peCkRvfcXg5hWk5/L8t9OctUWFm7bxLvIXWAshM/
	IEec81C9ONfIEwTgKm6XaSfpEa5S9LGxn5/vzfHTEWhTBrr8V7c0EaglBxEgmHWZBMIcy
X-Received: by 2002:a5d:4387:0:b0:452:bc55:c684 with SMTP id ffacd0b85a97d-45ef6b5a7c6mr14476371f8f.19.1780309821497;
        Mon, 01 Jun 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a5d:4387:0:b0:452:bc55:c684 with SMTP id ffacd0b85a97d-45ef6b5a7c6mr14476319f8f.19.1780309821038;
        Mon, 01 Jun 2026 03:30:21 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b7edsm24174472f8f.22.2026.06.01.03.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:30:20 -0700 (PDT)
Message-ID: <a4293c1e-88ad-4d95-bf03-78923660a2dc@redhat.com>
Date: Mon, 1 Jun 2026 12:30:19 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: dsa: tag_ks8995: Add the KS8995 tag
 handling
To: Linus Walleij <linusw@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260526-ks8995-to-ksz8-v3-3-c530f651989f@kernel.org>
 <20260530004901.49E6C1F00898@smtp.kernel.org>
 <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fNdfIl_N872FUU_Wh8YbqDUbVDK_Ofp_OdZ8snAd5Nc_1780309822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/1/26 9:47 AM, Linus Walleij wrote:
> On Sat, May 30, 2026 at 2:49 AM <sashiko-bot@kernel.org> wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>> - [High] Double free in ks8995_xmit() error path when vlan_insert_tag() fails.
>> - [High] Double free in ks8995_rcv() error path when skb_vlan_untag() fails.
>> - [High] Undefined behavior from ilog2(0) when receiving standard 802.1Q frames.
>> - [High] Failure to push non-802.1Q hardware-accelerated VLAN tags into the payload.
> 
> I have already looked at this.
> 
> Sashiko is missing context, in this case comparing this code to
> other taggers in net/dsa/tag_* and realizing this tagger is doing
> exactly what other taggers do.
> 
> If there is an issue with that there is an issue with DSA tagging
> in general and not with individual taggers.

FTR, I agree with the above. It looks like sashiko is consistently
tripping on this pattern, so I'm wondering if something at the DSA core
level could/should actually be done.

/P

