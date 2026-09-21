Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226943DED5
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022516; cv=pass; b=cF3i2+bcJyq/3nqN/Iab1LhyYCu/nOhMAxhRSsQr1b9l6FVmaMoEVkhp3fxTLjBgauUG/FYt4cxp4opUNa/NooIX4k6LW9/xckRfe8KtnVl37AmWEhTyyURylB0MI71HJ7dD7bJAdc7pDfKeUiMyqhXlFW2i2Vij0K2pudPuJtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022516; c=relaxed/simple;
	bh=pt+34o8lJgxRNA99LRhSysujE940rHUeLKeZxsBvkHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8JLjyjgu0mD3COCfpnW0f2EU6fOgIMPIPWtdcgsLag5Qn8U9mmPPJQNX10w0VXOWDFGY7+WO5lwl+sBHhT4Qq8CL0SzZPadkvSmwg8dCBhohGa2HRs81lg3ofnokA2ceZEcFA4hrKxJSc15iVmwmsyeu71yWP9Zw5GVgsCEwns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aI+ey5WL; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI+ey5WL"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4aae314aso2678693d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 13:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790022514; cv=none;
        d=google.com; s=arc-20260327;
        b=cHRANwP2sCwjBV3fXZRLDSR57QinGJaOgEY3vKeEPo78r3+XHLs8JjIzITmYj4Hqij
         iRq0FT94tGrfkFJyRMQPUxIcA2ZyCytKRnvfL1EpuZYIcit4DCCC1xUzD9AGnF/weyPU
         ppHjNMEPtU0/tyqU0Cho3ASxjECp1xqZar347e3+xn/ZmprEOmZ272TtyJFtGlpPNxPw
         WywAc2tarlnF6SWOHIAuQGqikEp5s8VlnTeaxGpufBeoz4Uw+O9KwkBty/7nkisSt+db
         /AFWYMMrIejfH2VhIHnK4AMVglHaVQLCId05bBdKTeOPEZaRjkjgbAAeJbhkWSzPsVW5
         wjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6elqDrf3QFm09b3Lgqg9C9aUdeLszZ6hCtMVrCJuCT8=;
        fh=LIqjvKLTBa2SW1RJjCd8GCJhCcTi6l6Iz2T7narnqBE=;
        b=gGR5Umj4334UmCrn0u/ADRxPSl/qJaPARyIaYvIrAQXf2VkF1NCcPvy9hnAKvehfrh
         OtVYri/nUbtlkZa48fjG6NwmsSWvK0XROYZ5yIlEPNIoV5cKK/QJnnHno2nwbREZmy82
         JR1JXOzpqM3idk4gCABd7x8/eE6lXCST48BYp5Ax9rn9hzvxR0r1QlBCkFwY8uMk5bqW
         vwZL9A7QvSTTHlBWPMTehUcRl7AcKcynuHk8BZT06wEvDGwzUTh4LB7IiiX4FT74CTqA
         oUOJDFtSghLZg6pMn2Hw5NduGuYJCZEg0LF5WXQrVR603t/IVvfBgewILJ5X2rYrP8yR
         xf4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022514; x=1790627314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6elqDrf3QFm09b3Lgqg9C9aUdeLszZ6hCtMVrCJuCT8=;
        b=aI+ey5WL92L0cnM+yhUPy5g/Cm0IvevV4KiWcqOCvBx0n379rWDohPL2wwsIeLEyTI
         WIKNgiXh/cPC5UzsnkNLTG/hAwk3K3RzCSoO1ay8vdyPfcyDCqUZah0l4Otb7mQaj7NS
         hlguMNNeopBLQVhZ53xy9Hsymk3euRS7zNHQHV785D6An3LcwmGa1ArrJqOeTEmWA9Ka
         y14RcbOtuMvu5iOamjMzTofSYIGOelbrcUUbiddQIwrymM8+pS6UwUY/eyU4ljDFwNMq
         5lKEaCBslC5HXXbRrsyMkIkHn+U2bBUYn8TdDkGkUhkki0F8HnJFDOpgbMRlvZuZk7Od
         D1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022514; x=1790627314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6elqDrf3QFm09b3Lgqg9C9aUdeLszZ6hCtMVrCJuCT8=;
        b=oStvcIl1kbqieXOYkQRYiLSrJO9El6wDvf7s2O9aMb8cps788TybXxdaEgepgMxtck
         ySC/GXFgFt7iJ5hTq1pMr1i9QPxjeVKxheaz0kyv63zGTotXsfeHX61A3LJCe2LMxDDU
         9v/LauwlxKu5NKrVIsq2dAXPGhdrTxkljDlWdv5xJVL7z04T5I9n4puLjhzeiqT1+YEC
         HqZYE6h5+G0GgnPEAwxGM5H/SaZn5qnaNxMAi1ewU0Piokvn8CWxJ6SlPvFXGzPt2AUN
         r8oc1a1KUxJSyzOTi/vir8TaJEa/ueOjaFk0VBGcpBWbOEcsWQ9z8eCNv624kVVcnW7X
         RK0Q==
