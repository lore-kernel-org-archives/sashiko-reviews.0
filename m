Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6C3C278A
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539049; cv=pass; b=h6XSGP1CcJnHF1FQfC+Jhybqn7DB0DdyqXaJzvs8wB/fJ+3Bu5tnqesDXjnv1Ksc5/KYGAlDhWyp5KYf9QAiHBOxkTUpEjR3CtqIOEgfz+OfU6Bf/x8elAcVNUGRy0ff80HaXP/TqA0YRG/hRlQ6uC0d4Cb+ALirtbgOPL+g1bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539049; c=relaxed/simple;
	bh=kguXhAZ9G2VENgBFpRIgWFRZh2YAaMFsHNYSBlo8zTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb3gTeoSNAACLMmHdL9xn7vonwmKkdQ6ZjEaZ/0/p0xffnImT6YcZBCfuGIxSVIVqzZkhrK8nA9kojUP8w/GfhiSb+7aPGyfG4J8ycxx/Qhgv2EIn1/Tsg8DtnR4qqKWfWRUkQEGmqwWxRlT38u8lHTRcwebvVBfmQLqV9OH/PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+RHcawm; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+RHcawm"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664b3831a20so183519d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 12:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783539045; cv=none;
        d=google.com; s=arc-20260327;
        b=ZW8aX9j57ntCT3ZyAqyXxnIMT0iyzIyHAjL9EhQn99zZRFi7t9PKoXnLU9EbMvFCnT
         vc3fMkxaAlkKujEwSh0dmw4TYTAb6vvxm24CwU6IW0CJTOrUeKN59/BKTHgffKrpHC+c
         lXXpy9MA42PaC945gQEqrkG1qKm2sU0m2uIzsgOoEAIrOlgzlcaMDlmGiilMbcxlpXYj
         rz0i3luqnJP4F976Xu9l8/z6U2JGTZU/6SQzeTm8b8o+7t/G6AquetlVU4yu+K74QidD
         MIl3vyIXuUMFdqpOtDG6czNfMR+pxYicDLNUCLMo44BBuhsAUkr2hUjIwBJf0YJqLFPw
         SWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gK/BZ0CSIGck6yi9THWfQV8deFFMWvYWLYGtOVRdINE=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=e+TT27GATQNtpxDkGX44Y9nojjk/8OcpxfzRBbr6l8U1cGYBz/4clTJ5VNrEsjdvGD
         O7u7XLweS6MGCokN2pv7wrgJCWeryoe2NeAtRP8y3ghhSBd9nv48ldyGK5QmGULF7VPC
         nxHRpbDKdqJ3MGrPtOKpiM1j3ikOKBtMiK0WDNIpju+FGHg/jLx4eW47NtfMKEclLpKL
         Shoqxt26adQ0G47agaiaal16BeR6ffwPXLT6iC64QKkFHjuChF8tbyQkAAByyyF91bF8
         ys/pzIUMJj2d+g15Al2l7UUiW0/5TNNF6Dcf8oWEHWQPOuSzMZSnJ1cAaR9H2aSsQXup
         H9Ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783539045; x=1784143845; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gK/BZ0CSIGck6yi9THWfQV8deFFMWvYWLYGtOVRdINE=;
        b=A+RHcawmjMZH7oP3wKraGTMzwVDsi1QVCHBR3zRG1yoPHEAXqMTg4jI+HurFp3ZiGq
         /mx9Br6pxHwvcGAGdYB2f1yVZv2OUy7O35T+CeDQl6RduduJQYe0FLr9v66xJ0BvbW7D
         /4mNyaW/2k79y6j7eUQdhDjXDfl3aG022pJzxPuwQPfjt80qtbq/cUe1oU3Hb0J48nXK
         JKjH89tms+kVejBfjvjKU/8Z8lPkHnzu584MN7Zc4rKiH1iUoMMST22gJA3C5oSixJ98
         HxmIZXYMD6ddN6dED1DzsQyJrnxmw1Ny/ZU+JDVKB3tOPfOL4jbUwupYgFysmqzFRvZ9
         8CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783539045; x=1784143845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gK/BZ0CSIGck6yi9THWfQV8deFFMWvYWLYGtOVRdINE=;
        b=DxTlWtHW8O6AS80wlXNzgI5Pcu2WWA+dN+cGTFVFL6nR1dbIH3rAG/iHXiflEEgULF
         KTnj+7sVHujAT4+LloTSeQ1GnP/aZrdhqM8y2kBOyOLA2M2rT7g7s1CXZ9xSaQEhgZQp
         EvRzl8+onGZTCkD+/+xZ7JpK5PWV0cQ7IUcIwqT9WGKJ9soU2cmqY0h6XaIXF+KwJCT5
         aH+uxNVuShBhZc3PbhdWCqZTxf+m+CdPeQZQtfTJU3sSXSrt6oy1KnUYRxJ9UYTJYZUQ
         6bKNKfkbiWCJdtgKmlqTJ8ixhbndZVaFwcTX45J2wBwBhotIEMLVpArhEJ4/K+ynn4ni
         UG2w==
