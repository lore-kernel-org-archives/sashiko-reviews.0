Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053538;
	b=iuusyhCPYzPh3qaPxIN49bYzor2QttwPWnNJdTaKMX6xDs45yK2+UNUExho2roCWOjEP
	 Me3Bj5OXYf0vp8LGB8SjmtO5hAm8QtQ4FBSfSm8qHnbjiSxjYvrbcRY0iFZGvve72oOcr
	 02lywOZa3jyB5MwR0SGzMNGbQDKxITMpsgFOgtbMSeJy57rM8o80113VhJKJeBm0EVbmA
	 7KS9jkDwwl1TtLJ0e1dI4O6D754MkF2hWC7gV4UWXMERb6ssBBqukr5Lk3sC48oc2epns
	 Th1qgPyVjOi3GM9rugmMafoPE9Bl8DnZP1pmyoPRuPZAJZh60pG05nnBkupPgSXSZaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
	b=UvYmmtPkDSAQTOkNAUsSA44dJ+dr1h8ncvE+7s2w/pPiKZQGWOeAQq9jhUX1QzVecWUt
	 7USSZNz5JJRzvexoaiOHf0Fitx5Dw9xUndS/0mpfGBJuDXi+Pz4xKrwShMkh3VEvRvZWP
	 ucxyMSWIkVbr3jydijAdGcG57/SxgyMk9fIMmJEc8cZhK+HK0IffRlEnfbflga6K8so7F
	 /RZlv1Ks1P59941i4vneCm7H2NK4v1Vf5U0tTJ06dfOoJ0lnQA+W24yINXZLzPTq+crsH
	 YeauIphrgQkbfy7ELT9eHkktBmMF3lqpkhPDi6tlu31hi3xuEbAKiEcjEjtYoq2dhfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MStiEOGF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD310606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 22:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD310606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MStiEOGF
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-675676afc3cso4167026d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 15:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053537; cv=none;
        d=google.com; s=arc-20260327;
        b=Xi17UGMgy2yQkF2c8YHRad4sVUcQaCJa6Gf3oSLbgWUmUECizA9CkxUhs/hnWDyE83
         rO/762dyJa/TNkMCHRUXBWLniDQoSUM4gRnRhtTGrrogSHFO9MsLM/2Kbj4RW+yHG9iV
         oF9SCLtvr3TBOcqgQ0UOlU4/rBxKjIcwYBJrH1eNW10aKafN/Sh2X2lqHGhIgMSm/GXZ
         fyD9tMMILSGTOlfGlAN3rQhuqrgHVd+MVqvsWJ0SlkUdUZ5L5STdJhzYQItuv/gIrgCn
         YnvR6gEEfOGxB/xpLzL0LTCKJurtQ2wmKn4jKPnVFJS3/M/n8CFRn3fQg4yvIiQOb7K1
         owEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        fh=CM5CX2EKISlDLjTu9nL2F5h8dKXFkJRcvzvvSHVMPwA=;
        b=tDhaWh7RSb4uqSyrRR8FZuqEV0gAzPDr3+LtLk9Dij4rN/Wt2NKr8r4GRd5EC9P4KV
         JE5SWekm/+NjRQJmBUiFA/WbkmJqrXakr63+3RHTIuv0ZDdjJEshWgF+JzCx8xW5syTY
         b7wzta9cMKl6A6aLVgFr7GM57BbnZGj0JSVMkPQZWAGci1rqpyEGHCyuLLPy4YWPVz4U
         dxn59EMzjmdoohjd8GG9tWGzMvwEXqcnYnPpBiY08M7M9zLMhH+PJttsk4zM3MQkhXTx
         DZIxzSZXMrskw9xgMFOZ2d8GFQtdJA4AI5amJ3udoY/jsOQ97MF1a8IAS8wJTRS2IYIL
         uKMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053537; x=1793658337; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        b=MStiEOGFxDBSKWhv1+pKYezHJJyDJ4IfMg4NYDlfI0Ovgy6wbcr1SiaDAU7o+3n8lS
         n396ShbM6QbaceL506hOgjEx6gROH8SYi7v+7dC6EqZTPWu9UMvdEjJ+kTcCkuDw6/XJ
         Xxq4ri3lTfUgriT/tsCfHWxi8mMxE33H4GeH/DS1M8I9sZ9KS7e355Ea24UAFLkfTexl
         oKyUKA7o+R19HOhBtFz116lP8Ok6i4ibdHtvlg4LGpPghki0KgqQ/+v7MtyQud3msfIl
         DOe8c1KXpwWeiowVLBMX7r83zpG86Cisufh1F7x1dR6ito05lj+1wU8coWz2wtpUV1hP
         iaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053537; x=1793658337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        b=c3Rtn96/X4T7MnSj9GbFj85PEv1C5ISXmhe+lr9GCvWzDMIm3uveLL6EKJysGbNvRE
         cdfX3t7cRbJfHmwPx4TE7TqlanL+rP/ZQGG2CGS5PNjYwF96rTYZ1ttQ5LSxFkTlFVO3
         S5VLIJM1fhyrLrUvDgwlC9SAOPRrPCtrZu/GmIJ6wGIK+FGTiocqGuNJoMKq5PZL5dhs
         gL8iMqLhWEE8kbGLLIwZT7aU4dlTsAYXFTrO2TItmyhIaxHXTMbOYpxHzf17JDPLMnvh
         kAdZ+Tmf2E0FZ/2I1GGQ8RnigPVPW/iT1SAru8tocb7MCmpziK2YHTS4/DY6XJxp6DAL
         fraQ==
