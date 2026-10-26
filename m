Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053681;
	b=okC7HNBfrxW1tVqkWr5gsLKoaebcfuKeg7P3flBayc1tJX3+2pSBncZdV5vgMumvKjrb
	 LikY8yrH+3rgPVXykPk2wKTVrUEQpJd77ZgZiC7TeKtuRjgvPFOBZHS8i4MU4TZTLk5OU
	 ereNw54dDR4w/ZVVdSo2S9nDSoulzvBbgrYoPCmflGVfG6ImbNjGkh170uN/oX35RWTUh
	 3Bz8Qz2Qt48CWGyVjNSlJAXSsk8LdIhPEg4ZziOX9Kq3IBWYayt9mGwokPOskmswfqTd9
	 9POk27KE/i+k6NASjGvzUVDcYF5L8AP6BjpK1sOX2gSSICNxSdjXnFwHLP1QNqXNwDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
	b=qtccVL3RZ/luoPcbOihGYmhm8fzuQ4D4Eq2QIcHabxQEokRfT1gi9gNhG1kkWauAkP6E
	 SoB6OYNSjYVGa0im3Nu1rHDeE0BxlWH7r9qDotzw6szR0IvFMXtPDeQ4xM1qJP2zRcpJh
	 YxnT7j6DtV5xR8sjr8uO35iNeYVdjGvV3m2ywtyf3xZqXp+lSsEaqkt6lwD7vSmGxktVT
	 nOZBsFSHx+6kuPPnAY3sWk0dIaf41UdE0fMTZbLa664w5FMcVW3uyk6iSzMrjEuzqql9N
	 ZyZAg/BSibUP9URBw07jF2TR065UkDownsgDyP7OJiwQDLR2JZFibJm/ZdgKHNiSxfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MZlmsRva;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF3606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 22:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MZlmsRva
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b05bf699easo32773507b3.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 15:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053679; cv=none;
        d=google.com; s=arc-20260327;
        b=JWegT3EZmBjZmf83sjeK2mUvthSAXKBVz2hdCsXp55P0RXulHyapUWZWc9q3Kas6zR
         8uZQWFky9BFFjgaNebArzt/o8uNj+rznMOZf48BEPmKgPKTnHKKILNaRZ+rYlCCjY67V
         y1Bi42e2Szb4crYmSWZMZCPasdLI2dwyBduK8XkrU0DQl0mKU/neRrlR3l8klAsEnUqo
         klwP9D6IGCHGYX0SQEiGijRbkpSdrPO0Nq/eS1r6RS86zJPgL8J7jOnixbKyrVLnDXzi
         3Hdj1pJ6pa7HvBqLSVEmxYA98Wjbg3Hx0qIyxV8hp5Zdb3TcwDM+wX41S5E2jeqGjSqo
         2QjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        fh=8C0Lm4TMaVbKv0r+2pEeIA4v35hviqcOmjoKQSS2WNA=;
        b=KAD9xMGwukxYa58d/W4Q+Ku+cdpw8dNTUcC9jvhw4BBx9W9Kcitr9f7UhAg6ykI5pE
         7/Yy8f9y2ZCKs66OmMcFfn894CMHeDAVBTTrh16+4zFou+xybiTjC4oqYir0u0KOVErz
         lRTaTOm4/caiWjeClciI1sTNte+KGVRDaQBlLciXBvtxG7HyEoQ+jZ5b0+RR0gjM9I4w
         BKrm6tIWv/vL3mNI4mbi8Upw/7dtNPo2jK9faQFzfbfPEIdl0kSadoVULVbSo5zG6Kvk
         o6Ah8f0eSG0uLEBkdag9VXnyo389BOx8iRWYidVryPGm7v6vKxRsLqwZyByEaBuSnzv7
         0Paw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053679; x=1793658479; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        b=MZlmsRvaFNFaR3aVOEXT7nPAL6WfiG0Afd6xa01gKc5rKzF2+Q6pY3Kqz1nQeMYhmm
         ffgmmxe/BmdAL6Kw/3++p/w+MnZghJbRo4MtU0JB+sE9/0l6jg1nlRBxWUguqf+bnoBP
         1qGlvNzogzGqkNP5ZM3KiMWOmb5DmCflWERh6RKottvgy8/HRU5BktS+oWOaNR6w3kGz
         +9B+/GtcbRVTmoYdyg6i9r/x80RVGZ36Ic1V7duKfXKdz6rtLj5/C/f4YoPODuqoPs0P
         Zt5py8cqWqyC3cR9tGR68X6b/Nfj0THNlnEJ3yPE0fsPe/UZH1zLzt56cXtUkOQmPYWZ
         SjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053679; x=1793658479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        b=0XkswhsJGZ/rfXSKgQA077bSYBRcxO2N2LyIqxXSUMb+YtVfHiZkoboeFJ1dptc0PI
         yzPEkBlWBltjyazcXpm+Z+AQLNge4LxpfWKU1X0rhtjAlFNww5AVGROVAhwMLO/+BOyv
         jv6duTPLhjeuVh2iqD+novbywX4qIHh1qSj8j+CGpY/G8TlbILP40GhiUakom0dZVx82
         QwA2wDgatgX802veItsF4uyMJghgJb0m80ZmfPPsOn6RSm3em36SO3m51iWlDMZXul8R
         b2PnO3KRIS5eyyRn7yIkHwzfhoqZfZy7dqAhhjgsS7MEYPuRF0VBVtlwCdeJ3h4ktQ7+
         GjUg==