X-Gm-Message-State: AOJu0Yzfo52u8YuePN4FoXTdJEnxS9oMoKIfhGXtIEqSD61Aj3kWkmec
	a6YYCW8ekIplUNiw4DO2Js8pTdzUPr4nsTbMtUHT04yGNGQMhDgO/TAnakXAUgLVX/WhpyUaxvd
	/ZXZDeq8MPeH8lD9UqVsT/eBVfeie7PZav+Xf
X-Gm-Gg: AfdE7cmXg1LykI+u+pb4p66wc2iLe13Nhk1Bh6xMmos6BJI6XyYajux1ZAHTlAIBEc1
	SaGgJX3dsqf2v8/v2mQYEWl8Mth5kztW886ej4w4AGjg9Oat39HIs/9cjuCAxbIL8qQPmHKVGLH
	V2hV8kdp/LOiMCk4CMQKIu6IRexmjj5UWgpAZrHkDRV0okGtxW/tNGwq3mV8dMsfnyynYthhSQi
	Ib8CMluhV5joEGzMgl6t5Uc25zbT15XoyN7lDXf93qIru50Ntls0ha6YzpkwAUAbrFWwA==
X-Received: by 2002:a53:ac8b:0:b0:660:54e4:5db5 with SMTP id
 956f58d0204a3-6679f1d5e06mr2904765d50.56.1783539045228; Wed, 08 Jul 2026
 12:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
 <20260707-dd-maint-2-v6-10-381f3edb0045@gmail.com> <20260708022424.AC02F1F000E9@smtp.kernel.org>
In-Reply-To: <20260708022424.AC02F1F000E9@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Wed, 8 Jul 2026 13:30:18 -0600
X-Gm-Features: AVVi8Cds7DLaQyUd_VIEnr4Erq4jsgRR4iB7pa01JTKxLMrPiWW5nBrfdkHRCNo
Message-ID: <CAJfuBxxi8k25iU-6VKTTMQmMrFCmjhUq8oV5upkvj=yXdJi-zQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/24] dyndbg: drop NUM_TYPE_ARGS
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly defined macro __DDEBUG_ARRAY_SIZE is unused because the=
 array size calculation is manually open-coded.
> --
>
> --- Patch [10]: [PATCH v6 10/24] dyndbg: drop NUM_TYPE_ARGS ---
> commit 0ca0f4a344ab62c4d4df9c27a60daf65fecad136
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: drop NUM_TYPE_ARGS
>
> This commit removes the NUM_TYPE_ARGS macro and replaces it with an array
> size calculation. The commit message mentions adding a new local macro na=
med
> __DDEBUG_ARRAY_SIZE to handle this without causing include conflicts.
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 9607121c3072e..9ae1accb9bf63 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -8,6 +8,8 @@
> >
> >  #include <linux/build_bug.h>
> >
> > +#define __DDEBUG_ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> > +
>
> [ ... ]
>
> > @@ -122,11 +124,9 @@ struct ddebug_class_param {
> >               .mod_name =3D KBUILD_MODNAME,                            =
 \
> >               .base =3D _base,                                         =
 \
> >               .map_type =3D _maptype,                                  =
 \
> > -             .length =3D NUM_TYPE_ARGS(char*, __VA_ARGS__),           =
 \
> > +             .length =3D (sizeof(_var##_classnames) / sizeof(_var##_cl=
assnames[0])), \
>
> [Severity: Low]
> This isn't a bug, but should this line use the new __DDEBUG_ARRAY_SIZE ma=
cro
> introduced above? The calculation appears to be manually open-coded here,
> leaving the newly defined macro unused.
>

Ack. Fixed locally. Will resend shortly.


> >               .class_names =3D _var##_classnames,                      =
 \
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-dd-maint=
-2-v6-0-381f3edb0045@gmail.com?part=3D10
