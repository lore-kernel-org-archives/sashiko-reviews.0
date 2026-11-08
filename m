Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140812;
	b=H0/0BC94WbSxFtOazD/adEZHXv+r3svdBVzJjENxQyjDaMexWPpbo2vXHW1FzzcxguXA
	 qWwm1oV6pnRggK0c/8KoQoxT6sp0kWMU9/MsyzootMz6wyF/XBSuMItBM2wd+LkEZxT6Z
	 vxDUPVHmgMnvHEXgyGjWTjD7sBus+pUHfw4/YSVQIJ+OjFZgdvHi1iiGm+J7pJbtxpx2m
	 /YbxWoGPBSpYAZJAPkGVKog1tc1ewIz/IRuEITFZsxQo2bhZyfCKayUPHFB4wNnkp+KCZ
	 a7zBMoR9lbg4z/29M/Xp9zNa4CS+6zlF4+gIJFaChO4ZnusvI2CLCCYcji+LNcKp1HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
	b=3tX853emSbtbJEOczFHEwbw7Ke5zAMLuZU5iSBksSC4ol+tgn0ByCEK902AkTCWe1Rkr
	 Jjt1NmUPycrvumAG36Fo5lT0eQOwk7EgvvcB5MpYOJCMnx0FsRAL0vcX/QKoL8T8OOmS8
	 bFxam2e6Cu+/rU6KWJr2tangFZIa94+UU1fT72XNGLTDVWiZuYOV2MMUK8cMmkprUDF2M
	 +thK4KZX8UGs9ispUo9EfeDiMNAkk5IDwKbcrLE+i8WlAEhg0XcDhBDZo2f/f2q8c2Uxt
	 8PNgqpNWuhQHqFwIyrIO+sdvUncHRPhRO1638WJ186xI/zI+CWCHwUYs6p3gibmzUyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFqA7XjF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E8606A31C
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 12:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFqA7XjF
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so196457eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 04:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794140811; cv=none;
        d=google.com; s=arc-20260327;
        b=EDmHqRHxQPER0c3u7JbyBb8cAIbM7cdVDEmn7I+d9kSvnrFv9orGrN2GP30qfONsEb
         a6DfMxWRU4Bs+Onr7Yb7eIhuqPCnytyrz9JwLKe9vOVFbU28q4X/33WfyRaNvIPIhR8+
         2kIiOJg+f8GcM4KnI21t/yKtLvAsnFmnpZrOiRuh0+oMvQwUur5Xmwmnx2OO4lCS08te
         iAQqFd73oq8hi14JfkojfThl9CO+W/U6L19ioaS5a+jHPCXALTjj+Bq58ZVoxxG4DVjT
         M+xME5+NBjb5V7GPYrw50RHnVEulzp5EmchsNBlVChl8aecmHXcV/Whys0imHChq5Ai/
         rv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=nxLdE8jWGe1+FkV2My9SjdO1OdtVmuDyyilZlZnpraP8V+tLhCZqQaORcMDcEIg6fR
         o5TUPcMkm8CXTsjD6ZRb02tCsp+O6RS94jU8pgEME0eWZis8sBjZ8YgYEkStGJfBLHxm
         hnWr9JK/PzvgQwlFZftmBwTdrX4l9LihvNvpPzuqBVS6Ov35JJV3U1TtTt2CF87+1eXq
         ID/yFtIvWfQJMKGZl/mPvHshTZOH5fqh/Z1gufaVCESPFuEYa4YNMdOH/P42hJ6or+Wd
         VeG8JVitBLDTvfd4YvsovTjjUTPWOzW53oeqdWnRG4IoghXuo8YSWOBAaLcMpyLppABS
         3PNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794140811; x=1794745611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        b=lFqA7XjFi1kKMHymKlzo8kahnbM90SkEmQ6unKpq4clqzAbZ7nJxaJv8JJ1poPKtIl
         JCNQ/J6T9gKENjyr3fMYrluV8m1lBIWk7WdiIh39gnDhdX9rSNpiRG5TO8ptxuwZtvWE
         a8jyUhjNEvt/TJ+zPYSLRftVKO2/5bC94MXaFlamZogZvuWQxRiR9/uVL3YCpo8JLeDs
         Jo1KLryRiKeTK0nNXXPmclkqfeQWBwNHOqbMxQQOCpp0PypW5BWk+l2PmLPGAtLviPIQ
         hzjnP0I5fuWaTvaGufN9xfGY73uMSw6CYCA4en7xN5Lv1AHUoZE1O6NNOWyP0WAKFo3m
         VNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140811; x=1794745611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        b=KnV2/UYns5GEtMmUgWYjbmdVXbw9g0a1wzM9nHrtOLXS2e2v8sFvcSb1GgPz/kJIG8
         aXTeMVWr+EepDbocJ+yYLMeDaLUirPEH87yzOWuaRLlxML/wM8RHhyf43kCj6cx/XOvh
         iEfPk82t0VMCqCqLSf1ZNfVAOO/KUFdHG2OuzQSt25w7eGDHVUNLLpYClEQxeLXTl/He
         9msZbl/NIacnwk/Ri9ny6fj/4xpA1dDYQ/6To/bFHw5uDSJV/DN3qmYi/qeAT6Kf2twQ
         KUYFdkyV8f9UNIrismrIpv2d53qc0J2bkcAHKrmiJ1sNcYFDnWOKz/QZFE06GaRNMaDE
         6RHA==
