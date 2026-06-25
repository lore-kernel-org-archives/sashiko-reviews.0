Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69F3D88FA
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386452; cv=pass; b=eSH1IuOvBp4iyLRsnp31k9y2tlQ0yhftwJKz3FuTcQiUQO15xgdILJZepgExc0AyeM1zXV7/KW92oUXdb7Zbwsbde95xv7fcAqArJOLEs6bpDdSVmZe0HIUqumGf6NxvIwzEXe0EJWeU2k0yieYrUYcLnEtnz7wc4pxMsxhJQaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386452; c=relaxed/simple;
	bh=DBGRRLjKyXInFkVjuZiiItHB+vEqg1vprNXOqYiM1QY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0+v6JkIwhRTvrUMiPUdjv75Vm9qq6Wmwo1DM3E6gvdUyydwaCU/h9bvonZVqHcMUx5rtbJoAs7laydy5Bv0ImlwgOPAT6BTm3QRXM/8Z1C9s/aqFrxAUu4P1PjyQah0ErU1IG02z1NGtv5865WUC7aqRbo0viyUZjK68bYCmz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrAmRyWv; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrAmRyWv"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66481f17a4cso825035d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 04:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782386451; cv=none;
        d=google.com; s=arc-20260327;
        b=bK3mXSxYwckwRw0/mcbHlDCByYg1X8uTzZYP6fxwEa8FoMxTgDSUSG4eIgUrp+V9lQ
         Bxnc6NoIHOPO6udsk8HBagrWnqSe/QAxuh0x+VWtAl9++c7JbOR94WsM/F4jK2shNQhk
         yGml4NQ1j78MhGaCmV5/uDP+MLkfZnzx4SVLSL4KUMwqOoBR6SuUp7yxfN6oAOaFTBgI
         m7zvwG9tT/K6+73wsHpJle0Osokpzphq3OIJPFVvtHLNINhh60NiulYQm5zQ27yy/6ll
         Fk4tX4IYxs54W54EhOlCG8KVsYVdxXrHCTfivvDTxQ8KCUtuBlPgxjquZxSInyKyWQri
         jhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lf13cIJBwNAT6Ke7JgHfnNymgELoxPci9N8XDoYvcY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=JCU1XaXKulWT3x7elzH2H5djKX6UG++ZHXHDfO1LpZqxb7xMQmTTDKKUXdMbCJhutM
         OJCNuGN/588uzD37z6k0qVbDR+Kcdf1qBA3ggyTbTMF3EcXpJjk1wi9cu7heY2KTAe/V
         1n/Ig0ypVJPjZrKrIm36/fdPw6H2OsKTc5bMKk2FDCQEnAsSwcRNbYouB3Hm7Re+aB+N
         lkSSFnvdgCgXnCBNCXvo04bPbbNcRK2RtAQ/Am6mpiHyx1hl8O0hKDhcl2dkZt+zji94
         paEK1JwU3G5Up5/id5+tKLNQ8F1dtI4SwUr/Adbpm6C/+i4wpe8SZ6RRLbuT0b3Cx7Ms
         uYTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782386451; x=1782991251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lf13cIJBwNAT6Ke7JgHfnNymgELoxPci9N8XDoYvcY=;
        b=rrAmRyWvEO1+DAcxesU3+SR+56ZsKuRqsGsQF265dbIPVTbDdMZL8/KprseHcb99wl
         c1bL3aMmPzzViMAOOIVq/PLDs/7J/QLgqCmLjTfwD/dP5BdXbmgQ3wXrABCVUXoJZRJf
         CFbP5lhE57o1FUtzSXX4rzkpEFiTaI3xo5/yZfdB54VNMqN9g2ARzauT47n0xYrV+ey0
         FHoXHbip0tkdg2xacHmfqSoEOhZoLQr9VdWau0z8pwj4LST0YXI/xNJdXePXul81wSPv
         Dx+4prpEkLkd65TOtI5pER7sIT7OLO90amKjQnWElxB0OOxPW1D3nshrhLvtcsdH3yQc
         t0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386451; x=1782991251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lf13cIJBwNAT6Ke7JgHfnNymgELoxPci9N8XDoYvcY=;
        b=EPci439FpoSd98hLyUn9RsAn9LjlO3iub5wKtMH7aWnBdXogjQNKNqq5mZNMeTjd+2
         SbOormNfaF0yJJHEf5uMESXC1DMVUlVdjRDW4QPNgsIWCIHvZp6iC658XrUlmKXVzzmI
         K3zpDku379kQhmz0Xtg/sAEDXjYq2yh5kfT3U9nACmJNVaW1dhDteeFpLvQw1Lp96R1e
         uQi/k6p0Za6P7XRGitlCNjlVUM1axawqOFhnMNdUHZ/MjcBCKI3+auvRvb0466mOC2gK
         +w5PM0+AJR3cVObWIELQwDNImvI6g69+G8NmD8fBxRxpOIBb7C9fQMeTESJ644W3WsmN
         qmVg==
