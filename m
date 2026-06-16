Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01AD46AF1D
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626655; cv=pass; b=an8jH5vhkXqiuA7LSTNxvltG2hLuNTkAC5MRROI/ToKgdUQf9E4odv4ErYfuphpySDDLiLFdL1MhZQbseAvwrsZul9syxnc/hVrQ92LjcHrHz8uO0EtZU/YPL2/yA4YdYFWvb4l494WXxLceeHl110gLt7ic1nb/CK/3DswtfCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626655; c=relaxed/simple;
	bh=sDoB2P5KGh+urtsUOmMFkr5mJa72QE7lEpEfZHM2CGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiOJNhzp3Mrl3/cmjexArHjRa6P/r3MbYe+RmTMGr+EyldCtkTh9wkUeT2+4kGF2CiJF2UVDoOidwt0M4eouGwxRgGoK91IefHKFMTBdhCwHg0CD75EhwlVtM0qdSrVid9QIyXLG531FagNoFIDtR/+3W0F1lNuTxm1VB7Z83Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxxWRe95; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxxWRe95"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso59889a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 09:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781626652; cv=none;
        d=google.com; s=arc-20240605;
        b=jJuL+popKw6ADAQ/Dih9hJj82CEFD8lFLMpxBPN1YMU0jToz93rdFTIKStNRKlqaOe
         W5HfxNgRyAORQ82BaM1w5wb4OSxIyoZidMxO+mfRBdAKUw9jY6chgfVxY58EkXdKHq2z
         4tBq/zJNQlIZw7ulJNfBovQPkEp9jra0Y3G+/be2G+jVSjVaFNCoUm06ihja/iSjoOSd
         74QKeZICiiblDhNhe/FrY5J0Y1eHiOd+5DwYf05/T7k7pYt6KTV/Mklm6NC8Sih3+fTT
         2DQUARpC5htq1HlwNTzJebAhMQG+n4zGtv3qKr19runte331I9/RzPvL91vtyBmTVF3J
         fAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uFuJQBCMQ82TTH2h3ox5BafprtAZOSVIE0bYWfxjhM=;
        fh=fAUcOLMJrL6/gSlJAi6JxZuXRW8JDI9oXae6bn18h+k=;
        b=hIhT+ntawa83kLlldWxHlhSt2bQ7MKpPt6zSy56wEeoubKWJe3uuAnSfd+qLwZtVd2
         hYe3bL+F839xzOC/0GUDesLFDRYiAXM96cJbXe3RHCjhB7/jd3tJNn1d2r1eERIrF/Yu
         2PXRlHoU0amjX+Gs5DRrZjzmqCoXF0Ps3SHkKF8UCOheaKqeTQKfx5F+c6gLfvGZQdEO
         sZaEKPDOi1zTcVj/3OaKIxjrP4Yjbc+c1KOaTMgxzzHVl+3PvK3ZHZ8FF+F7geD6Waks
         NNHn6jDV+rcHmfaHRB4bOxzwJEndAr6H/LaITOJq1FD0VvKjaBugELD+kGJbkXSgsZGn
         ulAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781626652; x=1782231452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uFuJQBCMQ82TTH2h3ox5BafprtAZOSVIE0bYWfxjhM=;
        b=CxxWRe95pEBJJHmuhrVzkovRlnUSjJpg4/Jf3uTkr3FiBT0XDsBhQ2DgS/uAN0k0WZ
         /itRRECpEPczvizQt7CCIIi+758bsPW//9QsoegXNXLtpJEA/QTcXz9K54yYV8Abf4vO
         nu75khOBZVNIMW5k4sO9BSTi0ntPpS6yhhES3EG4ZeFrm3cwyHBHcI8719K67la8fBq+
         GeA3BWGXXoAduzN+N88T2pvdmxL4rLqfLMwofqBwBIHQO3zQkdrNB5wlvtt/BSV80dxV
         kusakfOurp6FF7Bg5b75plMoY3vqyULAMrj3nzGu53nkJnfPAZIaCTw0wwy603pAtr8x
         4Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626652; x=1782231452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uFuJQBCMQ82TTH2h3ox5BafprtAZOSVIE0bYWfxjhM=;
        b=aCBXP2EzY/BDyQcqKdutHkKn6M7WA6B8nyvqXyy75yaSJrGao3ZxYSDEejipmz0bhG
         qchuLNSn4+ZzY1VA3VGOiEcnlvxHx8GSRk4pgHFL4nYHwVftK6aiK2+vEWG6t0pBUJ22
         RVfieNnCkkyBJRTr2SKN3t4qeROCyThK9W7um7J3t6vddA7nN4ORp78Zhl/0u72k7L78
         eRlsD+m8iU4L3VOmeeyu6sMADComdIxp/pCblIpIvAyCcKFj8svGHdmI+lJylc4Hmhv6
         3JrEFdME5ZSURED445JAOQ0sCdMyfDPEDN34E8x86A6bkh9Xy28ZnJt1bJSRYVxSZHFm
         62cg==
