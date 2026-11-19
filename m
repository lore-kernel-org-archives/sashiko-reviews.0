Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117859;
	b=xHNEDyiAY2QtKTU/4bkXSU1cPpJKGh0Vtj5/cJzY+/mIBbpRBaRobxU4mkR/ht4R3yJj
	 68HwHxqNCEXZRNUy+JmQ2kZfDsTfsfYTr7ul8+fZLEXHeo68R1IS6R2OpDPsQzUwbA9/4
	 DIM+FMkbJWnZvCa8Mr4GInYdgQoSgBTLxhHg7h1FkqCG0GUVq2mMy9BD8eeSst8NYU0as
	 3FBr3t7l5ZV7uNTjZR4WST6s/MIP+e4by5TIeo0wwxsJ6rmAdR8S+dmF3jTtNAuabnRQn
	 j3vSmkRmanSZrdqZkKCZMVpHWUdIhI96fLAQhJxM2lI8cB6NQVs27eutrPTVQ9OnJeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=aANZhc3kQYwnQcRF9OF2NeREH20t7ae5EPygqFTyG3s=;
	b=JtFXCKqXNPDlowxH7QAMByD6m6BbPjmj5/1RfsVmH2U1ogSpb5aaBwLnphFtKkBWT4Tb
	 BzAt6Mr72U2zsJwHLwBBfMJy0fBToXH0zRr1Ga+gZ8uwCV1B47EUMFlfSrj1cQdhu1+2N
	 TLkbjdKY1+7itwOgJJH1ucYxh++hyD0OmwT0z7uHinj3cbVYSueziicmfWxz0vDk8cRvv
	 E1xL8sMiIoRrM1vBnMIzbBNz+y0FmBabhr7LLCPxLcc5IWyb8x0ijSnOV2KHA+gqan8u6
	 kGGR/ULv9a2ANC0p06bQEzaJLCm/pvftCuDEYZ/seVscvxlhsuppVT2GQLy8+La0j2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y3a/Nvii";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F206606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 19:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F206606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3a/Nvii
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so753265e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 11:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795117857; cv=none;
        d=google.com; s=arc-20260327;
        b=fHEjhbJXdhObc0REhF9CMczc83Nb6AUn/dUtMw1ef0xOnzJE3Oe4JeUMnz3eGkjIe0
         jZZ3ktnECQOpJL1BeoLCBhwJd9sEQ5sUEiD1JEAU17d3/tXgMIXAkGDA0CBsqM4HLUBe
         LVa9bRHoble9240zACiHoOq0hDtCJDfZY5IP5bsWwI1B+l/5Nj9aSIIXV7kMA0UJJCU8
         XiA+DNfbFut+wqKGjXd4iQo5TCma5/27dk750XrVdL0VYwkhW2P+PoNpQyItIleqXocn
         MSwBYPZdVJKcDqhoe1lrsHCUHe4krCLktjTo1RxnhfR5Cmt9W1by77O0a2DU0XSPUnfB
         Ik3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aANZhc3kQYwnQcRF9OF2NeREH20t7ae5EPygqFTyG3s=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=dweUjqMLoxKwZDGPzq9wEnP2iL0GZ2uO3tY6qlh9BGpAAuEpepQL5Ukyedjh2agi7I
         03K3654qfmD4k2HYoQPHewG68vrzDcbPTIikITPJIYEJoqO7Q584EVcbOh9qbsX5DOip
         FocroGfkBiD0vLYNIwDf9wzryFE2RkviMeRJ/X7KLHPprFIZkDBFSQ/3U7RHq4i4bOKE
         yRgFa51jq8GPAJ7bIrIbS8NUVCwNXHXVBREJiFU+LlLY4WWsG00+TWeVNlYybRB7m4kS
         nT+r0hh4hm5MSdnz5yT4v47yhLCEBERnmq7tojIqX6+X7pK0l3TSBm9Df4PR2drpOw9x
         B/yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117857; x=1795722657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aANZhc3kQYwnQcRF9OF2NeREH20t7ae5EPygqFTyG3s=;
        b=y3a/NviiP6BTiIKrNiI5xZQZyxy/E2oANHDkPK5Be4GEsWslB0KWE51fl+GtxQ2CEp
         6k6fpBb+FnEDYnnUAd13NfaaM8PvES6t2dsWw+iVNCJFI5valTi6oQKw36ox2gFckqBz
         kXy1/bJI3SdlEGzVkj1o4TzcKpLxKVrzV+knUZ15sPbHqzBwsPj681YTuPKTqXsiNB8S
         llNz7FuuCJfp/Cc0gylz+M8F+JGB7mJdDXpQbKwOCqJzDlI8UA3aeYeelp7cKtz8U3YI
         Q0mSDPACxAGt4jhDid95CqXPPyPhmrsLR98PJTHfiVuP9TJBZJ2dfdEL2tneeterCjxY
         rKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117857; x=1795722657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aANZhc3kQYwnQcRF9OF2NeREH20t7ae5EPygqFTyG3s=;
        b=ut0CGrzF+QGjpx7svBYxRTZ2Bo31RrBimjO5iAGajc2KPg92dO7vTDzBAWcWGWsRrj
         cSuIXwCY6rNuU9i81CbAmL1F61Ui6TzFpPR07zDjPSZnTVLtApwqXAGcVqazmA0J0OsG
         RpDzRM9PuizhFChRagDLuWhi9dQ9pB5kpXQiyb+yY7aD+qCt4ALUFRoOl3KBCcU4df1N
         1Y/h9We2r4URLdQwXHqaPPFtPlinMa+hVY6him/m3dv3mP86XSmHEsawUDIAONZKs4kT
         zW5UzdRzJ1OP4t941IItCWJ/YLccBsZjrSZ9xy3l1sQORRSlebWzZerAqz6KHHqPXPA4
         aEvA==
