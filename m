Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C053B71C5
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782682511; cv=none; b=RtcyDP5nBHB2fLMZFN4m7tO/SDAy168KxFPnzOY5CZLNuy2xGKWB1BHHDrsprw7rReqiCrP46NW2M8n7d62zLSzDVU+1fwqHAl1ZeSPNg2pOyC3c7zKmKbjA+KQfbN36ppiA6MqFBasV1ywLYWToNm84LAezfXZNipTxdw73bvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782682511; c=relaxed/simple;
	bh=g0M6Gwoyc38onI+2UIz19L5eRvWvC+eUuXD2IhLd5rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BgxqtJHZ56q1t6nFU4D4YKq+hrJAh1rz9PST70m/gjx89fZNbCw/ZOMcu03fKZyGhoKhNYQwbRITw/dBZyeg+99FvyxCI7V43UGsT8DjbsyXPUdaNirzr5JmF07gz93w5/UIdkqyAi1W0PBEhotofz1Ke6Uh7jE9ytso58b+WRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8ziGHol; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8ziGHol"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46fe472da0dso1597688f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782682506; x=1783287306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9LXqxr2JxWOgeCvYiMaDiXo7ssMBku/dDXWkHsZyng=;
        b=f8ziGHolaZ++6s2XGpZj5YnD/n3XLTALG4UXvTatMcaJmdbQV9YzKUHgvwminTWW6Q
         aU9WeeWVbGbLlQv7FOJkTfY1qF00Rp5LuTEhbsEnLJH2+2U/8hGH/9SJo/aVA1qsVTBO
         xB1NM44d/OynQHoRrtLwWaZeuRSRTkUPLkzh1Usod/TViSGt7jBDAS6Cv9zIWVG3x3u/
         t2ZWVxp8RmMKJgK+WHhgJ/p5Ib2Zybeew25Rin8C180e2hm29V794W/r4ZAcObhUQn/Y
         7seuoukhnRxCKTmIifKfcpLwt8q+aTANBA175S8dpNo8IP+l/3dKDva9QSH0ikLFh+it
         OpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782682506; x=1783287306;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9LXqxr2JxWOgeCvYiMaDiXo7ssMBku/dDXWkHsZyng=;
        b=KfMkVis3Q3wsI4llKKbUaRUl78QAA2za61Jt70JdilKoe4rpPYh2W3tji70IfKG/Dp
         NRFjeEo1WWihvQq4spqQz9esb9oLbNTZfp2QMQn4N0+RBYubWofvc6UiVenwbXBe81Bu
         bb5sDfnpLMvAREWQ0HIlKW6AmXhFu+sfobNGn8mfiJ3q5fanQ/iz4MsJ4g4YDqXu0Qal
         L77E0ZeqCkGDp6sxkdzfyx+DOVJwkjo8yCDN8hMwK+j504u+qwnp5BmA4ucKfKWSuBld
         p+Nx+vLv6SwbAzTIhinq5ZNhYozdrHThn6ELLi5ZyQVWZhqTzmt6xYjuN6exPg6QRoOM
         uZ2A==
X-Gm-Message-State: AOJu0Yz6920Yc0iTAhYlS944ckBKM7jL1u1Yv2U0J+G7t5FiInFXJukA
	HQD0YbgBNjqhnKnbeD4+2mKC5JZuyUkc36vNGB/Mnu1NNeHY18AIWeNgL3joCg==
X-Gm-Gg: AfdE7cnQ/GFvmFy7qnqrFzfkt2qhnbI36/IiVT2wYT32FmlB2j44uU5H/Gixn1MolWC
	7OxKqHCEoc9OUDDdHFTIRobfMgWI5YGt8CpXDg2JFQpZMmVWmkUBniTfwes7U2nU4boCXd+Q+f3
	2Wigdq0yav6UZ6+Fw0bGRl7eCco81OrintAcOuHmzYCH4kQedqBdzqBiwmreHNCb2C+xak9zaCm
	Hj5Jj1+y2Gb+YbhABn5uxfAar6sTvxKHM3oieaz2dkrjtahiuzw1WGpvkH/o9h4P2hrU+dOvYzp
	qZDyZQsnQn00yIcP28IBg0Jwg70CWW/XDdJvYuGKwF6J/F6AEcdiBpDWO9t18fpuIdY8HqLmSmS
	3ECw5Q5uSPlZX80d3wlS5i7mfOkLLsN1dTaCd67v3p8kDYwroAMCKTTqcdd/Y0iAZe3zsL+RsCx
	0zbc0fBF+QK0vquONayKG5UOkobbY6BX903pud+hxszsnoOMA4YnplZAjjaZd7RZhd
