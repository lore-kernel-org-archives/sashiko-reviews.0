Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD43D649F
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932593; cv=pass; b=tGoEHCiw/fYsrNjad0jUA1b4cJ4HcJHCcnFJ4uKNxJ31KkdYcCKZitnHnHsMlgBd0orcmLazMIIgqiaVrYH/UORCFkXgIBLGXsu4OvLtrWwfqzorhfucYDOxGFRO51RGaAZ4vxcPbXNEMCrd6fTb6vK6vudjo5lxJ8WrEry3si0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932593; c=relaxed/simple;
	bh=7QyYKbH4NtzTLiNAjB//SALR0HNWGH6snToS6ryNEIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LafwFegUTbrtfqiYAy8VI62UjHrl6UEVbt19CwLCy+vPa7FwztoaoeZObxzxjolNxbORRbczUbJfAyYC8o5OnGgFhJJPRPisO42aygndQuY9AfzgdbpTf1lvv+8kHLER0e8g1uNme5vP3PVWwoOR8xHhXc2JWlo29GbuRtIy/sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBa2Skx3; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBa2Skx3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba0714574fso4149495ad.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 04:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778932592; cv=none;
        d=google.com; s=arc-20240605;
        b=ahhJMq/YaeIoHVzrUjjus1xSTffPV4Pp1HPp/EsZNkB60O3DLKVyfvHzd/MwbDtwYU
         YLCHlXn5OYY0I/sPrBHSL/qcFa3dS7Lki1rxgPqmh3UMbDgvWYOXQOY16c7YeyKO+tYC
         OwVWJu+U4WLBsyCUBGnVWJwgt0qv/nbVI2s9aOIDEJrxz+8DZyQgbrtSq7kYHmMWnvIk
         C1URV+PNE2pc/Lb55iVTCp3ANjrI+WiBcnsD+ClLCcoTjDAAsNdoXEqSBHXrO0NSWi5f
         1I7O9FqU7BVCGhjL6om3U19CA+XmOqqIEnjIU4lRPgBe4ulQaL015v7srG8AIRBoW9dM
         tlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        fh=clJjuPX1wp73EmI+aQ2kiO/nitl34gvpDqzRs0i0+c0=;
        b=IZShpGb8Y9TO8ZTyyZy1eLV7OeGgt/vBdpCw5954+RArVUaS+fr19L7848kRLz+rAs
         D6R4yvkovkzTVCyzA69/K1tmHDq1+XkKXrnCc33q/QY1LQHpu9OU8sMbwUaf1Buhd9q0
         gXWnaXEAz5lPmRDIq2E21e9WTClXdUn4V6WpehP+Q65L3hOdZQdY3kNbo6i9U5a4AhV4
         MMITfFCqxhU9Cuk5d8aPGyCQ8m71nmz3BzHq0/cJlwJBjCMbnT/gD2O75kwPFyCHfxJh
         WojUKzQCpAc3YP+6rAtvA74YRj4R11i1eBNSc83jd3+NxEmZl2NdXIyDyHz0r6Va2Zrm
         Xl/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778932592; x=1779537392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=GBa2Skx3bUtX6dzBC4TAzSSHQ4xM76vabwuAeUI5MzqyYdMdGwLfz3U4hr9YM+Zrq4
         k3rZSSVAcuY9euP/mz/eqq7lugpmQu9cBsjy/QNWClKyZbgp62wz4d58gU26AKPzUKJz
         vyR2kNEcCNWMlS3A3wfLX5oo/fN1nvHT/TTWZSZ+Otl/DR/bAx2nlamhW8u7E3MCWcGj
         fNFZCyJnFizPx2nMhLBrEcK7WZMO2VCpayfgYj1B7oxhLS7T3RDHcLgQweVmrVINPMbx
         pGV6qAnG6ICVWn5lMaWxbJwlQYwgLCJCsDnVrNl0ZFvE31tsGMcW/BQj4/stQxPmUNWz
         +3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778932592; x=1779537392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=hb2L+BtEYFZE8kSbEUib3iqDio/yftpYaXR85/2LbJflsejS1CwK5zWlRh++1RT69v
         JOREvRm7xnVrCUncocchrqq3UyBCbZ8jv6BLrKtbYbq/JXB4/zsEuJrIqSwM6HJ6tmkp
         +TcHw94kv6DtwA4edNeE0NYM1coTQIo4xY1rxncoo+65Rj+LQzFm7s/CMWe5Kr+uzduq
         QfYUoJDHHM37/CSLlf6BAiQRtBJQiwNTOMv6fzn08vsAxUOV0LMxZJt6G2maHrmT2q01
         TBUZXjylDZojXIVf//Xvf3B9fhVC0nNi8VFCva6gHPAKFw97i5fhpqKmrgeMjkQNMb88
         EeAg==
