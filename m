Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE737BE63
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789925153; cv=pass; b=G/pvkBXWz6OpyxO9hA4eVk/f7UguFPlq2sJA+JbTGP7QbY4/jRgGeyHX0+YEmVumVQ6tIOYJAGaMAbWj5L9UerrRXV/bHQeGPhxwEOwxh40Ba8AjX5+XGX5qsuy8EJquxeZjCbKzAmlNUKnm3u1RXmSzA5k9vmiOkaFiMf/CeoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789925153; c=relaxed/simple;
	bh=UfUPUMvGuoO9T8NbtoMUnIBUq7sjsNXSSIXwRVTqF64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ResmwHChoIzYfecNX82tua7VSTtz6V5ZrPuNm/wiYaZe/DQKjRqZvgJX78ii5Gxme2TBTEFaQBFaPYy5pMvtLSo9hS6E1sXKCqLaezs/qzrrp847tRR0DbXZrmyzFOysEuVfhkxaGymmcn+O6+6fJjgZWiYWrbeTZ3K6ePWgNlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3mFDHeL; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3mFDHeL"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1860328d50.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 10:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789925151; cv=none;
        d=google.com; s=arc-20260327;
        b=aTZdFqb03ms48GH11zCkPSTx/KN6lioLIqxG9VASkvoB48aqL25SGdd0n1M6UJv7NK
         s4lCpvDwsdzoDTbHlpagdZ6ZP1/n4MuNypiBog/FMoruw5KKyq+66HrRhb/g6M3glzBT
         BtQhkInOFf3WExY4DjP3xoqDkYzVXZTLkb06aAy44GvBgOKy9yTUJ+l+XFOHNHiRFYso
         i3S40ER2nuJVxBOmNxQRxFafc48kUe7CWl9WiZT3rS51F6B1o2UCtpNnM1teHorSwCkg
         vhe+Cc12WADeVlvsUXbrtxmiAIW/v0lzGVp8Zkr2k3vtSEi4uqqKRxk+zue9kLbfZ/3X
         hReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3OfbjdZ7JhnmWB3SFJinxtG8xu+EcVyQidKsmmu69Ws=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=PvASQr+kHvkZ7Pkcy6AmE0FiY8kJ7pnhx6aB11eMu0h/9XulwMtYbVFWvOEpjkdYh+
         hXH/+qvTu0U5qTbQHaw2EbCQLEUALVU/cY8Wb0NqcGDEVGjnir5XLYmhC3+OlHebS1wA
         qPbCJXnGGUk7v9Hl7UrL7xl55u7hKaQu8YF4SzSAHiR0bx8x0Ts6oRvzkh96NQfUWwdK
         Mq28nx+ai9CwPxeZLGT0oS13s//cxAaeDbyPcIf13FZvqTq6VhKBEM1kmpijusOVZDYB
         dsj4jj61/V2rUNILlQMlztpyhZd7Hg0mKLI18IircGUFFldq+0UGWEreTM3udtGXTtnx
         LoQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789925151; x=1790529951; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OfbjdZ7JhnmWB3SFJinxtG8xu+EcVyQidKsmmu69Ws=;
        b=k3mFDHeLqG5fO/uRaXGYh8NkyAbLZWQobkC7TWaSrpY4sefE37Bqza9tzVrCakDm4u
         COZz8tsW9ZWT1Zw0In8QcNi8iQXN9k/YWRqvuvQUc2XR9WEvbrYRBF49H9753z5FeCUD
         GgxckdD+l3G7BghP6g1OLn4A+K/ChXyA8Vp+orv3gliHTSZR2zm/B0cWdRv737GoMUrD
         jQd2/8CtXIMJgCL1HnTxxkb2COjcUtPQn5tbFP8u8ouItXPoLPKmG2WhYx+o+SEwj4WE
         ibXja4VcNzDXW9nZshm4n9KsWrmShfj6H4pTIyme3W+ImS8nr6l4bpttMXRKtAH2+lG8
         NcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789925151; x=1790529951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OfbjdZ7JhnmWB3SFJinxtG8xu+EcVyQidKsmmu69Ws=;
        b=CpGLpFVotdwjT3LfO6UKmexLjMx/PF3m/NGQ2UC6CDzhXdmsLfpjvlLgvbSYpY27Hf
         7ifgEPfBz70jQNdtNppRSZCi5TKRQoFODJTxri1Mw4+fVnSzYf3qceUFzONKoOUdCOZp
         Tqbi7WRj/azV/Pxn1b6IFyo7t2oIhuXUQIRtycRU9RN/DHToVNtstksGTfbbpJAZVM+v
         p3gsJtYmrWGijDBBJqkZUBAxmqtKTMw6JdG0ezkg0ASDrSHjsZPfVQVRiNIMnug7PoSS
         e7cXM7fV/WCOwMQfX+0J/lbnUTY+AmOjA9tL2HxVY9LGZaviAMeMqDnbUQf2nweLIGSp
         DdhA==
X-Gm-Message-State: AFuF++kslfDhkTU68o3fJUqMjhGQiZ3Q7qVVE5DuCOnMKbOKWlQhtkdI
	3z9ysXTpemnb3pnnV5O+OeqwYRVn17o8dGDtPSSGOSErhbLJhk3riUrpVjXzF0wUWpk6Lv9s2aK
	TXxrnZ+tS5OnhoEGcrSmIQMPGKXxKoHeblA==
