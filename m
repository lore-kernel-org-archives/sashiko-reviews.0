Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053489;
	b=0pLqgMWyj/9kziTU3QJ2ceHm6mqWN9f69jxMjHUW1Y3yPTeKLmN5G1WsrvQ+psRjpngV
	 Lk/BeWDWmfjLeRWsZ7BNxKny01D+gxQzZqCmRFtGy9LGPO8s3zGPyvDaNC1bxFVNN7bCp
	 bNXMYbxSiBE0LKo00WlmUzsPRB4CzCFPyHZH/34a4L6OZTYf3hq42tLf03HGTWZtNovjF
	 pBREYdcPIygzWADP7J8oAzpsO3NHlDOoVXWWmgwCtlvaSkdmUSKAWz72cSqmrW+pGrrwi
	 82ugp+jOL8Lw5U6Xrfn2e6o4phFHk3Ac40kjJkvw9mvKHcJ9/O8hu5skNBZA3XwzmNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
	b=SAv1INlcRRArciQ4/BQXr7seyJJ7lNAYlMEIOPeRYxXQiJljDCv36qnaRu8X6fJe95hb
	 9k8yBBUjvwNe3kgHfLtimsg8UfubdzXNUv1YXs0Cd4PeCN6CmKo7eM+fIwzVhhvPty7Mh
	 SqtkpmjBFKDC733vjPfhhABH0odSN2la56reYHo+QKbexN6kwyL+b0zdQA8lxocCAnqPd
	 B9hgVYCm7qYZFGDjPZ6ZN8f2E3U1x3Nybo7nzAxK2zvYOjb/3T3KZqdzcTX2KwJB7M8VR
	 Z++LQKdKCQ75UGHQy9AX1LgtcRfWZmC97q9Ax7tfMtLiXVCrVCpjuDEOQmhZ+1ebX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NOdbpiNj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4383606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 22:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4383606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NOdbpiNj
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67992884b02so2305509d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 15:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053488; cv=none;
        d=google.com; s=arc-20260327;
        b=Byry4Nbo96PV5T6jlHdw9LuyyDNk6MUD9nhePrNrJZHieBnYLRS5uTHUUVdyF5qtkE
         NNuCm6p7WIe+sEnP96jEVh+dX8LRdjyKHjkGyH7laL9hbkzATHX8q2L0Y+fvkgbxwtF2
         Vu4bxidB0pqVe5kH/AaLMrHLdZOqTwIXAh3L5oYd4xAB8PYtSSB5jqPYDjeoj+AAdfM3
         y89XgOYLaYTP0k3TRFMaDuDVDroZLr+XnBix1DHpqNIcyU5O+Zlkfz317BkOEE/9I7pH
         ue0Bt8aHNnivA7qLvZgufcOxDlWpbBYhS8B7A7t3g5U+R1oZ3TqBbWB2eaOx0WQC6dwY
         aQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        fh=8C0Lm4TMaVbKv0r+2pEeIA4v35hviqcOmjoKQSS2WNA=;
        b=ejxiQfiQ/dkIOhi3JqBi6bN1f4HLhuCtBh8Pkn/o2S2SfwH+ToswwgCYTf02v7xhjx
         HULBnLlpq8gPQJ/RNTfAhdshne1VWV6cqmovh1OCNSHSOQUpXeN+xvArGSwrzagFupUr
         MFg019VP3TAHNNu5stIEftDVEGxmQqdYrkxj0McMEKf6yD19gSXcS3k+p2hxpJljKWBW
         cF3P8sRhBP3TqOqNhHtUqv2EhptRuD5Yzvw4Z/KdUgEmKV7Ch1+K/jeZZloJioKpQunv
         YykgfyGurBobgRKKHjqXCHudo1cQYgmNbFyJTc5FLp+rCt3lBrHQtiLtvFxtN9hSSD9m
         XbPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053488; x=1793658288; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        b=NOdbpiNj9IMzA1r0jOXIAhUUzYqsDgOO88bLbRTtq8DUKb7PmV8d2d8mlHP9RqyYMh
         AQMi98Tw6LHh8w/drItgSwdRsfQAXJJiYPJjHsEWjVo6gKFlf2bsXYiPa9M8WKFr6xT2
         irJg45WAQpco8XNHGbQfXIvkjHzHsgLtJ27fOkSxb7VOn30mweaoMlNAnxnHaQntUtQX
         HXSp4Hw5/8pTavmF9wWx6g85A3eQC5wgPlhj5D6aKiGv0bxmCYS9IRSw2ai4nQvNJYh3
         gd7NfOg5vds54mRGZ9d1/VlHGPNlPlxJk070gljqEqzbIzfmb//iXvfYrGwRLBw8mjwk
         UFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053488; x=1793658288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        b=a26Q7arwSYz1nFStqB3uR2TSYU9Kcc97dLM1L+2XawWU3m5ZuZZ5nqcHR0LGbXB2In
         lQRNLPdnmZUOJP4vMahLroMwQUN3jJYqkquzqYPfIOS/gJ21cVMOxE37jguzyTdLBeNT
         nxE1F0z8Y165Ug/o0IHV5EkHUKmro26DIFz4OloB7DvCQ776XSJPTab0eeEffmWUU/S7
         0QCFAjVfh49NY71Q9E9pVj/jqfuweWvCjnUbR97AvpGoG4K8Xbwi60YP7wLIz2Swsu4I
         eCV2zH5znCEP/b1fjpJAFmrF2cKexDYQV9t1JgorGLFpFQuk0IUDyITZWnxzkyUGO79T
         xM9Q==
