Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857F2FD696
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 23:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897113; cv=pass; b=mBbM42XbP5z1iXDY+tB2GVYCLmsL3MuxbkIxDlQHtL5rpxF3ftjIhXrYUjaaQTyga4AYudlTcRGM6mM6o4r9daMkiaZSDLdMc8BEH6tnB/W12yakVTGRtf+LojY/yEoRLrUlhyFddgDJMDhu/SIQhc3+e3AuXMFdrV3wMAzUYTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897113; c=relaxed/simple;
	bh=w5DNQYe8bIFaazPMMSIcL7oDJikhQaw0m6GW64PTLGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RseSaYUWaHBSyroG3UjFWCujxaJhzMZCYWWHZ+dilJTRhvqaZAIaMeUeDfQTtCtj8GylXsXqeWzIhtHUzGch84CMSFjC9Zih6PxODeyOSOGLQaGfOuPZEqLObN5R0sCa5EP+/O14Tw7RVgCsBr9SIqjZ05jSPoU6EjWTO3z/rpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrqIfi/1; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrqIfi/1"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so3263032d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 16:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790897110; cv=none;
        d=google.com; s=arc-20260327;
        b=KOcYRwQn8nlE8OhKijCqmMbx7xuEGr8yTCaDLUaHChc2+EUeKRWxyhnVd4k3hPNB0M
         f8wDfOoGMEUCHVShAQJlP6t8RTSpETvEhzDf8o8Xq49JMN2ztm902yKt9L1x/B+sdCGd
         u5vY+mETa7F4uKAs2merSZrJ8wQ0IU8nhsmZcUBzO9H8b2S+CdlFZFTcSSpA3FkUZBoD
         eXuBtpIv4ETecQ+q/zDGYc/Z70d9h3qb5G/xkRP7XPN/nFXXuV/HtAor75e5g8sv1DGV
         6fWiv8swpRbVBMZ/G0pkW9qy3YPd7LOvziXzADg5/WQOR75a8WL6jDsNeb+XlmA1FIb3
         lPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z7GpKJHYk0xmN9tpUhQVKePKwe5CIuT1Vrxc26cesaY=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=HeNbea1+N+TGYecZ5A0csgOO6upKX5Omx1cgAnxSSWxids9dGxaX7xHo/VzmBp0BUV
         egjbD0KThXVj/Fk6zf8rdyYiiLrlMd33jMzdX/aDklHjWrA/kJaOVqBoXLAP+tu/+TBy
         /mWlFR74dWvpOnya+TP9DCsFzDG/Xa6/N5nGBRgm6AkkNEDXgoSvHFYsqXPmR61PqDNj
         mk7KfhHqJ722gGKnzWuwRQvkQfL2bNNoTgF8Wr59/Pck6PlwIiFV/RiFwkwdwLJVcaxo
         sRMS6sNP333yt0jmDZkrrQwutqucEeSDWpFY8LABlSvMhtd3saCu3UXlqSUb9eoyLGr4
         njVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790897110; x=1791501910; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7GpKJHYk0xmN9tpUhQVKePKwe5CIuT1Vrxc26cesaY=;
        b=VrqIfi/1Xa+LxPbYzzJNb81F7xsQwjDHEQhiD75AdlQIUt+lCyNTOq+j9ribciTUXm
         UvlqCJhM0mu9/3Wt1UOLsVIefA27kE4rK4VK4HF3gV/2QzzJ3JfO76sUYMZEJqr7wOmF
         BTVlp9g/TWzYLtlrN54rJ+rjAA9Ez/PXZluh4d2ZVqDb6xJSPJQ+wqXRV6peBXyXyzXP
         kQjVJRq/ZCIIeeVsvyNHjLdikjPM/L62WMhUb6IJVcGPwFjEv+LNLly6tXgamoCWEPN8
         MUfxyS39H6aPqVnM7r1FYboar1crumTvHR2jvuaxAdTR6KBH8OboNwLPM0n38Kk94pDi
         Q61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897110; x=1791501910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7GpKJHYk0xmN9tpUhQVKePKwe5CIuT1Vrxc26cesaY=;
        b=LRR2p2G8s8P8O3WP7RRnPkQt1S+8Of/QxnT2HT4IojS9Qfm66bm6hygg0yGn7qM0bl
         og5ppwsvtja+GzIUi2QO0Uxklf6UbnZ/UdQN0i8SuvW9tCdacwDsE3cAom0jmDo0uE+T
         mGLIKMRZfLCm0Ru0rDUEDiaknlc6VwGFS2CjEzy9+Ar4FPSoQCzytPJMneE2Y6aa1h0y
         qNYOCuqKqjq9hsAJAM/zyay2O1y08Rk6xvSpyE0TDpYbO4AgExkTcfwvYQzJeak4ntia
         zcIk0fsrn05b4zp9feKHItPx3dQIh0n7pGbrmazqie0w48EbCDKUuq5IYVNynUlqxRPJ
         GrOQ==
