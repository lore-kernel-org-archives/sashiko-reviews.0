Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF646A601
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852071; cv=pass; b=LKvpnnu5A/RB4pcPgj2Agh1RcKhGssFHA/+0Vm2P5pRpmL4hcDvnBu/mWQg0C8XEqeXjkdU9TM53XiPo3DcX71gIN8zC56Qz+vCKXQuu+USPdRZtNNlb4fdO0h1fKtN+ksnG5N3LKZrIULfx/XfOty2sSN60GFkDIifDzlRUc20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852071; c=relaxed/simple;
	bh=Vm5llCv0uwGEuht8g4AIXY1M57YgJMf8Jkqu6WWBja8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGXgAifmvwoo80gxuokyHyjNM1QOGE68BetjV3RtUKg/ygJel2TnSZXXcWuFS05PhHmRhnuHC8Ctol+foX9lmGH0Ef81pvGwhjSjx/sKzLN4hwyhivD9SqCSYJKiKdCi9ATHWBu6excKrJG8wcl2rQW430+zEki8tc9xrZmTqWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNao/TcZ; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNao/TcZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-384c94c9423so515752a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 07:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785852068; cv=none;
        d=google.com; s=arc-20260327;
        b=I96FcOOujUCb6r40BvxcAo8D0p4D7cC1BLDhoIE6B7EPLjJND3wLpgDv0+JYGl6ZgO
         v9pvUS/Ojjgk8deXz1P4jWtmUu62IDgcs10h8lSX7gdQFGXoWFf8u9BuWCTbmUYuGgQA
         x5f08t+JW5wHADY/E28n3137kFjElqmcUzgt0vIMhJo66QJxCEaXuaOVZvheWL0RIEcu
         /6mlkhLZd6+MnrNVl0xvreYVXNMdElKqmGaI+jB5nrS9EzkM3y7hOnNEnqmk7mdWoF9i
         KNdL5vH4yLDXf6uDg+Vncl8IOq0Gp+hY5q2omW2N6cX1iKtokH7I9jO4Ye+aHJOMCwMt
         hPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jr5seHTvJXwM5lFrOeXOrJpAk4DxLxwscIyr+3p9G4g=;
        fh=bYy1gdffJzDCrIK7z4EL5b/4iCdagfa/eUW4B0maKQ0=;
        b=eOsLEJ3PDvIxtGhWp2nmO89zlx0sKjpn60U8692fteD4jO9HkCtQNkxpzXWC+NiqBe
         LPdWMDEIJIVISiYe4g6pYfCrs7anBrv2phVlloH2Bg8zkc2kTZlIQrw5jYp7EzbkXKjg
         jo7/JuqdxnrR74Gtos/ihd4f/5jshy4a8rK7by0a9L/54cTmCwOODDc7fwKZ8F+X8UH7
         mPwupS10dxMBApTbRAYN6guZJ3nqM+/T3RUEQPnZ0h7usuh1dO0KmDN34sOyEyhRgkEp
         VE5DYkP2oxhFLfYRRFPtuEBsHTeS0N5fOTwXk08cuMNsrInH6XNR7EsP69C+qWayQJvq
         6Nlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852068; x=1786456868; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jr5seHTvJXwM5lFrOeXOrJpAk4DxLxwscIyr+3p9G4g=;
        b=jNao/TcZ/RCRfGznAdupHNeJnVAbkGNLWWRwwTmj18FvG/rHdcWrU6RHu8fzTF4jdt
         6epfOYLz9trnRHtRqvcLidWhEokIeojy5qXhUkUDlnoku5ratJJby9/4VofcwWHjtnyh
         nZ3m9ODlYglqTZXVehP5Hn5YQx+JLXk3bgSCtqJW3clC5sa07YOQl50wmYblrljgjjlT
         QyAckfN2ZEpd+DfEKkPF7NZpDLJZE1jwHNGE/bVgwvZoem24fP82UgSIbXyLr3asTkaP
         zNDth7NYlPZEszpWnnL9FoaSoVAYH8snVL5wnv+RJH4wnxZa5RXFZva2Q+mgWRGSOVkq
         0gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852068; x=1786456868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jr5seHTvJXwM5lFrOeXOrJpAk4DxLxwscIyr+3p9G4g=;
        b=WL2DutyMw7b1X31cUTVavfgiNJMMJTUXvl/pz4G6XYAZ0CVykehkZYgm3x6ia5j2zA
         WUWl1WG9p9ThG0jbCNudmwNnQgXvE+KHDge8z0dDJbHiQkoP7YuY8/R2Fn8OjlDQLpHv
         nks8PCadPQZKA7UH6XES99gk8n7kIIMuwWRQjh6RlXB++lxEYV9QpsMou6guciuxohx8
         AbonxF9Ifln2y8hmAbBmH5ub/fsUbQ7Znh5bUJw7ePRv8murBQkvbyzKCSIrtW4PzoX/
         8tGGWx9RPGqgV0kX9bOoCkFTP6cu5PZT/oppI6t2TSeJgthflkGHPC/lDAUbFxLc6h8P
         pUhw==
