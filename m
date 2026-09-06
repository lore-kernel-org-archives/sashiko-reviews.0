Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A0246778
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659225; cv=pass; b=rTbI4T9ez3cejV7te/Lu6/jV7ulbeXm7+S9dpA+UeSMK9lcdBwsJcSohUiMUjdnB+4Mwjea/E+W4RLx1A99rJk4yXK0UHCoMqezVqyQSl7Y5M5KtC4qaxerkNGGI+XwsC3eRdjmJ6nh042Jfk8DztWR0MBqN4vTzuwCl6Hh785U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659225; c=relaxed/simple;
	bh=8p128yWcOOgvfc5rvLcd5R3DTRB7J1JcVPGCpi4fpqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e45ZjdnibCEphPfEUGpoDX2KAcCL4IhwYLf3+urr1zELkzkwig93gCQQ3Q+fwUJChERlSrLCrrZE9mEaJBo2WykK4VokVmnis/InwaXksPpKHgRQP9u5adpeZW8vpFO7J+KGiZoklEhXB4k0UbT38s9+IceLQ3v5Pw+E5/mgFEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVpXa5bm; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVpXa5bm"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9399258e5f8so143337485a.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 18:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788659222; cv=none;
        d=google.com; s=arc-20260327;
        b=NwPA9N2VQY0j7ZuAVBQtsePqQYOSug6u845EUfJw2KI4uUc3PTxiFmQCENwqEe/G4c
         kBrstQTb2Oo6p7DtHPahPM26p37nDxbOo+AruJSNnEf07Kj2WiLUwFHsMC8YejIOmGzp
         8yWgIK3IAO9pkCw0w3t6sFNlaKPLs3/gtytPsrq7+NNppNEVHMXddfGRfVRE+HB3nX+w
         qhaVh1WTL7idxd3oMzII6LJY/zVIdjNU+HSKjTGAM0b92I5M5Xb9iyY+ElJ2DtW6kVin
         xXw/Tpw6EYZStKxJk7BqQPR3xNuCMz1vpaVsm8fIaNGcbzQ8ArVoGV5iJ/T7Y6B+//vN
         OyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxmMh7HdE3ykc1Lqfns8Sc2JU4iSRDsi8vOQrQ4w9vE=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=NowlMcCtQdrx5alo6RitKlnN3vBQwD8aOcyVQG8dUgaBe/WzkbWVdgR2DGtCOVUt64
         8/WYquLiTTX4+UKTeVkNMsn9V1x0GvvNMRKnl8A9dMleeb52iwNRB7YUbfBSr7buY8ML
         kmQo7KfzV0EqBjkjdc0ELZrDFkf4MmO2wRhpCPvjJtnMrlUl0dlii6/ZmZu6bIjmQNaD
         IVg+SZNMtxd33aink1EGWkns9G+7ZeD+0lhfRE9dY7uFeT4I20ygC3SuTDUulm5ovBFt
         tn/u4QkP4VADT3TbkTZDM2vVFQ8uu9rYxCd/JoNJwFdErhra2wv0Utv8nQb1UbspBKlo
         aCAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788659222; x=1789264022; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QxmMh7HdE3ykc1Lqfns8Sc2JU4iSRDsi8vOQrQ4w9vE=;
        b=AVpXa5bmk0ubF4harOlNpECEcq27+7k/ras2f80ROHOlXvktft4/Yw0eZ5S++oa9/n
         I8mxrYPzb8YqKRmRZJ/xK4OcnlsuVDPAIGAw2svUrZHsEbmRJOQB5uMqII/fwrU8miay
         J8dPT51H0ym1tnXVRv7FAeTi/KgxRhJjHjgXt9vSmiSS4cd3KEOB+6tBgqTeBHv5Aw9Y
         93Z9PKrx5qaldtGUdhguW4EsJnL1QCXQbjiPbxthd0wEGfnoQOgvAYfj9nwoL/BmEs+R
         7Af12zgQdWs6f87ycgWvjcqHs/snnpWe7PP+Od1tDsewdT/90jPC/NFibz1NqjG+ySSk
         pFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788659222; x=1789264022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxmMh7HdE3ykc1Lqfns8Sc2JU4iSRDsi8vOQrQ4w9vE=;
        b=bsz0nNEPpMMPtcO/fTnDZlY5DXiAe+Cb6t7q8EvsAOHlLKqQmI63gxLla2w8D8QAoi
         k9M9KchElCLNViwo2vlZIXwiW4ZdtLwYTaPc5p9x8U8211aYIYd9Run0U3YnZGgxmp1b
         38cPhBFHyKvaLneF+gq9k82U7t3iFfmzVzsSDW8wxiQ+i2xdLkbevcEp+XutEYtoMMCV
         ZN07ZI9HlUFbPH2dD5UjFFcw6J3ShjcPGc5Z8J5U/ADt0nxQg+90yl14jg2mxXMI3/PZ
         6LEnabQeXnkeypo+RhezxZYIod5F3UqbtyLennQirAP0OkjdyheMsOtSbMCITQPLLpAc
         4P5w==
