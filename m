Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A922C08DC
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511089; cv=none; b=Fi0E4L66a58G5SOrVfYuKxFHPYHwrNcJDYprRQUE1BIJvGcJNkMW7SYc4QvSBnibGyAgCUkzMkP1Ocp+o4twQWrEU73LgzRikbT8DBysvWcmKCIpKBICsNtVtZCe2CroXWPROE0zU1VQ4FmPtOj5CM1GOVzAPHV34AOmn/yTYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511089; c=relaxed/simple;
	bh=vkAjOTN2OSxQ3NT6LfnmMdKXifOjLa41qAT64P/56SY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U95dCBDhhahWwEf3PWr9da/gu08Z1SRn6Me5Ih+ppHGxmpG6GlElKxG02mCSvL5GB2tMDyaE83n7sT2iweHq3mZmJ2XNl8+278PRwtJcJ2tplrMCsGsoBsCDYgkIZ1ylXLQFrCsDE0qI/DzifQ53rEJO4dFgPR+YZTetnEA2FKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5k8CARg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5k8CARg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2439560f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781511086; x=1782115886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHKH4L1yXonvQGqJbkYblMaxDoWz9KlhZVMxCLtZwmI=;
        b=F5k8CARg1kNcKo8HQIYuZTRi7WYowbZSsaSzahtYhS6R4bjDPD+930pO0D7hkrpv7D
         NBb1AcvFAbR+e/oCOvnmcuqnS1sTPXk+8sqybFUI9OG7+QjvZOSmSeuMQHXMOmcgYDkW
         tOwr03lKLj5KAlGw5NJtoktuwec3Vg4H8mXMVM4wqvh3Xqx6ZRx5L1SrnHIPHd+WTk1h
         F+zq/xuSCe0OwKY+z4r/CaU/TaFcvqsaXaJfNjNXBqpgBQCue6wxOKqGif68puyAnvyD
         bWvuzcXtwLz5+1N4Jmw7V3+qBqJegztcB0n4Ue6LiYnKw0tHTyBtP3ElVWSPzq/gqucV
         ms3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511086; x=1782115886;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MHKH4L1yXonvQGqJbkYblMaxDoWz9KlhZVMxCLtZwmI=;
        b=o36oJvVyZLlXBL7TEIj+9W/BmXg5u/dRL7ddbRrhcTqH1c7ArWi4QW+d+Sn/xDpgT+
         LdZXJonqxr04xsn1a96jxAHTVJkVmK24zIBaTQpVrEEV9yq/9vSL6YPD4NYDxS7pwAIm
         EH64U0iR3dLKBabXD7bMkXc4DiVnYHuPkrGE8qW9n8OI1Z151B0Epk1nzyAWEeeOS3po
         jz26gL0RPDWWuGqYBJjMZlVhPJjJUl4Z9kPi5GqU+3Z9UeWq/MXSi3iPQHAHEAD0cbE4
         HOCEtVx8Jf+Tlt1iFXUQOTzdwJx5TYeRBPKkBFGetNAhfKeULbAzhfcl4JeL2kIj7/Iz
         5XTQ==
X-Gm-Message-State: AOJu0YwhiRN0KP7pxuLP6Wd2oZ3wv7CJhHgy3sZYFFMtBfbbElAOXiPW
	j0NIr6+FDzDwkO/M2xiKAOHVfQmhgta/9V+pZqwIcnk+N19u/XjNytc2
X-Gm-Gg: Acq92OEYK5PWs0TU1QWwJImyC23aT1uvl53ookPJ2NkQZrp4RycdeTRS/PTtA9ZuQnU
	OZXNsyg/zsi47yZdgervJTh0/vK3efPVnkRc/cBF/rli4wutzJXYbqzcUm+Ap4PioHrj9n6oHvx
	VsKWOwGrcODFaChn9/gZoqWiKLvSp0AAjx8WDkDXzfHTkwy/9CfpgxtuXysh8MP20IfEgRUDptv
	hwD4gLmSX2qDMvfuNswG90BUoXWp/Na6Fkvc3wnRQMzyZO9w8IspFPJIsVVrOtdUAheOasWfxbK
	+g23DMUwOUVjz8xrb1bmDR0eUX/ZBRYeTkmnMCD9DkOOHmuA3CDNjRr5bAxxskEOwDb4QQNxWSZ
	6WhWWDumomg+Itu0LNtVKdJG5NZ8JVYLk74IBCFcon/D973Wj1Dyxm7oerEA2h663PctqK2cdKT
	TU87nIL6SV9OYCUg8awr9JvTt2AWK6hOIjQlBu2ncGoBQbTDYQA/oEkiDFmq1kpcZNZC8=