X-Gm-Message-State: AFq9FYLLLLuouCiX6QOrrq6lcsarS6DHAiltRYvkU9amXVyflVQsmLXJ
	6YjuX5OoMn9Daut7r/yjWDL5G0JUwvIok6E1vBuiMxcxIdkT5Hs9T75M98p3VcQrMaJfDfC3KhD
	JqP8VVb/dMZCXwQj3qSEgem5HGL4D5KYJmA==
X-Gm-Gg: AYBFou08zGbtTy6ZsjTBSbB2MmLm5Nw0iI0qnZafg+X0OQrF3I/3HdkL6NyVllnWYl2
	PPmRN42ok4hGsw5mhlqhe5sl8RIE/D14VhPd8rviR4KFPizFNh/7XoOquD/TvMUebvLH53zFadO
	45/yMglVzADy4jK9TIks7639WMlTQhz0N4s/kJjPh9WxgMqIyWpJ6jqFKi75XNjj3VLELqEKNoM
	HQRzTUNFjbOdvwzxivm0krA3t6FCrE2/MyLSmqKhe48J8xH/Miv5bWbk2NC+sny+E6t66XvrWZe
	haidK+r8emEMdN1tI86zH0X6R00dxuBdM47JamYhhrP9mLNLnwmduSGQRcZQu04YsObUdXz4IxD
	cZg5t9dhynFtCY1Ma25xNzTUfNgI0GI3SnYaGWTQeAC8EpbQjCc9MYTt4BD4/RK9XmR3Fww0uSt
	Bk1UxB79YxZtazD5qtzbVIZSRqf8KJf8YnBWsN
X-Received: by 2002:a05:690e:dc5:b0:677:cbe8:4fce with SMTP id
 956f58d0204a3-67a45500fcemr5471600d50.79.1793053487746; Mon, 26 Oct 2026
 15:24:47 -0700 (PDT)
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
 <20261012-dd-cmap-part2-clean-v12-1-3c8cc5725def@gmail.com> <sashiko-outbox-170708@kernel.org>
In-Reply-To: <sashiko-outbox-170708@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:24:20 -0600
X-Gm-Features: AclHuK8NnuLVLON4lfx7cNxK26K-bWlrdBylLKsqpFu-v1Gz5G-bY8ivxELQPKw
Message-ID: <CAJfuBxzw4jWufuQhgstnYFtkC=+VyV9nNLi9R3xTuJEVsWbuNQ@mail.gmail.com>
Subject: Re: [PATCH v12 01/40] selftests/dyndbg: Add kselftest script to
 verify dynamic-debug
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

