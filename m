Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC63859F6
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840899; cv=pass; b=On2lT0ZQZhDeRimjUYQBmqf3TDVAjdu8HIU9dESAdAGDGB5De/nRl4RzUBsz6dE0taiujwa9TVshnumh3nHNLf1jRBG+kNS0L+HLcMSvRvo2zYqsXafne+bIsM7R/ePwiViCCS8mNXsrkC7OyaoCoFeun0gFSODRoSV4hCQTHvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840899; c=relaxed/simple;
	bh=qrLeuvCFzR2hQ3pzCF50zMqJUsKk3LsT/QApP1Cp3uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3k+lzC+h74vcI94t9WTpkPEh9xu+70hODsnsDdPGlyhiIlLGrMd2x0aSsPtnbxk6s+Ha1Ji+CIZy3yPr3LIcndGsfpPbonYi3yTS53+3Cxl7mmJ5rl9cLrNmyoNF7CFKGwZRa/8DKGye4mgnxaKQ75MZFnnzSCE7kh98SnXwfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/etvEeX; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/etvEeX"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e2fd65f968so29980157b3.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 07:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780840896; cv=none;
        d=google.com; s=arc-20240605;
        b=V5s2GQbGvHQiapeqOUEZMKVL6afdMXorsMMdSaxbL4k+Y7nBhwTtgAiCr8fSioMzhW
         1Wfqmhw+oPceRTl8dWLJ4cav/+srKKt5gqpLTVUp0phpzaA+YhwfkcYYg7w9KKmv++xx
         DxaPuWB/VDRHsdiUmcyXXfOTt//a7ZbHVYyZ0V27HOPIC2ebHWLv2a8G2XxtdkJZvUxR
         A165EqdBkmFYOLe3a8MrCDYQEEOM2EawEZ7Rs6XLP8voEg7dUsmhU0xQx2e4zsO7xFPO
         taXj1a5VXcJvCmH4b1Dvam9CUlGF54W6uBtYhcFLKfVkbkLtZJ+kHMVG7a1H3uFkpCbY
         PCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4pYahT0z4LacNeBL11VjXkln5kCP+7BgtEQcumXBxMc=;
        fh=gil4l1ZdtuwZ0BOON6r2rez0EcGyFSpyaNOoG+TQ7ws=;
        b=ImgrzvydfbcDcDVs+WmmVR4CfoO32LLDo94TiFe/iTPyYNVIr4sP1XfnbCvnoSZ5IS
         sSpXI+eWfyXq8QL6b4FqELPtcuU9p5k3QH1+oSC1i+kOU3sfdKRrsQvpzCF4KqH4HTyG
         p6UNqb0a4PkM+LHElRNUeSVhGtlD3B9M9oX7QYv/f+wbDUGdRl9ebeRjhwC2MDij65sf
         2AqV8+Rp4SNCrlsII2AYnyo67hNvTc2hXuRozdt/N6zp6+QhPrZ9ZspqeZo5vv8x2iz8
         aySdt8oU9q1AnVGjgcE13VbGFUm94iZ9rwkRYX57TLn0ZHm1VBmN+z9K19+OYVf947/2
         lNsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780840896; x=1781445696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pYahT0z4LacNeBL11VjXkln5kCP+7BgtEQcumXBxMc=;
        b=N/etvEeXMAfAF0hPSC0EnrgdPCHR+yo18obzCHwtJokVFQeKtIA6rNE+6HZugiwjug
         D+2k1V0PTN32GdE/RP25K4e9aoaguEAR3RKCootwvzfCqi7GkOwbkMS4Fr/e9Ke91JQl
         x7V4dCzYuGlonSXSRXbxIIZbhsrdvtkDZ5xtDHLWigylipAkpKt9/rLU48uZLtG8/PO7
         9u7xXG6qLAS+1piOrYtPZq1MCBAyK7Hazw4drDGQ87l9jPT+cV4FFxnqb2iyvuNQZXfb
         CSiBmjVFzegbQL3t3goktddNcfKUcWCnCPo8Z8OUMGzcOJoEgPjr56kyGM7fcSo6N+p5
         VPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840896; x=1781445696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pYahT0z4LacNeBL11VjXkln5kCP+7BgtEQcumXBxMc=;
        b=QE5PcgwQjTjPTaGhRIwxZRStHAgvyV5eoeHPynTZ+FLevhZk38t/ddxfziJcTJR5tB
         vfbNW9Mq/ejj7O96s6gwP+uSGJvoX6npRr8vYOEeF+UiZrvqXw0pKaoTAGG2WuvfMI+u
         qi+qK7b/nYrX23pQ0q5gTN/y7JZJ49d0NOGRwwI+FEs6/eskVBDX1C38pENHeVegAobv
         skd+9A1OWlfiJnguGtozKP3Ua6D77xCS8jZC44AhWHBis2WZJWnXr4U47N/OXIcYCUGr
         fgcksaVORnBW/S77zK9muRCFM/PP02jugFQ+HrXGLKIgqR+rdY7k7rA+YpKzw3veTRmD
         0CEw==
X-Gm-Message-State: AOJu0YzGFOWGOFAeRmREyjb+Szew6yXkxqcRQm+sjljQbK1IjhuD84nt
	Pne2wOQrqIECtv33bAXfLaLczUZ+MC/PKU59CNGQOHP+64OnjGKgpi6UT0K920dFg/OkGAfgEXG
	1tqXPXVwcCKp6dKAUQrOlhrdu2ZVTobvZL3WngDc=
