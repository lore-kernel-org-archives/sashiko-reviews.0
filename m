Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC61285CB3
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390630; cv=pass; b=Z6pjc8zX+++70UHehFm2hNS2Jok+knl+3kHOLeOx1h/iIafRJVX78PO9mMuwgMJ6GidqeAM4ncwMb6c+/tMnvr7Zhihq9F7JUUhBp52l7gQk0bI19VFeBC6Dv7jCykf1YFM4AsSOFwWngDDwn3oiJxP6PTtbx/b2oPWeVbdeXrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390630; c=relaxed/simple;
	bh=Y+5f81K7DHNtXPtB/F7Xz+mM4DRnLSK/j3ypDuLllII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXKuTZCNPJAiTSYniLnm9T/5sCWqnQjpLlv3+FBJHgKgl+HLWgaBm69OCilPH06qdTREIvMxG1e/FGkeJTpiHOtzI2VPMEZdsYnddAweokLX5I3q4GgMMivN8JSTJstgebMUt9oHj+ML5wO8ldfCBcbL3vr3gaaDXLFLYZZV7Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2uHzbCr; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2uHzbCr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bed4cc46252so300161366b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780390627; cv=none;
        d=google.com; s=arc-20240605;
        b=kyMVo0XVv+gkSTf9mxsTQzB4mnpdegCp+1pMdR69XkFBDSbWuLeUSfnhp1EiJqy2dp
         suE98gHR/iQ9HksqM8bPIrddsKyW8LRoonKyyFwTiIAvi3ABM/cTKytFjH0PaZOkdaHv
         PAgujQxXGls5TbqOdKfLIene7uk3m03AuQkb6ddDLEb6yYXfeOafzLQNl0pDc5LnCSXb
         ujEqg1GJsSbLSi8G+yI3fHrHO3xqIlzxo/+i4oHsZYRnXavfFue+qZgGaKBMgwAkY/MR
         YPa2dDOyr4EO5sxtBPWEhX0DKIcphTETdz7a1WAC/7rpZqTf8X6xhLi5+QYeVmbivC2j
         ah1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZg0g8kfpnyHG9bcYNNs04NW71/x368Tj2iB4Wk0/04=;
        fh=fAUcOLMJrL6/gSlJAi6JxZuXRW8JDI9oXae6bn18h+k=;
        b=YlVuanAlfZ+VeMS7LVJWSEHidHT5n8EMTzlmxD51ZEqpB32GlZLpYP81sBny0FcA5B
         FB+hsupKqt6xA4/W6aPT+JCm2d9YtPR/UWijqV1c6QPK6nbacgtlnZEWOxyQEeFCDPNj
         lFg6sYlCzb92MDF06yk7mz8Dqn4s+A6uGEaPhsXuPGgbHslP79Nr1tompk2LWbS4FXt7
         UywoElFXXrFtPbE7whPgE5IeORkDTSX7YqC5PQSbzYX3RMG7Y5gUkWDjbgNkVHOzNnI1
         RGd/S8UyaU93s4nEAFvOHr6n6YZoNepVTaXVe/d5Y/GHUbVF23Ghw9wHOWQnGYugHukl
         AYVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390627; x=1780995427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZg0g8kfpnyHG9bcYNNs04NW71/x368Tj2iB4Wk0/04=;
        b=K2uHzbCrFZ3L8/XfEJ6n0FD8DL5DHfxqHfujRRSFv8rORKATmmtL6rG9d4q3JPFtrZ
         cKzdBuOrT+EkZOSHr3zqbPScGiumigJIBJ7vCPfZrBuqSpS8Y7EFZZwuaT4E+K1vESvv
         S5i1iGaotwBcIllE0fUCuwDyJ0zDWz4WGQwkJNYo7NQlwxAYtgOVACKwqyBcydGZuRfP
         zubnP54/NeyhQlErcp7XLbF/3AjkmywZ/sfTL7js0qL+fh/0TeJVWwtZ/mLX6A0wiO6a
         q1+Yg9kXZ235MFf8lYH58AK3TvuZcgokj5br1u6gBJBEpi25wcHaFLtBr+/H0Wradi9I
         RGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390627; x=1780995427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZg0g8kfpnyHG9bcYNNs04NW71/x368Tj2iB4Wk0/04=;
        b=ENHMsV2jF6wxnibhkBsSBAeAsM1cvzVLMGxyPejT63EMrZUyN+Z9K4y4TmvQdbhF60
         HFrOY4Z2n0/1vqhnMP71nkNNlO3mu1qIB6Fv7WfNhTq/7pfxGlJ0Dl9IhNcP3NbhnyaG
         40n0nKPskWRSpbCRsIokAEjd4O5678//iVr1EKpnqA8pJppXyGavExT9DQ/x2wITMxYr
         RP1ZAf17P4MBvtuIObsmU6YaI2C60JEWld7RyKljzrmRw3RZPvTKMu/7LW/S16RBI8Hw
         z+ltV8WTQnmQWc7jgrmgNhzJAioFFBcQXLAA7iRdeqstWWYZgb5w+N339o/qzWNBaira
         1+0Q==
