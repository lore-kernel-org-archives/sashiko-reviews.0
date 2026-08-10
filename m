Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F18220F2A
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332908; cv=pass; b=CVMCHs6d7x4oxO1wmcCoLJbSyFxcOCUP/DNYxJA+aZMkiJsPoXrYxVYlHEZOIaUe7AWU73jbuaTfmeTxWewr6+KbZ7NHAxOT0IP2cV5KQ4/1rppMiQZdro/fj5wUL4Ft/6akzHRhMnRhOA90plq8A3clr/uGbSXF7M7N7O+W+4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332908; c=relaxed/simple;
	bh=nrDHJ3Gk92dRSWD11QS7hoO4J7V89rsy52yiVCPdPMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLq80n1hAngpXxwMzIvjQuT5VFVypmQV4A8DcUvLIH/+PYbHcoEl4MJEljqMhoUczB4zx386cC++3S3l+nVDstwWxBwBZ+E9UjvroDOMqvjdrD6sjHGVCuN2UUfEkjFsYjf8+aydhxHRniY1dgeIpEAzxtJG1ltoJMM0Ih6UEuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0dKYpnp; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0dKYpnp"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8228ed0081fso19137237b3.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 20:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786332906; cv=none;
        d=google.com; s=arc-20260327;
        b=PAlcP4GW5EwhvShIOVPIwwgXZXj+tjtrrxt7fEmOP90C5Pyi/McibctSCPPUM3u+v8
         sJwfq23/RSoKs939FscQB/jakgdObmBC15/kA/E8bHnO/wVsx+TTqwpmfgg+dnyrGpDl
         S4+r7n+dLKz7LMY5SjSVfs8M8eJEcDdR+CevsuDxYkAJ7DxQoVQbv8bzLyN9Coc8qnmY
         cl9/7VrOFRZ3sWTUOcawFplu2CJBO/2ZRgTOvxo8glAUZQHS8qj0ktwZ6OEFpov9uZnd
         yoFxWNfiyR7Tbfj7lbT/rFJ+E+LAuSZrTKreNGf2rJgA6uFZtEjX1WAsCEj5YyIo5V/C
         2J5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7ZreFox0bzGLpZmjmw+ippLqhhG3N3kXDUNYf9WX9c=;
        fh=Jo3A2y3ojUuTm4QcBLkoso37fi8foyy4Damprw7uHtA=;
        b=Ufh7meb4NtzHro4pfvsm85Wcd60JMdk1/g5Z4kFxWHqQ1QfVKDeZB3NJ7mOLsSDvvG
         dZ528pjazlwEPjVW5IszY9P3ge5Y3oZwZt9ZchKIro8+AYwRqUqU5IsL2ES0kYlTMABl
         5jRuE83TrdegtigL7XdZY4YlpHDr5YBp9IPM8dxG1KUNMYCOpMCHZ6UCBKVIEW0J7pJW
         QYISIKOxTNv/wOUquQU47sny6ORIl0i1XyJqur0qpbD2Bd0Kes+S5D5SzFKjUMPELQ7y
         d3HS/63cB/NnzH2c7vHxHxl2X3NG/nj4RM54Vkm5Udw9tDehSdZ/FcJ63keqA1OFyMBf
         HWUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786332906; x=1786937706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/7ZreFox0bzGLpZmjmw+ippLqhhG3N3kXDUNYf9WX9c=;
        b=r0dKYpnpR4+4hsxHe4SPoTd84SVS6jK4vXMsuFum0bywuJ5l3KqzkluM+96734Mb1m
         YRVtREhLmAqE/IQH9GhXNU9sNgbztFNh8El7kHdGr19V07nN/W7ybHlsZBY2ouACSTIG
         6pc0rh5oG9xyEf8pSwX3yQOWgxQkP9++sVBn9BUaWEZsYt9DHNBo7uQNvopw+qHe9mCP
         8WxrRxajwUqZiZha41W/Kw9A4uA6kff7qYrlR2THOUkMRYfMay8Iuao9Hhkke6jD9IZL
         ozQYqhJLJ+xyvkdE1rqGPv0GNEwCbvaqRHaHP4gWoLRuWJmRQb97s08/uFi9HnRvFW/F
         +X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786332906; x=1786937706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7ZreFox0bzGLpZmjmw+ippLqhhG3N3kXDUNYf9WX9c=;
        b=bQ4IW22K6emi0wDrenIxz6T+sKzzjTJUEfd/M0YIdR2FfCW5q2GI4icuv14OJKrdNA
         GNGcqrw8GOnxsVSmRiuIFZBw1VuESb9wxW/3UG7p14wLU3ZdMQFmIIN2abhPf1Z7DPew
         5V4JI/PYKekHS7ji9ns9FauL00rqQzYvaz/9hN1OMwy5diS4Ze7NT5Up7UPY739s+1Y8
         neGbBjLzqucvXT5Rw46hew3zh0wdv9AHtaSxzdtWzp4VV8r3BM5rqj+Ox7pvUptvQPyA
         3ZOuzianRfmEoNBTLCXhCVzCMs3EOSeAynoB5DY/+XG48E4go7QmC5lGr0C1Nai1xP8p
         hBrg==
