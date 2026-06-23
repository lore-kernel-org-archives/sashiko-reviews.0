Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5B13C9C4
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782180240; cv=pass; b=jXon7pSFEzH9IBNFTIOpd5jCqLmR+ufOSl0r3Ckm0zDZlKaYKSnoZRS5MDLiPgnYjYId+hpQQHZOlD/Z6GBvjP7v5Uk7O1xj1eRD/3JWlGufwAEzhLGI4nCyzInqygqw6QY3jJ0YfBMgjnq7+v8P6wbzShuHvgDC+l8EifF72Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782180240; c=relaxed/simple;
	bh=yfz/p2GvdAEBen0CxmAM1laTTtAt4iZdMa8fFT8fzAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKL8VYkO3I7xfdOT8OUmZvEtgfIy4xLnc/wBl17ObzpjyDG6sv46/P9XFcON/TqOZ174NsBPb2k5UQd5d1YGq3sM0TJozN7/H2qKifIANOVsYofQyCoA/MAXM3BvdLFMSwqlJqHCQoBWJADcbQeYO0G4zHIQc5Oeo/HULsqzQfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1+MVnk1; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1+MVnk1"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-662b95934dcso5314768d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 19:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782180238; cv=none;
        d=google.com; s=arc-20240605;
        b=c4caFP1lsyp8hFF5OMhcjaGp6Immcw/dkx+2CD85g8zQ/+YC5yWhIam/s8n5f0PJTF
         2CtPkthSTbIxjBv83GzYAbfWFAGjWg5DSsdl4EETvUgAyOre9YldlujPZ+MJOavHh2QE
         TWpDXUTKzbxs+EqRAl7N1PA4TVqiNuGCIo252oe/dae+MQrUR9j7C30lE84/w7c2w7yJ
         1YMfJ3moa4vXsFCfE+1FC+72iH8bG6LeuRPYQ/pWV9MNiI286iFnMC7SOhH7W1xIjxCj
         T+bRtIAkup8+UCFVH/gTkk633CcNz/o9FmWKlCbuycB3erj8Hq9g3xjso5Vq9izU3e9O
         2mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mt39b+CDA1UqkI46nSmJGTg6k30239R4rmDIdfyhkmg=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=jKr4sdyadBr+yNZcdViWSkSOsHmeI4JdBHgkWv3EgrxTiq+Xbp6Hi1MmiES5P56oBn
         uLZBXNeRM69NdYyoPMl3FCG1C2vkwwmCV8k+W6NAYOiPjxDOXlXmWUSMIP2TDiXP0Ran
         zy6yvBMM1MSg2PM3NgHR9+YwBHRSMShl9BlL1qQ0Ye4pXy885bsR7lQdAQtBU88pQpq8
         xDeC6ETkKOtLdvfiMlmgb0xGpdAHPXI7hqZfxPXc1A7tB6TlGMAVC9A48TUVETNYIshR
         zY19zq7epnHzpgbUJIblk6CH8zwqpVYfDpdPzPupBk3iy4R21dGdaXPzpcOttzzbQm1N
         OxLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782180238; x=1782785038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt39b+CDA1UqkI46nSmJGTg6k30239R4rmDIdfyhkmg=;
        b=p1+MVnk18LWlq6wl+Q6GS6l8jyU6JFxvjFuBbiQNOafW2M7LfS3Umgfv/JMbTG3h7e
         oS+WvUtlpM/26+f7672djPPL9H8KddoxATWT0LfcOAF5UNuqUMAI9eqrop9ilPXxk1LE
         T5RzNXRf00gzXk6Vb3q2mBVkkT2PwYIKtcKor9p0QUZs4RekuHXtAELluYqb1f063x8u
         ZKkL1apurD/hCgmidu0jmsvvdiBTuEZs3CmAe/Fbv8t3Arkztgqk2CI08ER/M1Xvb1a/
         vst2+xxdNPBroRZcSBNkI38P1xWcuS3Shx+4rsBPfhIK/Mp2sG6YRqljY1V7AFJJaqct
         OVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782180238; x=1782785038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mt39b+CDA1UqkI46nSmJGTg6k30239R4rmDIdfyhkmg=;
        b=jN0xfceeXyyEXyZPGATgZHr5AOqq1iUQP2ARV9fz+xtFRHO3QV8Rfis+YyXU+adMcI
         KOcp8zQa8mP9MVNGvL1QEGpnUYk60iSqD0ck+/V5kMRAHFPXzbJD6U77t1H7zWpbdj0a
         OoLytJrPE5jQxQKxjqhcQBTzOPsM231OvtMUKpA5PRKSZx2Ll/Gg3Abkd/ug7AP1zDPU
         OXP5h8k9eMWGVd7gHv7PXEZX+hvjKk343OWSMLa+tZyHGozZiATMQuh8ke1pAyO8cQdl
         zW35zHfzjqTVjpV3cbUWAyJdRe1PWzd2mA5931kykrvsuRPJ7zoSPE8f2abHe9k/ImZk
         5lSg==
