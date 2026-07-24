Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806C3AEF49
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926211; cv=pass; b=V9DDQ71a5CIkf5SFvd9imfe3oafY9UylxpJYZcf4TEk444yzq5wsPwI0kpzysiq49wRrDySc1bWKRSvOoL0xw+N1ybd2+2l6devlXVQ7T8PN6VhRsdluxDISYGmLz4v1elbnR58yeFJ5rmKptgXEwAEo5ne3tFFVAIOoaDvhOnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926211; c=relaxed/simple;
	bh=DeKeHMN1EaZyILyPa3N3SlwUjqx+e3RWpW7JK3gJa1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guSmPQKyw0wuy0gPW3WkkF9V1LhHsZQNOhr1Pt9KLB9exIDLKSj3JAugXrmw1Ue4WNvYlfoOw4T/9DAC1X3IOb/ls65E8Jzy714mJrfrRNBmzeduKDqGh4M1nDC13x4jEkADqvWQ6yI6pbgaUAf3VJ05h7N8ysADo8sOCCJe3+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGq3Ar7R; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGq3Ar7R"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ed2a00f12so8387977b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 13:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784926209; cv=none;
        d=google.com; s=arc-20260327;
        b=JlplipoNgTj2Nt4SaLF68aQ05AxCJIA9MkSeR2McUFcYtU+TGCG5Bm/b/84SlLIVbQ
         qD+a/0oB7h97pgNy8zhljGIPbeZ6rmnUxx71ePALru4ICYV7GoRfkuxzsOmMufUBFVOB
         eowyox8sagQp8C2nWBzyjRsQ44gfBBUJ2+YMUjOm3R5mOq3cjbbCwxu8oRmxo9R27Ftd
         zg4zEbADWzL+UillVwmBB8H2NGyeWzfvX0gFDbeGFp+2/ADS0w/AQyjKOML5YHQSRMEn
         rbdcg0Ld5/St5qX9bF+vc6o6cusD2epHCt+HzND60FQeCDDuiKEAwapfX6WQM6Hc3gVD
         R1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ruj+BsjsuAbvvaqwyPqVkAoHz0sZM0BQFx5c/y5tKvI=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=p38dDIE0WcYJd/iI5g0u4usf9H+Yhet7Ecbair3RQOrg3InyhmDZamLOguN688dytB
         nBVLIOvo4KFYty6/V4TpSSH79B3BD4wL6dKNs+V5Jr1q0owxz5y73AW7ZlwPPqkzaz6R
         0BmJMytVpJuU1ziL3qvrBiB5eOCrIlOYvV20GOkcEObB9/Gi9aBRmswthW4IQHzHy3gc
         IqkkHHVO3oDJQmpsWY7ZhtoOZUzB43X24KzFRhJQvtH3K/4KiZpSn8vvN/qXLT3I9b9S
         IzY45fhp2raS5eHi9S9C/Jm1qFMq15x0yE2J1piWn15LbBV57b28FZDQFUc1WkSBFSZI
         BDkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784926209; x=1785531009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ruj+BsjsuAbvvaqwyPqVkAoHz0sZM0BQFx5c/y5tKvI=;
        b=CGq3Ar7RWCnuR5kuqp3Q7g5ntya2yxIeZ1f0M0xeyP1wDuQTZrtRrW1uzNI75IppC8
         aA7YipxnPZQERC0EwgL7m8A4QQfCOSmad5XI3AHALFWdvIWoUBnSbckJHQImlD2NYrBZ
         uNwImUZmhAMJnw8qhMUbOjGaxivTQyb1eiV0BHxFYM0uN3H/pYfeVaSufa/Z/ZXR6pZR
         r3z+C08uihnITr3WxW740FLzPZEU9iGmaR8iT4pDBPF7zioTjgzSLh6U3gZ3rzlbX7h5
         pzlHbVhHL26E7Yq01FpSQ1HyrA31aMeXhjkM/p/UOio0WeVWBI1bjwxnF3yvkESUz0Rd
         8W3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784926209; x=1785531009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ruj+BsjsuAbvvaqwyPqVkAoHz0sZM0BQFx5c/y5tKvI=;
        b=EKkFI8c5ctJwt4+g+ncGYrbypikBWOtw9qqUArP+m2KV0fKTcqKjmyzxPMqzQDWvRL
         C8Fkh8Rw7oS8i4pyb1SOwth/dWlVkVOYC49BKBbO0tZiVNLltVbn8K0O6MvZwVODFrV/
         XTZLTDhFk49U+akq+B06QSyQIf9CQAYe3J03RYhWqGhbPq3DtEwnpPypzdG1Lc2dy0Zv
         DM2Ikl/gSMRdcJuqqU9CJrCEa2dZ7pXF/bk8YoJdUPoqB9xZQQYRvvL+KJlhD1vCPmfJ
         mZX/kE/DVlw00uw3N53XmawN5VmxKuNUhRksZ2Kd2/pOBOo4Ks78IseYtEUNI6yYnZp4
         csEw==
X-Gm-Message-State: AOJu0Yxu7pbaDc0p9uOfRgs2T2rA32D/IDsSOM5EPBNI4CsnbTrJkaq/
	ByfsL6TA85NETdKZVVQDkh8NLH1h1z7xy69xiFGwkmiVzXyr6O7TQh7ImfrzKyjB19oLlv/LBRc
	Yu5L96OrQSiEG4NZXzmMvX/LzmLKRnl6k0Jt2