X-Gm-Message-State: AFq9FYJhyMBBQYLY8fRQD/oeurB1tsjPUOio4iypwwkoChWZqss5Sbgv
	zORnju0sM0ngyuuXrkg24bla2oHuUMpr5uskxUdq/wBCm4PpGJ+F4bq7Czyw4qsi/o+2rdl8LyI
	mQTGPm+6TkJo77e10+YYYrraiGEuDfgm5IDSB
X-Gm-Gg: AYBFou33PlosNKvzTeKOlYzVplTHAMPNxMhW81G20PoUdd4TIf9tj8So3G1FH4s1VGr
	+FVa2zg1+KlESoVAFHOAJiQxO1foZy/1FO2q6+OcondUPGqX5VZr+6fJdCP0/CemPoLo2SVbN7Q
	pRLyYcF1hbyyntugm7lkOilkHKYvJqWpXKLTobTfpR8lYi/CBHHbqi2WHy4yI/uGFKlALQspFd7
	+3P4GVQq+Vw3dp73kxU1kEJamUqtBTzoba/wiO08iOm8erYHSB+ujakyCDYMrEIacihctnfJx8L
	VgslfD2AJpkvh3AL74UD/1tFrIM/WNTi1pM2WymmdBEmeqIxVpaq1enUUygn3Gx6FqELQa1f2vw
	/hExoN9TN4DSg5SWcXcF9uaOLA3Mu3ERz1g==
X-Received: by 2002:a05:690e:80c:20b0:674:1e39:446 with SMTP id
 956f58d0204a3-677abff80d8mr347805d50.39.1790897110259; Thu, 01 Oct 2026
 16:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-24-9b6c217fdf2f@gmail.com> <20260923224520.0FC9A1F000FF@smtp.kernel.org>
In-Reply-To: <20260923224520.0FC9A1F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 17:24:44 -0600
X-Gm-Features: AclHuK8BjtsIPOJOBV_6x7QlYWrq8f66IubOXehmbQGa_J9fPwf-nlNjvUt1OkA
Message-ID: <CAJfuBxyg=oJ59-2o8b9CGKeQvaYbTM6HXj6+C-zd+PmpKBmu8w@mail.gmail.com>
Subject: Re: [PATCH v11 24/38] selftests/dyndbg: Enable FT_classmap_inheritance
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] selftests: classmap inheritance hash check excludes submod
> - [Low] selftests: undocumented uncommenting of grammar testcase
> --
>
> commit 7d522a72bd526c1e41ef1a1e604e466e1e729843
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> selftests/dyndbg: Enable FT_classmap_inheritance
>
> Exercise classmap state inheritance between supermod and submod,
> verifying that class settings and controlling parameter states propagate
> from parent classmap definitions to dependent class users upon module
> load and during runtime reconfiguration.
>
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > index c279c795867b6..5a805cb30e6cd 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> [ ... ]
> > @@ -189,7 +190,7 @@ function FT_grammar_ok {
> >
> >      # use 4 keywords (max 9 words inc flags)
> >      ddcmd "module foo file bar.c func buz class D2_CORE +_"  # 4 keywo=
rds
> > -    #ddcmd "module foo file bar.c func buz class D2 line 100 +_" # 5 k=
eywords
> > +    ddcmd "module foo file bar.c func buz class D2 line 100 +_" # 5 ke=
ywords
>
> [Severity: Low]
> Was this undocumented uncommenting of a grammar testcase intentional?
>
> It modifies the behavior of an existing, separate test in FT_grammar_ok w=
ithout
> documenting it in the commit message.
>
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
g\]')
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
> > +    local hash_sysfs=3D$(slice_and_hash_ddctrl '\[test_dynamic_debug\]=
')
>
> [Severity: Medium]
> Does this classmap inheritance hash check exclude the submodule?
>
> Because of the strict regex using escaped brackets, the grep strictly mat=
ches
> the parent module's section and filters out all [test_dynamic_debug_submo=
d]
> lines.
>
> Consequently, the hash equivalence check only proves the parent module re=
sponds
> correctly, ignoring the dependent submodule whose inheritance is supposed=
ly
> being tested in FT_classmap_inheritance.
>

The test does not ignore the submodule; earlier steps in
FT_classmap_inheritance explicitly verify submodule inheritance across
both modules via verify_control_slice 'test_dynamic_debug' against
the golden records database, and step 6 validates runtime logging.

However, broadening the step 5 modprobe-vs-sysfs equivalence check
to verify both modules simultaneously is a good improvement. For v12,
I've updated the pattern to '\[test_dynamic_debug*\]', proving that
both supermod and submod callsites match identically across load-time
and runtime parameter configuration.


> > +    if [ "$hash_modprobe" !=3D "$hash_sysfs" ]; then
> > +        echo -e "${RED}: Load-time vs runtime parameter equivalence ch=
eck failed!${NC}"
> > +        exit $ksft_fail
> > +    else
> > +        v_echo "${GREEN}: Proven: parameter load-time (modprobe) " \
> > +            "and runtime (sysfs write) are equivalent!${NC}"
> > +    fi
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D24
