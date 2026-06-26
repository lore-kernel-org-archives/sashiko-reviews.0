Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DCD20E023
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782434921; cv=pass; b=IJsl6tgdNWZpz7cycQg1dnxO2Yy/diuGre2d7qjGuuMAOeI0GRjj7W8hbvDeQiVeoAive3SEqd3fUOSj2Z7mitDRuL6cG3Tn3LBf+eVGTw/wZFT7HMWYFvbiFxeI2x0hHP1Jy3so0DVLW8utSPsJAR1ZfL+hB28nNEd6q/F1Nrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782434921; c=relaxed/simple;
	bh=yXAvvuEZOGffk+WYRf60Aeg2AVFN7LYmasurNyGDKxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cvzpqaodswk9FfQ2AFIW8iNAFnRDURW7LI/6daI/WibUwYaZXHWcOrIQ64f5gXnwuxqysqo7qPSleKEa5Q4V8Fua5SJdxw06Ox0hWOcHJRACqmvnXi98aQ3HOvps5ZtZv/UtXZJSCrATLNRBf6Wwz99pIIGCXZcpa/nWzrJrzKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDg7wzko; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDg7wzko"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso169601a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 17:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782434919; cv=none;
        d=google.com; s=arc-20260327;
        b=L3QbjAKNXPLdGy+cPE/uhKKfPBflSdwPt835qmqwP9a4Juqkw8lCN1O5Kmld7e7bOJ
         SOVzXiVNxzhXfRQvVd3idY1mxb5Mu1cCQIBGJvoPGhThHSpbJ0z/3ehsxnkppdx5boMH
         k8NBLUcpuxrFJ73gK0MrmPnU0SI3Eqhyi6pIZ2ZW4Hcl+j0R+e+I4FMw1NWMPuCA/MHU
         8vPVBxrmot617hwxwU+rH398G7QZHAIod92FgOOVstzbG8t1kwPp/+0S3Xk+O9wHoxUZ
         N46Hzlh2sMbsvhv9afq7IPDCXHzq+ZROSFsFSPOztb14CJHlb7mjALgkx/bQ/Ms8wFQP
         t99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6xq5VzG65VCEADs41H1uwnAG6kWl4tzWEHNj4tAmMM=;
        fh=jZ53Cy+vb1IbrYwR8ptyjnEQ/EXUyfYLGGy0uBFeh+s=;
        b=T/Ufy+NoaoePkdshp+9qi/4kOReX5PuU2PB9ry1V6Dd0/d8Ch2LnW83RzEZCE7W2N6
         5uwWqgVHuoJwELcTBZALa8zlo6y4i8kzLj5iKo2kfg/f43Y/MBnuRkZD5XkCtasaxznQ
         I02HvMXvurYhf0t43OnTe72bWVU1swGUIBQS6m8GseuD35zZE1cOlNRQKjf5/7nwS54D
         UW1Aacak5ze95wS4XINQ46DtyufpbvISiT35AMoRlTC4XDwoJzxjR8ElNUrWHw3rki48
         XzzFVoCgvgxwb8w6g7j5AWT0g5j1QI0Efu4HYtrqy9Vuu3TYcp/ClX2zjld+aocygr5c
         ejrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782434919; x=1783039719; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6xq5VzG65VCEADs41H1uwnAG6kWl4tzWEHNj4tAmMM=;
        b=TDg7wzkoP90dtkBOFs4P9DAFdfoXBTS4VOAvmuF7J/zfhEkRs2cB/kBOg/W4iE+ZXD
         RIlZDoqSSPmcU28TVAMEYhRJf94HoxvbvW9fbcH/SgVqBYpHQYpfOShncQP6Zt98zw0s
         IduqA3xPa3mGmb4c3y6uzpDYeOFZZG3m0XnS50GuEdee1rWzVfxj+jraEEmx7cQfbWmU
         lYcYCWsfkbEmWFkSqeBEgGV1if0zYnC3RsNkLPXtuhT1p9kmLr28VrI8utP9palIzS+H
         BNad9Da06I7hzPd4VUWTaRvTQhKi1z3WjRDKLzjgSeIz+c8w89sKHHASF0nbqKQvAsc+
         w/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782434919; x=1783039719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6xq5VzG65VCEADs41H1uwnAG6kWl4tzWEHNj4tAmMM=;
        b=VHpWqAj/6kuw41pvX36e/MUgf5XyoYWJ9f31bOF/eWXGLrzcqhST+zFx+zmxTiTvc8
         29TjA8D6cmMJ3hQviVt+xEhuJ95MrAt301RJtK+pp/oeZCL2NHO8DLh4rCA3j0OxZyfM
         DzyNMDq1635X8fSOtgDjJi9qxxegMtsACenZ6lLuMBUI0HClD95pb5iW2dHnwmdW9USK
         EhWGmrhg+uKX7zmlrCyuXKKqZnXZN4+c2hvQwuNuxeu2VsSjY9Aio884REB6KqEyfw7B
         93QJ1hfQRG324VRlMe0XgLXHkMzhtgul/F6DZSW/GCiCNOpHJJQ48K+TvrVSUpN5cujU
         vAqA==