X-Gm-Message-State: AOJu0YwY00QH7Yv9pmO7GNp/iNqmukAeHJsatdPT2EBVBDniQ8for+hY
	bZSxvz16y9g7V0PIrApa3U8ooyhsmSFhR5x49nR2uJ/lvke0UhY6oPXlwQpd/YbFumkfM3sab+E
	Y4mFIryLyKMm3Iu7mHTSXgTIcZXbBBHhvdZc7cAA=
X-Gm-Gg: Acq92OE8+y0CE0x1hIcHzYgr3GYDbBdX4sSEQ5nQ4Ki2+i+8SXQSgA66h6TChgA8ErV
	TgYmFZPV4/mDYI3UtvsJa6Cvuna9KAufF9tlWXQ4n1Itv+CSYaHHHW+5OFYS+zn36mqewRMtCZZ
	+WlqDb/0FMDZQq6fDTtqj6KCS2IBc1xPCLgr4I2kH2bIOYSARU14o0NGHNYMvp6fpGPXsyknZun
	3rNzSxtgm+8DXvCBosyOn02+PxwODlL6dCKiOC5H+8RQ2K809/PvN3R4g2htwvshUiXybtMfbkq
	tzQXkqgtQpa7dyB+rGl4Fy+5bhmPd20zXQ==
X-Received: by 2002:a17:907:7705:b0:bee:a25:b977 with SMTP id
 a640c23a62f3a-bee0a25d320mr331236166b.45.1780390626557; Tue, 02 Jun 2026
 01:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527121207.2312181-4-puranjay@kernel.org> <20260527140948.3D61C1F000E9@smtp.kernel.org>
