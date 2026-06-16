Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C735A3A4
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 04:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781582562; cv=none; b=Lld+liPaV6QT1WWtbBG9GeRIoE/AyKrF7QzO6mExnYwUacGVpS13PNvxi196NKP3IdKQ595CQd/tBm+poY+87sjy97WNM4iXNap9LAswDC6bwAQprUkr5TwRvjX0zHX8jasOlo6wA4/Gako/AcIUmk5SaMgyJiXKIbI3IsHhrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781582562; c=relaxed/simple;
	bh=AwNKfL9SSNcGYoZ17QcLuU64BZDbB/ephFk8uFUmi4M=;
	h=Subject:Mime-Version:References:From:Content-Type:Message-Id:To:
	 Date:In-Reply-To; b=LcRW9JSy+iz6xd4EFiE/aphrdQnjfqALII2jM35ANZfGwAMXfFITgNn5u4kpHLWExxGfyoK7Px4WEQnDdJc9ubvbiU21phblZ9RsCCq/bon0UA2snOyk/RdiFWRFqoUHiDIl7q+2NEQjnGslxRhev4IgSQUxA9XkDdhDMsHVe50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=mN8SNmYr; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="mN8SNmYr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1781582556;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZwMJkGm4oNFYZgv6YKJJRFi0G/4YgISTpxB+3KkOaNs=;
 b=mN8SNmYr2juhwHaAnBuSA2u++x+HD6f+NndhFD9hw/bWgk653M4xNGJCfUctL9vN76MPNi
 xUgu6mKhwVa91lM6UUBNCjDPdfNSXxo5QZiamn82ifKLz+DLstfxj+jnW4KG+H2xLFOkCX
 kNblC5+/Aa6KocauzHoajFihnvOr/dcWwocf9SHAj7Kwy10hXbfaAYS5J+rJNUP50+lBxB
 NZ1XkKuCjOdRmlpMkkihMOBDdYN5G95MdvJDHiiJO+fSmds2l7MlBguMAlnUq3T68tZT3d
 2761y/IAWljGC/UyYQrNEM53sI2cp+h7pyaeoi+u1IJutp//+2uiyXTIvl8joQ==
Subject: Re: [PATCH v2] md/raid5: fix reshape deadlock while failed devices more than max degraded
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615113450.2088877-1-chencheng@fnnas.com> <20260615114929.E5BAD1F00A3A@smtp.kernel.org>
Received: from [192.168.8.62] ([183.34.162.81]) by smtp.feishu.cn with ESMTPS; Tue, 16 Jun 2026 12:02:33 +0800
From: "chencheng" <chencheng@fnnas.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Original-From: chencheng <chencheng@fnnas.com>
Message-Id: <ec3e5f21-470e-4d4b-b1b0-fe698bdc1ff7@fnnas.com>
X-Lms-Return-Path: <lba+26a30cada+f9f5e4+lists.linux.dev+chencheng@fnnas.com>
User-Agent: Mozilla Thunderbird
To: <sashiko-reviews@lists.linux.dev>
Date: Tue, 16 Jun 2026 12:02:32 +0800
In-Reply-To: <20260615114929.E5BAD1F00A3A@smtp.kernel.org>

