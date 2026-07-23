Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCB38947F
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825587; cv=pass; b=Ax4lGpC+RiSFygPb/JLhOkxKosVypPDArpO4AVBy5TELyGTdg94apR195w5RCtXkbt+tY0r3B6RNLBgk00It1jj7SX5yFdljomKZFM+7gQh45uItEDLMw0vQzCfskQrON/EZyM5M5i9DU6ipdS8W7issX8wOqMbSTPil91rfN/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825587; c=relaxed/simple;
	bh=eECP8AmlTL6Y/rafqk+Nw4dJNBD5MFOMRhH1chD/y8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXb12MWwvW1EWCKGBCDcNsJMleY7TFRDoeGoFa2K961QOroFw6yL66TlpTjbznfTYj4AvjKCQn9/+MRahLOMzDbrNeUmrFXK9CqMV1y+1l3jiIuJ5+bbGmG+YfMm4FzM7blPIsMuJTdPCavUDqJiBWalXGgXSN5oEJ22AGdRMUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsPeW22E; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsPeW22E"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e6f0b4610so6055617b3.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 09:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784825584; cv=none;
        d=google.com; s=arc-20260327;
        b=Ym9dKOxeFf14sR3oDj0niEFANsyAIa9ew/VuiAl17pgCNffSkLqLE/BBFjMbUxVdL/
         W+gd4sAF6GUgXjni5c+NTmn5GSRNDo5T+RhiDWwzZE0wf2PXmyl3m/TR+dgUxGvdnf9p
         n7mckHc2REHpLzOwLNO0KjvscpcL1ZhX9n6VsDfy4Kyy0ttdj67iuq++Y4V9ld3RQHns
         7YcwnJAxXSmbXfp7ad9tIuQG9R7MZV4jzHTvhTJjVuQyxdykLTPBraHoBbiif3LJm9EL
         SclUErZHtFXUJzV806Z+r6g6+aYwQlKRw4mtw2oqdMTSvjNfA/k5d4DPtlcLcArgpHMD
         1SUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFlS/DgVG0mBli/C45AnzwYLezZwdHd2vepLVL+Pp3Q=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=HyqHNJyS3Pf+hkAOQlWdMVXqQUOc8AmlvJGffyMtRAkt9nUIwc7iHT1ygaciJJMqik
         30rulSf8ZcClmHcVz730vX5seXEAW8Nq5EyePZRVLvGf1dLsa8SGMeRBhxwWfyIiEc1Z
         knk+vWzINhGZFOUL0oucoyZPhS5SP641DbW8c87fjRarOeDqJipeYzWIVar2mTHXYMvd
         yt8xlt/ilXdzm+FNl67gvfxUy8pV001LF7ZkqFoapXUi39Ud1WQDvDB+DDW7qffOmzJZ
         xDdwPuAgKUSy4G4D3qREKRsOc2pxZIqC41JyxsjkOkugS2t/vOorO4skaGhAEw1Af9Tb
         IjeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825584; x=1785430384; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFlS/DgVG0mBli/C45AnzwYLezZwdHd2vepLVL+Pp3Q=;
        b=VsPeW22EH4IqCzNTOi7H7F7ZZ8fndg9NqygciFS2BJGly0zbdyU/ndZ0nIAG8xybGM
         hlHl5BXgYQLP7dRr10C4VxVjXjKbCVh0h8pAnropoW40LSEy3UJWS9KmeD0GUA+Ygt23
         i8OV1jwjEyvkrEoOmfv75ApNF0moZ9OT/1IAoeNBIceSZniDE7atVtfCNU1Pn02UYJHJ
         p52AIra3V8XdnRhk3VFAZbIgnE0X6VkgP6wF8TJntIjjp02s2nyyqxKOZOgBMCDfuCzV
         HC3W72CeFvdHGvDBD48B3aVHAXt6MEh1nFOLt/KUZfMcS5dVUyJAPZs6iMIEIY4xPycr
         nPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825584; x=1785430384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFlS/DgVG0mBli/C45AnzwYLezZwdHd2vepLVL+Pp3Q=;
        b=Q2IlmtHHgtT5jaCXQqVoDHwemRt2th72TiAckuByo5/ARGxVW+TKKUPvb9vU4GfguJ
         27+uHrqYvdwr+cDPAHpF86/wPheVKlUf9z8Bksfg5rvzBLC6iyK+ID87xhqN1SGeLQwE
         grBYtqnRW1VhgOND6dHg13cNH+AzDdpR39Axu9wfEZoMvY3Lh0ookp3WrrenQ2pw9S0F
         PVeLAK5TkUgFGc2He/VQ0Gu7N6ndnsX3745YZcgcib5Ca6d0jJ3wpyX9kdCNNSdDtpgA
         tdSAiekS3w3SvI96LvGkyMg9gpjCNwYQumOySd5qG/0QcSO5lSj5XikGEBrBnzNOnbFN
         /3Gw==
X-Gm-Message-State: AOJu0YzqSChD+K3k88tHpwi5T18XV2uQiwey2qhejPGsOJkmkodVAIVU
	s17JdNQxZDshVydU5TH0cOpdKME7xFS6Ajm17oAngyaiih212I+uTxsEC8V4CUfdQ5/Wgr/zEyD
	7v6e4La1a+Ii1BkiAM4DG/SOOz6kmeKpdXg2P
