Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705B48AE16
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710194; cv=pass; b=hkElzkXCphuXRsFNDGT8DKFu5SdvdnPvK0CL7ioxiipph8is6x0aeA98bqX8B0yyPgJDztkDiaDk3se2z4etOT2zDAvm8rUjJXUjQ2cdUeRyqGDR/m0Dzr4fgOu4SD3WGmyDZ+ZTBCXCl3pBTL5TgasbxeBWI4HG8WINdkykWis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710194; c=relaxed/simple;
	bh=MKk5MluiAQJnSpa2Pf6/pQQh44RfvLoPtvDGJYV3mt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeTgkYq04TE8qtAW5vZs6bERi545hXd2MXrGrvs/Vz3Uosd+21fwNknf5lcJpimiGCP4RT/21dv6Kyd0ROD1Zjm1sga9z3ByMxZRzG6HxM2UiL/2CDuDJHtD7D69+2WzDI5FEgD6bxNiXKgu7B8jTgCrhGF1xd7APk6OYl92C9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SXaJtE3/; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXaJtE3/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5175d339e8bso303231cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 08:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781710188; cv=none;
        d=google.com; s=arc-20240605;
        b=BCfkUzUB/+wCmKSW354iPE3S5g0vj/SGS1FRUlhkZthDJ3+3GhvgHQFXSkZf5r+uh/
         3qSctnsR8o9EwAeySLJiy9VcPvJJlHYJVE1SBQQalBlneftEgNodfjqe3TIyKg0IUdpw
         x1FvlXSOnEDkh9vgToOyqWACCGyA8/ZRc/pijBrAJuZ72kFdwM0YDhjckRzOSlpo84hY
         3IPIkoCARZ0Txc2RqoudjceUhdQLx4b8tYzW1yetsDvG0BoDd/fbX24z7Ikii0oN92LZ
         sSj1GtFxbcExva+iFbYjjcsH57CdibvpaHIdkJ8L1Us0zw+7IL2QGk6ik2BsX59Bv252
         Wrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ubB/kwmCmSaCx0iLF8+L4TShpYDwgBrKrRr5YdGlWvg=;
        fh=vxFxEzPfV2TVZiF6T5th9UokvWy0tGwKR5SSoD4lX+g=;
        b=XCdPSd2eJZHTyV9sA//c9COZdQDdjGEROfdjk4eSGYTEqsGLTCo8wSVcne+/dwIW/N
         b0i7Cm0qVJXLwKU3nGhlcNEBemjbj5r7gTCcKdnG+x2sFBbqtgwc++swKKHRUEDCuC/0
         11MYLkWiyhGh7szpgDRfSJTiAJSCHvqkuT20zvgREgAxmYqnfn/uxvn9Peqs4ZlWaacV
         CbqODA2/pZqjhzFSJgmIuAyZI6c8go8yj5DmXX5ZgsuNhvcZ+IYG2GKnoPzM1i12qgbw
         EzYTAmRS5fDUtX1/RoUTWfLOScrgt5pjX6n+K5+4za43HVdRR32N16yyHsbCSf3V27Ym
         O65Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781710188; x=1782314988; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubB/kwmCmSaCx0iLF8+L4TShpYDwgBrKrRr5YdGlWvg=;
        b=SXaJtE3/nEiMmaY+Bb5svov4r972q46J2rqWrvzWJKlpAxvAfBiWjIX+ydXMFMjryh
         H7oaXWB/6Rp4wPWldGptbLXhX1zDSLJxk43F5K05+8zXwyk7d3V8dXLcESOnT0Cf9+8s
         fvaiTJcgOfsYKd1WEpqbrhZz7WFNtIZlXaHiTJudY9KSY+DA0zCB8E9G7QYryIwWkScl
         8Uch3zd9HISXmhCqS6YG/oeKJFIXA1z+jgMPLWVASuHBuRkbqQR6DGlcDzEW6k+8R/1C
         M9JFSVWFwj/fCsCI6TvTotfoWXKlz+e7eataibAR+DJkiVUmAEmYDzgG047FSVRN6pqe
         +ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710188; x=1782314988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubB/kwmCmSaCx0iLF8+L4TShpYDwgBrKrRr5YdGlWvg=;
        b=c5i0QWptC3wN9Qu3/QEv7dpfiz6sPGOlUmIkQWbiTX+pCCQnihZT4rAkETpflVQKHn
         7rpVbCicmfiZxp860N7Bl27rEuqogBa3PnQm36mVH2d8GQrfUmEVxTYb6la/URi+CbiV
         dGoS7gphK0cTr0uyNu8emXvQkRwySYNNK9Orm/Fwlo0KNp3yO7I0/e0LlRH2VFxgqhXU
         9KG4rQWaVxWG+IHeVipOsgNnlyf9LsEkwf953+yCkLhfPzynwNemQkZC43pp4boPVY2Y
         J4ymC/NyWdVL5GZMwWZbkdhnBqhGBLY8MknufgZU4Oqajp2ErjcGjVtdmu/8qvRUUBcq
         xOdg==
