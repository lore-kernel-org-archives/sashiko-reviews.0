Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793060806;
	b=HKNhgCFBw0AiG1iI6eS4MQHqWbW3+eHTBWAAAP3Z3vnmNR9rliFw8fap2CNUYp4gq1gy
	 jBXQVTVnY95eXfbnuWUTuWMDAy1HIQxqJQG/6CsFbH3s+D5REcafSmXIEQ8PXIn2rIcBN
	 vBf7NbcOKC8o+LnV89n6qiKOSVJxtEPOJmGr2xnef0TVQJ/zmTjSjKC+eV1BZocwBsDLx
	 puVNKRwbCEzCISeEMiTlM/ujmZKtknhWa64vzi7j+Vf7MvcCiAkNXXKtsyNWxnS6wWXad
	 YLEc4ZCFCfzTAzvbylxmZTD2N3pXSA10ZSsCsm/LH469GSnbIIRUygmeCgZrO9gE6SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
	b=o8DsBO4M7gQW/9GGBN5LPp9VrB/CNMeCZJJ8rWM8UytCHaOziXJRQlJtnacn3PP+epg4
	 o6DxlrNYCwLeJryQRRZGJowH6Pt064nT+7T4RpxIMLX0wOPK/mLZeVLso5I7I8p9Jhxe2
	 fh603pWmqfOCkzgAWVD1vDz0TEjRfx8eIqP5pqZ31nMdqRWWecMLFo+R7AClzQ7gUgAEG
	 WDSFQYj1702eFc3tRWc9uiFZULTeljorhzIfq+csrhDVQI55x3Is1bp4j2PDCJ4Kxr259
	 kItLztAzN7SqvF8tZYP41Jpxaw3CtATsqo2qbBudPZ4BFUcISCvpQV7122tH49UMzhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jas897B/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C885606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 00:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C885606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jas897B/
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6767d92cde6so3411497d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 17:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793060804; cv=none;
        d=google.com; s=arc-20260327;
        b=qxTg4oRWxm0ehGQkOW0SmFnIB9FuoJPzfDoyVfADicNo0Udq5+MXvKlu+o595aShLd
         BJbD40nixgbSBK/LcoE1SZX2LPNOQP4mwdNylZL6Nnj1wne3XP1c5j5HHjV3hh3bog+A
         SwDKKuZ5Dn39pJ9n1XJnZK6FO425U5l2CgGCuK4unvvpCdBhfpGy4E69B3g7K4js28yo
         F6xqpOfa4ulF5ePkToeknKw0GR4hQTPSN2AZSNls+FRCR+ZwM+s97ImkD78+p5gt7fs7
         BP5lrKzCShMC4eGuK2bokAqLt12QOSneSGGMOVNGEakj3ONY/ktWeTjmtNNQzEYUtAaw
         Bmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        fh=CM5CX2EKISlDLjTu9nL2F5h8dKXFkJRcvzvvSHVMPwA=;
        b=a1fZuJHD76LWCWbxSzv3dYymkHoDei8+F0/W8TZQp5L0T+Tg0DzyOi5BgdcJFXKwzH
         lc+hgIbkzwr2C+yH4Wa453aK5VVa2Z+RUpAAYUoCWpmQzoO8fItqtIBlnRvYBRv8Bcik
         MX23mpLgRdrdREwCLgtXAd9FJZux//BQW0aAEchPZy53MsttAF9iaggXS7XawGiVmSNR
         mpT22+iuPt/POjlsgiyxKemLsKMKa50+weG6iAwMvXwnp5NVCbobpXb60WicyUWT65kv
         0djx5OaSx7N7KOiVLxwZJi/I3gFexZqHgpGJtI9ynUHDe+NVPg96oaQIfUJ96MucQxX5
         yNpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060804; x=1793665604; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        b=jas897B/nIIlku/y3mGabvTM1BVaJ5TDC6u6xsK6XP9KoPtxHlnPiVIKQedRxt01Gb
         wIzb3EVroML0tAmcJ5YmyfcREN3oHuKYAVItS3n9WNUHvOy/VrrSxPHDHzEIctxwLYBD
         Tfq1liw88hG7KSiIjMJFNujVEr7hnz/8DV3K2kE1qifmWUImUH3Ak+2+hpfGT/j1V9VA
         6kzIUwrhssWxCN4mlim16cPjvOP/YDCuHYvs0vFvzytipTni3RB//4DvKl6jqUy10j3P
         biHWX544/xJyNEoNA9DmgvmyAWAqnQOWXq8UHY/iNUiCLjgvrsocEZ4FpuGpLeVvEVlE
         G37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060804; x=1793665604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        b=xJ3UxAGphWNaInsO4UG//7xqxNsnl37BPG3tQ+0Xt/3NFwBmvPMyHt0O629BaUYUCJ
         3AeReSH5cBls5sBWcJLNhCkwycxKUdTqi+Rc/TnLaekGDh+mEIaLRl83QKtnjD0HvHBo
         X2/1HvjFCu7IS++avEZzuJRk0DelNwKzv/+9UxB/ErUY2ACy89W0kQTLWaAu1uGh7lzW
         j8tdE0NsV9wBC8uT8Np6cnM2agODt+macG5CEVYQpP3cuvEXCGNhcslz9HH88SiGI6fo
         MVeUIvqBLxLjs1ZKKkQUKUnY9+sDZ1QwTtRmyCPmt6zAa23f3ChdxlbN67L7mJ4UNyb7
         Li+A==
