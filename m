Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2847ACD3
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823581; cv=pass; b=Vq5DBY6ro40b2ccWf1BCeOoKbsu3YzDFFtsSNG98AM37EVffmp8VXAhSumG6DiXHIDwc1tarLgNFOY21x1R6Nb3LPD1V/abviHPlREJSqYVgTS7j0mPkUrDlKYtojYwgoBl3fV1RFkyiuF13pm/VXQGj5zGBrprbwHA4GVS4fvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823581; c=relaxed/simple;
	bh=CGTehmPoZtpkgLUVZInj667j2ApkFO752c0wLjhRzDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTMVHn7Zt317y2bfrawiUiMAcZfT2p63fJ61s8JfvFCJ6OS8BHxY1mG2HXdDhyXCyuQ9auD7ktz1taBowiWK0MrC4/GnMJCX8h64rYy8TlRRPIctCaVY0OvVwyz2WGYAzbvyhkh6cqoHe4uF0i7ZdBdy7n8tTnkYF7BK8UW7QE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm2+564f; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm2+564f"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ee41aaec1so8610537b3.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 09:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784823566; cv=none;
        d=google.com; s=arc-20260327;
        b=F5HWFw/ncoKxHqhSjfvdxC0Kzr8GH0EJeF0X68nuZZ8Ea0n4r5alpTWrhvyadX3tIO
         lxfKKpsf/JBDlApyXFtmNmMNW2B8sDq6/rlP6+ra76JrOrAygpKPnxcjE3nK0T1ULtXU
         1TESUpeYPR6ffwzhCh3RF3d6W9AHqgMvRW5Z9RX0syxpWApjiqpFFGk3MUeRt5r8v4Ed
         MbEc+4QUaVfMGbvnUJ3p4OBKTcPH/rBqtpxDU6ac1ZRWdnzPisUQ0kzLKkCrP8wVaBJl
         5bSQCFf7kSwf/qGluIRMsXQuoQxsyngBT9hM7WiMkaqUXs9SOnNaGGdVBrXQ7oO7Ic+H
         JJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U7KT+w2KO22zzr4U0Av/AbpkMD4h2JR4x2ATdiLmsbY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=jjWsZbnwIqVprL8pRjjo4lOP9/IB7qTXUy8j3vGMIQStrr3fGdGI+4tSYv4eec6rZI
         9s6KHph+S+Wd6sa2EMSkqXx6Lxi8w8w7oBd+Wcm7W4Jy/WarJPt9ON0q7H+V5s+xg/b1
         hlUNHodc/Ypfuxm1M/dgqtaLJpdW6Me+hP0ntZFP2o8GO9Xnk+kPZtPNIEwJX3qXtq/l
         No7TYTiLY3JIA9rbJWYcVWRbj99JV0O0C9D3ZF03Ais8WDsRP2n6zlQ7VCr76udWoIu2
         ROhbM3PaGDOTpYWBULTeyxonTRXenSkM3f63Lln69eMvmS9mrjP4O8cdid51nBWZy9nx
         Qd9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823566; x=1785428366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7KT+w2KO22zzr4U0Av/AbpkMD4h2JR4x2ATdiLmsbY=;
        b=Cm2+564fyslua0bP2kYKuHKbNNZsygxaaavnrNTPWCgEBGiHEGaKRpIEpumo+rvk2b
         pl4RnZinC77WxyCyzWJD8ryIOPFNni1xtPPW2lLFev8n3eGZmtFIMXx9ygK81u2dVwk7
         TJrPPBVqHEMnu5FIK471GQkFWzBlMpEKd6/78TJk9WrSe9EO3emR7nruxeWUfkB7v4j6
         efX3WoIhvySo1he7jvy2p+6TggUR7wvG0uwDh5lUTdHc0ZHn9wNkPfa7uasKa3wHocpZ
         aXb02Ju40MWqRnMwqOGJTltE0lAeKeQJdQO9KU/Tf2i9b+MSP1jr0f11BQW6XIiKfcIV
         uPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823566; x=1785428366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7KT+w2KO22zzr4U0Av/AbpkMD4h2JR4x2ATdiLmsbY=;
        b=jn5u7Msn22q7uo3/LWZ1knMELZdhpD5yEGLIR+J3Nta3Rz8FhI5Vpves/hd6BjY6nG
         0Be3/EJWLhXEoQDjXx91xOS6+8jeieTlC7WEAOlpRk9e1BlTpsG4amWceODqBhq49YK5
         7St9ftcibr91Ox5ycgsgQDxPLyaLJWsq13bBQk1QKrobXwQczvVyxIt3mZXl/E2s0PCQ
         7nVSgpJluUYSeOm2Zh7W1VsLwTtsjbLKGkiQ46J3LDb52oHjfIhp5A4wF0q0rgR4ZxX9
         1qTn1uU6N6dmKF90Qc1icTLg5k+lN72NxThJOd4Qpggy1ppyuhEocA9SqfBzHa/Y2g8+
         V6bA==
X-Gm-Message-State: AOJu0Yya37C7+npYQ5jHNGad+jXWTCVqaVi/2U5hA4He4LNnjsIGN/nL
	k6tf7C2TztdEfBo3pE1eZruHQZPyvEbPLTGSRjCfZToaITOdf2RRHgeEO9AhIuyGPLYPgIwZl71
	3PiBOj4LWAN33e2Z3k6SWYwFYe1rxms4WsU+c