X-Gm-Message-State: APuU4Z/pqdoKbPpikbH/QGLF8SIPzA3k/IIn5X+WnU7/Npgw0WqtLBE6
	M3EJrfoEtyibY/YnA5kU0k4bb6g+9PCWxs53AtgTavdHw50+XaVjm8aadTLKd1VuJC69ZLXAhK8
	cQKyh3VucEqmJ+Q5T4cMbr2N5hMeFskquHmDlFAbzPA==
X-Gm-Gg: AYBFou3pTQipOBWkDTZuxJB4ly0LSCYTlImGuO8sK99zvVUviiJMNSRUrZAZLCaaiw4
	LMj9hmxF2IqwtGL+to5UjBaOtS9Nz9zeFuRBsOR48cIMDiVE0w2yiyzKWDBjO0XGNDyKsLegrIA
	TWbRfsYTISoi2iv2d/TMSu/tEjcSRqprB7Q3V1Sdxu+nIongtnr3UpKkqPDi3CmvRRrmu0wt219
	r94YP+Umz4VVJgUeP1o5LzWMXgIQzHM3iUzcqJJnXN8T3XUBl3SAjTMuMi/Iih6LQbVqJqXQYIo
	AbgcEKvU3biNDBjPRlmHZH5EyjsMy+UHCdFV4VaRVWu8DWZTcgxRdZjRa0exuW4dPllNPeKSZ7o
	bMVx6wLkKmwL3vtjyc1HcDEtvpY+Ne6YfYRk=
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id
 5b1f17b1804b1-4bb887fe887mr14870135e9.8.1795117856614; Thu, 19 Nov 2026
 11:50:56 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-asoc-dpcm-pause-link-v1-1-5b97347b5771@gmail.com> <sashiko-outbox-223965@kernel.org>
In-Reply-To: <sashiko-outbox-223965@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 03:50:42 +0800
X-Gm-Features: Aa3M54qkdolW-IiAqhCcXyuYn1Y0lonH8m22R8ej5KdRu3qZXoYvZ5AR4I8p5Qc
Message-ID: <CA+X8SdgOMQM-h1GTBNPDUHrjVfqjY9P3k7FgpzxZYCxG-V=5dA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Track BE pause per FE-BE link
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> - [Medium] ASoC: soc-pcm: duplicate PAUSE_PUSH sent on STOP in
>   dpcm_be_dai_trigger()
> - [Medium] ASoC: soc-pcm: stale pause count after prepare/hw_free in
>   dpcm_be_dai_trigger()
> - [Medium] ASoC: soc-pcm: BE left in PAUSED state on close in
>   dpcm_be_dai_stop()

I went through the three cases with the code before this patch, and it
behaves the same way in each of them:

1. Closing a FE that was paused across a system suspend while another
   FE keeps the shared BE open: before the patch the BE also stays
   PAUSED (with be_pause still at 1), so the other FE's hw_params skips
   it in the same way. The patch only drops the stale count.