X-Gm-Message-State: AOJu0Yx+QUzMP4nW304pettIWtjvSpSkkL4Dp3WyKZxhY7S7jFT3i8uo
	zz2eqYzQzI3CE+SjcmJ70vhi588A1fSg1PwyBO1EodUdm61CXoLge5B2ta1RH0JzVVpPjrlKJaK
	sAy335MF3PMmmr16DXxSJ5ca52pa+iInn+YLD7wg=
X-Gm-Gg: AR+sD11BgmszGMAboJjTmanhJeD41LCRRDcXczIyaZiR0TQLJcoZ+6IeB1RaAC8nmH9
	qqpy3b8muGjYSO7Q8HNRe4GugbKUiuzPpoKpbCZREgw3qKBeVnOPCaZAcjbaW/ALZEu9pyxRSbO
	tSeT7UdCIla+aw3mSqKT6IcARa5Jz3S/PI3gTPKo3kkxjbMroWUqg71pUYRGcleO/KhUHtnIA0S
	DACGQsIQ35K54yFQa4yNijfsc0jaRUEkFYB2J2FvsI/sNWxyud2+Y+3zXu7Cx/iDNaDsKnbreiQ
	DAhXtNkEqUPd9fm4pKJVNVjCJAlQhnUJPzJHmWvWiOaL4EGP4RO0C3zk6nv1QbAPtiusrMzZres
	5
X-Received: by 2002:a05:690c:b01:b0:804:a2d5:1e04 with SMTP id
 00721157ae682-82574af4157mr110216907b3.16.1786332906395; Sun, 09 Aug 2026
 20:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-8-laoar.shao@gmail.com>
 <20260809093147.9D9081F000E9@smtp.kernel.org>
In-Reply-To: <20260809093147.9D9081F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 10 Aug 2026 11:34:28 +0800
X-Gm-Features: AUfX_mz4L-Y04JrtYY7v3tt6DGnwuRY3dzPpYvi3YncrY_c9gKj1_aIBlj4eKCg
Message-ID: <CALOAHbDzY-hWPMd1KkSG2MyqieTQrPOoQNT=YY73ka90Cwa2+A@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] selftests: livepatch: Add provides/obsoletes test scenarios
To: sashiko-reviews@lists.linux.dev
Cc: mbenes@suse.cz, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	pmladek@suse.com, song@kernel.org, jikos@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Race condition in test-provides-obsoletes.sh leading to flaky =
test failures.
> --
>
> --- Patch [7]: [PATCH v5 7/9] selftests: livepatch: Add provides/obsolete=
s test scenarios ---
> commit b45263c641deb4b2b48bbe22a1f0bf862b20a22f
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> selftests: livepatch: Add provides/obsoletes test scenarios
>
> This commit adds test scenarios for the new provides/obsoletes mechanism =
in
> livepatching. It introduces test-provides-obsoletes.sh to verify replacem=
ent,
> coexistence, and obsolete features.
>
> > diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.=
sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> > new file mode 100755
> > index 0000000000000..c740d463f556d
> > --- /dev/null
> > +++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> [ ... ]
> > +start_test "provides 0 replaces provides 0"
> > +
> > +load_lp $MOD_LIVEPATCH provides=3D0
> > +load_lp $MOD_ATOMIC provides=3D0
> > +
> > +mods=3D($SYSFS_KLP_DIR/*)
> > +nmods=3D${#mods[@]}
> > +if [[ "$nmods" -ne 1 ]]; then
> > +     die "Expecting one module listed, found $nmods"
> > +fi
>
> [Severity: Medium]
> Could this directory check race with the asynchronous sysfs cleanup of th=
e
> replaced patch?
>
> When load_lp returns, it polls until the new patch's sysfs transition fil=
e
> reads '0'. However, in the kernel, klp_try_complete_transition() clears
> klp_transition_patch before scheduling the asynchronous work to free repl=
aced
> patches (klp_free_replaced_patches_async).
>
> If the test checks the directory count immediately, couldn't it sporadica=
lly
> see the old patch before the async cleanup completes, causing the test to
> flake with "Expecting one module listed, found 2"?
>
> This same pattern appears in the "same provides replaces" and "obsoletes
> replaces" test cases later in this script.

Makes sense.
I will update it in the next version.

--=20
Regards
Yafang