X-Gm-Gg: AR+sD10YMmGPfCcqcB9c8cmyuj8O+uFV4ENFcFLtW2DRNRNAvQVSSFiDKg+pH+mxcXP
	SbAddAVcXhunnOFaUKYGBTbj4HATvV3AGGTmTfsJfAScRAmrDUa1wpC5l8X4eAWG/F/67ag+CbZ
	kzxsOmed0/lDgS8ndH0vZ7SI65DNjgRIZ0Tv8kXzmeVhqZhgkBy8STcsd0uAQRTJjvZUunNh3sf
	qVBsyXXuwg93KVYNT2AuFNPj8MPydeJkyUuU67IUSztV4d8z5syfjJYzSybyg==
X-Received: by 2002:a05:690c:3388:b0:80b:9114:3b7b with SMTP id
 00721157ae682-81f4c1bf05fmr11795357b3.17.1784825583783; Thu, 23 Jul 2026
 09:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-4-ameryhung@gmail.com>
 <20260723053502.B40831F000E9@smtp.kernel.org>
In-Reply-To: <20260723053502.B40831F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 09:52:53 -0700
X-Gm-Features: AUfX_mwJdOqs4jUEMIYvLOgaaNieUoE9IjpoUFhEvPc09qaAKnvjT9cjXGiDALc
Message-ID: <CAMB2axM-tZ6OCFi3MwE28Je=3HLYbrsjyMSR6Hs-KyUNEe7nKQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 03/18] bpf: Split kfunc map argument into
 __const_map and __map
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The newly introduced `KF_ARG_CONST_MAP_PTR` logic fails to v=
erify that the register's base type is `CONST_PTR_TO_MAP`. Any register wit=
h a non-zero union aliasing `map_ptr` (such as `PTR_TO_MAP_VALUE`) can bypa=
ss validation, leading to severe type confusion at runtime where user-contr=
olled map value memory is treated as a `struct bpf_map *`.
> --
>
> --- Patch [3]: [PATCH bpf-next v1 03/18] bpf: Split kfunc map argument in=
to __const_map and __map ---
> commit 2aa2cd575b3d4be283e92e30e814910f54fbe0cc
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Split kfunc map argument into __const_map and __map
>
> This commit splits the kfunc map argument annotation to avoid type confus=
ion.
> __const_map indicates a verifier-known map, while __map indicates an opaq=
ue
> struct bpf_map resolved at runtime.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index bff51aff25579..0ba0de8eb8fe0 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -12164,6 +12168,7 @@ static int check_kfunc_args(struct bpf_verifier=
_env *env, struct bpf_call_arg_me
> >                               }
> >                       }
> >                       fallthrough;
> > +             case KF_ARG_CONST_MAP_PTR:
> >               case KF_ARG_PTR_TO_ITER:
> >               case KF_ARG_PTR_TO_LIST_HEAD:
> >               case KF_ARG_PTR_TO_LIST_NODE:
>
> [Severity: Critical]
> Does this skip the is_trusted_reg() checks and leave arg_type as ARG_DONT=
CARE?
> Since KF_ARG_CONST_MAP_PTR falls through to the break below, it seems we =
might
> bypass pointer type safety enforcement here.

is_trusted_reg() is not needed for KF_ARG_CONST_MAP_PTR but the check
below needs to be tightened.

>
> [ ... ]
> > @@ -12371,12 +12376,16 @@ static int check_kfunc_args(struct bpf_verifi=
er_env *env, struct bpf_call_arg_me
> >                       if (ret < 0)
> >                               return ret;
> >                       break;
> > -             case KF_ARG_PTR_TO_MAP:
> > -                     /* If argument has '__map' suffix expect 'struct =
bpf_map *' */
> > -                     ref_id =3D *reg2btf_ids[CONST_PTR_TO_MAP];
> > -                     ref_t =3D btf_type_by_id(btf_vmlinux, ref_id);
> > -                     ref_tname =3D btf_name_by_offset(btf, ref_t->name=
_off);
> > -                     fallthrough;
> > +             case KF_ARG_CONST_MAP_PTR:
> > +                     if (!reg->map_ptr) {
> > +                             verbose(env, "pointer in %s isn't map poi=
nter\n",
> > +                                     reg_arg_name(env, argno));
> > +                             return -EINVAL;
> > +                     }
> > +                     ret =3D process_map_ptr_arg(env, reg, argno, meta=
);
> > +                     if (ret < 0)
> > +                             return ret;
> > +                     break;
>
> [Severity: Critical]
> Is there a missing check for base_type(reg->type) =3D=3D CONST_PTR_TO_MAP=
 here?
>
> Since this breaks instead of falling through to KF_ARG_PTR_TO_BTF_ID like=
 the
> old code did, it looks like any register with a non-zero union aliasing
> map_ptr (such as PTR_TO_MAP_VALUE) can bypass validation.
>

Right. The check needs to be tightened like below.

-        if (!reg->map_ptr) {
+       if (base_type(reg->type) !=3D CONST_PTR_TO_MAP) {

> For example, could a BPF program call bpf_wq_init(wq, map__const_map, fla=
gs)
> and pass a PTR_TO_MAP_VALUE for both the wq and map__const_map arguments?
>
> If wq and map__const_map use the same register, process_map_ptr_arg() wou=
ld
> verify meta->map.ptr =3D=3D reg->map_ptr (which evaluates to true), and t=
hen break
> out without ever verifying the register type. This would cause the kernel=
 to
> treat user-controlled bytes inside a map value as a kernel struct bpf_map
> object, potentially leading to memory corruption.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D3