=E5=9C=A8 2026/6/15 19:49, sashiko-bot@kernel.org =E5=86=99=E9=81=93:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Clearing STRIPE_EXPANDING prematurely in handle_failed_resha=
pe() allows a destination stripe to be freed and reused while asynchronous =
DMA is still writing to its pages, leading to DMA-after-free memory corrupt=
ion.
> --
>
> commit ec55b78c975b4f9f35e287b83bee72d76b92b33a
> Author: Chen Cheng <chencheng@fnnas.com>
>
> md/raid5: fix reshape deadlock while failed devices more than max degrade=
d
>     =20
> This patch fixes a deadlock in raid5 reshape by cleaning up stripe states
> (including destination and source stripes) when failed devices exceed the
> max degraded count.
>
>> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
>> index d0d7f96fd7cd9..2f4d82bd7c2e6 100644
>> --- a/drivers/md/raid5.c
>> +++ b/drivers/md/raid5.c
>> @@ -3730,6 +3730,78 @@ handle_failed_sync(struct r5conf *conf, struct st=
ripe_head *sh,
>>   		md_sync_error(conf->mddev);
>>   }
>>  =20
>> +/*
>> + * handle_failed_reshape - handl failed stripes when reshape failed and
>> + *			   degraded devices >=3D max_degraded
> [ ... ]
>
>> +static void handle_failed_reshape(struct r5conf *conf, struct stripe_he=
ad *sh,
>> +				  struct stripe_head_state *s)
>> +{
>> +	int i;
> [ ... ]
>
>> +	/* release the destination stripes that are waiting to be filled */
>> +	if (test_and_clear_bit(STRIPE_EXPAND_SOURCE, &sh->state)) {
>> +		for (i =3D 0; i < sh->disks; i++) {
>> +			int dd_idx;
>> +			struct stripe_head *sh2;
>> +			sector_t bn, sec;
>> +
>> +			if (i =3D=3D sh->pd_idx)
>> +				continue;
>> +			if (conf->level =3D=3D 6 && i =3D=3D sh->qd_idx)
>> +				continue;
>> +
>> +			bn =3D raid5_compute_blocknr(sh, i, 1);
>> +			sec =3D raid5_compute_sector(conf, bn, 0, &dd_idx, NULL);
>> +			sh2 =3D raid5_get_active_stripe(conf, NULL, sec,
>> +					R5_GAS_NOBLOCK | R5_GAS_NOQUIESCE);
>> +			if (!sh2)
>> +				continue;
>> +
>> +			if (test_and_clear_bit(STRIPE_EXPANDING, &sh2->state)) {
> [Severity: Critical]
> Could clearing STRIPE_EXPANDING prematurely here lead to a DMA-after-free=
?
>
> During a reshape, a destination stripe (sh2) might require data from mult=
iple
> source stripes. STRIPE_EXPANDING normally prevents the destination stripe=
 from
> being returned to the free list before all data is copied.
>
> If Worker 1 is handling a source stripe via handle_stripe_expansion(), it
> submits an asynchronous DMA copy to sh2's pages and then calls
> raid5_release_stripe(sh2) to drop its reference BEFORE waiting for the DM=
A to
> complete:
>
> drivers/md/raid5.c:handle_stripe_expansion() {
>      ...
>              raid5_release_stripe(sh2);
>          }
>      /* done submitting copies, wait for them to complete */
>      async_tx_quiesce(&tx);
>      ...
> }
>
> If the array concurrently fails, Worker 2 could enter handle_failed_resha=
pe()
> for a different source stripe, look up sh2, clear its STRIPE_EXPANDING bi=
t,
> and release it.
>
> If sh2's refcount drops to 0 without STRIPE_EXPANDING set, could it be
> added to the inactive_list and reallocated (or have its pages freed) whil=
e
> the DMA from Worker 1 is still actively writing to it?


that make sense, however I can't find a card or processer to support offloa=
d
memcpy , neither emulate, so I can't re-produce this scenario.


theoretically, the fix way I can think of is use refcnt to point-out the nu=
mber
of offloading memcpy tasks, after reach to zero, the destination stripe do
cleanup, otherwise , delay source stripe handle .


>> +				atomic_dec(&conf->reshape_stripes);
>> +				wake_up(&conf->wait_for_reshape);
>> +				md_done_sync(conf->mddev,
>> +					     RAID5_STRIPE_SECTORS(conf));
>> +			}
>> +
>> +			clear_bit(STRIPE_EXPAND_READY, &sh2->state);
>> +
>> +			raid5_release_stripe(sh2);
>> +		}
>> +	}
>> +}