X-Gm-Message-State: APuU4Z/uAQqoaImWF8WK9FN2+uSzKJQ0yeXtSkJqr2hzCA2ncPCUU/Gl
	Bfvfnu/UV+pkXnhwH96kLG2YTjzyM56urSn+UaptDAN1pyqHpW1a7/RLEmVNXs0iwPysTdtOWhH
	PYucN76nIaVvU4qN5eKq9/jl4yjZMIyqzwnZ9DAg=
X-Gm-Gg: AYBFou13RRJJKFVAbCxedtc8DtfNDNw79lrBjMTJslC4PA2QfU7fTgzWFHBlIUz+DTU
	h3UMxwkzAdphkHNSNrvXDQDmnFLQOBJHeEbS5buIlUvS4gITkOS+eegb/wcRTYbEfweSja2w6+1
	UFvQJg2ptksfTIf7GLz2ACKcNE5GGT6CuGnHtqqeFgUDU0hOjsFW9TpMifAO1BUX5uRYrB8t0yf
	tqMgsUQZ+WqMP1soaA/kO3Q03hhRdaap+YsIpi3ovTdzspS7yFW3CR8fxWzqHCspdKxTwALveTv
	wjoLVR0JrHEQDRiW/oU5g3+RZ4MEmqcp1thKJT/yMc9c54folW3KyANiZe5GBKnigPLnRZv9+Tx
	12Tn0rKCTojpjMpvMLxkR/Hr7VGUXwfbIIQ73OkdXlCAISN2o0oULWCu5xWpvHEldvWvf
X-Received: by 2002:a05:7300:1c0b:b0:366:2893:7421 with SMTP id
 5a478bee46e88-3725d77d5a3mr2667000eec.10.1794140811086; Sun, 08 Nov 2026
 04:26:51 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108075116.251501-1-hj351016@gmail.com> <sashiko-outbox-203644@kernel.org>
In-Reply-To: <sashiko-outbox-203644@kernel.org>
From: khj <hj351016@gmail.com>
Date: Sun, 8 Nov 2026 21:26:39 +0900
X-Gm-Features: AclHuK8osNMBBduPbbtZlOwueo3fS_08uTUPSOwGZBoE2xOvgWzT7m2_givR3xg
Message-ID: <CAGr5VtMcrnHRZWjoL92uQJFgPcigv+Py=-R_S-a3rNRE0XtOAQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before
 freeing f_audio
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- all four are valid, and the Critical is the real root cause.

v1 only cancelled playback_work, which is necessary but not sufficient:
as you note, f_audio_disable() is empty, so out_ep stays enabled and
f_audio_complete() can run against freed memory during unbind regardless
of the work. v1 also cancelled after gaudio_cleanup() and leaked the
play_queue buffers.

