Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0FE488DA2
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832304; cv=pass; b=fPDWcUbY5qtKy6+TEeZOp/ToJTbgOTD4l2SThxOpC9MZzCsW1wb9gLh+UoM8qX7ktgUwhvx2d9B3oeGCzww1qtdxUkSX7UMeD+zUFppwnBj+541W0krkJfeigOst1XLzg0z5dGI3BIijh0M2C1d5BY0lhhmq3La2OEbftuFgsnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832304; c=relaxed/simple;
	bh=yg9/TuPXxiIR3f/K2GQ63dB4YPeSX1mhjvPFI9kMu+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipUXRPiucJ2xq5epq7aq9xN6M4x1m4CLYX92E9wn0l3F4RcFsgwQsadZxfaE1L8rZT3m9UmloJo7esedesOOa+sq+wLwFTBZ8D63SpHD1687DCYsP/7esUTJ0rD0O1Mg/pBMlvtj97CEbRSAIvcBuI97ri4X97BJY36WtqjwhAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7N7KyL3; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7N7KyL3"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e69a2db34so10011447b3.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 11:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784832293; cv=none;
        d=google.com; s=arc-20260327;
        b=oj1l2anZa9XdzTcJtKlmzfIfrhUclrSQdLlsop2JrjyaORzB16R9MylUiJ+/3sWeAZ
         oQEKHll8GafRaEj1063jCFmm4j7akQQcn84ogU0tmPUK69XY3VghQd6IqAwjWFtx85cx
         +6pfdNx4s3dLJFT80DVWs6MgAYE2UNl4juK05NYhAG4OzzkO6+bSu1dBd4LGxhNNYiAX
         7/WjNOvDwWdpLKrZbIxcjg0cAh0DujZ6D4qABnObf9qFXGImP7/Lv/C/PJLrBhN7WcIa
         J8oAYv/fyHQ4697sKFKk0h9QjJO3hUBLnSjgEpmA2XjxWtuxHVEJu69FFTM68zASM94c
         ifjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWE1XQk5hMIg4yF/U3X0RJddhBOGdBRI/GnQd18cQ84=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=ntaK3jtma+0iwyQ5/ae7vmeqVRDTGYyqXM1A8nHy55lzof5DYLxdE6stqpR/0ZqdNz
         yfKXLgoTC0UI7AQbJ7pTCvcEQFCXmM6KKsRZU69+Tf4u/Gpqe386eUFfnwZcP8kQDOmL
         sru76B5UgejQLAC2mXqyC+gHfy0pPBcNn6IZgJG/kMY1Cby9lqvUYok1CbXjIhu4UaR2
         TM4bJht/bC4XOCO7NKr5YytHp9MJiGIXI+LqAzTcjcXa9s6B5MMp+ord/18FtLz4b1Dn
         oYymQmSp88orqHTSqBLmTCgxGcKBIAUXVkbiIjhuGYP7aijaE0dbIeRoVgjJG/Khse/z
         45pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832293; x=1785437093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWE1XQk5hMIg4yF/U3X0RJddhBOGdBRI/GnQd18cQ84=;
        b=D7N7KyL3OZ3EECvmyDCx66lrZiOdU9qbRGVK+JANsXhkE/9dhIOvS3+JSFIVcy7UID
         2roHO8V6N5Lsl4mJeW/+58gWofKA/+qY/30RQHmmny682JnPx7oiSL3Nj1v+bepTeHxW
         X3EFCm9vk3ykLkt9kBvAp1P0GOrjtUFkUsaVjnL7eGfo8o83+EpfgWWhUeTGaAoETJpF
         gOjk2OztMMVVE5mcH5LxOm6kwP2aT2KckZfKXAaFFWtBVrIDPSSyOWvCFsNDkZo1wd/3
         uXevDR78feydjhGZIHBV/WIdI03EGlqzeTYyAKYLBIk4jiIdjkrKpXc6+9gRQYbffkTB
         rHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832293; x=1785437093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWE1XQk5hMIg4yF/U3X0RJddhBOGdBRI/GnQd18cQ84=;
        b=o4kOWcLpwkRBUcKSBOILc/2/e3LvFt10cahoJSSlrxSlAPNwZaAFdQyw9t4C8onTYh
         XLBxEjn11Rs4yN2PTerjcH7j1Y5M7ZKFgzWWy/FW0Nrdgdsnf2zm9RXmmvskN9EwI+NG
         BhsFXcLacCXrAgNqC9OPv/YNoEf0N/wNidjJ5H9ZkQnCKlSIl0WiIG76eJs3zCkiIAds
         9N8oBKI6L/+++W3Q1wqVUhvcrPKw/ry7ly9ZksdzlAztDQvl6Vjdi9TJV3T0poTchUFe
         TwCd+fwVja6QD43HBCujdVGZRsaqPqlUT3TiUGJOAX/slFiIu36VtncK+R+SIwymBd/M
         UdVw==
X-Gm-Message-State: AOJu0Yz0ZzgQiulbNU38gjPiF4ezmch4FpnTy56/sCDB7EWoiQL4HkD3
	3jn39Fd0mMLcABe+7RVvdE+RO9notV74a3Cv/fz5HLMmBSJ5o2BDHlemUllEMLrCobsvTGN7qvj
	/t5hC6mjjTgCG2QOceAY0QCxEC3522bwb2w==