X-Gm-Message-State: AOJu0Yyvs/diYWk4c3Sc4MBxzMY+TW6s2xfWGQdTNmvUSdn3ohoWZ9nz
	fbisrwhu8RVSsaCjXajz/omG7SaxofcEuL96uAkNlwLwZ62EvDtUzNYwppH974uO22HrwllPyPU
	hyF3wcXHCBBm/CN9A7jWrGz0tIsfZsDTF7/4uhVBAMUHTXDSH9uEBF714sM1Ag1nn
X-Gm-Gg: AfdE7clttd+VWA/fwQbOwX9lVCK7OBoep4l5aoDZgITgTHPdwUBRELrw8t3hoIrRxnn
	SPSicTMiblJgv5vkUv+JaDFzJ18PYKqZ7udyQnSn4qPCierRMK3XuokZryhdHI6ylvKglLawF1z
	czgQ1SO+Z3NgZispEFipPsF0sOwP/Nk5S1WZHPiuBmwwhbCuQ2NOo3rp7ElLttDnzeATHl5A60n
	2gEAzaK5sQG+yao4aVliT/7TeoOkMIvZicCeJPfGMEvP4dT4STTDAUj9QHAmPt6RfP3pQkdFJLP
	6iPtlVjHyYLtmH93nM34D56Gv+s=
X-Received: by 2002:a05:690e:134b:b0:662:ca79:ceb6 with SMTP id
 956f58d0204a3-663556a32e2mr9336230d50.31.1782386449969; Thu, 25 Jun 2026
 04:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624-bpf-lskel-fixes-v2-1-e8ac5974a72c@google.com> <20260624183439.E32C91F000E9@smtp.kernel.org>
In-Reply-To: <20260624183439.E32C91F000E9@smtp.kernel.org>
From: Sid Nayyar <sidnayyar@google.com>
Date: Thu, 25 Jun 2026 12:20:38 +0100
X-Gm-Features: AVVi8Ce1SRY_WU6H7QOzLEn99skkGSFZNDX8JS4f4yjc032yPW_W0GtUXsqSmnY
Message-ID: <CA+OvW8ZN0ZcWy_cPO+Z5toPdNtm5x3HQx0JTAkD2YUKoGh1Acg@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: allow BPF_LOG_KERNEL from kernel space
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 7:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > @@ -831,6 +840,11 @@ int bpf_log_attr_init(struct bpf_log_attr *log, u6=
4 log_buf, u32 log_size, u32 l
> >       char __user *ubuf_common =3D u64_to_user_ptr(common->log_buf);
> >       char __user *ubuf =3D u64_to_user_ptr(log_buf);
> >
> > +     if (common->log_level =3D=3D BPF_LOG_KERNEL && !uattr_common.is_k=
ernel)
> > +             return -EINVAL;
> > +     if (log_level =3D=3D BPF_LOG_KERNEL && !uattr.is_kernel)
> > +             return -EINVAL;
> > +
> >       if (!bpf_verifier_log_attr_valid(common->log_level, ubuf_common, =
common->log_size) ||
> >           !bpf_verifier_log_attr_valid(log_level, ubuf, log_size))
> >               return -EINVAL;
>
> [Severity: Medium]
> Does this code handle BPF_LOG_KERNEL correctly when it is specified via
> BPF_COMMON_ATTRS?
>
> Since BPF_LOG_KERNEL outputs directly to dmesg, the user buffer is 0,
> meaning ubuf and ubuf_common will be NULL.
>
> Slightly further down in bpf_log_attr_init(), the mismatch checks and
> inheritance logic rely on these buffers being non-NULL:
>
>     if (ubuf && ubuf_common && (ubuf !=3D ubuf_common || ...))
>         return -EINVAL;
>
>     ...
>
>     if (!ubuf && ubuf_common) {
>         log->ubuf =3D ubuf_common;
>         log->level =3D common->log_level;
>         ...
>     }
>
> If a caller passes BPF_LOG_KERNEL via common attributes
> (ubuf_common =3D=3D NULL), it seems the inheritance condition
> (!ubuf && ubuf_common) will be false, and the common logging level will
> be silently ignored.

BPF_LOG_KERNEL should only be passed by in-kernel loaders. Entry point
for in-kernel loaders is kern_sys_bpf() doesn't pass any common
attributes. Hence this situation should not occur.

> Additionally, if a caller specifies BPF_LOG_KERNEL alongside a standard
> common log level (ubuf =3D=3D NULL, ubuf_common !=3D NULL), the mismatch =
check
> is bypassed, and the specific BPF_LOG_KERNEL is silently overwritten by
> the common attributes instead of returning -EINVAL.

Again this situation should also be impossible due to the same
reasoning as before.

> Could the null-buffer checks be updated to properly support inheriting
> and validating BPF_LOG_KERNEL?

I think we should add commentary in bpf_log_attr_init() to clarify
these scenarios. Maybe rewriting some checks is also in order.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-bpf-lske=
l-fixes-v2-1-e8ac5974a72c@google.com?part=3D1

--
Regards,
Siddharth Nayyar