X-Gm-Message-State: AFuF++nW5U8m+JUHGf0TAOIWMKX2rr/ebTL26PcqTtiN0TnIkiOS51lV
	cp8/wEGadxfXLHxlLk7lw3wI+LoND1Y6Yz9tByNpXPsuqZ7kpd21BbJnntvkD4zIU8eXHz1S6Za
	pu6XK2iVJ7r5I2F1ZE6jB8bBrxIk6v+hDxCsh
X-Gm-Gg: AYBFou2/btd6EziddLZjVGfEPmS31VI4spy7lCfql848lo+OsJFW4dbLz1ZLmW6569s
	z/RJjEa6MoWtrqNAHXXp3lGJ2bEmVK6ADhmAzxJw2siB/7K1wBeXcfuWWdwAqAP2F2XSlAP56a4
	RVu7LilWBtq6quh15je68YnkLAdb7S9UtPPtk5U/ESGCv40MkIgZ9/qP2kbQJWxOLw8AUlsPb7a
	K+PNck8mMuvtVJmsxQ1IpApRV2yv6LJTpjnGRmcUUJB9Ll+3nEUUvjs3snBdEdNaERchbGAShkw
	wjx6FvM48ZR/KGhRVQ3zHn8paeImeViVC4iU8oqw/ZGQAjItfAWpaUiU
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id
 af79cd13be357-9398077453bmr1491078385a.50.1788659222531; Sat, 05 Sep 2026
 18:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904005240.502787-1-physicalmtea@gmail.com> <20260905005352.1E5B01F00A3D@smtp.kernel.org>
In-Reply-To: <20260905005352.1E5B01F00A3D@smtp.kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 6 Sep 2026 09:46:26 +0800
X-Gm-Features: AcwNN1Uz8wr-epjfsaLBUzBnMwbbmAIBLIa_l8bHM3MEHqc2afAijKPJ2Jb8XE4
Message-ID: <CAJwVaMJsTVYPKhB4-a++=hapn7teFRuf3o-0aHkp-BjvwU8Jrg@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: fix event queue iov out-of-bounds
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Self-deadlock (AA deadlock) in vhost_scsi_send_evt when vhost_vq=
_work_queue fails.
> --
>
> commit c17fff972ec26b541af9ec7b514db052328d64e6
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vhost-scsi: fix event queue iov out-of-bounds
>
> This commit fixes an array-index-out-of-bounds issue in vhost_scsi_do_evt=
_work()
> by ensuring there is at least one input descriptor before indexing the io=
v array.
> It treats pure-output chains as missed events to prevent reading past the=
 end
> of the array.
>
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 7a1f39a327da6..5a0863d560a07 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -608,9 +608,10 @@ vhost_scsi_do_evt_work(struct vhost_scsi *vs, stru=
ct vhost_scsi_evt *evt)
> >               return;
> >       }
> >
> > -     if ((vq->iov[out].iov_len !=3D sizeof(struct virtio_scsi_event)))=
 {
> > +     if (!in ||
> > +         vq->iov[out].iov_len !=3D sizeof(struct virtio_scsi_event)) {
>
> [Severity: High]
> This is a pre-existing issue, but while reviewing this event handling cod=
e, I
> noticed a potential self-deadlock scenario.
>
> If vhost_scsi_send_evt() is called from a path that already holds vq->mut=
ex,
> like vhost_scsi_evt_handle_kick():
>
> vhost_scsi_evt_handle_kick()
>     mutex_lock(&vq->mutex);
>     ...
>     if (vs->vs_events_missed)
>         vhost_scsi_send_evt(...)
>
> And vhost_scsi_send_evt() falls back to vhost_scsi_complete_events() beca=
use
> vhost_vq_work_queue() returns false (for instance, if vq->worker is NULL)=
:
>
> vhost_scsi_send_evt()
>     if (!vhost_vq_work_queue(vq, &vs->vs_event_work))
>         vhost_scsi_complete_events(vs, true);
>
> vhost_scsi_complete_events() then attempts to take the exact same mutex:
>
> vhost_scsi_complete_events()
>     mutex_lock(&vq->mutex);
>
> Could this sequence cause a self-deadlock where the kernel thread hangs
> indefinitely waiting on the non-recursive vq->mutex, potentially leading =
to a
> denial of service?
>
> >               vq_err(vq, "Expecting virtio_scsi_event, got %zu bytes\n"=
,
> > -                             vq->iov[out].iov_len);
> > +                    in ? vq->iov[out].iov_len : 0);
> >               vs->vs_events_missed =3D true;
> >               return;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904005240.50=
2787-1-physicalmtea@gmail.com?part=3D1

This is a false positive. The current patch does not introduce this
issue, but I will try to reproduce it to verify whether it is a real
issue.