X-Gm-Message-State: AOJu0Yx2p9E7XEZ5fc5dOttAf8VpoPY67G7Rp+Zwj6U/l+O92NHbT9Mu
	j27CkyAIs8O4D3lpStsf0UoKJwrLoK+TJjgm87XK44tKFGJRq1M62KZBvsKvRqx61WMrxiPCK2g
	VEQlfKHPaZ3iU9mWiV+AVZ+7wpY/0Hk0tyzrvsvevTg==
X-Gm-Gg: AfdE7ckBHdXWkGkiHi6+PbR5Tv/KzQ0ZD9hvuGTkLkkS4r10acMuSyhoeuuFGyE7ERF
	hUvpFqvZpi/v8aPCeH7cjaliagNtHJepajNhajz21Opbis5PaFGnALigeY9dwIZZiAmWCaut8cF
	agwVRx5dyQcg8FWTKyWKRGeeVcWBPC3S3jpL3FdDOoSvMaz6h8pkeDoLbQVnpOqTEY9bpbc3CMi
	0LDBgoCcNTF+B37gcvQDPOSZzizQ8udn4H/V6jgCxbhw/k4Vm2xEg9lh6na8k4cebuSWzmKN0lB
	cxci+zRMLwuKVDp9HgatH1qtD/e3us9s9guT+hFt+Os3u7GeHGU=
X-Received: by 2002:a05:690e:14cf:b0:65e:3df3:1c30 with SMTP id
 956f58d0204a3-66359e1c2bdmr866674d50.7.1782180238233; Mon, 22 Jun 2026
 19:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623014027.402820-1-sun.jian.kdev@gmail.com> <20260623015325.2F2D31F000E9@smtp.kernel.org>