X-Gm-Gg: AR+sD10o4lf4mHD4XVmvdw4BCZRJmtP2H2P15XpaWDI0xYxigNQt0gfazxZXeqK12Jp
	NRoH8/TuS0cVrK4mKvuhMhScGLQfgwYXXeLyiekH9Fo7UN2Zph4xuStzq/cL9FczSVs8ddgaVF6
	FUa9Cn6wIU2NfiUCs49ivTv3mXgI7OC+EKh5R4nb2tW3A1jt2OeapW/a0VS489R4HZvn29NUUQY
	HQqFzvuLt5VatIw5zt6+LlaIoakRuJAk8KkjJqExq/7k71f/DQYHlitx0WZ9zQwsR0ELwbKB3M+
	2P/mwqEVrFmHReED3XAi7uUDCF9lHk/5hFgYrTWA
X-Received: by 2002:a05:690c:6181:b0:81e:76a6:4fa4 with SMTP id
 00721157ae682-81f4c3641b3mr13865687b3.51.1784832293409; Thu, 23 Jul 2026
 11:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
 <20260721-dd-maint-2-v7-20-010fbe73b311@gmail.com> <20260721211144.5FF051F00A3A@smtp.kernel.org>
In-Reply-To: <20260721211144.5FF051F00A3A@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 23 Jul 2026 12:44:27 -0600
X-Gm-Features: AUfX_myewH6u9zWxn6egOOnD6NQMr2PYuX2LLJqaFPr4esqlMtuMqkOK2XVFRr4
Message-ID: <CAJfuBxzqPPui3TRsyncnbS_CLyyh6pU2=1mkO=JsPEVwa_v9Rg@mail.gmail.com>
Subject: Re: [PATCH v7 20/29] dyndbg: refactor param_set_dyndbg_classes and below
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 3:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The refactored `param_set_dyndbg_module_classes` is structural=
ly incapable of correctly applying existing global classmap settings to new=
ly loaded modules, and it corrupts the global state.
> --
>
> --- Patch [20]: [PATCH v7 20/29] dyndbg: refactor param_set_dyndbg_classe=
s and below ---
> commit fd7e6888285afde6b911cef67e7e2452e7180dba
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: refactor param_set_dyndbg_classes and below
>
> This commit refactors the param_set_dyndbg_classes callchain to support
> module-specific classmap updates, primarily intended for modprobe handlin=
g.
> It splits the function into upper and lower parts, threading a modname
> parameter through to ddebug_exec_queries. It also adds a check in
> ddebug_apply_class_bitmap to skip printing if bits haven't changed.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index f66e5373e61e2..a619cefd801f7 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > @@ -625,7 +626,9 @@ static int ddebug_apply_class_bitmap(const struct d=
debug_class_param *dcp,
> >       int matches =3D 0;
> >       int bi, ct;
> >
> > -     v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
> > +     if (*new_bits !=3D *old_bits)
> > +             v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_=
bits,
> > +                       *old_bits, query_modname ?: "'*'");
> >
> >       for (bi =3D 0; bi < map->length; bi++) {
> >               if (test_bit(bi, new_bits) =3D=3D test_bit(bi, old_bits))
> >                       continue;
>
> [Severity: Medium]
> When applying the current global state to a newly probed module, will thi=
s
> continue statement incorrectly skip all configuration queries?

this is a param callback. the modprobe has finished, and the modprobe
args setting classmaps
are already done.  the param-callback only handles param updates


> Since old_bits represents the global state, test_bit() will evaluate to t=
rue
> when applying the same global configuration to a new module, silently
> skipping required query updates.



>
> >               snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_n=
ames[bi],
> >                        test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
> >
> [ ... ]
> > @@ -683,8 +693,8 @@ int param_set_dyndbg_classes(const char *instr, con=
st struct kernel_param *kp)
> >                               KP_NAME(kp), inrep, CLASSMAP_BITMASK(map-=
>length));
> >                       inrep &=3D CLASSMAP_BITMASK(map->length);
> >               }
> > -             v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
> > -             totct +=3D ddebug_apply_class_bitmap(dcp, &inrep, dcp->bi=
ts);
> > +             v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*",=
 KP_NAME(kp));
> > +             totct +=3D ddebug_apply_class_bitmap(dcp, &inrep, dcp->bi=
ts, mod_name);
> >               *dcp->bits =3D inrep;
>
> [Severity: Medium]
> Does this code inadvertently corrupt the global state if a module-specifi=
c
> override is applied?

the param belongs to a module, its not "global".
and I dont know what override means here.
the callback MUST update the internal state, or error out.




> It appears that *dcp->bits (the global parameter state) is unconditionall=
y
> overwritten with inrep, even when a mod_name is provided.

the param belongs to a module. so does the param state.

> Should the state update be conditional on mod_name being NULL, to prevent
> modprobe handling from modifying the global state?
>
> >               break;
> >       case DD_CLASS_TYPE_LEVEL_NUM:
> > @@ -697,7 +707,7 @@ int param_set_dyndbg_classes(const char *instr, con=
st struct kernel_param *kp)
> >               old_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> >               new_bits =3D CLASSMAP_BITMASK(inrep);
> >               v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, K=
P_NAME(kp));
> > -             totct +=3D ddebug_apply_class_bitmap(dcp, &new_bits, &old=
_bits);
> > +             totct +=3D ddebug_apply_class_bitmap(dcp, &new_bits, &old=
_bits, mod_name);
> >               *dcp->lvl =3D inrep;
>
> [Severity: Medium]
> Similarly, is the global *dcp->lvl state unconditionally overwritten here
> when a module-specific override is applied for LEVEL_NUM map types?

the state belongs to the module.

>
> >               break;
> >       default:
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dd-maint=
-2-v7-0-010fbe73b311@gmail.com?part=3D20
