Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FA3CF699
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629862; cv=pass; b=j3X6BWw3fiyZI6v9VRONVSVsdfB6Q2d6bkx1vkjOQPIObWydtktchGdq7sFYUgPyZJwuenfxEtN1bWU6JREvK1q7NdUBZvLyIjLTdWVf88MWYuTqiFKyO5CY9BAtIgkpgAuZTPvsJVz2/IBT3ov7iziYGYiBtSz+30CFR0NSq+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629862; c=relaxed/simple;
	bh=YQYkZTA/hC42ziJpmTdONXxoZwGTPZtprA9i04fY5G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOvVDIxxSzJ4YYMDvqQNZzfXL6ltQAvaUvDNzyVjp6t40uMTwggTflpUyQXKGke6B/lKI3nl9obKioM0WVGdDsSj+Lfl8S7fIh1VIFDt5QaQyKWu9uUrMQ+e/aSmLxfk9AuAt1ErZsguCVkIJBaPft9KRJA1K5Ajx9jPnY4Ya4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayiVqDr0; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayiVqDr0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb6bdeaeaso2119e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 13:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783629859; cv=none;
        d=google.com; s=arc-20260327;
        b=YCDr/2d1/wgl9jHOFuZO666GhCqz4OXwL+o8oGqTYnSpfOAPkBpY6Yia5SfhkDuYA4
         UPKPb0H+EhasVO33UXhyXOQLxscCH91YPSM6i5DjEHAzdzPk8LrIOt7inzOlhIkXcslU
         8W/CedQznvIV9TZ46JD4ZywmacwHdpW/FoWeAKwE8GE0mnsCS0Y95Zjw8oDm82+f/ls6
         EtX+Mlqsfg4SLdbdtQ93UWf3K3ID8iILZB5S546kg1lFvC152nLZlQPyOIT/YSmCnwK1
         l8lAqGUSt9+syCbSS6v/bVnT1TXvyMoC6YXtZRtmTQVQSxoA6DJlQwQxF+Q/l2Nm5uUh
         9uNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sz/TS3U0255GtOYfFG18AkoFtfEgSpwa44l7VVdAJ14=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=Wv1ZC3TRTCGWhaWH5f6Jp9c6/h4Qe4IUeLnmmCS6hlV7y/gDFXxFbyKLVsm5/GQbHe
         b2oDuUoYhjLlJy5MIZA9aUlpQ8d3bGvcJSpAlwcGqysDWR3dHL/VhRBPS0JrwGrKwezt
         OjXl/cndQhP9nLnEiNZjbM6K+/6EPYYCXA0wMykvkTM6AdnZK4RD3ASnotNUV5DKOYxT
         wRqMNPyAx8IDbkYHOG7tu8jcH2btJHO1PzQBNA1VmHBCMmfZ2pmjHDNnFvvxw5/gdicQ
         kY7/q7IlXq7Nz0fJ4m2rTZkr0cfaXPvYm+6bxPZsmctUewp4GKUrJr/P1Xawjpz5P/p/
         CgfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783629859; x=1784234659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sz/TS3U0255GtOYfFG18AkoFtfEgSpwa44l7VVdAJ14=;
        b=ayiVqDr0TexPqgvLBovkDBm6dgRGKMOA0Mu/cyyBDyYCLCF4iN1D2XCNBbNweA0not
         8hgy165CmWUGZ3wQ2u6iniwEOCmQBlWRQTgHJwKmBvRmsVAVILKTnyRXVMkxQr8ljftC
         oErZXBJxJJBd4q+OPqeUzQhUsRR+HZhbYUzvkOcuJJE3V3Ulqtf/ZFNGnAkSw9QovssQ
         gOdlijoM85bi0np3eSOtQZbTuobCYaEyMu65FTT0pPFZVvvlTMxCMMIAZqFwwuxEAWBC
         sT5Jih9mtkrsGAI2MFdJN4qXd5D/z/lI1uvZnHE1LJbpA9mQGGPSWwn/JHTJsXLHaYYm
         MsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629859; x=1784234659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz/TS3U0255GtOYfFG18AkoFtfEgSpwa44l7VVdAJ14=;
        b=epIb5hNoM+ftYPGmpTWlo2wJOra5rbVD0m0nB697A8LJoQG081XeOhr1mndWaicrqT
         6YOCBYDbiFo6WrattNkS2Vjw5y9dB4o9i7iKfItNXpFGUCXQt49DFEWhF160JkViczup
         WMN7ZKZDJ0lTMn0fZxgW5FwvdTmHKrL7X0FmCu0MxeacKo4JC4ipUwAA8q7aD69MfeoQ
         u695L5sCyJjC68Is8HO2M03SwHgCDsDghCD7AoylKy8l1ZxJsT8bjon4m48nXT/GtnYl
         jtKbwHmJTiqPxsjhA+BuBkZDQxgMMA4WLTp9JVKaPWidcvJr1vDLbmKC7+srv84i2XaG
         f71g==
X-Gm-Message-State: AOJu0YzNeHyZIKfk4foel9nXCGotbY8ycXOTcdw6uqhIbKkjvgGUS/Oe
	mPLGNiFGUExHlt6x9rfDSrXgcSpgcLn8ulPVnDzwXWZIGoXbmo3qhCfcdlQOEfq0b7Y3jerV5oZ
	6f/2sYqlJ+0E4KbmiGk1n9IHB3TmvUjYya84RYEUcELPXxkPZeFlXTkA=