X-Gm-Message-State: AOJu0Yz3J8NTiUcn1nFp9bS07Feh0vdxDhGYAHItJm9e/sXMTaCPPqsY
	hCBd3QFewvCCx+8CCZ7KxTK6+MBFcbSqIJkG1IWcJzrErQbqv1dxFLJObo2xyeDG1ilci1g1gmZ
	+27qdKq/8CnbqMEKeJvU3m1v1doWpsDVxazKn
X-Gm-Gg: Acq92OHzaXi4WDKkz7nVOWh1eJy7jUpvxOE+nSVDzSlEwysjf5Jera5s3WMSKdgy5ef
	j1kY+nJNwcr9WvYgkakOq/RMWu2aQGkHki6JLMxVXKFZfkP89SUDHukmLMrqGq3WzRe/wI4OnqQ
	gxMk2OBzdkBPUdkwqIGEcgAYNAW6IiedeGHq1l0k+3iN430KBNM8dF/SQD1nYhMZ+S2JdK21VAs
	+paQW1/Knr0M++gj7MYKJVlOshTHLoBUGAJsaDh8lkSVxWb5zok+OP3tfFeu/McV9D2QzY/7yDH
	D7kwvnGpqXyVksOqB0dRVew=
X-Received: by 2002:a17:907:9481:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c05a5c03690mr23715866b.11.1781626651956; Tue, 16 Jun 2026
 09:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616155716.2631508-4-puranjay@kernel.org> <20260616161518.088E71F00A3A@smtp.kernel.org>
In-Reply-To: <20260616161518.088E71F00A3A@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 16 Jun 2026 17:17:18 +0100
X-Gm-Features: AVVi8CcjIbUgmhOIANgIq3WI0JBsLxxPAED7PPgYm_NfVPOLivA9qZEJ9eiduv0
Message-ID: <CANk7y0jy5w7TwUnvtTbqOKHOYZFQfco0U62S5UHwoFv2+4c1xQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 5:15=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] `arm_brbe_snapshot_branch_stack` contains a TOCTOU vulnerability=
 where caching `SYS_BRBCR_EL1` before disabling interrupts allows a stale v=
alue to be restored, unintentionally re-enabling BRBE if an interrupt disab=
les the PMU event in the intervening window.
> --
>
> commit dbaa008d5027ec5e859cbcac51237295c1187ed6
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>
> Enable bpf_get_branch_snapshot() on ARM64 by implementing the
> perf_snapshot_branch_stack static call for BRBE. This pauses BRBE,
> masks exceptions to prevent PMU overflow pseudo-NMI interference,
> and reads the branch records.
>
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index effbdeacfcbb3..a141ad7abcf25 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> [ ... ]
> > @@ -774,32 +795,97 @@ void brbe_read_filtered_entries(struct perf_branc=
h_stack *branch_stack,
> [ ... ]
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
> > +             isb();
> > +             return 0;
> > +     }
> > +
> > +     /* Block local exception delivery while reading the buffer. */
> > +     flags =3D local_daif_save();
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
> > +
> > +     /* Restore BRBCR before unpausing via BRBFCR, matching brbe_enabl=
e(). */
> > +     write_sysreg_s(brbcr, SYS_BRBCR_EL1);
>
> [Severity: High]
> Is it possible for a race condition here to accidentally re-enable BRBE?
>
> SYS_BRBCR_EL1 is read and cached in brbcr before local_daif_save() disabl=
es
> interrupts.
>
> If an interrupt arrives in this window and disables the PMU (for example,
> an IPI calling perf_remove_from_context() that invokes brbe_disable()),
> it would set the BRBFCR_EL1_PAUSED bit.
>
> When execution resumes, the bailout condition evaluates to false because
> the PAUSED bit is now set:
>
>     if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
>         local_daif_restore(flags);
>         return 0;
>     }
>
> The function then continues, and blindly writes the cached brbcr back to
> the hardware here.
>
> Since the cached brbcr had BRBE enabled, could this unintentionally
> re-enable BRBE globally despite the kernel having just explicitly disable=
d it?

The kernel doesn't leave the BRBE disabled, it enables it at the end
in the PMU interrupt handler and that is the only place where it is
changed. So, this scenario doesn't exist in code.