X-Gm-Message-State: AOJu0Yx0p2WZmzRmyuSe7mCnS8kVgmjgR9LC57/NA7JQoXZyQtBEphyv
	lG2uKx0IcBPoHHctEzQMazG2hIbGjN83poLjIlPijHv475nFCAeFrEzeHNH23CL1U5mJbvqGLnv
	dhhgFuzBIlZntZB8TFsUwF+K/rUWa9ztfyuhE
X-Gm-Gg: Acq92OFb++zyItzgyqVy63sFxV/dujNB5p48hKfi2v3Xd+XnY2p19uhs1MaNQUc0Adp
	2w4EnxwElQJW+uO8+W3sfQwdVqpYEoBd3fTjrEQp3eGOeaFP2Vth1zysAR7DXgHZUbnAnHuOtZC
	4n52HlsHIEJjct208mg1pb2uqibfF9FuuMJPQZzku7mUAVGnyCI6VJsQse14VbhQllsSn5bGXmU
	dVcmxPBynhOuHYQLUVfx4ZbvoMWhGU2N7VP2k4GTZ7aE7HBikBfkPcaD8cr10XDW69XhYItH/7S
	Wfd7zDzB96TDgxiCj+KDWrDuIMbjnpdykrgJZCZ1
X-Received: by 2002:a17:902:fc84:b0:2b2:eb9d:1648 with SMTP id
 d9443c01a7336-2bd7e9a02e3mr81606565ad.37.1778932591918; Sat, 16 May 2026
 04:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
In-Reply-To: <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 16 May 2026 18:56:18 +0700
X-Gm-Features: AVHnY4K87wbzdoBlkwWjKd4mYgN3M-8jhbsSCXPKekL4N1DL1gksd-L0oaFEhQw
Message-ID: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am not entirely sure whether the issue is exactly as
described in the Sashiko review.

However, I also looked at a similar case in the
micfil_rate_set() function from the fsl_micfil driver:
https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

There, pm_runtime_resume_and_get() is also used to ensure
that the device is runtime-resumed before accessing the
registers.

To address the review comments and avoid mixing functional
changes with the cleanup/refactoring using guard/scoped_guard,
I am planning to split this into two separate patches:

Patch 1: replace spin_lock_irqsave() /
spin_unlock_irqrestore() with scoped_guard() / guard()

+ scoped_guard(spinlock_irqsave, &host->lock) {

    regmap_read(...);

+ }

Patch 2: add runtime PM handling around register accesses

+ ret =3D pm_runtime_resume_and_get(dev);
+ if (ret < 0)
+     return ret;

  scoped_guard(spinlock_irqsave, &host->lock) {

      regmap_read(...);

  }

+ pm_runtime_put(dev);

This should make the review easier and clearly separate the
functional change from the refactoring.
Does this approach look reasonable to you?
If so, please let me know and I will prepare the
corresponding patches.

Best Regard,
Phuc




On Thu, May 14, 2026 at 6:22=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Thanks for the review.
>
> This seems to be pre-existing behavior rather than something
> introduced by this patch, since the current change only converts
> the locking to use guard() helpers and does not modify the
> runtime PM handling.
>
> If this turns out to be a real issue, it would probably be better
> addressed separately from this cleanup patch.
>
>
> On Thu, May 14, 2026 at 11:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Hardware State / PM Violation leading to bus hang
> > --
> >
> > commit 0686001584788d984a0f16403183bcad78fe4176
> > Author: bui duc phuc <phucduc.bui@gmail.com>
> >
> > ASoC: sun4i-spdif: Use guard() for spin locks
> >
> > This commit refactors the locking in the sun4i-spdif driver to use the
> > guard() macro for spinlocks. It replaces manual spin_lock_irqsave() and
> > spin_unlock_irqrestore() calls with scope-based cleanup.
> >
> > > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-sp=
dif.c
> > > --- a/sound/soc/sunxi/sun4i-spdif.c
> > > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > > @@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kco=
ntrol *kcontrol,
> > >       struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
> > >       struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> > >       u8 *status =3D ucontrol->value.iec958.status;
> > > -     unsigned long flags;
> > >       unsigned int reg;
> > >
> > > -     spin_lock_irqsave(&host->lock, flags);
> > > +     guard(spinlock_irqsave)(&host->lock);
> > >
> > >       regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
> >
> > While this issue isn't new to this patch, does this code risk a bus han=
g if
> > the device is runtime-suspended?
> >
> > The regmap configuration lacks a cache, and these ALSA kcontrols can be
> > accessed by userspace at any time. If the audio stream is idle, the dev=
ice
> > will be runtime-suspended and its APB bus clock (apb_clk) will be disab=
led.
> >
> > Accessing the physical registers with the clock disabled will trigger a=
n
> > asynchronous external abort.
> >
> > Would it make sense to ensure the device is runtime-resumed (perhaps vi=
a
> > pm_runtime_get_sync() outside the spinlock guard) before touching the
> > hardware?
> >
> > [ ... ]
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513105003.=
81880-1-phucduc.bui@gmail.com?part=3D1
