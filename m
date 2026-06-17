Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714D3B774D
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704520; cv=none; b=hHOfEw1P8hKH2aHig2hntsjvz1sBGAxFEXXa6DWSfnRyn3W4hAFHy0Lyo7M1al605wTKy/6v7bq00xcVw8axVdgiNg3cKvkeErHS/poQ7j8UbsmUy8aOBHmrVJKYrSL/uX7NpYu4bWFMb/lDx0QC987CCV0xmUXm4+ii1BMsVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704520; c=relaxed/simple;
	bh=FIhRAjU2S7amaNpwygREz87N0ws2BZ8z2tbsthDbX34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWZdHQCjVnjwEBDEg+f82fns7Uq3KDVPenELnXWzWjWjLAoesA6mc1loMoF1O7BsgPC81inGWEpQ5Sp2ge6xxjqc5M4lKMZzsYBdZEJwtMuTXfm91hJ8KGok+4MChjKy01RVHN82tFudkFbNG1usVo6pb9BT10SWMVWKEXWKqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmjcIoNj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmjcIoNj"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6930f7e83b1so1448996a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781704518; x=1782309318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo+39z+7jWnN4BY8JaCf4Xasm1WdIUT2UiMvAy1Trps=;
        b=FmjcIoNjoTVz+FcImKpagVHDa5CqPPfCRqMMRLDHDHF4ANMG6K3ZlPMDBck7kbJfIn
         OAKh7j0J+MYjbJLyAbQzVniJGd5KZHRzIqNKhpx40daUJwourANctqRl1rV1H1b1wD82
         JHikOjR5p2bzNlMgmb2FcpjXWnUPjKwRmKLyDG/pd2l65/XZFU3RnzYHxbEzK3zIE/6N
         EnmJrihfR6WbXCWO3436TSytWmAphuXtdGGnQTfFNg82nTV5wN8QLaSzcGOb9spGGl33
         200mf/r+7XijJff1cRch2z+Ta7PDsjkqNrplFn62A7hFooEDigEJDG3WomU2iZqha5tq
         8KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704518; x=1782309318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yo+39z+7jWnN4BY8JaCf4Xasm1WdIUT2UiMvAy1Trps=;
        b=OBXJnoWHmc7eixm+gKWiW3OgcTptEVHoZOYrdp5o8SjOp/qgzLCsMgPb3XYLGOAx8L
         oE1X7La2+eu71OobnLCVV50eJIbmYU2mt9KQGidlqTdwdZmeK5J3av9WG5lC+RkejROL
         fhuJEOkJYtKHou/hc5sKdK/9i7N47lVkS9Xei0nrVLLP5wmb1ssK/eRVnNyA4xuWdx8A
         S58LRDuyb+jJh0dZz/qrj8y+CbVSyUdRKwDH3nY4SbMwZ+zjRnZgkbSobMtCGqO2AbmW
         DigHBbCnyVhHTFqc6+vDrvFPSwE4eNI2GOWAzh74ysTvkzg/Mx0zoFFgFnWaYewG2UfX
         8YCg==
X-Gm-Message-State: AOJu0YyEDJGolkSJFd0JJaQd4VBBMbExBaqbSY8U10z2XvTchRCNeEwQ
	hT+Xa4v+X6G2Aw14r8cPt69GXWuwmOq7su62pFpnmHHKdAtVoi0C4OnNapJz4g==
X-Gm-Gg: AfdE7claDTGxjQymBOTfym5N7FvM8mtYi6d4cA/4VBlr4/C1+e86Fok0a/a+I1COWB1
	sz59P/poL/+6nBao9D30OI7dnXVM/x3VsmffPQx8XFMh+GPeigouikOYrYuJSSmH2YJm5AMIhFQ
	R4nPJMYHIntOzoRTcG8m7/fA+l3TDufkMNQuhXMx9m9/U16AhtMtdGQBLkgVdmqZDvadmQwhhqu
	QKoEOw1UzToS7uY6QNAfYWIr1M2l3QT1x3jCeVg2CVmQ8KlrIW/Vx4iwy1OOF5TvJWHZSuBEVnF
	WyVEkmdpptKqgOlYPEM/WoYyYYpRQyxyWjFKTW0ocRAPDKFNSwKENlcWuRPugDoYqk81SB0sU8+
	3ueDDPafcir39vLO8xGV1LjkOMepIiIe5KK9uBF6bzJzax3jte0yP1qRoXJ3AKo4BGTnPjCy88T
	h+f79HxttiIyszLY3CZGADeviCLGFYGesmtMbiyXm2mFWggkI=
X-Received: by 2002:a17:907:6d21:b0:beb:d461:7b09 with SMTP id a640c23a62f3a-c05d6e83296mr183033066b.11.1781704517307;
        Wed, 17 Jun 2026 06:55:17 -0700 (PDT)
