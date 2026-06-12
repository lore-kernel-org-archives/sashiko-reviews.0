Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92BE345757
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781290529; cv=pass; b=VCOyGr1Cb9c51S4JW17Dq3gB91VcqF42idbLIHvQQzbWDwmvW1wVGPC+L1SpFTeNRn7djbKuAOJlR82m+hchD4l6WU28BvwfOawoO5Gx8o/oomctJVpJNH+p4Y+iws3iXmLWizOvtsv1qSVuOHKp13wfjIfyKwRJ/OZi2KF3kSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781290529; c=relaxed/simple;
	bh=YEBunFSHRGDNumLMfC5wR4SHihWDvjTENa69vkBW9iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw+P0+NURfFSvqq9z9b3UdwFp4l296UzxNyc9KD0iHW/6HAtiPf8xkc6pvRIiA9QZKCPLVMi+s5sdVs3lICycjWSNYHn235eD2GMaVdUMKViDIIHNYylcRNa8nGF72H3PlJzAjjq9wTlz9yBvY4wYJRQImMIoUorf4GfbejDJ3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HcDjIZAk; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HcDjIZAk"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137dd523634so1932227c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 11:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781290527; cv=none;
        d=google.com; s=arc-20240605;
        b=MRGTxQfWJ2AnZ5DihhvYvWqQFDpBgZIzFBc2mTjoJOWr/q3VcB4kJ2gW/qhR1lbD2T
         6aTMRXeGoU2AR8pZ0sib8zuy+HWDYwk0hwzoikCWX1YqlFcf5sRkqNyyHjIiwonqCmbl
         +T+E+kvUiIMvNXsxO+vyx/tHU4pxKRDP0iRe/4QQutu9NWXc4JkZy6UGP8SUnHQ0whQ+
         vLw6FVAVRrr8zJEUomfWMMYcwWAz/oUHHwvNNVaWB/hqylFxT+RQHAo8u3pYsp9EaHb3
         e1T/+/c3PxncTtudSIH2qtdq+1OykSSu2uqMUaJkrqpZzGVVpJkRuHgZHTAliQj/CqDl
         fq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+VG0vtUWvBGovF7rROnctTtU6VOb+iUw0EGb9SMXyc8=;
        fh=qwAHEygO6oiegpp/vuoASCfYTsg0pySGtNZvVTFXlfo=;
        b=BHdSPWV71P20ayv9Vzx34I3TfEt/QKVLcJsP8jD/7pjZM3v8nX/LUarENSr7qXC6e/
         VL9sdbSuZvRpJ6Q1/O7plsvO/3H33UUO6GUpM5rFt0taeldptd+1aC2J5fcmw+qyZzp0
         zx/sutAACb8VpOZdEAc9yV052drsLbaumnVSqvrI071/4E6Yujfz+p3Xo59hy3sMg2Z3
         ZQ750GASq8gUMYIQKLhJvoKxIGDchVMkQ3OQZ8Grqjx25GxPLNEuhz3Tjx0XPdyKS3cY
         5yCgTff7Y5EE0waRT4iPr0Dbpy9z1gLo0Q8TgmqYjSu+p6vhzZ5nKDjemKOfZNrLDbRw
         eaeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781290527; x=1781895327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VG0vtUWvBGovF7rROnctTtU6VOb+iUw0EGb9SMXyc8=;
        b=HcDjIZAkxUf0xX5SE5UbEFAGpy92ge17O2kcgkMJ9vjlo7r8Zwya+XO2vphuSX9PHr
         CGGZcwo/V79D/NQH4hVN8yFWal4pzzt1oQk8tzBc/I7n573QRSkJaU4AWsoARaFFn+1/
         uMk8qFeG/To7OgndbBqbf+oGAqwODeGY5KFz75FaS/61A0O6PGc47S/3y/u40LQ5djSH
         y2byBXaJ4s8Yt9UQdGNlFAuGH7IuaNbDnDp9bcSM9+kRLUmzjApxFnSxx+zyWWw5FrpF
         hBipOwEvQgpA07lYjOE0Y12UQMB9CekBnBeii5jFVsOp77EN63W4B+GFrxSOOgWkkuSP
         NT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290527; x=1781895327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+VG0vtUWvBGovF7rROnctTtU6VOb+iUw0EGb9SMXyc8=;
        b=m7gkMjf7V9wmY7ijEkrGvPb0BDD7yitMQzh8X2s/J9uxMH5moTsXGCL1NTxUD+TUR0
         5A+nwF/jnGsyhkR3qESgXeeulMXNPdPRn5bJQz1RybrkX8oZuNbgKSKELsUemtSHQZy/
         cJGJJhMKrliSrMJlkHal/rPkuzgnhekrwA+oxQ2266Y/WXob2C1ePX+9IXrnZj5wWxde
         +hFCIff8gZ2BwNR3IX1WSGT0S6XZ9ZNkSAxMRPyM5ZkKwjZUS66ZY69uXVeDAMDuHKcS
         eYeHvfrQ5JKwi/w0/WYqkZ+sstpKUGm0DRp8DB3ZskWw34KEghhA/cVKeQsJlfnou9xi
         30bA==
