Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DA390981
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988554; cv=pass; b=OvnsOeU/9H7fq4PN8fX68AoX2uMrbxUqiaL4D5qWphDUlcuVPDFo0mpQ0+rxxFfDlyOh1tVy/DawHfsDgPngJvAJwO+NZz0t7tOSfvwH9A685tx+GHlB6kOhx3n209qF4n01JCk3UXzELfR2irPTu4D/g3yds6gFuFOlak1XrAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988554; c=relaxed/simple;
	bh=h9OaHUTdD9koqxIvwma5pxTK4b6XSkZ5ywBxDgrsw74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvciw6krxgve/vbeCahKuh5JUy7vJfm01NRCX0492WytGRfpuG7fp3hjmqd7bT8GTRJH5/sSXmjikTnNHHEzGFyBDfoSt7SoiEp16Af98DcqDPUrbkhoweqCBt4tIypq5QbunDvdvay11Jn1zCRGmbGY7VRWrac4jDe2O0rSPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERfRTs3o; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERfRTs3o"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44cb68d549fso171334fac.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 03:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782988551; cv=none;
        d=google.com; s=arc-20260327;
        b=K2Q0D444fwmk6cWXCXpLKvWgVOu3OHvOdJ8Yne/LaOMOGJmCeqQDYOFIZ6zTGHlpD6
         M8Zb8SeClHFJJOZZz2kzyyvLG9WRueSRut9ps7p61Zq8MsO1Xjc9WDXSA2xm1lrr197d
         wTU4/F6ywx1JPrVIT0NcbS8y6sfQMHd4iTDGbIcfXShZ/Y4bMvPFwHP+HO0sIXGzSnja
         JjDdFMyiz+j8Dmym5QatIih5hAbReg/jO/MrSDnw/k+w8pgVDaXoMtNmj3mnyI+EPJyj
         /h+PPqNqtNM5V9hbHGEcO3150WDQ0j5FpfXZ8WRkOh5M0/L2bTYKLyOIFAOTIi/2eXAA
         IZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        fh=hS6SkAEYpt78E9fJ9bz/FuQrShetqfvsvKq7bnXnNJA=;
        b=sJ5CoEo2FyzPqLXoK4v/g+KIoiXSFRYj7B4YwyK4yCBhgTWPlWNauxLNmpWzKuY4L/
         rZNeaDEtjHg+/IxmTnmlr1Rg9GQgjqDz9xZWVV8nQdH1W1UqZV/IEv9YjqBIq8oTW2xG
         zMP8ogFP1pTB+jcUNgYsHanf1icF3SYfhGNCxF3iYgTXKMCsZ+KMPFK6p2JXGrqVwOmY
         HpOr1XoV+PuzVh7qkYIkghE84yo4bDofvyTFWh117lcT3rGZItZIQnTjBWD/3lBOV3+n
         evg91mlVo92BxaWMdmTXh8AVIctmmpv9yOf4zRM6Z9k8JRRdHfJWrJIJlYBM3M58gnbB
         0VsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782988551; x=1783593351; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        b=ERfRTs3oivRgBlCFa7TYQagfxX2onag7hGNvcibSFvaIlo7ZijsQQdtRBvlBzSwBQy
         m+uTZKm7ufoAepM+++gSQD3gFyUZ6eBLdQiGtor0w1PMejx2EPo3XXQOaGKHoDWVQrT9
         ApkajGUwCjDqhRjZaeD0kTVmyuaV6PIg4fzQzv3eshEIbIlUnKpCdeWW7NuRQILn1v/j
         bsHjuqEjF8Y+IWGKWu8td41YtVs5lW02ue/dB13vz12Zf/gLiE53DvmO92yT++gzmE1G
         6BMmF7ljcb8hlRxME1v41/iGqH4e1/FKp8y+58BLS2ORV0U7eotNhguqcyOIRvAfQhtt
         HJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988551; x=1783593351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        b=dOZOgIBveJkRoaIAmCfni5kqZ9uN/zY1LkcN8/271U5mTgzN+MjGZ804/m0MyUBRd2
         mpb2n8TecZkccGLxbbI/REiT2w94ALSoP2hZKj4V64grPMUAsKpUz5R+qTiBPXdObPec
         5Y8HaikT3cB1ZMDHEYCjMPa/ZrkYaMEn0RLP/tDtJk8wv9vXLcdiW6eEchtpF/In/gGg
         /BfuP//8Pd/DB53szRjZx2cT1ApyqvPt4NtjXlbE2tZecoofAbZd7EZoKYo25J7zEnOF
         uTdCprlfH2OeBwMqOz7J0+ZU8qYQZ1cviqb+hqFqQ/1ITF6Yi+Q62DRHf8fkkSoK76B0
         izcw==