X-Gm-Message-State: AOJu0Yw4CXTNyM3lavXRrNO2LaY0KGU+qgdvHRVmT+J1D7JzhIcRfESQ
	S+YsLGqt4rIJkS33+XAg6pe2xKkijZuPuYIaphV8hWeGfQG0pK+iDbgwuDAal8wjK6QgTcvsUGO
	yOs6ymUQsFZmsej8GkZq5exf/9gKuVTR+pw==
X-Gm-Gg: AR+sD12cKOuG1MPVNJxgWr0HdUpVGQElA64TRBSactNv/Y+xQZ+ush7xgwgND8wj0v/
	JCvr0bTdymx98eKyR1BMxE7rCQZE1NB1AomsL02Lh//MduZcFFMrJRbwZ/uvPjaEXQZqvFPFdzO
	zqws2CwH5LGbz5j6Cr3UZXyhcvwbAbLO3akjv+AdG56Jfj36f9LVlFThRSjPLz7Fr6KnLHKD2f+
	1c82thgibDJj1kVRXGd1ikiG7Nytoy+vJpiQLRl4F3kZqCV2aE4I8LzJYx2Q9tHPoxu9V3eGb2Q
	jYN/CJj0M/em/FLLuCPFt7qrxndqj/JEowgmHjOdCBBVPe6QnHVF0XXivbEYgu0EKDkn0iJ5+ID
	/iCoDtoR0wprkNB8vRW0TTw/T5VfZ070=
X-Received: by 2002:a17:90b:584d:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-38fbc52adf6mr18937864a91.2.1785852065736; Tue, 04 Aug 2026
 07:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730170011.28915-1-harimishal1@gmail.com> <20260730171458.ED8481F000E9@smtp.kernel.org>