On Tue, Oct 13, 2026 at 8:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] selftests: test flakiness from unfiltered dmesg temporal slici=
ng
> - [Medium] selftests: test failure coupled to unrelated kernel/params.c p=
r_debug churn
> --
>
> commit 56bb89808ed29ee403a2b674106329de27cb9b06
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> selftests/dyndbg: Add kselftest script to verify dynamic-debug
>
> This commit introduces a dynamic-debug selftest script and a reusable hel=
per
> library for baseline-change-verify testing. It uses spatial control-file
> slicing and temporal syslog slicing to verify valid syntax, error handlin=
g,
> and basic queries against the built-in kernel/params.c file.
>
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > new file mode 100755
> > index 0000000000000..c1475c7555429
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
>
> [ ... ]
>
> > +function FT_basic_queries {
> > +    v_echo "${GREEN}# BASIC_TESTS ${NC}"
> > +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > +     echo "SKIP - test requires dynamic_debug built into kernel"
> > +     return
> > +    fi
> > +    local f=3D'kernel/params.c'
> > +    ddcmd =3D_ # zero everything
> > +
> > +    ddcmd "file $f +mf" "$f"
>
> [Severity: Medium]
> By strictly validating the exact state of kernel/params.c and hashing the
> normalized text, won't this test break if an unrelated upstream commit
> legitimately adds or removes a pr_debug() in kernel/params.c? Does this
> inadvertently couple the selftest to unrelated core kernel changes?
>

Yes, there is a certain amount of dependency / brittleness
IF kernel/params.c is changed in certain ways.

That said
1. kernel/params.c is one of the most stable / unchanging parts of the kern=
el
2. tests that change flags and verify the changes are needed for
adequate coverage
3. tests against builtin pr_debugs work even when test-modules are not buil=
t
4. line numbers are excluded from the verification, eliminating that
source of breakage




> > +    ddcmd "file $f +l"  "$f"
> > +    ddcmd "file $f -m"  "$f"
> > +    ddcmd "file $f =3D_"  "$f"
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/dynamic_debug/syslog_hash_validati=
on.sh b/tools/testing/selftests/dynamic_debug/syslog_hash_validation.sh
> > new file mode 100644
> > index 0000000000000..8c6e91f5d9c27
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/syslog_hash_validation.sh
>
> [ ... ]
>
> > +function verify_dmesg_slice {
> > +    # Slices dmesg, computes its hash, and verifies it against the dat=
abase.
> > +    # $1 - unique test key (e.g. normal_513)
> > +    # $2 - optional start marker (defaults to ${APP}_START_${label})
> > +    # $3 - optional end marker (defaults to ${APP}_END_${label})
> > +
> > +    local label=3D"$1"
> > +    local app=3D"${APP:-DYNDBG}"
> > +    local start_marker=3D"${2:-${app}_START_${label}_$$}"
> > +    local end_marker=3D"${3:-${app}_END_${label}_$$}"
> > +
> > +    # 1. Capture the log slice (exactly once!)
> > +    local log_slice=3D$(dmesg | sed -n "/$start_marker/,/$end_marker/p=
" | \
> > +     grep -E -v "$start_marker|$end_marker" | \
> > +        sed -E -e 's/^(\[[^]]*\][[:space:]]*)+//' )
>
> [Severity: Medium]
> Since verify_dmesg_slice captures all kernel logs between test markers an=
d
> hashes the entire block without filtering for test-specific messages, cou=
ld
> concurrent unrelated kernel subsystems (like networking or RCU) emit prin=
tk
> logs that alter the MD5 hash and cause false positive test failures?
>

All my testing has been done on VMs, they are well isolated from
unrelated subsystems.
ISTM most CI-CD testing is done that way.
If needed, we could easily add grep filtering later to select only
relevant messages,
but it adds its own maintenance burden; it doesn't seem like a blocker to m=
e.

> > +
> > +    # 2. Compute its fingerprint
> > +    local fingerprint=3D$(echo "$log_slice" | tr -d '\r' | md5sum | cu=
t -d' ' -f1)
> > +
> > +    # 3. Verify
> > +    verify_fingerprint "$label" "$fingerprint" "Dmesg Log" "$log_slice=
"
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D1