X-Gm-Message-State: AOJu0YzHWYBQRVTSRrOvR2yzRJXB/duJUAADDCbepEWQEHS/h87drsXr
	K1a93H+JklDUSFsPjPnjdaS1dM+22g/kdmuNM03GnPWdmZtvGQWnxdcGJOX3dXWebxkNchNt5/Z
	Hkcdar71Z6JOUAgseENoAtW0Y1WYUnfzRfk0n+uLDnbDIRCfjJI+GDmTa6rM=
X-Gm-Gg: Acq92OHrIqfZsTLud6EsQXFplHuSXcLExDKzoPyT9JxxS2wwGiR0fwElCnThC1Zon1q
	USR3kgmAUA1ipFLH6a58k7CYjb9NFYER7mkggUk7MMJsLy2fiDU8DJaeRo7WRbo2xMRJ+hDq7Xq
	Bc7ofZFQzu0tCMgJaWDmqcGzquAnGf8Pbb60+fD9cEDppTTLUGKQKlkehK0LZEOLTWDBK9xcsup
	+4G6h84Cokm/aUhxGP0RzbaHkCtcGCtZ2bVbX2qW4avwr9DNDw8xt4Ag6WKJRrxdIEQXqbC5LyR
	qIe2C/NH0bPvS++0aVasD/26OQ==
X-Received: by 2002:a05:622a:5a0c:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-519aa976470mr10556381cf.8.1781710186875; Wed, 17 Jun 2026
 08:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617144907.2972095-1-tabba@google.com> <20260617150438.66E3A1F000E9@smtp.kernel.org>
In-Reply-To: <20260617150438.66E3A1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 17 Jun 2026 16:29:09 +0100
X-Gm-Features: AVVi8CcDF_ndawt-hT_yYHscpCN_9-TB4HVtY75uSEgCoFxG-oPzigLrxSYXAig
Message-ID: <CA+EHjTybyMvQtBAbRhShXA8Ba0=-W8E7-RvCKO2X3EMnMXhhuw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix PSTATE construction on illegal
 exception return
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jun 2026 at 16:04, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete PSTATE allowlist on illegal exception return causes g=
uest state corruption
> --
>
> commit 93d5c5c2769fe9f58076ca66eb01cbe04fd87921
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: nv: Fix PSTATE construction on illegal exception return
>
> This commit updates PSTATE construction during an illegal exception retur=
n
> to correctly source flags and masks from the SPSR being returned to, as
> per ARM rule R_VWJHB. It constructs the PSTATE by taking these fields fro=
m
> the SPSR while preserving EL, SP, nRW, and EXLOCK from the current PSTATE=
.
>
> Link: https://lore.kernel.org/all/86wlvxs5r0.wl-maz@kernel.org/
>
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-n=
ested.c
> > index dba7ced74ca5e..ace2b40cf8756 100644
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -2738,17 +2738,30 @@ static u64 kvm_check_illegal_exception_return(s=
truct kvm_vcpu *vcpu, u64 spsr)
>
> [ ... ]
>
> > +             mask =3D PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> > +                    PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT;
> > +
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, IMP))
> > +                     mask |=3D PSR_PAN_BIT;
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, NMI, IMP))
> > +                     mask |=3D ALLINT_ALLINT;
> > +             /* FEAT_SPE_EXC and FEAT_TRBE_EXC also gate PSTATE.PM one=
 day... */
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64DFR1_EL1, EBEP, IMP))
> > +                     mask |=3D BIT_ULL(32);    /* PSTATE.PM */
> > +
> > +             spsr &=3D mask;
>
> [Severity: High]
> This is a pre-existing issue, but this explicit allowlist approach seems =
to
> omit several architecturally defined and KVM-supported PSTATE fields.
>
> For example, PSR_SSBS_BIT, PSR_DIT_BIT, PSR_UAO_BIT, PSR_TCO_BIT, and
> PSR_BTYPE_MASK are not included in the mask. Because spsr is masked with
> this incomplete allowlist, won't these valid bits be silently zeroed out
> instead of being preserved?
>
> When the guest takes the resulting Illegal State Exception, its SPSR_ELx
> will have lost these bits, which could corrupt the guest's architectural
> state and break guest exception handlers that rely on them.
>
> Would a denylist approach (masking out only the mode bits and EXLOCK from
> SPSR and taking them from CPSR) be safer to ensure all relevant bits are
> retained?

I don't think so, but Marc, please correct me if I'm wrong.

My reading of the ARM ARM is that these fields are UNKNOWN on an illegal
exception return, not preserved. R_VWJHB says "All of the following are
UNKNOWN" and lists PSTATE.{UAO, DIT, TCO, SSBS, BTYPE, PACM}. If that is
right, masking them to 0 is a valid realisation of UNKNOWN rather than a
loss of state, since a guest cannot rely on them surviving an illegal ERET.

Cheers,
/fuad

>
> > +             spsr |=3D cpsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> > +                     spsr |=3D cpsr & BIT_ULL(34);     /* PSTATE.EXLOC=
K */
> >               spsr |=3D PSR_IL_BIT;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617144907.29=
72095-1-tabba@google.com?part=3D1