X-Received: by 2002:a05:6000:200c:b0:474:fb6:b049 with SMTP id ffacd0b85a97d-4740fb6b245mr501849f8f.38.1782682506187;
        Sun, 28 Jun 2026 14:35:06 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([2a02:3037:668:70cd:15f7:baa:434f:df10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93eesm42647287f8f.20.2026.06.28.14.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:35:04 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Subject: Re: [PATCH v2 3/7] md/raid10: consistently fail atomic writes that
 require splitting
In-Reply-To: <20260628143620.64A6C1F000E9@smtp.kernel.org>
References: <20260628142420.1051027-1-abd.masalkhi@gmail.com>
 <20260628142420.1051027-4-abd.masalkhi@gmail.com>
 <20260628143620.64A6C1F000E9@smtp.kernel.org>
Date: Sun, 28 Jun 2026 23:35:02 +0200
Message-ID: <m2v7b2z6ux.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Kuai,

On Sun, Jun 28, 2026 at 14:36 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The `err_dec_pending` (formerly `err_handle`) cleanup path in `r=
aid10_write_request` can trigger a NULL pointer dereference when a replacem=
ent device is promoted concurrently.
> --
>
> commit bc9d81fdb2c33f8c55baad27ab1eedf427ae25ed
> Author: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>
> md/raid10: consistently fail atomic writes that require splitting
>
> RAID10 handles one badblock path explicitly by failing atomic writes with
> EIO, but another path can also reduce the writable range and force the bio
> through bio_submit_split_bioset(), completing it with EINVAL. This commit
> centralizes the check to fail all atomic writes requiring splitting with
> EIO.
>
>> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
>> index bd322eccdc3ff..3480fc7907f01 100644
>> --- a/drivers/md/raid10.c
>> +++ b/drivers/md/raid10.c
> [ ... ]
>> @@ -1493,6 +1484,9 @@ static bool raid10_write_request(struct mddev *mdd=
ev, struct bio *bio,
>>  		r10_bio->sectors =3D max_sectors;
>>=20=20
>>  	if (r10_bio->sectors < bio_sectors(bio)) {
>> +		if (atomic)
>> +			goto err_handle;
>> +
>
> [Severity: High]
> This is a pre-existing issue, but can this jump to the error handler caus=
e a
> null pointer dereference if a replacement device is concurrently promoted?
>
> In the error handler path, the code fetches the replacement device without
> checking for null or falling back to the primary slot:
>
> err_handle:
> 	for (k =3D 0;  k < i; k++) {
> 		int d =3D r10_bio->devs[k].devnum;
> 		struct md_rdev *rrdev =3D conf->mirrors[d].replacement;
> 		...
> 		if (r10_bio->devs[k].repl_bio) {
> 			rdev_dec_pending(rrdev, mddev);
> 			r10_bio->devs[k].repl_bio =3D NULL;
> 		}
> 	}
>
> If raid10_remove_disk() runs concurrently, it can promote the replacement=
 to
> the primary slot and clear conf->mirrors[d].replacement:
>
> raid10_remove_disk() {
> 	...
> 	WRITE_ONCE(*rdevp, NULL);
> 	if (p->replacement) {
> 		WRITE_ONCE(p->rdev, p->replacement);
> 		clear_bit(Replacement, &p->replacement->flags);
> 		WRITE_ONCE(p->replacement, NULL);
> 	}
> 	...
> }
>
At first look this looks unreachable, because raid10_remove_disk()
should only run while the array is suspended, which would drain the
in-flight write before any promotion. But that assumption does not hold
on the md_start_sync() path. The suspend there is gated on a lock-free
check of md_spares_need_change() taken once at function entry; we only
suspend if it returns true. We then call remove_spares()
unconditionally, regardless of that earlier decision, and
remove_spares() re-evaluates rdev_removeable() independently under the
lock.

So the suspend decision and the actual removal are sampled at different
times with nothing held across them. A primary that was In_sync at the
entry check (suspend skipped) but fails afterward becomes removeable by
the time remove_spares() runs, and raid10_remove_disk() then promotes
the replacement and clears the slot with no suspend in effect. Meanwhile
an in-flight raid10_write_request() that referenced only the replacement
(because the primary was already Faulty when it ran) can be sitting in
err_handle, and it reads conf->mirrors[d].replacement as NULL.

It seems real. I'll submit a fix addressing this issue.

> If this concurrent promotion happens, will rrdev be null here? It looks l=
ike
> other paths such as raid10_end_write_request() safely handle this exact
> race by falling back to rdev when replacement is null, but this cleanup
> path does not.
>
>>  		allow_barrier(conf);
>>  		bio =3D bio_submit_split_bioset(bio, r10_bio->sectors,
>>  					      &conf->bio_split);
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628142420.10=
51027-1-abd.masalkhi@gmail.com?part=3D3

--=20
Best Regards,
Abd-Alrhman
