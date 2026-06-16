Received: from va-2-20.ptr.blmpb.com (va-2-20.ptr.blmpb.com [209.127.231.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499C2F8E96
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 03:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781582384; cv=none; b=SgfGLLpy7OFQZiY8W5yIPHT+SQsNB/M6xb6NBI8XzyiytSEss43ieD/cHOwKC5jGM12kGh0spg/IwHEmyL4tZtdEutNL2Th2nGjkKR+9NIeFyu/MHGY3sOPvtG5dnVjnRV6lzPW6/JWZfSlAUuKZN2XJeUdlD2Ota22rIGtj+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781582384; c=relaxed/simple;
	bh=hsah/15Fj05n8KzbzqXTLyXhcMXqEo6iqKvyPIzMsqA=;
	h=Date:Message-Id:In-Reply-To:From:To:Mime-Version:Content-Type:
	 References:Subject; b=nGsR4EfLKlZ8jFJLaYBU8osjy0y4V1TwvbHuwsPyAWDgo7mpO7QA0mSE303RSdZJN7oi1MsO1GOQavAzwAwg4L//BeIWPyz82hg9yRleh/Hn51nlVBbECqhxjIZSiG2kQY6N9X8eH7rQbxX6IGivGaJfUn/+rGkf/z9Yt5GtvbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=mIUuplO/; arc=none smtp.client-ip=209.127.231.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="mIUuplO/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1781582371;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6VHD9awDiPH/43rkmYUP2xcTYC8GI6bJQhkSjdEtnig=;
 b=mIUuplO/PsaxC5+hw/f7IffE9mLIc56yCleDHefhHNVC1kFUWvkqfg0IuYzxlpaNNIbsg1
 7SOyJbVBxRs7sDESgPzNL83xwYI3eo58zvjR7cuFfQiPF/iDEkYlUmD6gFG0a8Hae6xrFJ
 ehAPz+VRSPa86xW3Llahnvj5vq9kaGchF1BCoOP5mCzbx6aZ+TZNSe26azMCE/mXEDYcMM
 CAd8pDjIS6XSlRYWK6ZucHVJgr3kD/uGJ9dHa4w1aBXZl1Y3oNYE7YN7bjzt7aJA47okDv
 GbgFSLJB66e4UFO/2ChOIVjo9MXNZ/geppSWDRsTLtgvH7vGr6h4UK4jb2AccQ==
Date: Tue, 16 Jun 2026 11:59:27 +0800
Message-Id: <ed5eadd2-26e6-40c9-a0dc-956c5ef32c14@fnnas.com>
In-Reply-To: <20260615114929.E5BAD1F00A3A@smtp.kernel.org>
From: "chencheng" <chencheng@fnnas.com>
To: <sashiko-reviews@lists.linux.dev>
X-Original-From: chencheng <chencheng@fnnas.com>
User-Agent: Mozilla Thunderbird
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
References: <20260615113450.2088877-1-chencheng@fnnas.com> <20260615114929.E5BAD1F00A3A@smtp.kernel.org>
Received: from [192.168.8.62] ([183.34.162.81]) by smtp.feishu.cn with ESMTPS; Tue, 16 Jun 2026 11:59:28 +0800
X-Lms-Return-Path: <lba+26a30ca21+6d84de+lists.linux.dev+chencheng@fnnas.com>
Subject: Re: [PATCH v2] md/raid5: fix reshape deadlock while failed devices more than max degraded

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


that make sense, however I can't find a card or processer to support

offload memcpy , neither emulate, so I can't re-produce this scenario.


theoretically, the fix way I can think of is use refcnt to point-out the=20
number of

offloading memcpy tasks, after reach to zero, the destination stripe do=20
cleanup,

otherwise , delay source stripe handle .


>
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