In-Reply-To: <20260623015325.2F2D31F000E9@smtp.kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 23 Jun 2026 10:03:48 +0800
X-Gm-Features: AVVi8CcrcdC8SK0ck24XjoJflK84MKqPtrnYp0MVTlRgZUmrjwG6UcuRpikinWE
Message-ID: <CABFUUZFH=qx7e7mT=GSepdk_XUGhPtJEzuFf-qjUUMLRaEv0kQ@mail.gmail.com>
Subject: Re: [PATCH bpf v4] selftests/bpf: Cover partial copy of non-linear
 test_run output
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 9:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The newly added selftests `test_skb_nonlinear_data_out_partial` =
and `test_xdp_nonlinear_data_out_partial` will unconditionally fail due to =
an unaddressed arithmetic bug in the kernel's `bpf_test_finish` function, b=
reaking the selftest suite.
> --
>
> commit 99284be8e441ba5ead251137597e96ebcee998f4
> Author: Sun Jian <sun.jian.kdev@gmail.com>
>
> selftests/bpf: Cover partial copy of non-linear test_run output
>
> This commit adds selftests to cover the partial copy of non-linear test_r=
un
> output for both TC and XDP programs. It uses a 9000-byte packet with a 64=
-byte
> linear data area and a 100-byte output buffer.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/t=
ools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > index 01f1d1b6715a6..beb6fa78fd949 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
>
> [ ... ]
>
> > @@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run_cnt=
)
> >             "incorrect number of repetitions, want %llu have %llu\n", r=
un_cnt, info.run_cnt);
> >  }
> >
> > +static void init_pkt(__u8 *pkt, size_t len)
> > +{
> > +     size_t i;
> > +
> > +     for (i =3D 0; i < len; i++)
> > +             pkt[i] =3D i & 0xff;
> > +}
> > +
> > +static void test_skb_nonlinear_data_out_partial(struct test_pkt_access=
 *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > +     __u8 out[SHORT_OUT_LEN] =3D {};
> > +     struct __sk_buff skb =3D {};
> > +     int prog_fd, err;
> > +
> > +     init_pkt(pkt, sizeof(pkt));
> > +
> > +     skb.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> > +
> > +     topts.data_in =3D pkt;
> > +     topts.data_size_in =3D sizeof(pkt);
> > +     topts.data_out =3D out;
> > +     topts.data_size_out =3D sizeof(out);
> > +     topts.ctx_in =3D &skb;
> > +     topts.ctx_size_in =3D sizeof(skb);
> > +
> > +     prog_fd =3D bpf_program__fd(skel->progs.tc_pass_prog);
> > +     err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> > +
> > +     ASSERT_EQ(err, -ENOSPC, "skb_partial_err");
> > +     ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_partial_size");
> > +     ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_partial_data");
>
> [Severity: High]
> Will these assertions fail unconditionally due to an existing arithmetic
> bug in the kernel?
>
> In net/bpf/test_run.c:bpf_test_finish(), the length is calculated as:
>
>     int len =3D sinfo ? copy_size - frag_size : copy_size;
>
>     if (len < 0) {
>         err =3D -ENOSPC;
>         goto out;
>     }
>

This looks like a false positive based on the old bpf_test_finish()
implementation.

The fix patch has already been applied to bpf/master as:

b5f3534268e3 ("bpf: Fix partial copy of non-linear test_run output")

That commit removes the old copy_size - frag_size calculation and computes
the linear copy length from the packet layout instead:

head_len =3D size - frag_size
len =3D min(copy_size, head_len)

This v4 only resends the remaining selftest patch on top of current
bpf/master, where the fix is already present.

I also verified the tests on current bpf/master:

./test_progs -t prog_run_opts -v
./test_progs -t skb_load_bytes -v
./test_progs -t xdp_pull_data -v

All passed.

Thanks,
Sun Jian

> Since the packet length is 9000 bytes with a 64 byte linear area, frag_si=
ze
> is 8936. When copy_size is 100, this yields a negative length of -8836.
>
> This triggers an early error exit, completely bypassing both the partial
> data copy to the userspace out buffer and the update of data_size_out.
>
> > +}
>
> [ ... ]
>
> > +static void test_xdp_nonlinear_data_out_partial(struct test_pkt_access=
 *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > +     __u8 out[SHORT_OUT_LEN] =3D {};
> > +     struct xdp_md ctx =3D {};
> > +     int prog_fd, err;
> > +
> > +     init_pkt(pkt, sizeof(pkt));
> > +
> > +     ctx.data =3D 0;
> > +     ctx.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> > +
> > +     topts.data_in =3D pkt;
> > +     topts.data_size_in =3D sizeof(pkt);
> > +     topts.data_out =3D out;
> > +     topts.data_size_out =3D sizeof(out);
> > +     topts.ctx_in =3D &ctx;
> > +     topts.ctx_size_in =3D sizeof(ctx);
> > +
> > +     prog_fd =3D bpf_program__fd(skel->progs.xdp_frags_pass_prog);
> > +     err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> > +
> > +     ASSERT_EQ(err, -ENOSPC, "xdp_partial_err");
> > +     ASSERT_EQ(topts.data_size_out, sizeof(pkt), "xdp_partial_size");
> > +     ASSERT_OK(memcmp(out, pkt, sizeof(out)), "xdp_partial_data");
>
> [Severity: High]
> Will this XDP test also unconditionally fail for the same reason?
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623014027.40=
2820-1-sun.jian.kdev@gmail.com?part=3D1