In-Reply-To: <20260730171458.ED8481F000E9@smtp.kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Aug 2026 10:00:54 -0400
X-Gm-Features: AUfX_mwCaiVsPcXhRnX6KyhVMHYfZNjobvIYbx4-30KYLLssVMrG8IahYQ69xqA
Message-ID: <CADnq5_PZ2i9d+eOdMEkSYynxzqO5E0iO0fXX77PRhZ420eBVNA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: bound ATOM bytecode cursor within the VBIOS image
To: sashiko-reviews@lists.linux.dev, Hari Mishal <harimishal1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 1:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The newly added bounds check in `atom_op_switch` breaks out of t=
he loop on malformed data without setting the abort flag, allowing garbage =
execution.
>
> Pre-existing issues:
> - [Critical] Kernel stack buffer overflow due to unit mismatch between `p=
s_size` (passed in bytes) and parameter array indexing (processed in dwords=
).
> - [Critical] Nested ATOM command tables can underflow `ps_size` and bypas=
s bounds checks, causing an arbitrary kernel stack buffer overflow.
> - [Critical] The bounds check for `ATOM_ARG_FB` scratch memory accesses i=
s vulnerable to an off-by-one error and integer overflow, allowing arbitrar=
y out-of-bounds kernel memory corruption.
> - [High] The patch bounds-checks the initial opcode fetch but fails to bo=
und variable-length operand fetches, leaving the interpreter vulnerable to =
out-of-bounds reads.
> - [High] Command table directory index `base` is read from the VBIOS imag=
e without bounds checking the index calculation itself.
> --
>
> --- Patch [1]: [PATCH] drm/amdgpu: bound ATOM bytecode cursor within the =
VBIOS image ---
> commit e34469f5366554f7ff6d1ad26ef62ec969ed0a40
> Author: Hari Mishal <harimishal1@gmail.com>
> drm/amdgpu: bound ATOM bytecode cursor within the VBIOS image
>
> The commit bounds-checks several ATOM interpreter opcode fetch and table
> jump paths against the VBIOS image size to prevent out-of-bounds reads
> on malformed images. It utilizes the existing ctx->bios_size infrastructu=
re.
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/am=
dgpu/atom.c
> > --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>
> [ ... ]
>
> > @@ -1032,8 +1032,12 @@ static void atom_op_switch(atom_exec_context *ct=
x, int *ptr, int arg)
> >       uint32_t src, val, target;
> >       SDEBUG("   switch: ");
> >       src =3D atom_get_src(ctx, attr, ptr);
> > -     while (U16(*ptr) !=3D ATOM_CASE_END)
> > +     while ((uint32_t)*ptr + 2 <=3D ctx->ctx->bios_size &&
> > +            U16(*ptr) !=3D ATOM_CASE_END)
> >               if (U8(*ptr) =3D=3D ATOM_CASE_MAGIC) {
> > +                     /* magic byte + immediate (up to 4) + 2-byte targ=
et */
> > +                     if ((uint32_t)*ptr + 7 > ctx->ctx->bios_size)
> > +                             break;
>
> [Severity: High]
> Does breaking out of this loop without setting ctx->abort =3D true allow =
the
> interpreter to continue execution?
>
> It seems the function advances the pointer and returns normally when this
> bounds check fails, which might cause the interpreter loop to fetch the n=
ext
> byte from the middle of the switch data and execute it as garbage opcodes=
.
>

Hari, can you double check this and respin if necessary?

Thanks,

Alex

> [ ... ]
>
> > @@ -1237,6 +1248,13 @@ static int amdgpu_atom_execute_table_locked(stru=
ct atom_context *ctx, int index,
> >       if (!base)
> >               return -EINVAL;
> >
> > +     /* the table offset itself comes from the VBIOS master table */
> > +     if ((uint32_t)base + ATOM_CT_CODE_PTR >=3D ctx->bios_size) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the retrieval of base i=
tself
> bounds-checked before this new check?
>
> The command table directory index is read via:
> CU16(ctx->cmd_table + 4 + 2 * index)
>
> If index is arbitrarily large and controlled by the VBIOS, could the macr=
o
> perform an out-of-bounds heap read before reaching this newly added valid=
ation?
>
> [ ... ]
>
> >       if (ctx->execute_depth >=3D ATOM_EXECUTE_MAX_DEPTH) {
> >               DRM_ERROR("atombios command table nesting exceeded limit =
(%u)\n",
> >                         ATOM_EXECUTE_MAX_DEPTH);
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but are nested ATOM command ta=
bles
> safe from size underflows?
>
> When atom_op_calltable() recursively calls amdgpu_atom_execute_table_lock=
ed(),
> it passes ctx->ps_size - ctx->ps_shift for the params_size.
>
> If a malformed VBIOS specifies a ps_shift larger than ps_size, could this
> uncontrolled subtraction underflow and promote to a large unsigned bound
> during execution, bypassing bounds checks like idx < ctx->ps_size?
>
> [Severity: Critical]
> This is another pre-existing issue, but do atom_get_src_int() and
> atom_put_dst() incorrectly process ps_size as a dword limit instead of by=
tes?
>
> External callers pass a stack-allocated structure and its byte size to
> amdgpu_atom_execute_table(). If the VBIOS-supplied idx is used to index t=
he
> uint32_t *ps array, could passing idx =3D 7 for an 8-byte structure pass =
the
> idx < 8 check but access the 7th dword, leading to out-of-bounds stack
> reads and writes?
>
> [ ... ]
>
> > @@ -1273,6 +1291,13 @@ static int amdgpu_atom_execute_table_locked(stru=
ct atom_context *ctx, int index,
> >
> >       debug_depth++;
> >       while (1) {
> > +             /* jump/skip targets are bytecode-supplied; stay inside t=
he image */
> > +             if ((uint32_t)ptr >=3D ctx->bios_size) {
> > +                     DRM_ERROR("atombios cursor 0x%x outside VBIOS ima=
ge (table %04X)\n",
> > +                               ptr, base);
> > +                     ret =3D -EINVAL;
> > +                     goto free;
> > +             }
> >               op =3D CU8(ptr++);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this bounds check onl=
y
> protect the opcode byte itself?
>
> The individual opcode handlers executed later via opcode_table[op].func()
> appear to unconditionally fetch subsequent variable-length arguments. If =
the
> image ends immediately after an opcode, could these operand fetches perfo=
rm
> out-of-bounds reads?
>
> [Severity: Critical]
> This is a pre-existing issue, but is the bounds check for ATOM_ARG_FB scr=
atch
> memory accesses in atom_put_dst() susceptible to integer overflow?
>
> The bounds check appears to be:
> if ((gctx->fb_base + (idx * 4)) > gctx->scratch_size_bytes)
>
> Since it uses > instead of >=3D, it might allow an off-by-one access. Mor=
e
> importantly, if gctx->fb_base and idx are 32-bit values controlled by the
> VBIOS, could their addition wrap around a 32-bit integer and bypass the
> bounds check entirely?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730170011.28=
915-1-harimishal1@gmail.com?part=3D1
