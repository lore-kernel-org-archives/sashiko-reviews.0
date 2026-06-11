Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A73C5848
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174981; cv=none; b=cNn3chpB4+z9MoC5OdVFJGGLXjg3Eq5vKfPTIzSBpvzg/Z3wpiO6iy34xESOfvNOHT8DMXVcW1xvfOpdBeZZLyL/RsdsZZEVTL6QynthZ0+q8pbanBGGi4KVKqEQQwkMi/q6OiXkzdjWGGsTVeXlfalkVwWIXzIdgIPvkmwMOxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174981; c=relaxed/simple;
	bh=QxGt/qZpuh428S/K37oa/qKWhwxFOqVXN3XsqIbVzE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lfjn+AEphc3udIwwvKy90WKbns552ghugqqxBTioe20S4O+O3BE58C4C//n9ekb2L/qjDFV5ovDmgJ0rs/7MxxC+wbCYIanA5cMZjktOCqqdHqT7d0+s0APnF4lT8PljZPzGWHGvrLHtCRnvDrTTLJFuWqMXOWFVsjvybxDnXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssInbDwn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssInbDwn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b915ded5so69301475e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781174978; x=1781779778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwscJafaBugtAFcCVftAtVPNwhT6yYdKLLF+cCtGgwU=;
        b=ssInbDwn42+pzqhcoiDDlrlYKaZMA3G6a5uLo72xNYt0n84zokTIa294O7qReNYWVp
         CUKLIYrmFPiY1A37YNLJ6Z9EEU3tylFFOSOnG+h2lGl2pE4hB8y4XyGMlbV2nAe1CJB+
         hHJ+NRqhcoe6EAnPwP1pbeFvtkq6HhIr0q8XfiQ7BQqJuUClplH2QTiZBOGZJ48guaWr
         nkJMGdZM0HGWS/tSCkNp14o8QN7Ire+4rl6iYz7cavXRUAKNwuG9+vGGoxr9TpaVozHD
         7PjKuxzNdQNP5hMRPHoRtryjZxX1CD24twacqbw/8qXohRkOFy1gsIWAn6+tUp4Jz0m6
         LD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174978; x=1781779778;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwscJafaBugtAFcCVftAtVPNwhT6yYdKLLF+cCtGgwU=;
        b=Ntnz6dJtOA8W14G48Xz+JPMRTIBZj9vzShIUFreB8Besoidx38cuPYCBJc5gGGC2bO
         XWHPFlVo/3Kvu/0SiT9u4UZ6jRVT2NctWM2tpo4SdeMWwshVzbiEFmhOWmV78KLus1vC
         hl1bLqdYC6pbippOHHYv8S6pZh3LbFTZJtsBnAtdGRY/laX5DrPqx92rhd8iWtjJ5qLG
         J3l+/KXuUuRRtkKJ6zJ8jaDqvFLQAG8pVwDB6+sM510USkh2IF6/NaEIutPzaCoC98ff
         KGaa5y2q7tysQrimGTngEpGMxatyX3aOuPE7HYjS/U0Y3GB92YEMbVQxv/EFt5YEZKBC
         YTsA==
X-Gm-Message-State: AOJu0YzYAO1UGgfFhWAhE238Wz2F1+FPtz/RIv6CbZJN1eSTWxsv8jlQ
	lkvvxr4YwiUet4KXChwFHcliG17dWZKsSPQMbfQcALM1tS0ESNM+TwU5ZU8YCQ==
X-Gm-Gg: Acq92OH9PFr64c85+nKW2jYj/X5qd2Wwec97EI3Xojn+/qtR8qi6PreGsaIBr+x+j5k
	mlTEl1OBQUUYKgNkTPYQ6heQpn13V4JryRM2mOzLEaCuylvrPPglo7Ft2T32GeCQX+TEdhAFhro
	6g/wqWkUOWv/Zl1iJ2a0ok4HTm2kEXwYXN2xnSxGjY4YMfboazQxpysBhJqcjH++vTj6JhQTlz3
	vd0XqikZkyZHy07yBYI94/8kspfpwnE0y4S/WShwtOJ8w+UcYq+CpjUicbae/2kblnla95Qk0tl
	K1fKN5WGobhmPpwqkbQL22GCFFjb/HxwkT/EjH/YIzfSLmJwtptgcVYI8LW9drm2H289c/InNVd
	naYSECFzwNkGkRuT4FNDI/7QiK6/mP9cBEJdrol+2HJxdWlr7CwzRwE463dQj4YaukklThbIJgU
	RCjUA6/xOk/Bf8bk3/7cE09Qf6SdT1UKx+lDbHzbBvKUv6uzoUHLYY8PZ7Vs0WpFzvSaI=
