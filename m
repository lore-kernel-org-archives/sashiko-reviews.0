Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC600340402
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441775; cv=none; b=qqkMUGSFZYI5zhaY03UtWSMbSHmL80j0FQSyrgezcCTPl4+jI25qy+Kk+PABCFvO1kQpXapJyaDWYhHwobiP+qwgMYk6VfRg7riOiuOJ+dyvuk70WJIL/rKpjxQcFENH4sgumZnJhe+JIIGDzH+TPpHYriveyOQmRkjdXBSywK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441775; c=relaxed/simple;
	bh=p8h4DmUfcqZszTFCaMcEisgt/6+IGvOqY85EQwlg0sg=;
	h=Content-Type:In-Reply-To:Mime-Version:Date:To:Subject:References:
	 From:Message-Id:Cc; b=gSUTFNXJW877hCCG9JwfJjDEQhRaIq18MpBQbBwdvPj2/XLr1UmBpMVivTOibHF8C2pV5ZYP3ekzdXczO255JRNhNoLdZOv30l0CcdqlTTMQ9TvHCpxDMwnszsKIy+po3XnyuufsIrbd6RvpwLJ+WIt7cYwhR0TqsspB+Hwe2aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=WAyODMsk; arc=none smtp.client-ip=209.127.231.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="WAyODMsk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1785441768;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Tk3sB2hpJ9ZwidwOR2mz/E9yu5Xc7t091/qV5f+s5cM=;
 b=WAyODMska91uUjRz2Uq3+pWLS6HnaGPTT+S4n3BDtNx/EW46yxKG58HmN51vYa9OCCaTXv
 4y2pHjSDCB25EJou33AhsoNCpWebk++OI0vndrXwKbYL2SnryFbUUN1EbiSqayfqkN/NFL
 ViGD9FqQId8Wot79op4rzZPXyZj3zoFFPM9+o3ki1l6l0ymRoPyLseQnWuQzYPnXMJ9rDS
 ZDk9+Tn3fZvWDoiBPHfzx8BLsnMFJfaOY8OBHLpSQHF54PfRHC7+tiI63WpXWyoIj66ofS
 C4EOBoxN83rK07iYgKQdp/rGSspjmLhsoQZbX8joS9/Ivp7tZ57rKqiDEc2+BA==
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260710133601.099961F000E9@smtp.kernel.org>
X-Lms-Return-Path: <lba+26a6bade7+173006+lists.linux.dev+yukuai@fygo.io>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from [192.168.1.104] ([39.182.0.181]) by smtp.larksuite.com with ESMTPS; Thu, 30 Jul 2026 20:02:46 +0000
Date: Fri, 31 Jul 2026 04:02:44 +0800
X-Original-From: yu kuai <yukuai@fygo.io>
User-Agent: Mozilla Thunderbird
To: <sashiko-reviews@lists.linux.dev>, 
	"Hiroshi Nishida" <nishidafmly@gmail.com>
Subject: Re: [PATCH 1/2] md/raid5: submit a window of stripes during resync/recovery
References: <20260710132339.7284-1-nishidafmly@gmail.com> <20260710132339.7284-2-nishidafmly@gmail.com> <20260710133601.099961F000E9@smtp.kernel.org>
From: "yu kuai" <yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6a38d4fe-f8f6-4a0e-9054-9678f99537b1@fygo.io>
Reply-To: yukuai@fygo.io
Cc: <linux-raid@vger.kernel.org>

Hi,

=E5=9C=A8 2026/7/10 21:36, sashiko-bot@kernel.org =E5=86=99=E9=81=93:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The batched sync loop can greedily drain the stripe cache withou=
t yielding, causing severe latency spikes and potentially starving user I/O=
.
> --
>
> --- Patch [1]: [PATCH 1/2] md/raid5: submit a window of stripes during re=
sync/recovery ---
> commit 2b3cdb45d82bdea6112cba5dad14b59ec3acb23a
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md/raid5: submit a window of stripes during resync/recovery
>
> This patch updates the RAID5 sync path to dispatch a batch of up to 32
> stripes per call instead of just one. It throttles only on the first stri=
pe,
> allowing subsequent stripes to be submitted without blocking to improve
> resync performance.
>
>> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
>> index 0c5c9fb0606ee..574880e4f23fe 100644
>> --- a/drivers/md/raid5.c
>> +++ b/drivers/md/raid5.c
> [ ... ]
>> @@ -6640,13 +6632,42 @@ static inline sector_t raid5_sync_request(struct=
 mddev *mddev, sector_t sector_n
> [ ... ]
>> +	/* Submit remaining stripes in the window non-blocking.  Stop early
>> +	 * if the stripe cache is full: the disk queue is already saturated.
>> +	 * Bound by resync_max so a user- or cluster-imposed sync ceiling is
>> +	 * not overshot.
>> +	 */
>> +	win_sector =3D sector_nr + RAID5_STRIPE_SECTORS(conf);
>> +	for (submitted =3D 1;
>> +	     submitted < RAID5_SYNC_WINDOW && win_sector < max_sector &&
>> +	     win_sector < mddev->resync_max;
>> +	     submitted++, win_sector +=3D RAID5_STRIPE_SECTORS(conf)) {
>> +		sh =3D raid5_get_active_stripe(conf, NULL, win_sector,
>> +					     R5_GAS_NOBLOCK);
>> +		if (!sh)
>> +			break;
> [Severity: High]
> Can this batched sync loop greedily drain the stripe cache without yieldi=
ng to
> user I/O?
>
> During array resync or recovery, this loop acquires up to 32 free stripes
> sequentially. Could this starve user I/O threads that are blocked on the
> conf->wait_for_stripe waitqueue, since it doesn't check if user I/O is wa=
iting
> (e.g., via waitqueue_active(&conf->wait_for_stripe)) before getting the n=
ext
> stripe?

This make sense, always submit 32 stripes at a time will against the thrott=
ling rules
from sync_io_depth. Please check this in sync_io_within_limit(), and do not=
 exceed
the limit.

>
>> +		md_bitmap_start_sync(mddev, win_sector, &sync_blocks,
>> +				     still_degraded);
>> +		set_bit(STRIPE_SYNC_REQUESTED, &sh->state);
>> +		set_bit(STRIPE_HANDLE, &sh->state);
>> +		raid5_release_stripe(sh);
>> +	}
>> +
>> +	return submitted * RAID5_STRIPE_SECTORS(conf);
>>   }

--=20
Thanks,
Kuai