X-Gm-Message-State: AFq9FYLDQ4HhPiXWJytOv0kAzSP+6SxAo7efqvmbiXa0i0Zn9+t3Up+j
	MGETGG5R0Z9p2pPyl9eCGlZFSly7cYmKPEwaoqpdKdfjXKScAMuDWPZfygMQRCr48ON0QjcQ0Gh
	IyPJ/FGczTaKKdzPtl4YMm0a892OaYz1Il0Zd
X-Gm-Gg: AYBFou1KRB7ib252ivs6GXXPJSaDG36Kv0rle0yXcRCwGqJ3tgVDMKj4LtyAUPkwVCB
	fsPqVHMA6yt9qnuHzCJVBcJkLEcG0rtQEBXYut7Gz4gznS0Z3FRgNM3rYioT+pGNEJ9w3LhUz92
	DpaRf7g/KnSzaEh1rM9BNvhs8X7ZKb7LKV7xW0GdH8y3pw6//GMopK9dRDTKdP/dS0T9v4H4Qyz
	R8dWJ9z/eirCN2N48Ekv0p6GQTyaqCB2wyE/b8otf2kPan2YMyjR+nK/47KBSm/Nzk4dz5a8hQY
	fAQ3gopANX9SsqlM/z3suBBaMGYndOKlxpLAWsm4f3T34edN+6mvgwHg+DsifBwVQY/M/a6ZwhH
	7ZLOK5C30TOUC2OqwJZjwaiWb07/CkfN0DeuLE7oQOl0x+9ApiFPPqvcZQoYLCihUIQsXdJf8Vw
	XSDn0+84s8tC9Xqu8=
X-Received: by 2002:a05:690e:1548:20b0:679:afc3:b990 with SMTP id
 956f58d0204a3-67a455751ddmr3346085d50.152.1793053679299; Mon, 26 Oct 2026
 15:27:59 -0700 (PDT)
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
 <20261012-dd-cmap-part2-clean-v12-23-3c8cc5725def@gmail.com> <sashiko-outbox-170722@kernel.org>
In-Reply-To: <sashiko-outbox-170722@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:27:33 -0600
X-Gm-Features: AclHuK-iFp5xqB6d-LRnKDMtWnZXSOdE3cMaERLXso3BmPK_qGi1CmXSW6vaeP8
Message-ID: <CAJfuBxw9uTaqwRudCe7r8_G3-jh+VvRoEzoY-OcZXC=WpctzOA@mail.gmail.com>
Subject: Re: [PATCH v12 23/40] selftests/dyndbg: Enable FT_classmap_inheritance
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
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests: regex flaw silently excludes submodule from test as=
sertions
> --
>
> commit d0e8e8cb940b9b06248942fb57c7a41c66ad8636
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> selftests/dyndbg: Enable FT_classmap_inheritance
>
> Exercise classmap state inheritance between supermod and submod, verifyin=
g
> that class settings and controlling parameter states propagate from paren=
t
> classmap definitions to dependent class users upon module load and during
> runtime reconfiguration.
>
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > index c279c795867b6..d759243a4cbe7 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> [ ... ]
> > @@ -291,6 +292,78 @@ function FT_basic_queries {
> >      ddcmd "file $f =3D_" "$f"
> >  }
> >
> > +function FT_classmap_inheritance {
> [ ... ]
> > +    # Real-time mathematical proof that load-time (modprobe) parameter=
 parsing
> > +    # and runtime (sysfs write) parameter configurations are perfectly=
 equivalent!
> > +    local hash_modprobe=3D$(slice_and_hash_ddctrl '\[test_dynamic_debu=
g*\]')
>
> [Severity: Medium]
> Does this regex fail to match the sub-module as intended?
>
> Looking at FT_classmap_inheritance(), it calls slice_and_hash_ddctrl() wh=
ich
> uses grep to filter output. In POSIX Basic Regular Expressions (BRE), the=
 *
> quantifier matches zero or more occurrences of the preceding character (g=
).
>
> This means the regex matches [test_dynamic_debug] but demands that the
> bracket ] immediately follows the g's. It completely fails to match
> [test_dynamic_debug_submod], silently excluding the sub-module from the
> load-time test assertions.
>

fixed in v13

> > +
> > +    # Fresh load with default parameters, then configure them dynamica=
lly at runtime
> > +    ifrmmod test_dynamic_debug_submod
> > +    ifrmmod test_dynamic_debug
> > +    my_modprobe test_dynamic_debug
> > +    my_modprobe test_dynamic_debug_submod
> > +    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_b=
its
> > +    echo 5 > /sys/module/test_dynamic_debug/parameters/p_level_num
> > +
> > +    local hash_sysfs=3D$(slice_and_hash_ddctrl '\[test_dynamic_debug*\=
]')
>
> [Severity: Medium]
> Similar to the issue above, does this regex fail to capture the runtime
> state of the sub-module?
>
> This allows the equivalence check between hash_modprobe and hash_sysfs
> to pass without actually verifying the sub-module inheritance behavior.

yes, now fixed

>
> > +    if [ "$hash_modprobe" !=3D "$hash_sysfs" ]; then
> > +        echo -e "${RED}: Load-time vs runtime parameter equivalence ch=
eck failed!${NC}"
> > +        exit $ksft_fail
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D23