X-Received: by 2002:a05:600c:4e0c:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490e5379dbbmr34829715e9.0.1781174978208;
        Thu, 11 Jun 2026 03:49:38 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([141.2.113.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf582bsm60351095e9.10.2026.06.11.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:49:37 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
Subject: Re: [PATCH] md/raid1: honor REQ_NOWAIT when waiting for behind writes
In-Reply-To: <20260611084953.E078E1F00898@smtp.kernel.org>
References: <20260611083514.754922-1-abd.masalkhi@gmail.com>
 <20260611084953.E078E1F00898@smtp.kernel.org>
Date: Thu, 11 Jun 2026 12:49:30 +0200
Message-ID: <m2y0gll5c5.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 08:49 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Leaking pre-allocated `r1_bio` when `REQ_NOWAIT` reads fail `wai=
t_read_barrier()` during retry.
> - [High] Permanent barrier leak if a REQ_NOWAIT write encounters a blocke=
d device.
> - [Medium] REQ_NOWAIT semantics violation: memory allocations use GFP_NOI=
O unconditionally.

These appear to be pre-existing issues rather than being introduced by
this patch. I plan to address them in separate patches.

> --
>
> commit 7fed7389f4fe20e79eece974eaf3b8d317519e27
> Author: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>
> md/raid1: honor REQ_NOWAIT when waiting for behind writes
>
> This commit ensures that raid1 consistently honors REQ_NOWAIT reads
> across paths that may otherwise wait for behind writes. It modifies
> bitmap_wait_behind_writes() to return early instead of sleeping if
> the nowait flag is set.
>
>> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
>> index 5b9368bd9e700..d03da046a5920 100644
>> --- a/drivers/md/raid1.c
>> +++ b/drivers/md/raid1.c
> [ ... ]
>> @@ -1360,8 +1361,7 @@ static void raid1_read_request(struct mddev *mddev=
, struct bio *bio,
>>  	 * Still need barrier for READ in case that whole
>>  	 * array is frozen.
>>  	 */
>> -	if (!wait_read_barrier(conf, bio->bi_iter.bi_sector,
>> -				bio->bi_opf & REQ_NOWAIT)) {
>> +	if (!wait_read_barrier(conf, bio->bi_iter.bi_sector, nowait)) {
>>  		bio_wouldblock_error(bio);
>>  		return;
>>  	}
>
> [Severity: High]
> This is a pre-existing issue, but does this early return leak the=20
> pre-allocated r1_bio when wait_read_barrier() fails during a retry?
>
> When a REQ_NOWAIT read fails its initial attempt, it is queued to the=20
> retry_list and handled by the raid1d thread via handle_read_error().
>
> That function passes the existing, pre-allocated r1_bio back to=20
> raid1_read_request():
>
> drivers/md/raid1.c:handle_read_error() {
>     ...
>     raid1_read_request(mddev, bio, r1_bio->sectors, r1_bio);
>     allow_barrier(conf, sector);
>     ...
> }
>
> If the array is concurrently frozen, wait_read_barrier() returns false=20
> since REQ_NOWAIT is still set on the master bio. The code handles this=20
> by returning immediately, bypassing the err_handle cleanup path and=20
> failing to call raid_end_bio_io().
>
> Since handle_read_error() assumes ownership was taken and only releases=20
> its old barrier, does this result in a permanent memory leak of the=20
> r1_bio from the r1bio_pool mempool?
>
> [Severity: Medium]
> This is another pre-existing issue, but does the allocation path for=20
> REQ_NOWAIT bios violate block layer non-blocking semantics by=20
> unconditionally using GFP_NOIO?
>
> Even when REQ_NOWAIT is requested, alloc_r1bio() uses GFP_NOIO=20
> unconditionally:
>
> drivers/md/raid1.c:alloc_r1bio() {
>     ...
>     r1_bio =3D mempool_alloc(conf->r1bio_pool, GFP_NOIO);
>     ...
> }
>
> Similarly, bio_alloc_clone() in raid1_read_request() unconditionally=20
> uses gfp flags that include __GFP_DIRECT_RECLAIM.
>
> Since mempool-backed allocations will sleep under memory pressure=20
> instead of failing immediately when these flags are used, will this=20
> cause unexpected high latencies and potential priority inversion in=20
> asynchronous contexts?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does=20
> raid1_write_request() permanently leak the barrier if a REQ_NOWAIT=20
> write encounters a blocked device?
>
> In raid1_write_request(), the code successfully acquires a barrier by=20
> calling wait_barrier(), which internally increments conf->nr_pending.
>
> Immediately after, it calls wait_blocked_rdev():
>
> drivers/md/raid1.c:raid1_write_request() {
>     ...
>     if (!wait_blocked_rdev(mddev, bio)) {
>         bio_wouldblock_error(bio);
>         return;
>     }
>     ...
> }
>
> If the device is blocked and the request is REQ_NOWAIT,=20
> wait_blocked_rdev() returns false and the function returns early.=20
> However, it fails to call allow_barrier() before returning to drop=20
> the previously acquired barrier increment.
>
> Because freeze_array() waits for nr_pending to reach 0, could this=20
> permanently prevent the array from ever freezing again, deadlocking=20
> resyncs, reconfiguration, and array teardown?
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611083514.75=
4922-1-abd.masalkhi@gmail.com?part=3D1

--=20
Best Regards,
Abd-Alrhman
