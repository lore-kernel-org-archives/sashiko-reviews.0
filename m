Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC48F49
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844955; cv=none; b=MUiwnilSsJdtGnAIkJ8dK+0qZsAnoC4IHHXrCCAz0JowsG0F4fKQp4obxZBuGPZKK0ZLkEfyimRsLZQ1Lfj2jxrnwkb0zWc2Jai0NpStT9hs+eAfEz+2zlfAUtRLO/aaCA30RV8MpEDNJHdOeJZRUH1CY41aIMLjABGFbmrNzGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844955; c=relaxed/simple;
	bh=2N7aF5Va3Kpbp/jh/DJivxZPuHiAClh4sTv7kIihI0E=;
	h=Date:Message-Id:Mime-Version:Content-Type:To:From:Subject:
	 In-Reply-To:References:Cc; b=NCRO9/L2NpsdJisqIxabgSp4IA5HenS9Wh7j5RSnT1kow2LB4GUZhQhVycSzgDOGZvPPwkDdVK9GoJ9CBv2ZChUYx4tCbp6Fdjb1QEqPvdNiPRd8Ck+WxpWBQG0qGqRromg9JmtJBnHjxsMRtdXSHuDwcroIDc2o+NXn5UXh/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=DRbKavPv; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="DRbKavPv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1781844948;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ctSG7S+aI0m/BrlvwKZNwUMMch2JYmi2vbI/B7Q3hRg=;
 b=DRbKavPvUQ/OFejTaZ1L0B66LGiFNuWUBRSrVIXofLBFaNQt6WXukW13g3vX81rsoNI6my
 BFCgz5NsjwqabLFAp7H0vEHaJ7tytoGOY2jaPE/w9OX7yDmJjhjKVL4Mew3J6GlDoiakWi
 Hw+EJ01NIwNxLKu4ixi7J5FF1s7ZSOnWy5PnBHdECrHntGh6wker4HsAj5bOPXCGMFLA2J
 15El7+wcBIG/nMe3oTlifp0GnqSDpNiNWHEpRo/WGUEfFxnDEfW0VuH5h5ZoWsJlDR8BgD
 Wso2whOYH4k61qqa1VclRHCjGbxml1WEtOn+iQIO5FuPs7NYp/3V1wzEGqXu+Q==
X-Original-From: Chen Cheng <chencheng@fnnas.com>
Date: Fri, 19 Jun 2026 12:55:44 +0800
Message-Id: <03e65404-e103-4079-9763-b4ae7a5c489c@fnnas.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: <sashiko-reviews@lists.linux.dev>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26a34cbd2+83ca2b+lists.linux.dev+chencheng@fnnas.com>
From: "Chen Cheng" <chencheng@fnnas.com>
Subject: Re: [PATCH] md/raid1: protect head_position for read balance
Received: from [192.168.8.62] ([183.34.170.142]) by smtp.feishu.cn with ESMTPS; Fri, 19 Jun 2026 12:55:45 +0800
In-Reply-To: <20260619045116.E12901F000E9@smtp.kernel.org>
References: <20260619044114.1208456-1-chencheng@fnnas.com> <20260619045116.E12901F000E9@smtp.kernel.org>
Cc: <yukuai@fygo.io>, <linux-raid@vger.kernel.org>

=E5=9C=A8 2026/6/19 12:51, sashiko-bot@kernel.org =E5=86=99=E9=81=93:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [Medium] The commit fixes a KCSAN-reported data race on `head_position`=
 in `raid1.c` but misses the identical data race in the sibling `raid10.c` =
subsystem.
> - [Medium] The patch addresses a KCSAN data race for `head_position` but =
misses identical concurrent data races on adjacent heuristic variables `nex=
t_seq_sect` and `seq_start`, leading to a potential double-fetch bug and un=
signed integer underflow.
> --
>=20
> commit 754549019263d81271c296e50e19909fb366125b
> Author: Chen Cheng <chencheng@fnnas.com>
>=20
> md/raid1: protect head_position for read balance
>=20
> KCSAN reports a data race between raid1_end_read_request() and
> raid1_read_request().
>=20
> The completion path updates conf->mirrors[disk].head_position in
> update_head_pos() without a lock, while the read-balance heuristic reads
> the same field locklessly in is_sequential() and choose_best_rdev().
>=20
> [Severity: Medium]
> This is a pre-existing issue, but does raid10 also need this same fix?
>=20
> Looking at drivers/md/raid10.c, update_head_pos() updates
> conf->mirrors[r10_bio->devs[slot].devnum].head_position locklessly, and
> read_balance() reads it locklessly:
>=20
> drivers/md/raid10.c:read_balance() {
> ...
> 	new_distance =3D abs(r10_bio->devs[slot].addr -
> 			   conf->mirrors[disk].head_position);
> ...
> }
>=20
> Since raid10 shares this read-balancing heuristic, should the data race b=
e
> addressed there as well to prevent torn reads?
>=20
> [ ... ]
>=20

sure, already submited in another patch .


>> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
>> index 5b9368bd9e700..4cdf4484cab6c 100644
>> --- a/drivers/md/raid1.c
>> +++ b/drivers/md/raid1.c
> [ ... ]
>> @@ -737,7 +737,7 @@ static bool is_sequential(struct r1conf *conf, int d=
isk, struct r1bio *r1_bio)
>>   {
>>   	/* TODO: address issues with this check and concurrency. */
>>   	return conf->mirrors[disk].next_seq_sect =3D=3D r1_bio->sector ||
>> -	       conf->mirrors[disk].head_position =3D=3D r1_bio->sector;
>> +	       READ_ONCE(conf->mirrors[disk].head_position) =3D=3D r1_bio->sec=
tor;
>>   }
>=20
> [Severity: Medium]
> This is a pre-existing issue, but should next_seq_sect and seq_start also
> be protected to prevent double-fetch bugs and underflows?
>=20
> While this patch secures head_position, next_seq_sect is still read lockl=
essly
> here and in should_choose_next():
>=20
> drivers/md/raid1.c:should_choose_next() {
> ...
> 	return opt_iosize > 0 && mirror->seq_start !=3D MaxSector &&
> 	       mirror->next_seq_sect > opt_iosize &&
> 	       mirror->next_seq_sect - opt_iosize >=3D mirror->seq_start;
> }
>=20
> Because mirror->next_seq_sect is read multiple times without READ_ONCE(),
> could the compiler emit multiple memory loads?
>=20
> If a concurrent update from update_read_sectors() reduces next_seq_sect
> after the safety check (mirror->next_seq_sect > opt_iosize) but before th=
e
> subtraction, could it cause an unsigned integer underflow, bypassing the
> seq_start check?
>=20

good catch , and , I notice either. I will submit in separate patch .
