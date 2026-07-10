Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D23845D0
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712283; cv=pass; b=IdlGJFPoCEgRTPoxzqTheLhbjiJFa0BqluwILr3I+nSUgucWwRXl6WQ3ewmyLhE3CgvnzRXULXVMJD4hljITKEg9jchNFk1KoLgkT4P9DaGwTlzBiA/p33KGogPR5kkye9p3ARVg9OWTaMjeb6q0KQ3AUjgnPcDuWrX8yharCFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712283; c=relaxed/simple;
	bh=45/772M2ivi6fpTGCjKRNRa8Df2a9ZbYROKdGWmG3gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Upker5lxlSrCyDOp+2MJxJmubr+wfXDFj9Arbd7pr5aSqX7NoFPJthC03m+yK8IxceJwwtdVvKgUO0Jd1L3nTpSr8MgKWaV1ooRnLtN6G7HjyEUeBDnU+8yOGKZMxYQtfzosoVOesZJBW48GTW+u2Vs5E+u0gs3UB0sHpDzzGzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rJEth1sV; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rJEth1sV"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c15a5b265so43831cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 12:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783712279; cv=none;
        d=google.com; s=arc-20260327;
        b=O+r0Zpan/NEdlxSaEK1qjWKCYcrSnEBmfPGiQEgj48iC8AEdJ5KBtsWWJ4+5jvfuM4
         VG7BDUeUVtZpYI5p8QifwUPqbDYpKB2u3qG6aC7iV9+NNQJzEKVmszHI3f0RFNxeILRE
         HAdoabZRLKPoLzmir6IrLyFLKfBo2Zi77DDv/irEPBIFkX1ojCCOpg6OlozyiXjnQTZm
         h5U07pTiV3ZZotrFLUttvEFwA6yAdHV1Vpo34m0xDUxEqLKFUCTce8MFQid24Cot3INL
         2uqVx+K1wo2qg30vGn0eut3+M9jrSGe3w5nORWpz9AkwqASnXTBHBurVWhig5opQtxjN
         FOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45/772M2ivi6fpTGCjKRNRa8Df2a9ZbYROKdGWmG3gw=;
        fh=wuzSwMRqZyLNZu2ai0tUZksq5ajltlETdCZTFuFC5kU=;
        b=m5blYxcEltxqNdIJO8m6x5EYYEqMuRPieAU7YR9Qvq9WvuotcGhF/GFGoJmHh8wnZu
         KI/ChUqiVG7zyI1Ju23Yss8jWL7WjTmAlX0IcvVq+s+9Ql/TLPEIC3GuaCJfqQCI3I8E
         KGx5RQ+5S10C73oeuZw1PYVFaX9uCYCGOUm6MDdqPLJiKOcorcYMHdB3dsJgPe7yDgiy
         y6gbNeuOCkADNNxmZ3wtKbVIYDKpEJjOaafVyDONjcMGzbE8eena71ZkTPnNeV/jGrdD
         GJJydBfxL3SU+BxZZ0Qp5ZHdsvFt43amXTXQkTrZjF/K9fkGcJunNhEeWFHacGQjb4Wc
         snjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783712279; x=1784317079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45/772M2ivi6fpTGCjKRNRa8Df2a9ZbYROKdGWmG3gw=;
        b=rJEth1sVb0xI6/RtPc/Ei8a9LLocX2Xm/v+Mp/iWApeL1SbI5Xb6VwChvDGWhFKL//
         bqk8c8UiDZfpOqQL6iSnKIsKdhwVMag4NaNUhwdzsAbd2Imci8gAQB2OQzdzMypjDMJc
         9aH8w9P5HgC6JImfZ+x9NefUy0Ebyon1nGJdY+iRMsoL0WVsX9WVqblIRGVWLLYrES+j
         u3GNoecLb3D5zbB7TNpX4tRegJWbmBDdUQzW4X5maQaNfiOQeiEhNg5dVNyuvDiV30Z1
         LHtgQEReWzBa9E978UATN9Je2FVp0ufEa/Z4MnWkaGspLu5UOD5LDgHPDP36hzPQcEEb
         UqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712279; x=1784317079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45/772M2ivi6fpTGCjKRNRa8Df2a9ZbYROKdGWmG3gw=;
        b=oQ2rpTgq1uCMAnfPpNrvt9yG7M6YXOMT5rGfqjkkEPOVymzXuIwb/ahDraTuDx0xKl
         4zChXZx+zph85y4fm8y9Zl6X/XU9jT9FHiEAxNvnVYYzO6fWAS0mNboV2urqYNMTEN16
         fArecg24VgmF0Y5Yv+48u0zYZxFZAcz2SbM+r9Sxu+LknaNEvsRjl3D5pVduSajUoj+e
         rucdiTObVSVdUJVs0EZTTUUuKy86tuUUMxOp2DPgV/AzRnMPepk2LpW01bgLfb8sFdAm
         9UQKVHOh3D8JViXELJJ/vIS5Z6AnD/FG8QzV1Pnm+2Q0OjfY5069HLvDIgU5B3gwuomj
         ZC4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpgzyi212oSz0FwCHWnBV0kEvzhaONu4O3jTLr/0P9ujTtiXDcTq11FRcVgfyoex87imcbB0fSz67DO/LkoAcw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo0hgd3D+wATjculc7Cfsjngqir0RTx+Rc1euQtv2+KAPLBJHQ
	SXF0Gqq5j9wF3Q+vVRkxo2KIuHq4l5CgRs4K2u53tZiZlk2SKSyX2PQqMonTn2W9VET/Y2p8dQD
	cpNTOuAWtsIL5+g+GRB/8enQrN8/XRsc7e3hcL4Bd