2. A FE that was paused across a system suspend and then prepared but
   not started: before the patch be_pause also stays at 1 until that FE
   stops, so a STOP from another FE sharing the BE sends PAUSE_PUSH in
   the same way.

3. STOP sending PAUSE_PUSH to a BE that is already PAUSED: the old code
   does the same whenever be_pause is still non-zero after the stop.

So I don't think these are regressions from this patch, but they are
gaps in the same bookkeeping. If that's useful, I can send follow-up
patches to drop the link's pause when the FE is prepared, and to skip
the trigger in STOP when the BE is already PAUSED and still paused by
another FE. The close case would need the BE to be stopped from the
close path, which I'd rather discuss first.

Thanks,
Suyuan

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=
=A8=E4=BA=94 03:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] ASoC: soc-pcm: duplicate PAUSE_PUSH sent on STOP in
>   dpcm_be_dai_trigger()
> - [Medium] ASoC: soc-pcm: stale pause count after prepare/hw_free in
>   dpcm_be_dai_trigger()
> - [Medium] ASoC: soc-pcm: BE left in PAUSED state on close in
>   dpcm_be_dai_stop()
> --
>
> commit 30a052e7da7505ef9d19e12059b179dfd9931fe2
> Author: Suyuan Wang <stevewong@hust.edu.cn>
>
> ASoC: soc-pcm: Track BE pause per FE-BE link
>
> This commit replaces the per-FE fe_pause boolean with a per-link paused
> flag in struct snd_soc_dpcm so that BE pause refcounting and trigger roll=
backs
> are tracked per FE-BE link.
>
> > diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> > index ef8ccf52798eb..cb8d23756b1e0 100644
> > --- a/sound/soc/soc-pcm.c
> > +++ b/sound/soc/soc-pcm.c
> > @@ -1685,6 +1685,17 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime=
 *fe, int stream,