X-Gm-Message-State: AFq9FYL2ZXCS1DlHIrWqNq4GuIWD8ZuJzF2+VyaR0WjHnihxWzQ8tDyF
	4N87ljnnEHkNGcaMwNemviVB883HAiZ0yEtR/A6Ea0O7DFMYILUZz3OL4kmx70SNJUCOTEojUsb
	+giaAAdXyZ12Dt93ykBYWzgvEdjMuP+dDw5JN
X-Gm-Gg: AYBFou0TSMowF/vsm8LtAamTUQZZrgsf6hisVTc4qNrR+PnuPBOfJu9WGxVTm0KYkj6
	YMI335Nsffdk6AVJB7+Gm3Y70ZpbfYPOSVKDRQdgeyAVblAEmp328LOLHyq7JfR12Q1KecA2Snp
	8wtemcWqMS1ttoGQx59n9WrPN/+QMaFf17beiaJmIpljty9DZTiUomAkspptEhAexSNjpxYGNoj
	rEBYzrNhGvGhADpkOjYlpReNG6T3r7bPCrpKft+KvrNolTmNZ7xaYCC+0mE1O5/ktsK+dVrgFHB
	Ugrdq/AFI+t0hXc1ITWN2TYpTPyFj5egcS+T/rm5ovxSYIoLivGct/53z+cBltRvKkepcHpoSTp
	JJ8GorxlHfNPLW3g3GqGo2YuqXTLA6uF3A1+Bcl/FOO1aBRoE+c4lz6fIO+9z4QVj0Lv31l767A
	jIwSbzzn7uSMvdEYP+DXXLS4+0A+l+vgKAXuSB
X-Received: by 2002:a05:690e:12c6:b0:679:ac3:9752 with SMTP id
 956f58d0204a3-67a4519489cmr5899753d50.13.1793053536512; Mon, 26 Oct 2026
 15:25:36 -0700 (PDT)
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
 <20261012-dd-cmap-part2-clean-v12-32-3c8cc5725def@gmail.com> <sashiko-outbox-170731@kernel.org>
In-Reply-To: <sashiko-outbox-170731@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:25:09 -0600
X-Gm-Features: AclHuK8oPmCxBxu3r6O0jmjf6VGp1ZvogtAuE50408WWPep9paf2BtUZbw8FvSg
Message-ID: <CAJfuBxysCwTo9PZpgvjz+=ciTAAmJtOBAbE55_D_yhk+XuvCFw@mail.gmail.com>
Subject: Re: [PATCH v12 32/40] docs/dyndbg: add classmap info to howto
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

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] docs/dyndbg: incorrect signature for DYNAMIC_DEBUG_CLASSMAP_PARAM
> - [Low] docs/dyndbg: commit message count mismatch for API macros
> --
>
> commit 28be193f6b722396acbf0216c1b36e74ba099d0b
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> docs/dyndbg: add classmap info to howto
>
> Describes the dynamic debug classmaps API and macro usage in the howto
> documentation.
>
> > Describe the 3 API macros providing dynamic_debug's classmaps
> >
> > DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
> > DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
> > DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
> > DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
>
> [Severity: Low]
> This isn't a bug, but the commit message states it will describe 3 API ma=
cros
> while actually listing and describing 4 of them. Should this count be upd=
ated
> to match the list?
>
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index a8962ab22aaf0..f5b1470a4b881 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> [ ... ]
> > +Dynamic Debug Classmap API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this map=
s
> > +classnames (a list of strings) onto class-ids consecutively, starting
> > +at _base.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
> > +call this to refer to the var _DEFINEd elsewhere (and exported).
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
> > +maps/exposes bits 0..N as class-names.
>
> [Severity: Low]
> Does DYNAMIC_DEBUG_CLASSMAP_PARAM only take one argument here?
>
> The kernel macro defined in include/linux/dynamic_debug.h requires three
> arguments: _name, _var, and _flags. Could this discrepancy mislead develo=
pers
> attempting to use the API?
>

fixed in v13

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D32