X-Gm-Gg: AR+sD11lURyfnMGRr//eKkZg/SmnZiidBysSdi/njUACHozd4XZvhyPpItWqH8+iGa3
	5yrLBFjxWFj+WyC725EV+hCHgKnWzY8eP7Y7iUUwZxNba7ePwS53XWXahVoE2f4epKRfxeWt0t+
	U7235GSh0u00nPteqvfZINtlJsNQmjC4owXySGmyp2ga6f896I+jiPXqX+vtcmpTG+pi1/1LXhS
	gWD2IBwWiO+YrISp0PP/7yFKiPnDOEMk5WUjl7o8oeKBegbhjIzUPJRrYkeHQ==
X-Received: by 2002:a05:690c:3389:b0:81e:fd36:ff73 with SMTP id
 00721157ae682-81f4c15ffc8mr11121537b3.5.1784823566010; Thu, 23 Jul 2026
 09:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-3-ameryhung@gmail.com>
 <20260723052519.261291F000E9@smtp.kernel.org>
In-Reply-To: <20260723052519.261291F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 09:19:14 -0700
X-Gm-Features: AUfX_mzdbE453_9nXvQOeKy14QwV2Y8p0rPt5LClYeWV1TsjmoAvbVTiTLVMQdg
Message-ID: <CAMB2axObD03d9mVhXgZqsk3HiruW3tpdjJ-M_WofWZziDX=Rrw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 02/18] bpf: Unify const map ptr argument
 checking for helpers and kfuncs
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] NULL pointer dereference in `process_map_ptr_arg` when a BPF f=
unction accepts multiple map arguments.
> - [Low] Incorrect and misleading register numbers in `process_map_ptr_arg=
` verifier error message.
> --
>
> --- Patch [2]: [PATCH bpf-next v1 02/18] bpf: Unify const map ptr argumen=
t checking for helpers and kfuncs ---
> commit e4d2232623c3b71f4ec65054cb7cebf7737a4120
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Unify const map ptr argument checking for helpers and kfuncs
>
> This commit factors out the map pointer argument checking logic for both
> helpers and kfuncs into a single process_map_ptr_arg() function. It uses
> the bound map's btf_record to derive the object name (timer, workqueue,
> or bpf_task_work) for diagnostic messages.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index e8c76abbf76a2..bff51aff25579 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -8274,6 +8274,50 @@ static int get_constant_map_key(struct bpf_verif=
ier_env *env,
> >
> >  static bool can_elide_value_nullness(const struct bpf_map *map);
> >
> > +/* Record the bpf_map argument of a helper or kfunc call in meta->map.
> > + *
> > + * When meta->map is already set from an earlier argument (a timer, wo=
rkqueue or
> > + * task_work object that is bound to a map), reject a map pointer that=
 does not
> > + * match it. That object sits in the register right before the map arg=
ument, and
> > + * its type is taken from the bound map's record for the diagnostic.
> > + */
> > +static int process_map_ptr_arg(struct bpf_verifier_env *env, struct bp=
f_reg_state *reg,
> > +                            argno_t argno, struct bpf_call_arg_meta *m=
eta)
> > +{
> > +     int map_regno =3D reg_from_argno(argno);
> [ ... ]
> > +     if (meta->map.ptr &&
> > +         (meta->map.ptr !=3D reg->map_ptr || meta->map.uid !=3D reg->m=
ap_uid)) {
> > +             struct btf_record *rec =3D meta->map.ptr->record;
> > +             const char *obj_name =3D "workqueue";
> > +
> > +             if (rec->timer_off >=3D 0)
>
> [Severity: Medium]
> Will this cause a NULL pointer dereference in the verifier if a kfunc
> accepts multiple map pointers?
>
> If a custom kfunc or future helper takes two map pointers, such as
> void *a__map and void *b__map, process_map_ptr_arg() will process the
> second map and see meta->map.ptr already set by the first.
>
> If the first map was a standard map without special fields, its record
> pointer is NULL, causing rec->timer_off to crash.
>
> Should we check if rec is NULL before accessing its fields?

Probably not.

This isn't triggerable because no helper or kfunc takes two map arguments.

If the two-map use case ever appears, the logic would need reworking
first regardless since it currently rejects a second different map.

>
> > +                     obj_name =3D "timer";
> > +             else if (rec->task_work_off >=3D 0)
> > +                     obj_name =3D "bpf_task_work";
> > +
> > +             verbose(env, "%s pointer in R%d map_uid=3D%d doesn't matc=
h map pointer in R%d map_uid=3D%d\n",
> > +                     obj_name, map_regno - 1, meta->map.uid, map_regno=
, reg->map_uid);
>
> [Severity: Low]
> Can the hardcoded map_regno - 1 produce confusing or negative register
> numbers in the verifier error message?
>
> If the map argument is passed on the stack (e.g. more than 5 arguments),
> reg_from_argno() returns -1, making the printed registers -2 and -1.
>

I will use reg_arg_name() when printing the debug msg.

> Additionally, if a future kfunc separates the object and map arguments,
> map_regno - 1 will point to the wrong register.
>
> Could we retrieve the exact register or stack slot number for the
> bound object dynamically instead of assuming strict adjacency?

No need to change now. This block needs rewriting when that use case appear=
s.

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     meta->map.ptr =3D reg->map_ptr;
> > +     meta->map.uid =3D reg->map_uid;
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D2