> >               if (!snd_soc_dpcm_can_be_update(fe, be, stream))
> >                       continue;
> >
> > +             /*
> > +              * A pause may survive until close, e.g. after system sus=
pend.
> > +              * Drop the pause this link still holds.
> > +              */
> > +             if (dpcm->paused) {
> > +                     snd_pcm_stream_lock_irq(be_substream);
> > +                     dpcm->paused =3D false;
> > +                     be->dpcm[stream].be_pause--;
> > +                     snd_pcm_stream_unlock_irq(be_substream);
> > +             }
> > +
> >               if (be->dpcm[stream].users =3D=3D 0) {
> >                       dev_err(be->dev, "ASoC: no users %s at close - st=
ate %s\n",
> >                               snd_pcm_direction_name(stream),
>
> [Severity: Medium]
> Can this leave the BE stuck in SND_SOC_DPCM_STATE_PAUSED when another idl=
e FE
> still has the shared BE open?
>
> If FE1 is paused on a shared BE across system suspend and then closed whi=
le
> FE2 is still open (be->dpcm[stream].users > 1), dpcm_be_dai_stop() drops
> be->dpcm[stream].be_pause to 0 and returns early after decrementing users=
.
> That leaves be->dpcm[stream].state at SND_SOC_DPCM_STATE_PAUSED with
> be_start =3D=3D 0 and be_pause =3D=3D 0, causing later dpcm_be_dai_hw_par=
ams() calls
> for FE2 to skip the BE because its state is not OPEN, HW_PARAMS, or HW_FR=
EE.
>
> > @@ -2220,7 +2231,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtim=
e *fe, int stream,
> >                              int cmd)
> >  {
> >       struct snd_soc_pcm_runtime *be;
> > -     bool pause_stop_transition;
> > +     bool was_paused;
> >       struct snd_soc_dpcm *dpcm;
> >       unsigned long flags;
> >       int ret =3D 0;
> > @@ -2248,6 +2259,16 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runti=
me *fe, int stream,
> >                           (be->dpcm[stream].state !=3D SND_SOC_DPCM_STA=
TE_PAUSED))
> >                               goto next;
> >
> > +                     /*
> > +                      * A stream suspended while paused and prepared a=
gain
> > +                      * starts without a PAUSE_RELEASE: drop its pause=
 here.
> > +                      */
> > +                     was_paused =3D dpcm->paused;
> > +                     if (was_paused) {
> > +                             dpcm->paused =3D false;
> > +                             be->dpcm[stream].be_pause--;
> > +                     }
> > +
> >                       be->dpcm[stream].be_start++;
> >                       if (be->dpcm[stream].be_start !=3D 1)
> >                               goto next;
> > @@ -2260,6 +2281,10 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runti=
me *fe, int stream,
> >                                                     SNDRV_PCM_TRIGGER_S=
TART);
> >                       if (ret) {
> >                               be->dpcm[stream].be_start--;
> > +                             if (was_paused) {
> > +                                     dpcm->paused =3D true;
> > +                                     be->dpcm[stream].be_pause++;
> > +                             }
> >                               goto next;
> >                       }
>
> [Severity: Medium]
> Does deferring pause cleanup until SNDRV_PCM_TRIGGER_START leave a stale
> be->dpcm[stream].be_pause count after a suspended stream is prepared or
> hw_freed?
>
> When a paused FE is suspended and then recovered with snd_pcm_prepare() o=
r
> snd_pcm_drop() + snd_pcm_hw_free(), the FE transitions to PREPARE or HW_F=
REE
> without sending PAUSE_RELEASE or STOP.  Until that FE either starts or cl=
oses,
> dpcm->paused remains true and be->dpcm[stream].be_pause stays elevated (a=
nd is
> restored if SNDRV_PCM_TRIGGER_START fails).  If another FE sharing the BE
> starts and stops in the meantime, its STOP sees be_pause !=3D 0 and sends
> SNDRV_PCM_TRIGGER_PAUSE_PUSH instead of SNDRV_PCM_TRIGGER_STOP, leaving t=
he BE
> in SND_SOC_DPCM_STATE_PAUSED when no stream is paused.
>
> [ ... ]
>
> > @@ -2307,30 +2338,32 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runt=
ime *fe, int stream,
> >                           (be->dpcm[stream].state !=3D SND_SOC_DPCM_STA=
TE_PAUSED))
> >                               goto next;
> >
> > -                     if (be->dpcm[stream].state =3D=3D SND_SOC_DPCM_ST=
ATE_START)
> > +                     /*
> > +                      * A paused FE left be_start when it paused and o=
nly
> > +                      * holds a pause on this BE.
> > +                      */
> > +                     was_paused =3D dpcm->paused;
> > +                     if (was_paused) {
> > +                             dpcm->paused =3D false;
> > +                             be->dpcm[stream].be_pause--;
> > +                     } else if (be->dpcm[stream].state =3D=3D SND_SOC_=
DPCM_STATE_START) {
> >                               be->dpcm[stream].be_start--;
> > +                     }
> >
> >                       if (be->dpcm[stream].be_start !=3D 0)
> >                               goto next;
> >
> > -                     pause_stop_transition =3D false;
> > -                     if (fe->dpcm[stream].fe_pause) {
> > -                             pause_stop_transition =3D true;
> > -                             fe->dpcm[stream].fe_pause =3D false;
> > -                             be->dpcm[stream].be_pause--;
> > -                     }
> > -
> >                       if (be->dpcm[stream].be_pause !=3D 0)
> >                               ret =3D soc_pcm_trigger(be_substream, SND=
RV_PCM_TRIGGER_PAUSE_PUSH);
> >                       else
> >                               ret =3D soc_pcm_trigger(be_substream, SND=
RV_PCM_TRIGGER_STOP);
>
> [Severity: Medium]
> Can SNDRV_PCM_TRIGGER_STOP send a duplicate SNDRV_PCM_TRIGGER_PAUSE_PUSH =
to a
> BE that is already in SND_SOC_DPCM_STATE_PAUSED?
>
> When be->dpcm[stream].state is already SND_SOC_DPCM_STATE_PAUSED,
> be->dpcm[stream].be_start is 0.  If two paused FEs share the BE (be_pause=
 =3D=3D 2)
> and one of them is stopped, be_pause drops to 1 and execution falls throu=
gh to
> soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH) on the
> already-paused BE.  The same duplicate PAUSE_PUSH happens if STOP runs fo=
r an
> unpaused FE (was_paused =3D=3D false) while another FE holds the BE in
> SND_SOC_DPCM_STATE_PAUSED, such as when snd_pcm_undo_start() sends STOP a=
fter a
> failed start.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-asoc-dpc=
m-pause-link-v1-1-5b97347b5771@gmail.com?part=3D1