X-Received: by 2002:a05:6000:38f:b0:460:6a3d:a114 with SMTP id ffacd0b85a97d-4606d140526mr14759830f8f.30.1781511085719;
        Mon, 15 Jun 2026 01:11:25 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([141.2.113.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e6a8fsm32626107f8f.37.2026.06.15.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:11:25 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Subject: Re: [PATCH v2 4/4] md/raid1: simplify raid1_write_request() error
 handling
In-Reply-To: <20260613184757.57BC51F000E9@smtp.kernel.org>
References: <20260613182810.1317258-5-abd.masalkhi@gmail.com>
 <20260613184757.57BC51F000E9@smtp.kernel.org>
Date: Mon, 15 Jun 2026 10:11:24 +0200
Message-ID: <m21pe8xlxv.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Kuai,

On Sat, Jun 13, 2026 at 18:47 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Moving `atomic_inc(&rdev->nr_pending)` down opens a race win=
dow with `hot_remove_disk`, leading to a NULL pointer dereference during er=
ror handling or a Use-After-Free in clustered configurations.
>

I don't think this can happen. the array must be suspended before any
disk can be removed.

> Pre-existing issues:
> - [High] A `REQ_ATOMIC` write can be silently split if a bad block overla=
ps the start of the write, violating atomicity guarantees.

I don't think this is possible. bio_submit_split_bioset() will fail
rather than split the bio.

> --
>
> commit c334f57d91677f32131f21e50bb32b83136e5a60
> Author: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>
> md/raid1: simplify raid1_write_request() error handling
>
> This commit delays the rdev->nr_pending increment until after badblocks
> are checked to avoid incrementing and immediately decrementing on skipped
> devices. It also consolidates error handling paths and modifies REQ_ATOMIC
> failures to complete with BLK_STS_NOTSUPP instead of I/O errors.
>
>> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
>> index 632d72607e11e..86d4f224ffb11 100644
>> --- a/drivers/md/raid1.c
>> +++ b/drivers/md/raid1.c
> [ ... ]
>> @@ -1576,23 +1573,21 @@ static bool raid1_write_request(struct mddev *md=
dev, struct bio *bio,
>>  		if (!rdev || test_bit(Faulty, &rdev->flags))
>>  			continue;
>>=20=20
>> -		atomic_inc(&rdev->nr_pending);
>>  		if (test_bit(WriteErrorSeen, &rdev->flags)) {
>>  			sector_t first_bad;
>>  			sector_t bad_sectors;
>>  			int is_bad;
>>=20=20
>> -			is_bad =3D is_badblock(rdev, r1_bio->sector, max_sectors,
>> +			is_bad =3D is_badblock(rdev, sector, max_sectors,
>>  					     &first_bad, &bad_sectors);
>> -			if (is_bad && first_bad <=3D r1_bio->sector) {
>> +			if (is_bad && first_bad <=3D sector) {
>>  				/* Cannot write here at all */
>> -				bad_sectors -=3D (r1_bio->sector - first_bad);
>> +				bad_sectors -=3D (sector - first_bad);
>>  				if (bad_sectors < max_sectors)
>>  					/* mustn't write more than bad_sectors
>>  					 * to other devices yet
>>  					 */
>>  					max_sectors =3D bad_sectors;
>> -				rdev_dec_pending(rdev, mddev);
>>  				continue;
>
> [Severity: High]
> This is a pre-existing issue, but does this logic skip the rejection of
> REQ_ATOMIC bios if a bad block overlaps the start of the write?
>
> When is_badblock() finds a bad block at or before the write sector, the
> code shrinks max_sectors to force a split at the boundary and then calls
> continue. Because of the continue, the REQ_ATOMIC bio skips the rejection
> logic below.
>
> Could this silently split an atomic write into smaller pieces and submit
> them to the healthy mirrors via bio_submit_split_bioset(), violating
> block-level atomicity guarantees?
>
>>  			}
>>  			if (is_bad) {
> [ ... ]
>>  				if (bio->bi_opf & REQ_ATOMIC) {
>> -					rdev_dec_pending(rdev, mddev);
>> -					goto err_handle;
>> +					bio->bi_status =3D BLK_STS_NOTSUPP;
>> +					bio_endio(bio);

I misunderstood the comment. it should call bio_io_error(bio) instead.
I'll fix this in v3.

>> +					goto err_dec_pending;
>>  				}
>>=20=20
>> -				good_sectors =3D first_bad - r1_bio->sector;
>> +				good_sectors =3D first_bad - sector;
>>  				if (good_sectors < max_sectors)
>>  					max_sectors =3D good_sectors;
>>  			}
>>  		}
>> +
>> +		atomic_inc(&rdev->nr_pending);
>
> [Severity: Critical]
> Does moving atomic_inc(&rdev->nr_pending) down open a race window with
> hot_remove_disk()?
>
> Because nr_pending acts as an existence lock that prevents the device from
> being removed from the array configuration by raid1_remove_conf(),
> incrementing it after the is_badblock() and test_bit(WriteErrorSeen, ...)
> checks means md_check_recovery() could evaluate rdev_removeable() while
> nr_pending is 0 and call hot_remove_disk().
>
> If raid1_remove_conf() unlinks the device by setting
> conf->mirrors[i].rdev =3D NULL, when this thread resumes and the I/O
> eventually fails, would the error handling path (handle_write_finished()
> calling narrow_write_error()) read conf->mirrors[i].rdev and dereference a
> NULL pointer?
>
> Additionally, in clustered configurations, if the unlinked rdev is
> immediately freed by md_kick_rdev_from_array(), could this lead to a
> use-after-free directly in raid1_write_request() when evaluating
> test_bit(WriteErrorSeen, &rdev->flags) or is_badblock()?
>
>>  		r1_bio->bios[i] =3D bio;
>>  	}
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613182810.13=
17258-1-abd.masalkhi@gmail.com?part=3D4

--=20
Best Regards,
Abd-Alrhman