Received: from [192.168.8.62] ([154.83.91.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420823sm807905566b.4.2026.06.17.06.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:55:16 -0700 (PDT)
Message-ID: <9ba07c52-bf14-4e42-8fea-4e90281c3226@gmail.com>
Date: Wed, 17 Jun 2026 21:55:12 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] md/raid5: protect bitmap batch counters aka
 seq_flush/seq_write
To: sashiko-reviews@lists.linux.dev, Chen Cheng <chencheng@fnnas.com>
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
References: <20260616131310.3790554-1-chencheng@fnnas.com>
 <20260616133034.015501F000E9@smtp.kernel.org>
From: Chen Cheng <chenchneg33@gmail.com>
In-Reply-To: <20260616133034.015501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/6/16 21:30, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Missing full memory barriers between the bitmap update/scan and `seq_flush` access allows torn writes.
> --
>
> commit 45ef15a300eccd14518bc90e254146a73a49bf51
> Author: Chen Cheng <chencheng@fnnas.com>
>
> md/raid5: protect bitmap batch counters aka seq_flush/seq_write
>
> This commit attempts to fix a KCSAN data-race report on conf->seq_flush
> in the raid5 code by introducing READ_ONCE() and WRITE_ONCE().
>
>> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
>> index d0d7f96fd7cd9..ffc89ebbc4857 100644
>> --- a/drivers/md/raid5.c
>> +++ b/drivers/md/raid5.c
>> @@ -3538,7 +3538,7 @@ static void __add_stripe_bio(struct stripe_head *sh, struct bio *bi,
>>   		 sh->dev[dd_idx].sector);
>>   
>>   	if (conf->mddev->bitmap && firstwrite && !sh->batch_head) {
>> -		sh->bm_seq = conf->seq_flush+1;
>> +		sh->bm_seq = READ_ONCE(conf->seq_flush) + 1;
> [Severity: Critical]
> This is a pre-existing issue, but does this lockless synchronization require
> a full memory barrier (smp_mb()) before reading seq_flush?
>
> The producer sequence updates the in-memory bitmap (which drops a lock,
> providing only a Store-Release barrier) and then reads seq_flush. Because
> there is no full memory barrier between the store to the bitmap and the load
> of seq_flush, weakly-ordered CPUs (and even x86, which allows Store-Load
> reordering) can reorder the read of seq_flush before the store to the
> bitmap becomes globally visible.
>
> Could this lead to silent data corruption on a crash if the consumer sees
> the old bitmap state but the producer assigns the stripe to the current
> batch?


barrier provide a tool to promise "the things before this statement all 
done", and

I don't think I need such strong promise.


What I need is, "all cpu cache coherence for accesses variable 
seq_flush", so

READ_ONCE/WRITE_ONCE is suitable for this scenario.


>>   		set_bit(STRIPE_BIT_DELAY, &sh->state);
>>   	}
>>   }
> [ ... ]
>
>> @@ -5755,7 +5755,7 @@ static void make_discard_request(struct mddev *mddev, struct bio *bi)
>>   		}
>>   		spin_unlock_irq(&sh->stripe_lock);
>>   		if (conf->mddev->bitmap) {
>> -			sh->bm_seq = conf->seq_flush + 1;
>> +			sh->bm_seq = READ_ONCE(conf->seq_flush) + 1;
> [Severity: Critical]
> This is a pre-existing issue, but the same missing full memory barrier
> pattern appears here in the discard path as well.
>
>>   			set_bit(STRIPE_BIT_DELAY, &sh->state);
>>   		}
>>   
> [ ... ]
>
>> @@ -6805,12 +6805,13 @@ static void raid5d(struct md_thread *thread)
>>   		if (
>>   		    !list_empty(&conf->bitmap_list)) {
>>   			/* Now is a good time to flush some bitmap updates */
>> -			conf->seq_flush++;
>> +			int seq = READ_ONCE(conf->seq_flush) + 1;
>> +			WRITE_ONCE(conf->seq_flush, seq);
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does the consumer side
> also rely dangerously on implicit barriers?
>
> The consumer (raid5d) writes seq_flush and relies on an implicit full
> barrier deep inside unplug() (via test_and_clear_bit) to order the
> subsequent bitmap scan.
>
> If the producer's missing barrier allows the read of seq_flush to be
> reordered, the consumer might flush the old batch and advance seq_write,
> unblocking the producer's stripe to be written to disk without its
> write-intent bitmap bit being flushed.
>
>>   			spin_unlock_irq(&conf->device_lock);
>>   			if (md_bitmap_enabled(mddev, true))
>>   				mddev->bitmap_ops->unplug(mddev, true);
>>   			spin_lock_irq(&conf->device_lock);
>> -			conf->seq_write = conf->seq_flush;
>> +			WRITE_ONCE(conf->seq_write, seq);
>>   			activate_bit_delay(conf, conf->temp_inactive_list);
>>   		}
>>   		raid5_activate_delayed(conf);