X-Gm-Message-State: AOJu0YyxbEQrbbHSMyy9vrPMbxfI7g8jRtgWYBdgjIf42p/QemoqZYoi
	zEbIBK6byCkxZlJ/C86nlMB6QMjMvzFOE3fYjlXcnhFSHfRdDzwkihOqxFzAEmlioQrpnS/5oZf
	36EGO2OgVBbvem/+/c0lRYYQHg2RF9Ck=
X-Gm-Gg: AfdE7clYgX+Fp72kT8nr5WR9Ck5T7yXAmPcCTicY2WvhEv8YRrmSGuDvrLR7zwZdMAI
	VWoBj9jQ+K/hF5eGPYDkUHRo9xCkd1X6EBZZhrzqDFYyYA1tJ4h9taPyiHMmsvhP06cS1myYy3Z
	lnrC9nQZOAKbmHMYm+S+nBoRTFM22nZ/KFAj+TBuCAnd1ev8wbt2OFc+78T8Ti+MTJoN6JSgFb9
	t54DtpbOqO4EegwNCX59jYGkT/ciVBDloUujGo0WLb9zeHZRSxUq0pIoNfsBbYHgqqJu+BQNtlp
	WcqgqBXWZ9IlSGLfUu8YH1opGPFNtHlMx/+iTmuInxr8WmfPDuhikPePbPIDCDJLU5NbB2l2Siw
	76jFYfk0PsTBWzhX42e/gkyM=
X-Received: by 2002:a05:6a21:338a:b0:3b4:87c0:d7f with SMTP id
 adf61e73a8af0-3bd4af2d2bbmr5935549637.32.1782434919049; Thu, 25 Jun 2026
 17:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623014027.402820-1-sun.jian.kdev@gmail.com>
 <20260623015325.2F2D31F000E9@smtp.kernel.org> <CABFUUZFH=qx7e7mT=GSepdk_XUGhPtJEzuFf-qjUUMLRaEv0kQ@mail.gmail.com>
In-Reply-To: <CABFUUZFH=qx7e7mT=GSepdk_XUGhPtJEzuFf-qjUUMLRaEv0kQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 25 Jun 2026 17:48:27 -0700
X-Gm-Features: AVVi8CdrMggxg9K8_Wp0nhKye4DvDA4aL09na_EX3GyosjcqJ1jMva3U1mf7J0w
Message-ID: <CAADnVQKCk9vfi6Lc-RZj6KEpf6Yxm50=V5DWfTqfeYrSsGXDaA@mail.gmail.com>
Subject: Re: [PATCH bpf v4] selftests/bpf: Cover partial copy of non-linear
 test_run output