X-Gm-Gg: AR+sD12EnrsWMt476xjNrJ60e5ulyPUjsZyoVHQkeDCFx0btqUNrZYNiloshVSeWZAT
	ryMccOpW71NZxTWVHMU/KTGp4Iyv5Eq6+AzNldLWWNuQaTL2kgR3g8WH2rPXAgVmdfKUvuyBAm8
	uhSfE/J1Epbwy7EbdD7MOv2n54A65jv4bbSsDREkcxhE9+jJxZB90dNZaf+omlRnCwA2V4B/ZLx
	Gq3KfuebrAc+AF3mjZ3pL02NZ8cbZxePBZl5OxG39HzBuF5E0gwJJrM9EfmWg==
X-Received: by 2002:a05:690c:2610:b0:81f:47b5:d930 with SMTP id
 00721157ae682-81f69d49002mr163077b3.31.1784926209275; Fri, 24 Jul 2026
 13:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724190813.1458271-1-ameryhung@gmail.com> <20260724190813.1458271-3-ameryhung@gmail.com>
 <20260724192840.1BB2D1F000E9@smtp.kernel.org>
In-Reply-To: <20260724192840.1BB2D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 24 Jul 2026 13:49:58 -0700
X-Gm-Features: AUfX_mz8jzGwCxLHOf1PMdUD_tm0LrUzqkkbW-3SbwaVJMTFOsrBQMivdalnSg8
Message-ID: <CAMB2axPaPthdQ-pVG0PV21Wzw=dgWnFdPqi5FuJ1EeAEde-P1w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 02/18] bpf: Unify const map ptr argument
 checking for helpers and kfuncs
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 12:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] Multi-line comment does not follow the required BPF subsystem com=
ment style.
>
> Pre-existing issues:
> - [Critical] Pre-existing verifier panic when an array map is passed to k=
funcs like `bpf_wq_init`.
> - [High] Pre-existing logic bug allows mismatching maps to bypass safety =
checks in kfuncs.
> --
>
> --- Patch [2]: [PATCH bpf-next v2 02/18] bpf: Unify const map ptr argumen=
t checking for helpers and kfuncs ---
> commit 08bfe87a36be7126ec3db2d3ab4783e72b62e453
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Unify const map ptr argument checking for helpers and kfuncs
>
> Both the helper ARG_CONST_MAP_PTR and the kfunc KF_ARG_PTR_TO_MAP
> recorded the map pointer in meta->map and, when a map was already
> bound by a preceding timer/workqueue/task_work argument, rejected a
> mismatching map. This logic is factored into a single process_map_ptr_arg=
()
> used by both paths.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index e8c76abbf76a2..a3429610b426e 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -8274,6 +8274,44 @@ static int get_constant_map_key(struct bpf_verif=
ier_env *env,
> >
> >  static bool can_elide_value_nullness(const struct bpf_map *map);
> >
> > +static int process_map_ptr_arg(struct bpf_verifier_env *env, struct bp=
f_reg_state *reg,
> > +                            argno_t argno, struct bpf_call_arg_meta *m=
eta)
> > +{
> > +     /* Use map_uid (which is unique id of inner map) to reject:
>
> [Severity: Low]
> This isn't a bug, but does this multi-line comment follow the preferred B=
PF
> subsystem formatting?
>
> According to the subsystem guidelines, multi-line comments should have th=
e
> opening /* on its own line:
>
> /*
>  * Use map_uid (which is unique id of inner map) to reject:
>  * ...
>  */
>
> [ ... ]
>
> > @@ -12122,36 +12140,9 @@ static int check_kfunc_args(struct bpf_verifie=
r_env *env, struct bpf_call_arg_me
> >                                       reg_arg_name(env, argno));
> >                               return -EINVAL;
> >                       }
> > -                     if (meta->map.ptr && (reg->map_ptr->record->wq_of=
f >=3D 0 ||
> > -                                           reg->map_ptr->record->task_=
work_off >=3D 0)) {
>
> [Severity: Critical]
> This is a pre-existing issue that was not introduced by this patch (in fa=
ct,
> the patch appears to fix it!), but could the old code crash the verifier =
here
> if a BPF program called bpf_wq_init(wq, map, 0) and passed an array map
> without BTF for the map argument?
>
> Since an array map without BTF has a NULL record, evaluating
> reg->map_ptr->record->wq_off would result in an unconditional NULL pointe=
r
> dereference, leading to a panic. This could be triggered by any user with
> privileges to load BPF programs.

[...]

>
> [Severity: High]
> This is also a pre-existing issue that was not introduced by this patch, =
but
> did this original condition allow mismatching maps to bypass safety check=
s?
>
> If a BPF program called bpf_wq_init(wq, map, 0) with a valid workqueue bu=
t
> passed a mismatched map (like a map containing only a bpf_timer), the
> mismatched map would lack both wq_off and task_work_off. This would make =
the
> condition evaluate to false, bypassing the mismatch rejection and potenti=
ally
> leading to type confusion or memory corruption during runtime callbacks.
>
> > -                             /* Use map_uid (which is unique id of inn=
er map) to reject:
> > -                              * inner_map1 =3D bpf_map_lookup_elem(out=
er_map, key1)

Yes and that is why this patch use meta->map.ptr->record that is
already verified. I can also separate it into a standalone fix
targeting bpf if needed.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724190813.14=
58271-1-ameryhung@gmail.com?part=3D2
