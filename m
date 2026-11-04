Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825414;
	b=5OeuUtfc7FJbdCIb/Dv6rxKTZcdGC1Bsb4GtKlmf+OiVCrKrZv81YdNn4w1xgth3jehu
	 6Gx6pa9ngEybBJmhtA9wUnirhnFV1OoMmIILBezu0MJTqNTzmn4FLFnxE+SlZqz12Ogyk
	 Qxu2OfL95iRssGl0WmpPr05gDVP8PMc7RXu7DoWUWNY/767HvV9ThBU8YN7AzChHiAQyK
	 50UKxT66OH5ToF8xKQdzICqbULZURzeKAq2N0bnRpZh30ObwKuEO2xTMev+8HqehCgTwX
	 5qR+SDUTjTDwwRPY0O/Z2JjNlCTEDVTrOzgBznTBmkGkY4fBGtPSshgM5kHRte2EAHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825414;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-ID:X-MBO-RS-META;
	bh=j0tKPRW7itGb4wd98itoSibtROi/TSSvYQx4Adk0Nuc=;
	b=swyiYTzhREGgIREWR+n44PxlZJLpbbd0Be0PR2x9TO7ILBhyZng76BqyO/drQLzN/TSz
	 N2OjDY+2bTN8+wpjx+OGCOv6feUDC3UeX8z29EpJ+E6xCzDNTbBcvpiEXbdh6QqywExuK
	 0wG29C+alYLF+avRjCQc9csj5LDESahCuiHTksYXjTPtrn+5Rp0cFwIRNAZRfTTSIV/C5
	 vs7feKlVoGCgzzchNfcka8FpQriB+LJp7WiY/k59Hb6p1wwCcniEy5YJr1UFalOTehx3Q
	 Qw/AYrb1Eb/rPSAOYxqXRUnwMHbdNk/b/iJVxdV0t2exc33bvqv+prG5omLKRCiFgVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ImBQav+h;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D36606B2DE
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 20:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D36606B2DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ImBQav+h
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jKcyT5vnDz8tCW
	for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 21:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793825409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0tKPRW7itGb4wd98itoSibtROi/TSSvYQx4Adk0Nuc=;
	b=ImBQav+h3LF+1GiBl6IfIAcRP1Bodk4vAW+JgvpEQKDklSRiQVZSNadf+WTaiQb4Y6PlNa
	c6Tkj7gxgkZrr7iULVJzlmiuIbz4IkdXB4A3EVrH7kw4zG1dKlxpDlkaciRlRdMXMosjTe
	Zc65CFLugcSwvM6Qkny/js+fMrWAk0LdN15rqWXQ1EBmbaTPlFHIoFM4N+6MWdARVnfxue
	OBuQVkrnI3w8ZtkLALTyMHxcg1Ou4iSlTWH22JTpQg1hzQr/QhNBJr+aZo6gReKN1SQ7vW
	bhiVVsAHRo2IIphhplBOCvEL0KW3bqut0CR9n7hJc53v1QpwLBh7ySBo0GAKiw==
Message-ID: <2068473db807e7672e5bfb0eb93d542923144b1d.camel@mailbox.org>
Subject: Re: [PATCH 8/9] Docs/admin-guide/mm/damon/lru_sort: fix grammar and
 stlye
From: Manuel Ebner <manuelebner@mailbox.org>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 04 Nov 2026 21:50:08 +0100
In-Reply-To: <sashiko-outbox-193681@kernel.org>
References: <20261102150757.93058-1-sj@kernel.org>
	 <20261102150757.93058-9-sj@kernel.org> <sashiko-outbox-193681@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: c80da2e29637863d9b5
X-MBO-RS-META: 3te8atbxuc5fdkoaqauk6f7jx59qm7fz

Hi,

I think sashiko review really help the improve patch-quality, however
I have some constructive feedback. In this review a couple typos got missed=
.

On Mon, 2026-11-02 at 15:36 +0000, sashiko-bot@kernel.org wrote
> > Re: [PATCH 8/9] Docs/admin-guide/mm/damon/lru_sort: fix grammar and stl=
ye

The missed typo here is 'stlye'.

> > From: Manuel Ebner <manuelebnerli@mailbox.org>
> >=20
> > Fix tenses. Split long sentences thereby imporove readability.=C2=A0 Re=
place

The typo here is 'imporove'.

> > 'set as' with 'set to'. Replace [] with () to make the file uniform.
> >=20
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > Reviewed-by: SJ Park <sj@kernel.org>
> > Signed-off-by: SJ Park <sj@kernel.org>
>=20
> Sashiko has reviewed this patch and found no issues.

In the diff
> > +suitable to be used as a trustworthy access pattern source.  These sit=
uations
> > +including reclamation target page selection under sudden memory pressu=
re.

'including' should be 'include'

Maybe you can improve the automatic review process.

Thanks
 Manuel