X-Gm-Message-State: AFuF++mfC4D+Y7MansFN55XMtYslmsEKd9QhF4Jb4rC3NQsbbOjOd6Kn
	CctHgK9PEhRSBLdnfcyiSUir5bwtB/dHh9P9TJGrpapucPuRlUtkJh3H9CO8hMnZg+Ng0xslT5F
	FJmri0VV2MqSLvu2I27G36q1m5BDSCOCDtReV
X-Gm-Gg: AYBFou129xHIZCPvzGzGMnBGSWVRNXQtpWsKRjBr+HrgIqp2xcMTxEipwmXJ8BNxLza
	WJ4RA6STlteJEw1nRB1GN3V6AK/sDzTvsBvWiNJO+/Baj+VknbSAoGdI2r1QPYHvadFtf03B306
	W02eBdoPvEfHFpLL1lXhDYLLCoaJI5E9wm+u+mv3wpfmHu7nxV8PoLoVn2zZubUNJbun8KuCcso
	QsJRmxaglMRZlSsN0DvpkUE7077CaIpyBb9JjjajfXBbvA2A6Gar78aJaHZ+lyAKZdSmlzrF2zp
	WqD++oYtil+TaguGzeaeSMn/uD2ThJT+DSGHGgUixAyax0mb+vgp3m5OGorDJnj98mUtkbxd2pX
	qJXzp5FxTze3ddeTOdG4km60N8bc9we88IGlci7id7w==
X-Received: by 2002:a05:690e:d58:b0:671:70d1:d6cb with SMTP id
 956f58d0204a3-6717fdfbb04mr3479210d50.61.1790022513841; Mon, 21 Sep 2026
 13:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921182121.308217-1-talesam@gmail.com> <20260921182121.308217-2-talesam@gmail.com>
 <20260921183324.0DDD11F000FF@smtp.kernel.org>
In-Reply-To: <20260921183324.0DDD11F000FF@smtp.kernel.org>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Mon, 21 Sep 2026 17:28:22 -0300
X-Gm-Features: AcwNN1V18IxPBVX3MzwrIoIOApanVqkrrqNT5qAIi1tEp5iC7OalFNrUEHsOrIk
Message-ID: <CAHBRX4GqGrA-JhPct0K1GO+fO-uwPm+jJDiQcAQ9FBvBENcOjw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm/xe: Capture devcoredump on TLB invalidation timeout
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 03:33:00PM -0300, sashiko-bot@kernel.org wrote:
> [High] drm/xe: MMIO access without PM reference in devcoredump on TLB tim=
eout

Correct on both counts, and it is my patch that introduces it.

Tracing it: every pending invalidation fence holds a runtime PM
reference, taken by xe_pm_runtime_get_noresume() in
xe_tlb_inval_fence_init(). xe_tlb_inval_fence_signal() calls
xe_tlb_inval_fence_fini(), which drops it. The timeout loop signals all
the expired fences and only then, after dropping pending_lock, calls
xe_devcoredump_gt(). devcoredump_snapshot() acquires forcewake without
taking a PM reference of its own - it has always relied on the caller
holding one, which the existing job-timeout caller does. The new
GT-level caller may have just released the last one, so the device can
begin autosuspending before the snapshot touches the hardware.