X-Gm-Gg: Acq92OHaEaPoph/2Tj0MBxQUmwHSj68X5SdP3skgZEyumA2vahWrS7MW7eQhhvei6tQ
	JaTODWbGyGvGf6nac0VH6G5PjBSZcu/vVgkXe77wljBMzJX/xro/zmsigkTlvK7A4SXFDoTv/aW
	UgTDJ/JDGdMwW3xLOjV/nPu1QN8MPFvUQD81Gc/1jbSAwc1OqZPr5WqBUesWzxIxYjQJzL0Hw7R
	YFS6c2cJs6OXBYuDQnl5GobYEzmvNeQDE2FA3weB/DL5BO7xVo0VsGLFfQu1DGzlYticw33EAHD
	t9ctVKMor7NO7eBm2ywGInkCsYlI/6MiMIn1mLps6OtTMECJbc0=
X-Received: by 2002:a05:690c:680d:b0:7db:ba77:899e with SMTP id
 00721157ae682-7ed073f1754mr108786337b3.0.1780840895541; Sun, 07 Jun 2026
 07:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260607131659.29281-4-laoar.shao@gmail.com> <20260607133313.EE8A21F00893@smtp.kernel.org>
In-Reply-To: <20260607133313.EE8A21F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 7 Jun 2026 22:00:58 +0800
X-Gm-Features: AVVi8Cc1Jb25xR84tgMeD3ll20m9cTzarLFALGHcOZ6Z6rB1gi3jfSeZRfbeJl0
Message-ID: <CALOAHbDBVtkTfoK8Sv5mYj-Kq2e9QVe3uKAB-_pjYqb=8HH3Rg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] livepatch: Support scoped atomic replace using replace_set
To: sashiko-reviews@lists.linux.dev
Cc: joe.lawrence@redhat.com, mbenes@suse.cz, jikos@kernel.org, song@kernel.org, 
	jpoimboe@kernel.org, pmladek@suse.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 9:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The newly introduced check in `klp_is_patch_compatible` causes a=
 kernel panic if a livepatch module contains a `klp_func` entry with `old_n=
ame =3D=3D NULL`.
> --
>
> commit ed678e88294b650a730cda1a47351fce99677c1e
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Support scoped atomic replace using replace_set
>
> Convert the replace attribute from a boolean to a u32 to function as a
> "replace set." A newly loaded livepatch will now atomically replace any
> existing patch belonging to the same set.
>
> Link: https://github.com/pmladek/linux/tree/klp-state-transfer-v1-iter12 =
[0]
>
> [ ... ]
> > --- a/kernel/livepatch/state.c
> > +++ b/kernel/livepatch/state.c
> [ ... ]
> > +             /*
> > +              * Refuse loading a livepatch which would want to modify =
a
> > +              * function which is already livepatched with the livepat=
ch
> > +              * with another "replace_set".
> > +              */
> > +             klp_for_each_object_static(patch, obj) {
> > +                     klp_for_each_object(old_patch, old_obj) {
> > +                             if (!!obj->name !=3D !!old_obj->name)
> > +                                     continue;
> > +                             if (obj->name && strcmp(obj->name, old_ob=
j->name))
> > +                                     continue;
> > +                             klp_for_each_func_static(obj, func) {
> > +                                     if (klp_find_func(old_obj, func))
> > +                                             return false;
> > +                             }
> > +                     }
> > +             }
> >       }
>
> [Severity: High]
> Can passing an unvalidated function to klp_find_func() cause a NULL point=
er
> dereference here?
>
> If a new livepatch module is loaded with an improperly initialized klp_fu=
nc
> array (e.g., accidentally missing old_name but providing new_func),
> klp_for_each_func_static() will still process it because structural
> validation in klp_init_patch() hasn't occurred yet at this point in the
> loading process.
>
> When this unvalidated func is passed as the second argument to
> klp_find_func(old_obj, func), the roles inside klp_find_func() are revers=
ed
> from its usual context. The old_func parameter represents the new patch's
> unvalidated function, while the local func iterator represents the
> already-installed patch.
>
> Inside klp_find_func(), the check evaluates:
>
>     if ((func->old_name && strcmp(old_func->old_name, func->old_name) =3D=
=3D 0)
>
> Since the installed patch's func->old_name is guaranteed to be non-NULL,
> strcmp() will be called with old_func->old_name. If old_func->old_name is
> NULL, does this turn what would normally be a graceful -EINVAL module
> rejection into a system crash?

Oops, I missed that. It seems we should better check both func->name
and old_func->name in patch #1.

--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -82,20 +82,22 @@ static bool klp_initialized(void)
        return !!klp_root_kobj;
 }

+/* Check if @func is present in @obj */
 static struct klp_func *klp_find_func(struct klp_object *obj,
-                                     struct klp_func *old_func)
+                                     struct klp_func *func)
 {
-       struct klp_func *func;
+       struct klp_func *obj_func;

-       klp_for_each_func(obj, func) {
+       klp_for_each_func(obj, obj_func) {
                /*
                 * Besides identical old_sympos, also consider old_sympos
                 * of 0 and 1 are identical.
                 */
-               if ((strcmp(old_func->old_name, func->old_name) =3D=3D 0) &=
&
-                   ((old_func->old_sympos =3D=3D func->old_sympos) ||
-                    (old_func->old_sympos =3D=3D 0 && func->old_sympos =3D=
=3D 1) ||
-                    (old_func->old_sympos =3D=3D 1 && func->old_sympos =3D=
=3D 0))) {
+               if ((obj_func->old_name && func->old_name &&
+                    strcmp(obj_func->old_name, func->old_name) =3D=3D 0) &=
&
+                   ((obj_func->old_sympos =3D=3D func->old_sympos) ||
+                    (obj_func->old_sympos =3D=3D 0 && func->old_sympos =3D=
=3D 1) ||
+                    (obj_func->old_sympos =3D=3D 1 && func->old_sympos =3D=
=3D 0))) {
                        return func;
                }
        }

--=20
Regards
Yafang