X-Gm-Message-State: AFq9FYKuxy6rw36EODDgj60S1tCOK8aX0xaZlV5JOfqPMqhdf2PIm34M
	GxAyPxZMftPrEDe3Etq9XUdoLUIerR7BCEmG71GfYTV7mUln5YozIlcPVsvLtjbN/FxF6X6Cfu7
	uKNNpgjDFB+aE31UYnCLov1/koPYT/Zbbxu8p
X-Gm-Gg: AYBFou1oVowlJU3We2UT9/fNQwh6wV6E8awsTUSPlFDBMpF8VNaquUl5U7mEFeCH3LL
	hS8ckhlNIs+IeJWp/hipIQ4Eat6VROqEGjZmuKKH9K6mmU02wr5Au1GxgGgbh/FiQQqWRTmfBEg
	gC/85rwD1a1GtezQddc7TGBw6FjhICcSbb/jQji3wa+rOiJGQPBW0suY3zUM9UGpp4XgknY+q3D
	jOnS7/Mp5VrAsbKkp11ivZNsTMelIFUDmWLePRbbw5AVJdEcSRbkdgeGWTsxXOnHaSRpS8N2LHO
	CO/oZ8s67v6HT+YtP35JUKL7jWae6qlg3f1Qo+IA+pVukhYg+qynYLJW5BrR/jmez09RWnnvJ/T
	OnOMgBknQ5JIJBPey5MAq0AkCt84By2fOu2HvorYU1L2uwDjkmDCil9oqN65x59g5TKPrSXq+BA
	MHI8xrgclGEab8krU=
X-Received: by 2002:a05:690e:450e:10b0:677:ca67:98f4 with SMTP id
 956f58d0204a3-67a453de253mr3907194d50.45.1793060804234; Mon, 26 Oct 2026
 17:26:44 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-10-3c8cc5725def@gmail.com> <sashiko-outbox-170703@kernel.org>
In-Reply-To: <sashiko-outbox-170703@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 18:26:18 -0600
X-Gm-Features: AclHuK_jv-lTnu6VYS2062o39f_E507yFRpnLLpthRIG1YaVwpNMuyVZmZdMW28
Message-ID: <CAJfuBxwNEG2ukJbPyVqdu0jKN4_CGh_ZR1pYj1z6AJTErfLakg@mail.gmail.com>
Subject: Re: [PATCH v12 10/40] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES
 and code
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dyndbg: documentation references future struct _ddebug_class_map
> --
>
> commit 4edbf52dcd2e7bd06805f06e89c8d2ce8672c81b
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
>
> This commit removes the unused DD_CLASS_TYPE_DISJOINT_NAMES and
> DD_CLASS_TYPE_LEVEL_NAMES classmap types and their corresponding code.
> It also renames enum class_map_type to enum ddebug_class_map_type.
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index a10adac8e8f00..9607121c3072e 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
>
> [ ... ]
>
> > @@ -119,8 +109,8 @@ struct ddebug_class_param {
> >
> >  /**
> >   * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
> > - * @_var:   a struct ddebug_class_map, passed to module_param_cb
> > - * @_type:  enum class_map_type, chooses bits/verbose, numeric/symboli=
c
> > + * @_var:   a struct _ddebug_class_map, passed to module_param_cb
>
> [Severity: Low]
> This isn't a bug, but does this documentation reference a struct that doe=
sn't
> exist yet?
>
> The comment here refers to struct _ddebug_class_map (with an underscore),
> but the macro DECLARE_DYNDBG_CLASSMAP currently instantiates struct
> ddebug_class_map. Is it intentional to document the future name before th=
e
> actual struct rename occurs in a later patch?

yes, intentional.
using future-name avoids having to fix it later.


>
> > + * @_maptype: enum ddebug_class_map_type, chooses bits/verbose
> >   * @_base:  offset of 1st class-name. splits .class_id space
> >   * @classes: class-names used to control class'd prdbgs
> >   */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D10
