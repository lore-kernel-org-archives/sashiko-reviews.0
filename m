Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D237DAAA
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936587; cv=none; b=WLtBM62JgKk55U7hlCu85SRYkK/oAq/hjLoA3u5YXE/IxyUvksyIk3uWbCuxHGg5eVB9c3gB4KlkoFeP0O0GRaXgPLfc8SwARsnWumFd/a9OTXgHTZ2JBpUP5gaA5XFZQYGJX5UUTyiKlHG+S0C+g1uih6hJkif92UH2pese0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936587; c=relaxed/simple;
	bh=2Qfo1mE8wNpeyfoDzEnCqeGtUr1juI8OSN/sfUaQCvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mbRdDWK2p3sLXfZxlLCBaRbMgA8Joek7YKlCqM/j0dI4w5K1IbEd1IwssMn4Beb0cF1tJ9LdAKXFUue0BpkOYAat04UO9sVQFYg1jgxI3WH9/HLs0Dh+Hl4loz8FW7PFNFLO7XRn7UQ9GyKgI7QjtDl3MjxaYkljJBxuCGAn7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=brs2dpE6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="brs2dpE6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c354050c34so10814515ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782936585; x=1783541385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS9s/5w9enyucVDs4i1VhSIv4uqANToyaiocSAVztyc=;
        b=brs2dpE69WaMe1wIxncBYrIAnO2RTa6/REZcUNCIOgh+2vmoCJlM8AA/PCOo5uao7d
         wyR9/9S5EruVZkNUyiMQiCQypJm5VVUnfhztbqVSAkTIX9UuHkGABc8QScjaj31jwZWW
         uRSOi2CXbnNoeJVHDFQlRfW9SqHMp9iRhS3TwjKBwdTC1anaodfMwsjjwO6eeGfZyB62
         MDb3OhJ98Q3xIxiuWzPkTTIROiL6nh544jUMIjHeXL7vv+5qt7CA8eu+DeXW8i7lGZlV
         CPW4W4KvCgVEXiinOKdj5JlGf0a52Y3rTGYFMzf7OEPrE3OE/HwlmSy5nPBAePdFZFdP
         BGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936585; x=1783541385;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zS9s/5w9enyucVDs4i1VhSIv4uqANToyaiocSAVztyc=;
        b=lcfs7VRP9ks8O/YqMVznrCCiOE9yV9W0NKKU1ydS1DSQAG19LCqbae5L+2bbQ1WOJP
         DschFTKMiSh/vIyc4oeKmeEUDfdpt/xaRpYSB4SjPopXP0P32Ssr7bd9+T3ikqefA+VC
         TcIq9xi3pL98g4yWPvvpGKwHoDz0J4CNfL4BbGDQ5402GNpO4/3YdoAfNR+RAaZiQqVc
         mnLrpb2UFdGXTAnX658n37ftdAYs9dmBOYi9bRaeR8En55x4yadtE/ZGsykB9x2J0SVq
         S3klfBhAtS6BNQJllfviQAu+zibG4spQCVTXg+xvp3ORuIdOcmxauhte+7IJ8SthJxoq
         d9yw==
X-Gm-Message-State: AOJu0YwO76idg0ynavLU1GWUWgXw1gggi8EzCvsDqb9gihHaHPjqkkM7
	iZ45ZXO5D5XbiImlvgfFG9Ew14GdA0bQ0N/nC+vegl2qq8ZGlf7Wm70Wpol3c+1VEtuTBrfdaiT
	3DYTRfwyBoJRIKWmo4qo5GFPEBhyfIQcyxMvikofC+PHSQblaeo1GJo56TscQulcYDw2SL34gHK
	98A4W7aEqjeFTFHE3omU7rcVwHJrSn/JzclyUNcA5JCt1l4Upt
X-Received: from plbmk12.prod.google.com ([2002:a17:903:2bcc:b0:2c8:219a:17e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2d2:b0:2ca:b8d:e65e
 with SMTP id d9443c01a7336-2ca7e90cb3cmr33810795ad.37.1782936584763; Wed, 01
 Jul 2026 13:09:44 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:09:44 -0700
In-Reply-To: <20260701195337.2E1F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-7-seanjc@google.com>
 <20260701195337.2E1F01F000E9@smtp.kernel.org>
Message-ID: <akV0CHxODhM4Q2zv@google.com>
Subject: Re: [PATCH v5 06/51] x86/sev: Don't override CPU frequency
 calibration for SNP's Secure TSC
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch removes the `calibrate_cpu` override to allow the CP=
U base frequency to differ from the TSC frequency, but fails to account for=
 `determine_cpu_tsc_frequencies()` which will forcefully clobber `cpu_khz` =
if it diverges by more than 10%.
> --
>=20
> commit 6d3b9e81661ead5f25434666266aec6514dadaa8
> Author: Sean Christopherson <seanjc@google.com>
>=20
> x86/sev: Don't override CPU frequency calibration for SNP's Secure TSC
>=20
> This commit removes the override of the kernel's CPU frequency calibratio=
n
> routine when registering SNP's Secure TSC. It aims to decouple the CPU ba=
se
> frequency from the TSC frequency, as exposing APERF/MPERF requires an
> accurate CPU frequency.
>=20
> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> > --- a/arch/x86/coco/sev/core.c
> > +++ b/arch/x86/coco/sev/core.c
> > @@ -2046,7 +2046,6 @@ void __init snp_secure_tsc_init(void)
> > =20
> >  	snp_tsc_freq_khz =3D SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets-=
>tsc_factor);
> > =20
> > -	x86_platform.calibrate_cpu =3D securetsc_get_tsc_khz;
>=20
> [Severity: Medium]
> Will this removal be sufficient to decouple cpu_khz from tsc_khz if they
> diverge significantly?

No, but IMO it's a step in the right direction.

> Looking at determine_cpu_tsc_frequencies() in arch/x86/kernel/tsc.c, ther=
e
> is a generic sanity check that enforces a 10% limit on the difference
> between the two frequencies:
>=20
> arch/x86/kernel/tsc.c:determine_cpu_tsc_frequencies() {
>     ...
>     else if (abs(cpu_khz - tsc_khz) * 10 > tsc_khz)
>         cpu_khz =3D tsc_khz;
>     ...
> }
>=20
> If the true host CPU frequency diverges from the guest TSC frequency by m=
ore
> than 10%, won't this logic forcefully overwrite the correct cpu_khz back =
to
> tsc_khz, unintentionally undoing the fix for the APERF/MPERF calculation?

Probably, but this series is already boiling a pretty large lake, I think t=
he
ocean can be left for a future cleanup.
