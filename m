Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E14E433D
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718382; cv=none; b=fih0Oun57fosLy/mAs5XMRpjhopvoZGu7YIRhi/dStRxl46HcIJ8nWftuHVeVc8/Pmxs4+n0N3Rvc1qSZMAE92TP4wpr7fUTyIFabZSvoFqB34gmItAG6jrpvg3LHK/FfOaSVYobsd5gj63eVJjO8g/ci6sEUqGXjbT5QUKyEbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718382; c=relaxed/simple;
	bh=c60XZr6gjgTXxTb8TD6mSviBn7hGFt9Ur2eTffcnqXw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GRedsVH8UD2mZMVtHCffWfJVXIILjtlTGPxVO/ZIXu4QI65sCnbUqkGokgDTlSNLqKpmlb2ZlApxwEaJMafFRTcqcBVS2d77VXuEtKbXels7Hd79hdLgcZINQhx7pXeolIn8GTGGUewqsXGitljGVm2jT8Jg+3PhaAtEfNd5Dak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INpUPo3z; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INpUPo3z"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04edb5so7890739c88.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790718363; x=1791323163; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gtOvtANTNZsbuqRv+rrjZ79D7N3AuJOn+HMwiY7MqVE=;
        b=INpUPo3zRmr4QmJa9BpGu2N8s6lMjLgqTgUgdbd52JLfMsXgfn/I4rws4jZboWEy2J
         lOheVnE+5zIIP/oB2EnIujiMNBIeuzFvllUCnP1O0/KRM9ZyMb3afMPyDan8lJ24PA/F
         oz6qh2gPRFiiX8l4+ckOdx5IOIRNp9yg2Ixag1ejDzqHv53MvxltQof8E+4KGxxzltr3
         H2sr9OMBTBWMKAsmBmrKD0y3YSV3iMZSXMT0hfZwYLESp2cfYoD73yCO4KGKHd25wHkH
         nvKme9wMc/rGdCGkl9lrjzYSm3pYST5ifHDXMM51vXKPWJfmH1nVX2OhoVQl2pn9UZRc
         45eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718363; x=1791323163;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtOvtANTNZsbuqRv+rrjZ79D7N3AuJOn+HMwiY7MqVE=;
        b=N6+Y1IwYGhjOI/DwmfxaaekQcm/BA6x2/vy8GP/AyAbGB9QW4SE/cMZl9huIR5ldx2
         5syR4Z4i9k1GSU41y8JfvzLfbQrRVmZZCTszKecTkAeJRIM3qRzY5aZFyElBdETW3Ofw
         XfBQgzlruXmaBFfEr7PXOS4p90ykpvwLKBouJ2AuO+PeNlANtdQSXrEfP0fxwD7CYK/U
         l0ddh1EC3iNVPuuTsMDmjBKKh3AaLiw/RhRToiqAyHqyeuhe/yRVe9yg/okx9tbzUyI1
         m7Thl672YOqsmIjF6H1+QLgyMDt6MgZ6Tt+JRkV8yqzUekUiRhz0YFSgRnqURLZsVCO/
         Fj7Q==
X-Gm-Message-State: AFuF++kGfJtMb/lmPtKhf1WS9lLwn8d9cc+xM1k8aGOF1DvWig3NMk/f
	L2zVO3OAwPYlzHzzNn8Sa/qRESzz7eXbw12qRXe3h1sGa0XFSM2baHmoFBrELxTz
X-Gm-Gg: AYBFou21aflf7Swd0C/nOUsjnintv+PbUiH5wY0ND2bkzUJkoH3aS/wBFvP1EHcTqFT
	oksccAnANVyT664i5Xi2XjCR1xghKAP3rE7gkuHC0dKB165ty9dCMokEtFMtMc/vjSq8oLguwER
	tUP5sCeeOI9QrmC246A8KlllcL3mYQ4l+6HxOmZK/yEaCpiakw4z1T/ZMKBCkkhJv68O8oHjJsH
	D4/0dm2V0IJ+7uqwM6olgwotl/3fVwQX+qSClO2z0TPzox2LWSjHHwegiILZJMI2/CsqyAXUgHI
	ph7WkCkK6zqIB3TjZr1EiP5FqdpSbiMTVDp3TWwHzlyfuQNBlpTcxlaCS32tdEbWklChogdjsbl
	l/3gUJ/hmbUaKgToTpcDunS/TrRWW7Doi2nqSa3rCR938TzzPNN8+68Tzd5iNVuZf64hSFz12MB
	uaeLmiqFN2oV2TM2hK/m8qXBDmDSCY4JQhdbUnZzAzJ+rZhPoUsphCTsPMtaXksVAPhH2TgUGcf
	Ka20LChLb8pRSYDElhrt6BorTZgbMTyV6rb0KJ6xLgzHJmcGm/wonWY