X-Gm-Gg: AfdE7clQ459pAjXsscsLG7sGr9JZTVGvkVxLrfpyA2Sb1jCfEH0snoyqHBO6pFgA7eU
	zgrLWv0LvLHDLiKsvI+3Ps9DvD9+cylvAhvC4uohrB7abj7sV+oXh9rw0DRlSwucFSiUvsRCK6Q
	gu6Tv2ZEyLtJAdBABe4u/DA0CtaDWf9reOyTa1aXPjwfLf71NK+cP8h998POEEPGTZEk4WhNDia
	81OL92lWhHYm/rY8lyJxtRJkm2mES9/5gmMe4EaEDAZRApA7Wxh93PVhqEwSRMksPh8/qGQ7e5a
	6WS+jtb5RxL4VlIOGWjHyOJoTZTq
X-Received: by 2002:a05:622a:c01:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-51cbe686cdemr1615401cf.11.1783712273761; Fri, 10 Jul 2026
 12:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702020142.3399851-1-rkaruna@google.com> <20260702021411.B01331F000E9@smtp.kernel.org>
 <16780c1b-418a-4555-b4bd-d442cedd620e@kernel.org> <CAD50Xqp_LBvRqhn0q93s3aVxtfFWGhf42jBePKsUonfE6V=WNw@mail.gmail.com>
 <49cb57c1-d7d6-4f30-b628-72c083981da6@kernel.org> <CAD50Xqra-_2CnJdGPJtWeOZT-Ne4wRRcQEL+6uy1--jPRYwACQ@mail.gmail.com>
 <0E78BE5F-B4EE-460A-A6D5-F0CE47BFC7DF@kernel.org>
In-Reply-To: <0E78BE5F-B4EE-460A-A6D5-F0CE47BFC7DF@kernel.org>
From: Karuna Ramkumar <rkaruna@google.com>
Date: Fri, 10 Jul 2026 12:37:42 -0700
X-Gm-Features: AUfX_mw4uC-QpbL3MfJaXisd2xgR5S7uGqtH2tHtdoxGsMQs1DyRcDNHLIpWeW4
Message-ID: <CAD50XqqyJu7eQjXyBkQa+O737qfWaJb3Mc6-hhF63juanc5Vyg@mail.gmail.com>
Subject: Re: [PATCH v2] ata: libata-scsi: limit simulated SCSI command copy to
 response length