In-Reply-To: <20260527140948.3D61C1F000E9@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 2 Jun 2026 09:56:51 +0100
X-Gm-Features: AVHnY4KJgazUFImKAaO7E45UDwpfkanii3pt25-o-KKfnSa6wozbSJrvqWPTL3g
Message-ID: <CANk7y0jT_xi45gKdu=s2Gsoew1fde8cx0bcKQFiiHUtWcWW9Cg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] TOCTOU race in `arm_brbe_snapshot_branch_stack` leads to hardwar=
e state corruption.
> - [High] Unconditional calls to `brbe_invalidate()` destructively clear h=
ardware branch records, breaking concurrent perf events.
> - [High] `bpf_get_branch_snapshot()` unconditionally fails when invoked f=
rom a PMU NMI handler.
> --
>
> commit 4683208c7439e46b2ca26814f22b69f16e4ad0c2
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>
> This commit enables bpf_get_branch_snapshot() on ARM64 by implementing th=
e
> perf_snapshot_branch_stack static call for BRBE. It pauses BRBE, reads th=
e
> records into a buffer, invalidates the buffer, and unpauses BRBE.
>
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index ba554e0c846c4..aede95e277842 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> [ ... ]
> > @@ -774,32 +795,96 @@ void brbe_read_filtered_entries(struct perf_branc=
h_stack *branch_stack,
> [ ... ]
> > +/*
> > + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> > + * self-recording and return 0 if the snapshot state appears disturbed=
.
> > + */
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +     unsigned long flags;
> > +     int nr_hw, nr_copied =3D 0;
> > +     u64 brbfcr, brbcr;
> > +
> > +     if (!cnt)
> > +             return 0;
> > +
> > +     /* Guard against running on a CPU without BRBE (e.g. big.LITTLE).=
 */
> > +     if (!cpu_has_brbe())
> > +             return 0;
> > +
> > +     /*
> > +      * Pause BRBE first to avoid recording our own branches. The
> > +      * sysreg read/write and ISB are branchless, so pausing before
> > +      * checking BRBCR avoids polluting the buffer with our own
> > +      * conditional branches.
> > +      */
> > +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> > +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> > +     isb();
> > +
> > +     /* Bail out if BRBE is not enabled (BRBCR_EL1 =3D=3D 0). */
> > +     if (!brbcr) {
> > +             write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> > +             return 0;
> > +     }
>
> [Severity: High]
> Is this check incompatible with PMU NMI handlers?
>
> If a BPF program attaches to a perf event overflow, armv8pmu_handle_irq()
> calls armv8pmu_stop() before processing overflows, which calls brbe_disab=
le()
> and sets SYS_BRBCR_EL1 to 0.
>
> Would this cause bpf_get_branch_snapshot() to unconditionally fail and re=
turn
> 0 when triggered from these PMU events?

That is acceptable.

> > +
> > +     /* Block local exception delivery while reading the buffer. */
> > +     flags =3D local_daif_save();
>
> [Severity: High]
> Is there a TOCTOU race window here that could corrupt hardware state?
>
> The function reads and caches SYS_BRBFCR_EL1 and SYS_BRBCR_EL1 before
> disabling local exceptions via local_daif_save().
>
> If an interrupt or NMI arrives in this window (such as a perf_event_disab=
le
> IPI) and modifies the BRBE hardware configuration, the function later wri=
tes
> back the stale cached brbcr and brbfcr values at the end of the function,
> overwriting the PMU subsystem's intentional changes.
>
> Does the mitigation check below catch this?
>
>         if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
>
> It looks like it might fail to catch this because brbe_disable() leaves t=
he
> PAUSED bit set, leading to the function silently re-enabling BRBE and
> corrupting the hardware state when restoring the cached registers.

The NMI handler always leaves the registers in same state to what we
cached. This is not a real issue.

> > +
> > +     /*
> > +      * A PMU overflow before local_daif_save() could have re-enabled
> > +      * BRBE, clearing the PAUSED bit. The overflow handler already
> > +      * restored BRBE to its correct state, so just bail out.
> > +      */
> > +     if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
> > +             local_daif_restore(flags);
> > +             return 0;
> > +     }
> > +
> > +     nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK,
> > +                       read_sysreg_s(SYS_BRBIDR0_EL1));
> > +
> > +     for_each_brbe_entry(i, nr_hw) {
> > +             if (nr_copied >=3D cnt)
> > +                     break;
> > +
> > +             if (!perf_entry_from_brbe_regset(i, &entries[nr_copied], =
NULL))
> > +                     break;
> > +
> > +             nr_copied++;
> > +     }
> > +
> > +     brbe_invalidate();
>
> [Severity: High]
> Does unconditionally clearing hardware branch records here break concurre=
nt
> perf events?
>
> Since bpf_get_branch_snapshot() can be invoked asynchronously at any time
> (e.g., from a BPF kprobe or tracepoint program), if another perf event is
> actively profiling, would this snapshot silently wipe the hardware BRBE
> buffer?
>
> When the active perf event later overflows, it would read an empty or sev=
erely
> truncated branch stack, potentially corrupting the profiling data. Should
> snapshots be read-only?

No, this is expected behaviour, if we read the branch stack we have to
clear it. perf event later will read empty buffer which is correct, if
we don't clear the stack it will read corrupted data