X-Gm-Gg: AYBFou2IfyDdxeL2gDpQ3xucc6XqdVgqefp1xmAJnUjpQpHvL4bSOVGJDDv4Q2KBTo2
	KjZKC34wKw6q3Mi8QT2W1GWDFMnC2CciqZJBOjfK2poPXYGtbSvuNpRiqY3J+xVoCXsWk8bDAlA
	yFkuuj08BXfZnyeNPbX4gWEjv0FgUStQjQlRZJSSqedoLi8QOV1ykk8QbrEWe0RonayYw0kx9Rx
	No7pm89THHnkdDvReSS16jpXKHPLTFUn9EV2tb/xOikpESvD+RGIqxtrIBvEJjVqlJMxXy6VdeH
	0jC2CD6F22TbRQf3Nwf/9BgLQmpFTbGLhh9gNWEcybarHLOb93yVqk7jIDdz/iOzEiDaM0APQV9
	ym0aIjGdOfNyqwRfvVFKFlVXwyGkyCi4Krw==
X-Received: by 2002:a05:690e:bc9:b0:66e:45c8:fc92 with SMTP id
 956f58d0204a3-6717fcac9f3mr2366498d50.23.1789925151025; Sun, 20 Sep 2026
 10:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-dd-cmap-part2-clean-v10-0-af4cf4767707@gmail.com>
 <20260916-dd-cmap-part2-clean-v10-24-af4cf4767707@gmail.com> <20260916162426.BF6241F000FF@smtp.kernel.org>
In-Reply-To: <20260916162426.BF6241F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Sun, 20 Sep 2026 11:25:24 -0600
X-Gm-Features: AcwNN1U4PdC2-ak_eLI6nDpyzmI74MRgcM2U5SRdaLHhoM3APxQAdxw6Wk6ZIJ0
Message-ID: <CAJfuBxxGEYMZxChjRzG02tPM-WtVnjWM5mMCcfaJN9yX1vNTUA@mail.gmail.com>
Subject: Re: [PATCH v10 24/38] selftests/dyndbg: Enable FT_classmap_inheritance
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:24=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests: dyndbg: load-time parameters truncated due to shell=
 quoting bug
> --
>
> commit f2f3cad7addd566a67a218932463053f35d4d782
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
> > index 09a8dbf239dcf..51338ebc74bf8 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> [ ... ]
> > @@ -298,6 +299,78 @@ function FT_basic_queries {
> >      ddcmd "file $f =3D_" "$f"
> >  }
> >
> > +function FT_classmap_inheritance {
> > +    v_echo "${GREEN}# TEST_MOD_SUBMOD ${NC}"
> > +
> > +    ifrmmod test_dynamic_debug_submod
> > +    ifrmmod test_dynamic_debug
> > +
> > +    # modprobe with plain-old +p & 3 class enablements
> > +    my_modprobe test_dynamic_debug \
> > +     "dyndbg=3D+p;class D2_CORE +pf;class D2_KMS +pt;class D2_ATOMIC +=
pm"
>
> [Severity: Medium]
> Are these load-time parameters truncated during module load due to how th=
e
> shell handles quotes?
>

yes, Ive seen it locally.
it is the reason for comma-terminator patch later in series.
next rev adds 2nd level of quoting here,
then switches to comma-terminator once that patch is added.


> When bash evaluates and strips the double quotes before executing modprob=
e,
> modprobe constructs the kernel options string without adding quotes aroun=
d
> the parameters. The kernel's parse_args() function (using next_arg() in
> lib/cmdline.c) splits module parameters at unquoted spaces.
>
> This means it treats D2_CORE and +pf as separate unknown parameters. The
> dyndbg parsing logic executes +p but fails on the truncated class command=
,
> completely ignoring the actual class configurations.
>
> Does this defeat the test's intent to verify load-time classmap inheritan=
ce,
> allowing it to pass only because the golden hash recorded the incorrectly
> applied +p state?
>
> It appears this space-splitting flaw persists through the end of the patc=
h
> series, and the newly added FT_test_classes also replicates it.
>
> > +    verify_control_slice '\[test_dynamic_debug\]'
> > +
> > +    set_param 5 /sys/module/test_dynamic_debug/parameters/p_level_num
> > +    verify_control_slice '\[test_dynamic_debug\]'
> > +
> > +    my_modprobe test_dynamic_debug_submod
> > +    verify_control_slice 'test_dynamic_debug_submod'
> > +
> > +    # fresh start, to clear all above flags (test-fn limits)
> > +    ifrmmod test_dynamic_debug_submod
> > +    ifrmmod test_dynamic_debug
> > +
> > +    # load submod, which loads supermod
> > +    my_modprobe test_dynamic_debug_submod \
> > +     "dyndbg=3D+p;class D2_CORE +pfs;class D2_KMS +pts;class D2_ATOMIC=
 +pmf"
>
> [Severity: Medium]
> Does this submod load suffer from the same space-splitting issue?
>
> > +    verify_control_slice 'test_dynamic_debug'
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-dd-cmap-=
part2-clean-v10-0-af4cf4767707@gmail.com?part=3D24