To: Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, sashiko-reviews@lists.linux.dev, 
	linux-ide@vger.kernel.org, Igor Pylypiv <ipylypiv@google.com>, 
	TJ Adams <tadamsjr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 6:11=E2=80=AFAM Niklas Cassel <cassel@kernel.org> wr=
ote:
>
> On 9 July 2026 05:34:14 CEST, Karuna Ramkumar <rkaruna@google.com> wrote:
> >On Mon, Jul 6, 2026 at 6:10=E2=80=AFPM Damien Le Moal <dlemoal@kernel.or=
g> wrote:
> >>
> >> On 7/7/26 08:10, Karuna Ramkumar wrote:
> >> > Before I start working on this, I would love to hear your feedback o=
n:
> >> > 1. Whether you think this API update (passing `rbuf_len` down to all
> >> > actors and helper functions) is the right approach, or if you prefer
> >> > simpler, and more localized checks elsewhere.
> >>
> >> I do not think it is necessary at all because rbuf is statically decla=
red:
> >>
> >> static u8 ata_scsi_rbuf[ATA_SCSI_RBUF_SIZE];
> >>
> >> So the buffer address and maximum size is known to all functions using=
 it.
> >>
> >> > 2. What would be the best way to test all these simulated command
> >> > paths to ensure the fix is verified appropriately?
> >>
> >> Most functions for emulated commands generate only a very small amount=
 of data,
> >> far below ATA_SCSI_RBUF_SIZE. So I would suggest that we simply add ch=
ecks to
> >> the functions which may potentially exceed that. Off the top of my hea=
d, I do
> >> not know if we have any, but we should just check.
> >>
> >> Note that ideally, we should have each function allocate their own loc=
al buffer
> >> to handle the translation. But this is right now a little hard to do b=
ecause
> >> these translation/emulation functions are called with the port locked,=
 so we
> >> would have a memory allocation for a potentially large-ish buffer unde=
r a spin
> >> lock, which means no reclaim/no wait allocation, and thus potential fo=
r failure
> >> which we do not have right now. A proper/ideal fix would need to drop
> >> ata_scsi_rbuf, have some helpers for managing the internal buffer and =
redesign
> >> the submission path to not have the port locked until the translation =
is
> >> actually generated. That is all more work and more changes.
> >>
> >> So as a first step, let's check the emulation function if any of them =
can exceed
> >> ATA_SCSI_RBUF_SIZE in size, fail them with internal target failure.
> >
> >Hi Damien,
> >
> >I went through all the SCSI actor functions in libata-scsi.c and
> >calculated their maximum size consumption.
> >
> >As you mentioned, most command emulations triggered via actor
> >callbacks write a fixed or small amount of payload, and are well
> >within the 2048 byte limit of `ata_scsi_rbuf`.
> >
> >There are two functions that can potentially overflow though:
> >
> >1. ata_scsiop_inq_b9: Writes 64 + nr_cpr * 32 bytes. If nr_cpr crosses
> >62, then this can cause an overflow
> >2. ata_format_dsm_trim_descr: Writes trmax * 8 bytes. If trmax > 2048
> >/ 8, then this can cause an overflow too.
> >
>
>
> Please note that ata_format_dsm_trim_descr()
> was changed recently, on libata for-7.3 branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=
=3Dfor-7.3
>
> I don't think that this function can overflow anymore.

Hi Niklas,

Thanks for the heads up! Since ata_format_dsm_trim_descr() is already
fixed, I created a patch for ata_scsiop_inq_b9 and pushed it upstream
for review.

https://lore.kernel.org/all/20260710193235.334782-1-rkaruna@google.com/

Thanks,
Karuna
>
>
> Kind regards,
> Niklas