X-Gm-Gg: AfdE7cnTPK+4q0EF1/2owt3Jz75djb9rysT7bcdF4ZhlDwB6LLzdOSKsX6MZn34WcDE
	bp3ExQ6EC+nzcV/eFpXvNdwGj+VQHSXDg+ky+wUhR0amdqCQg9WlsLmxS8POSfkXlamT8mb3tgC
	Y0pyleHV3LXSDMpAauc60VEwrVJMhQZCsijj1nQcNPmfMqML5iCnnqziPxMcO9iDm+X1LjDGbHz
	7zkPTrpLMg3K8eV//qeri0lBEvQxnm5isN5SXXd0XP2Vwtg9uGbRFm3siPtBpiR++55
X-Received: by 2002:a05:6512:3d9f:b0:5ae:b99d:7df8 with SMTP id
 2adb3069b0e04-5b01cd4df96mr12690e87.9.1783629858661; Thu, 09 Jul 2026
 13:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
 <20260708-igb_v3_b4-v3-4-1272650ca614@google.com> <20260708233341.5238F1F000E9@smtp.kernel.org>
In-Reply-To: <20260708233341.5238F1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 9 Jul 2026 13:44:06 -0700
X-Gm-Features: AUfX_mzAwjHYVaNENrwJ4wPekK1dOTjvFtVMgeRzOwmUMSIvNXAKtENbgJmqdQc
Message-ID: <CAAdrzjuKchGGhVtwZZ8dn_4M=LrtTQQKpVo1_JPo0YBbF8eq9w@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] vfio: selftests: igb: Program MSI-X interrupt routing
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Commit message and implementation mismatch regarding macro def=
initions.
> - [Medium] Hardware Initialization Order: Unmasking interrupts before rou=
ting is configured.
> --
>
> --- Patch [4]: [PATCH v3 4/9] vfio: selftests: igb: Program MSI-X interru=
pt routing ---
> commit f99b27fd1b6bc3801803a7e5be3ec664facafb7a
> Author: Alex Williamson <alex.williamson@nvidia.com>
> Subject: vfio: selftests: igb: Program MSI-X interrupt routing
>
> This commit updates the IGB selftest driver to use the full MSI-X program=
ming
> sequence required by the 82576 hardware instead of relying on synchronous
> QEMU workarounds. It configures auto-clear and auto-mask for vector 0 and
> changes the EICR clear mechanism from read-to-clear to write-to-clear.
>
> > Replace the magic '1' values written to EIMS/EIMC with IGB_EICR_VEC0,
> > add the GPIE/EIAC/EIAM macros, and drop the wrong-valued IGB_GPIE_EIAME
> > macro (the new definition lives next to IGB_GPIE_MULTIPLE_MSIX).
>
> [Severity: Medium]
> This isn't a bug in the code, but the commit message mentions introducing
> custom macros like IGB_EICR_VEC0 and dropping IGB_GPIE_EIAME.
>
> However, the implementation uses standard kernel definitions such as
> E1000_EICR_RX_QUEUE0 and E1000_GPIE_MSIX_MODE.
>
> Could the commit message be updated to match the actual code?

I'll update it in v4.

> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
>
> [ ... ]
>
> > @@ -280,11 +280,32 @@ static void igb_init(struct vfio_pci_device *devi=
ce)
> >       /* Enable MSI-X with 1 vector for the test */
> >       vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
> >
> > -     /* Enable auto-masking of interrupts to avoid storms without a re=
al ISR */
> > -     igb_write32(igb, E1000_GPIE, E1000_GPIE_EIAME);
> > +     /*
> > +      * Program MSI-X interrupt routing per 82576 datasheet:
> > +      *
> > +      * GPIE (section 7.3.2.11, Table 7-47): set Multiple_MSIX (bit 4)=
 to
> > +      * route interrupt causes through IVAR mapping, and EIAME (bit 30=
)
> > +      * to apply EIAM on MSI-X assertion (without EIAME, EIAM only
> > +      * applies on EICR read/write).
> > +      *
> > +      * EIAC (section 8.8.5): enable auto-clear of EICR for vector 0.
> > +      * Without auto-clear the cause stays set after delivery and the
> > +      * test can see spurious interrupts on the next memcpy batch.
> > +      *
> > +      * EIAM (section 8.8.6): enable auto-mask of EIMS for vector 0 on
> > +      * MSI-X assertion (effective because EIAME is set), so a single
> > +      * interrupt is delivered per memcpy batch even if the cause
> > +      * re-asserts before software re-enables the mask.
> > +      *
> > +      * IVAR (section 7.3.1.2, register definition in 8.8.13): map RX
> > +      * cause 0 to MSI-X vector 0 and mark the entry valid.
> > +      */
> > +     igb_write32(igb, E1000_GPIE, E1000_GPIE_MSIX_MODE | E1000_GPIE_EI=
AME);
> > +     igb_write32(igb, E1000_EIAC, E1000_EICR_RX_QUEUE0);
> > +     igb_write32(igb, E1000_EIAM, E1000_EICR_RX_QUEUE0);
> >
> >       /* Enable interrupts on vector 0 */
> > -     igb_write32(igb, E1000_EIMS, 1);
> > +     igb_write32(igb, E1000_EIMS, E1000_EICR_RX_QUEUE0);
> >
> >       /* Map vector 0 to interrupt cause 0 and mark it valid */
> >       igb_write32(igb, E1000_IVAR0, E1000_IVAR_VALID);
>
> [Severity: Medium]
> Does unmasking the interrupt via E1000_EIMS before programming the routin=
g
> in E1000_IVAR0 risk unpredictable behavior?
>
> If an interrupt condition is met in the small window between these writes=
, it
> seems an interrupt could be triggered before the IVAR mapping is valid.
>
> Should the mapping in IVAR0 be established before unmasking the interrupt=
?

Yes, but the behavior is introduced in patch 1, so I'll fix it there.