X-Gm-Message-State: AOJu0YylsL4SNfW7AKo14cQXKNUh9n/QWCwt7H84kONdXbw7Jx8ebjYK
	wjUXBvI1g0zbJVMQoE3BR0QTVdiuKeIquaelAQC1WksUeOPejTPIh/HqnFcnvdit6rcNu2HiWtc
	m9DCtokSRrKzBWF9dDbQHL2Yc942pX8o=
X-Gm-Gg: AfdE7cn5GkKndaxjnPHQA+c7723RoSY+RW5KRdgHsGtUGkvOOQ+/6MZxXp9ufSx+ygH
	fy2o++SJ6UtFsYEhG8bDch2oj5IRGp0VXachxDykmUegGj7631sy3Vj2xUJw6i33TurhKmj9olF
	XJImdu3XXZe0FhYTccLDPp77ab8YyiuwzWXEbJ+dZX5ISCuouSMXUEv9K7WMdEG2ilwnd1DAsdI
	9bdZBbYUBjCk6rCLVrVfFgFZVDLXYD0hhapIBiSm+dqTHlQFXkOgF3fKIFC/pwlP3wAa8he6g7Z
	jcOIMvqNDV01QNoSDi5buMY9qhg=
X-Received: by 2002:a05:6870:788a:b0:448:558c:d8c1 with SMTP id
 586e51a60fabf-44ca825d1e0mr3184173fac.19.1782988551093; Thu, 02 Jul 2026
 03:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602185305.30759-1-devnexen@gmail.com> <20260602190943.1B01E1F00893@smtp.kernel.org>
 <akTwVMepaJ8HgEgj@zed>
In-Reply-To: <akTwVMepaJ8HgEgj@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 2 Jul 2026 11:35:40 +0100
X-Gm-Features: AVVi8CezoyQZIEN5ywk3MUSSe68tny2S0Q0MLfX8BMBD2LoZDYro7_iPYhGzAQE
Message-ID: <CA+XhMqzQ_z8HnA-5Dqd36Q7snJZnnHU3h78jS6Hqom1h56Wkpw@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone weight
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi this is a valid point, sent a patch. Cheers !

On Wed, 1 Jul 2026 at 12:03, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>
> On Tue, Jun 02, 2026 at 07:09:42PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >
> > New issues:
> > - [Medium] Endianness bug places the last AEC histogram zone weight in the wrong hardware register byte on big-endian architectures.
> >
> > Pre-existing issues:
> > - [High] Casting the unaligned `zone_weights` byte array to `u32 *` causes undefined behavior and alignment faults.
> > --
> >
> > commit 731a31e43f59014f133f6c66b9d8861ce15cfc76
> > Author: David Carlier <devnexen@gmail.com>
> >
> > media: mali-c55: fix dropped last AEC histogram zone weight
> >
> > The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
> > by userspace as a u8 array. The driver writes the first 56 registers
> > (zones 0 through 223) in a loop, then handles the final register on its
> > own to keep static analysers from flagging the array access.
> >
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > index de0e9d898db7b..33e2232ec8f5b 100644
> > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> >
> > [ ... ]
> >
> > >     for (unsigned int i = 0; i < 56; i++) {
> > >             val = ((u32 *)params->zone_weights)[i]
> > >                         & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but could this cast in
> > mali_c55_params_aexp_hist_weights() in
> > drivers/media/platform/arm/mali-c55/mali-c55-params.c trigger an alignment
> > fault on strict architectures?
> >
> > The zone_weights array is located at offset 10 within struct
> > mali_c55_params_aexp_weights. Because the configuration block resides at a
> > 4-byte aligned offset within the V4L2 buffer, the zone_weights array starts
> > at an address that is only 2-byte aligned.
> >
> > Casting this unaligned pointer to a 32-bit pointer and dereferencing it
> > inside the loop triggers undefined behavior in C. On strict architectures
> > like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
> > this can trigger kernel alignment faults.
>
> This comment from the bot, even if not severe as it think it is,
> actually identifies a possible issue.
>
> As far as I can read unaligned access to device memory doesn't cause a
> fault on ARMv8 but it is not guaranteed to be atomic and will be
> realized by multiple loads (I'm sure it's more complicated than this ...)
>
> Would you be interested in addressing the above comment and send a
> patch to access params->zone_weights as a u8 * ?