Fixed for v6 by holding a reference across the capture, taken while the
pending fences still guarantee the device is awake:

      if (!timedout_seqno) {
              /*
               * Hold a PM reference across the capture below. Every
               * pending fence holds one, so the device is awake
               * here, but signalling them may drop the last
               * reference and let it autosuspend before the
               * snapshot touches the hardware.
               */
              xe_pm_runtime_get_noresume(xe);
      }

and released after xe_devcoredump_gt() returns.

Taking it inside pending_lock is safe: xe_pm_runtime_get_noresume() goes
through pm_runtime_get_if_in_use(), and its "Missing outer runtime PM
protection" warning cannot fire here, because the fence reference is
still held at that point.

Tales

Em seg., 21 de set. de 2026 =C3=A0s 15:33, <sashiko-bot@kernel.org> escreve=
u:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] drm/xe: MMIO access without PM reference in devcoredump on TLB t=
imeout
> --
>
> commit a463de937c804fe9be7ed86bfbfa297e4f35c466
> Author: Tales A. Mendon=C3=A7a <talesam@gmail.com>
>
> drm/xe: Capture devcoredump on TLB invalidation timeout
>
> This commit adds xe_devcoredump_gt() to capture the GuC log and CT state
> for GT-level hangs that are not tied to a specific queue or job. It then
> hooks this capture mechanism into the TLB invalidation timeout path. This
> helps in diagnosing firmware stalls where the invalidation request was
> consumed but the ack was delayed.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/x=
e_devcoredump.c
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> [ ... ]
> > @@ -323,40 +318,44 @@ static void devcoredump_snapshot(struct xe_devcor=
edump *coredump,
> >                                struct xe_gt *gt,
> >                                struct xe_exec_queue *q,
> >                                struct xe_sched_job *job)
> >  {
> [ ... ]
> >       /* keep going if fw fails as we still want to save the memory and=
 SW data */
> > -     CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> > +     CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>
> [Severity: High]
> If this capture path is reached without holding a PM runtime reference, d=
oes
> acquiring the forcewake here attempt MMIO accesses while the device is in=
 a
> low-power state? Accessing MMIO registers when the device has entered
> autosuspend (D3cold) typically causes unhandled PCIe errors or system
> crashes.
>
> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_=
tlb_inval.c
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> [ ... ]
> > @@ -90,13 +98,27 @@ static void xe_tlb_inval_fence_timeout(struct work_=
struct *work)
> >                       "TLB invalidation fence timeout, seqno=3D%d recv=
=3D%d",
> >                       fence->seqno, tlb_inval->seqno_recv);
> >
> > +             timedout_seqno =3D fence->seqno;
> > +
> >               fence->base.error =3D -ETIME;
> >               xe_tlb_inval_fence_signal(fence);
>
> [Severity: High]
> Can this sequence drop the last PM runtime reference before the devcoredu=
mp
> is captured?
>
> Looking at xe_tlb_inval_fence_signal(), it calls xe_tlb_inval_fence_fini(=
)
> which drops the PM runtime reference (xe_pm_runtime_put). If this was the
> last active reference, the device could begin autosuspending.
>
> >       }
> >       if (!list_empty(&tlb_inval->pending_fences))
> >               queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fen=
ce_tdr,
> >                                  timeout_delay);
> > +     seqno_recv =3D tlb_inval->seqno_recv;
> >       spin_unlock_irq(&tlb_inval->pending_lock);
> > +
> > +     /*
> > +      * Capture the GuC log and CT state so the firmware side of the h=
ang
> > +      * can be inspected; there is no queue or job to blame here. Must=
 be
> > +      * outside pending_lock as the capture takes sleeping locks, henc=
e
> > +      * @seqno_recv is sampled above while the lock is still held.
> > +      */
> > +     if (timedout_seqno)
> > +             xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
> > +                               "TLB invalidation fence timeout, seqno=
=3D%d recv=3D%d",
> > +                               timedout_seqno, seqno_recv);
>
> Since the PM reference was dropped earlier in the loop, would this call t=
o
> xe_devcoredump_gt() proceed without holding one? If the thread gets
> preempted long enough for the autosuspend delay to expire, the forcewake
> operation inside devcoredump_snapshot() might hit the hardware while it i=
s
> unpowered.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921182121.30=
8217-1-talesam@gmail.com?part=3D1



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