X-Gm-Message-State: AOJu0YyPfbSV/va3d3iByqoEx7jnADAZqCPvMzUuRDDWpVNOy9B0WwAU
	5+IGcmkfhDlBOVHVbWcfOqiWRIy4CttBQSnjWP27E/Qhu9xBqapqtMqPzSjIbxvj/VdH1LYV5U+
	tjIS21yS0WcmWkjcRMoPYr7bTTVoOL170Sik4uRNiHiJ4MzqhZ559B2hl+LI=
X-Gm-Gg: Acq92OHcCCpEPlM2fjhHDbQvouRBpEamx2rGY6xCv6o9OYrjrr6hcEcawvB3KR07vQp
	XlJ2ufFXpK2NjPbbgNTZNnipW9/a7jxszSFwx+hrCRNhDZg/P8URXo90iDv3pdKjEhQpNHKb5Rz
	R91d/8rq/lbByU1TeQ1Ufdv9pBW7sbFTFtD+JRRvVfvHM4+jIYERDr73OgjEmNOHlfkSTx6ExIx
	6fEU7MQ3v/kNxJtjxdPsf0/x/bxakrCHJ1D60kMeOODKkFlgrwldgWwOLItSA0nfDyVlwHZxhO3
	2xFW76B75DHc/WaESiexnR1KltAgkjxTSJjDnpRNR8Tj/gyh4ZSLpms+OQFes1pRF4csJ/y5va9
	x1RsxZKd8QWNExaIexE0H1vicmQ+rmsRxOYp1omPAHHCdHykitCwK
X-Received: by 2002:a05:7022:629:b0:137:f875:c1e8 with SMTP id
 a92af1059eb24-1384bb6939amr1718651c88.19.1781290526219; Fri, 12 Jun 2026
 11:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612001803.23341-6-kuniyu@google.com> <20260612003138.E67A01F00A3A@smtp.kernel.org>
 <CAAVpQUCRU1ie22PbegWgGnfyWw9V0wSTjgQpw=5Wwb2RZ=su+w@mail.gmail.com> <DJ775MFSG561.2SI6FNLLV8NG5@gmail.com>
In-Reply-To: <DJ775MFSG561.2SI6FNLLV8NG5@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 12 Jun 2026 11:55:14 -0700
X-Gm-Features: AVVi8CfGFiXpNBZTAVmql2XQgWnU7gXYvHBtNP2-sFXgWrH5--YEOApHj6Xd1Kk
Message-ID: <CAAVpQUAWh__B6C05kt4ph30KD+CDPjh3_kD-DaBEOo4WavaERw@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next/net 5/5] selftest: bpf: Add test for hwtstamp proxy.
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 9:04=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu Jun 11, 2026 at 11:03 PM PDT, Kuniyuki Iwashima wrote:
> > On Thu, Jun 11, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 5 potential i=
ssue(s) to consider:
> >> - [High] Comparing a potentially negative return value to `sizeof()` c=
auses failure handling to be skipped, erroneously dropping packets.
> >> - [Medium] Incorrect struct cast for SO_TIMESTAMPING_NEW cmsg data cau=
ses test failures on 32-bit systems.
> >> - [Medium] Typo in the test assertion prevents verification of TX time=
stamp keys.
> >> - [Low] Multi-line comments violate the BPF subsystem comment style.
> >> - [Low] The `buf_cmsg` array is not fully initialized before being pas=
sed to `sendmsg()`, passing uninitialized stack data to the kernel.
> >> --
> >>
> >> commit e747f30190af013f6f5cc858f0dacb86e902e2d2
> >> Author: Kuniyuki Iwashima <kuniyu@google.com>
> >>
> >> selftest: bpf: Add test for hwtstamp proxy.
> >>
> >> This selftest simulates the hardware timestamp proxy scenario using tw=
o
> >> UDP sockets, simulating a userspace proxy via a GENEVE device.
> >>
> >> > diff --git a/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c=
 b/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c
> >> > new file mode 100644
> >> > index 0000000000000..d0f90f22bea22
> >> > --- /dev/null
> >> > +++ b/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c
> >> [ ... ]
> >> > +char *ipv4_commands[] =3D {
> >> > +     "ip link set dev lo up",
> >> > +     "ip link add geneve0 type geneve local " APP_SRC_IPV4 " extern=
al",
> >> > +     "ip addr add " APP_SRC_IPV4 "/24 dev geneve0",
> >> > +     "ip link set dev geneve0 address aa:bb:cc:dd:ee:ff",
> >> > +     "ip link set dev geneve0 up",
> >> > +     "ip route add " APP_DST_IPV4 "/32 dev geneve0",
> >> > +     /* We do not forward ARP to the wire in this test,
> >> > +      * so a static neighbour entry is needed for APP_DST_IPV4.
> >> > +      */
> >>
> >> [Severity: Low]
> >> Does this multi-line comment format violate the BPF subsystem comment =
style?
> >> It seems the subsystem guidelines prefer the opening /* on its own lin=
e for
> >> multi-line comments.
> >
> > Gray zone, this is rather net one :)
>
> bot is correct on this one :) BPF prefers normal kernel coding style.

Fair, will follow that ;)

Thanks !