To: sun jian <sun.jian.kdev@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 7:06=E2=80=AFPM sun jian <sun.jian.kdev@gmail.com> =
wrote:
>
> On Tue, Jun 23, 2026 at 9:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] The newly added selftests `test_skb_nonlinear_data_out_partial=
` and `test_xdp_nonlinear_data_out_partial` will unconditionally fail due t=
o an unaddressed arithmetic bug in the kernel's `bpf_test_finish` function,=
 breaking the selftest suite.
> > --
> >
> > commit 99284be8e441ba5ead251137597e96ebcee998f4
> > Author: Sun Jian <sun.jian.kdev@gmail.com>
> >
> > selftests/bpf: Cover partial copy of non-linear test_run output
> >
> > This commit adds selftests to cover the partial copy of non-linear test=
_run
> > output for both TC and XDP programs. It uses a 9000-byte packet with a =
64-byte
> > linear data area and a 100-byte output buffer.
> >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b=
/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > > index 01f1d1b6715a6..beb6fa78fd949 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> >
> > [ ... ]
> >
> > > @@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run_c=
nt)
> > >             "incorrect number of repetitions, want %llu have %llu\n",=
 run_cnt, info.run_cnt);
> > >  }
> > >
> > > +static void init_pkt(__u8 *pkt, size_t len)
> > > +{
> > > +     size_t i;
> > > +
> > > +     for (i =3D 0; i < len; i++)
> > > +             pkt[i] =3D i & 0xff;
> > > +}
> > > +
> > > +static void test_skb_nonlinear_data_out_partial(struct test_pkt_acce=
ss *skel)
> > > +{
> > > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > > +     __u8 out[SHORT_OUT_LEN] =3D {};
> > > +     struct __sk_buff skb =3D {};
> > > +     int prog_fd, err;
> > > +
> > > +     init_pkt(pkt, sizeof(pkt));
> > > +
> > > +     skb.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> > > +
> > > +     topts.data_in =3D pkt;
> > > +     topts.data_size_in =3D sizeof(pkt);
> > > +     topts.data_out =3D out;
> > > +     topts.data_size_out =3D sizeof(out);
> > > +     topts.ctx_in =3D &skb;
> > > +     topts.ctx_size_in =3D sizeof(skb);
> > > +
> > > +     prog_fd =3D bpf_program__fd(skel->progs.tc_pass_prog);
> > > +     err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> > > +
> > > +     ASSERT_EQ(err, -ENOSPC, "skb_partial_err");
> > > +     ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_partial_size")=
;
> > > +     ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_partial_data");
> >
> > [Severity: High]
> > Will these assertions fail unconditionally due to an existing arithmeti=
c
> > bug in the kernel?
> >
> > In net/bpf/test_run.c:bpf_test_finish(), the length is calculated as:
> >
> >     int len =3D sinfo ? copy_size - frag_size : copy_size;
> >
> >     if (len < 0) {
> >         err =3D -ENOSPC;
> >         goto out;
> >     }
> >
>
> This looks like a false positive based on the old bpf_test_finish()
> implementation.
>
> The fix patch has already been applied to bpf/master as:
>
> b5f3534268e3 ("bpf: Fix partial copy of non-linear test_run output")
>
> That commit removes the old copy_size - frag_size calculation and compute=
s
> the linear copy length from the packet layout instead:
>
> head_len =3D size - frag_size
> len =3D min(copy_size, head_len)
>
> This v4 only resends the remaining selftest patch on top of current
> bpf/master, where the fix is already present.
>
> I also verified the tests on current bpf/master:
>
> ./test_progs -t prog_run_opts -v
> ./test_progs -t skb_load_bytes -v
> ./test_progs -t xdp_pull_data -v
>
> All passed.

Thank you for testing, but I don't think we need a selftest
for every condition in the kernel.

pw-bot: cr