X-Received: by 2002:a05:7022:f210:b0:143:7821:e151 with SMTP id a92af1059eb24-14ca00a1a62mr735605c88.47.1790718362606;
        Tue, 29 Sep 2026 14:46:02 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:abbd:bfa5:f574:cca3? ([2620:10d:c090:500::7:dfd3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c640bc413sm1524006c88.11.2026.09.29.14.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:46:01 -0700 (PDT)
Message-ID: <9176a077b5ba674b0d35cd4db36bd239f99f48a7.camel@gmail.com>
Subject: Re: [PATCH bpf-next 08/36] bpf: add cnum64_intersect_linear()
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 29 Sep 2026 14:46:00 -0700
In-Reply-To: <20260926143403.113531F000FF@smtp.kernel.org>
References: <20260926-scev-minimal-rebase-v1-0-c8e5ab5ba79f@gmail.com>
	 <20260926-scev-minimal-rebase-v1-8-c8e5ab5ba79f@gmail.com>
	 <20260926143403.113531F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-09-26 at 14:34 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] bpf: cnum64_intersect_linear over-expands intervals that wrap =
the signed boundary
> --
>=20
> commit 07e53bba30487c590757dc2ec233d2811a607b9a
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: add cnum64_intersect_linear()
>=20
> This commit introduces cnum64_intersect_linear() to intersect a cnum64
> interval with integers congruent to 'base' modulo 'step'. It tightens the
> interval using signed bounds to keep residues consistent. This is a build=
ing
> block for tracking scalar registers with values known to lie on a line.
>=20
> > diff --git a/kernel/bpf/cnum.c b/kernel/bpf/cnum.c
> > index 86142cb2aee5f..2bff2c7e0cdf5 100644
> > --- a/kernel/bpf/cnum.c
> > +++ b/kernel/bpf/cnum.c
> [ ... ]
> > @@ -118,3 +119,38 @@ struct cnum64 cnum64_cnum32_intersect(struct cnum6=
4 a, struct cnum32 b)
> >  	}
> >  	return t;
> >  }
> > +
> > +/* Intersect 'in' with the set of integers defined by equation 'base +=
 step * k'. */
> > +struct cnum64 cnum64_intersect_linear(struct cnum64 in, u16 base, u16 =
step)
> > +{
> > +	s64 smin =3D cnum64_smin(in);
> > +	s64 smax =3D cnum64_smax(in);
> > +	s64 lo, hi;
> > +	u16 d;
> > +
> > +	if (step <=3D 1 || cnum64_is_empty(in))
> > +		return in;
> > +	/*
> > +	 * Round smin up to the next value congruent to 'base' modulo 'step',
> > +	 * i.e. increase smin by d =3D (base - smin) mod step:
> > +	 *
> > +	 *                 |<---- d ---->|
> > +	 *     |-----------|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|...
> > +	 * base+step*k    smin       base+step*(k+1)
> > +	 */
> > +	d =3D imod(base - imod(smin, step), step);
> > +	if ((u64)smax - (u64)smin < d)
> > +		return CNUM64_EMPTY;
> > +	lo =3D smin + d;
> > +	/*
> > +	 * Round smax down to the previous value congruent to 'base' modulo '=
step',
> > +	 * i.e. decrease smax by d =3D (smax - base) mod step:
> > +	 *
> > +	 *     |<--- d --->|
> > +	 *  ...|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|-------------|
> > +	 * base+step*k    smax       base+step*(k+1)
> > +	 */
> > +	d =3D imod(imod(smax, step) - base, step);
> > +	hi =3D smax - d;
> > +	return cnum64_from_srange(lo, hi);
>=20
> [Severity: Medium]
> Does this code improperly expand intervals that wrap the signed boundary?
>=20
> For such intervals, cnum64_smin() returns S64_MIN and cnum64_smax() retur=
ns
> S64_MAX. The function then calculates 'lo' near S64_MIN and 'hi' near
> S64_MAX, returning cnum64_from_srange(lo, hi).

I'll add `|| cnum64_srange_overflow(in)` to the entry condition.

> This replaces a potentially small wrapping interval with a massive contig=
uous
> range spanning nearly the entire 64-bit space, violating the intersection
> property (A =E2=88=A9 B =E2=8A=86 A). While this over-approximation is so=
und, it could cause
> the verifier to lose precision and falsely reject valid BPF programs.

> > +}