v2 implements f_audio_disable() to quiesce the function properly: disable
the OUT endpoint (which gives back the outstanding requests, so
f_audio_complete() stops touching the freed f_audio and no new work is
queued), then cancel_work_sync() the playback work, then free the buffers
left on play_queue/copy_buf. That addresses the Critical, the ordering,
and the leak in one place. I've also corrected the Fixes: tag to
f3a3406b3f56 per your note.

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:13, <=
sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] usb: gadget: f_uac1_legacy: cancel_work_sync() after
>   gaudio_cleanup()
> - [Medium] usb: gadget: f_uac1_legacy: play_queue buffer leak in
>   f_audio_free()
> - [Low] usb: gadget: f_uac1_legacy: Fixes tag cites file rename commit
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] usb: gadget: f_uac1_legacy: use-after-free in
>   f_audio_complete() due to undisabled out_ep [1]
> --
>
> commit 12cbf9965abf5188436aa00e354e601adc2d615b
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> > usb: gadget: f_uac1_legacy: cancel playback_work before freeing f_audio
> >
> > The OUT endpoint completion (f_audio_out_ep_complete) and the set_alt p=
ath
> > schedule audio->playback_work, whose handler (f_audio_playback_work)
> > dereferences the f_audio (audio->lock, audio->play_queue, audio->card).
> > On teardown f_audio_free() frees the f_audio with kfree(audio) but neve=
r
> > cancels playback_work -- f_audio_disable() is empty and nothing else
> > drains it. A playback_work still pending when the function is freed run=
s
> > against freed memory, a use-after-free.
> >
> > Cancel playback_work in f_audio_free() before kfree(audio). By then the
> > function is unbound and the OUT endpoint is disabled, so the work canno=
t
> > be re-queued and cancel_work_sync() is sufficient.
> >
> > This was reproduced with KASAN as a slab-use-after-free in
> > u_audio_playback(), reached from f_audio_playback_work(), under dummy_h=
cd:
> > with a UAC1 playback stream active, unlinking the configfs function fre=
es
> > the f_audio in f_audio_free() while the work is still in flight. A dela=
y
> > was added to the gadget streaming path to make the schedule-vs-free rac=
e
> > land deterministically; the missing cancel is present regardless. With
> > this patch applied the splat no longer occurs.
> >
> > Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implem=
entation legacy")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
>
> [Severity: Low]
> Commit d355339eecd9 ("usb: gadget: function: make current f_uac1
> implementation legacy") only renamed f_uac1.c to f_uac1_legacy.c.  Should
> the Fixes: tag point to f3a3406b3f56 ("usb: gadget: f_uac1: convert to ne=
w
> function interface with backward compatibility"), which introduced
> f_audio_free() without cancelling playback_work?
>
> > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/=
gadget/function/f_uac1_legacy.c
> > index 7c8d60c7e87d1..2dca5cda8cfd7 100644
> > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > @@ -945,6 +945,12 @@ static void f_audio_free(struct usb_function *f)
> >
> >       gaudio_cleanup(&audio->card);
> >       opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst=
);
> > +     /*
> > +      * The function is already unbound, so the OUT endpoint can no lo=
nger
> > +      * queue playback_work. Drain any work still pending before the
> > +      * containing f_audio is freed, otherwise it runs against freed m=
emory.
> > +      */
> > +     cancel_work_sync(&audio->playback_work);
> >       kfree(audio);
>
> [Severity: Medium]
> Should cancel_work_sync(&audio->playback_work) be called before
> gaudio_cleanup(&audio->card)?
>
> f_audio_playback_work() calls u_audio_playback(&audio->card, ...), which
> reads substream->runtime from card->playback.substream and loops back to
> try_again when snd_pcm_kernel_write() fails.  Calling gaudio_cleanup()
> first closes card->playback.filp while playback_work may still be running=
,
> which can free substream->runtime underneath u_audio_playback() or leave =
it
> retrying in try_again while cancel_work_sync() waits.
>
> [Severity: Medium]
> Does cancelling audio->playback_work here leak buffers left on
> audio->play_queue (as well as audio->copy_buf)?
>
> f_audio_out_ep_complete() and f_audio_set_alt() append each allocated
> struct f_audio_buf to audio->play_queue and schedule audio->playback_work=
,
> and f_audio_playback_work() is the only place that dequeues and frees the=
m
> with f_audio_buffer_free().  When cancel_work_sync() cancels a pending wo=
rk
> item, or when more than one buffer is queued, the remaining buffers on
> audio->play_queue are never freed before kfree(audio).
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but nothing disables
> audio->out_ep before f_audio_free() runs [1], so can
> f_audio_complete() still race with teardown and use audio after free?
>
> When the host selects alternate setting 1, f_audio_set_alt() enables
> audio->out_ep and queues usb_request objects with req->context =3D audio =
and
> req->complete =3D f_audio_complete, while f_audio_disable() is a no-op an=
d
> neither f_audio_set_alt(), f_audio_unbind(), nor f_audio_free() calls
> usb_ep_disable(audio->out_ep):
>
> CPU0                                  CPU1
> f_audio_free()
>   cancel_work_sync(&audio->playback_work)
>   kfree(audio)
>                                       f_audio_complete()
>                                         audio =3D req->context
>                                         out_ep =3D audio->out_ep <-- use-=
after-free
>                                         f_audio_out_ep_complete()
>                                           schedule_work(&audio->playback_=
work)
>
> During gadget_unbind_driver(), udc->driver->unbind() runs before
> usb_gadget_udc_stop_locked() gives back pending requests on the enabled
> endpoint with -ESHUTDOWN, so f_audio_complete() can also be invoked after
> f_audio is freed.
>
> [1] https://sashiko.dev/#/bug/linux-7598f007-24ed-4b73-bc9a-a11e4ec9838e
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108075116.25=
1501-1-hj351016@gmail.com?part=3D1
