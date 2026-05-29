Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8A39023B
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076525; cv=pass; b=XP3dKMKkV1Uuei9E4pSdJPbBnQ8ypK+Zi96ZmstfzWfyvMm3VidxGEG7FB1AwXGry/1h9rP47U8D+CVti6akLnNaFiCpdQTeplyfWjokVdLWQhIEdtGNMMa55xwoG7hwLVwbUbbeKG869IMs4raUs5vZF/Ve54wWiMnUjtdBwps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076525; c=relaxed/simple;
	bh=BJeonEZdoXwxXmmMK/D3NNQiRAFWb0eigy/nlt5BihE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRudPRz/KDCudPs0xgxZPXn/U+gvgAaog6mkdT1856PjCyC4KEqGMKJcqs39dc+xj5KBcgSoYQhsDNnNvjFtARJOXb8rB+JoWL6UandeNMDlvgHN2WseLjCvcymypn01S1tyok9a6yG249IQoG0kiwSZKmPMp8Go0gsjC662MrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fM1/o+1O; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fM1/o+1O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1275ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780076523; cv=none;
        d=google.com; s=arc-20240605;
        b=QMTPM6w9wRj+Bvz64cklgZANE/N0TZfbu+Kc3+PrvuZxoXSnve1nrivRrUK6b0Rap2
         rddbQNZMOjH8EaQkNCtT82UKDBkxXXdGGIYxg9j/+28Ea1w9ZC4fyQnRzju3zwzhJkiC
         dHS80wFr5LiqgP+wlB7aa18y2Q7wMdSGoX9k8Igjflm80AQZXPT6tdwq6D6Rf6/PyBcK
         ojNUIkHYS81t658WzX/lUDBKrASm5iSoXhe7xV8eM+/wum8MmBXkXrPGLMHEh5bv8btY
         yfGWxjGmfU6x6ymzhnSTwVAYH4YgzAE8kjqoBYVI0CXe4yJ3qI0UdI6VmQBbdsqzOHJT
         Jdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YX4oF6pCObKTl0kBgsQiOjoOSc/kNJefAsPyHQO56tQ=;
        fh=6K1Zilol94e47/JGg4U6QaVXTQrpxPQTuLBo9pfKiHc=;
        b=IW7PUIxSEJkzhyAfMc0VWVTO0huR5PhfXF1rJNvu2otTSldmwRW/1kOHZ1H6qFkXNC
         7nc0NhGkn1Q883ASQoOEaHsy8puU35w7rXsoP4l1226hE5RfJGjKHqGWcdkDXZF3XrNp
         VjDUvQ3xlNuuafZzIW9pJlj4GednAC0/qD/2pr2Z9BnbKl4CZt446daJK8DVEYq+3Nwt
         whV7J0N1sjHS+uQDbezP/iehyxqWEa/jn9m2KKVsWRHjMGIZLZtfkPT5V2NQ9Svi3TrL
         0NHoBSaAW4aoOiCx49o6CZ+oxd4X2gxLjzichuSZEE4comkiI+jo9c7fymrixkXwBQjy
         SFxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780076523; x=1780681323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX4oF6pCObKTl0kBgsQiOjoOSc/kNJefAsPyHQO56tQ=;
        b=fM1/o+1OH8F0xcmzgNn8cvXvEK5TTc83vOtPDBx62LIx+jvQv1ixekuzotUUvzRd1i
         uPelXvfQF/glBHMmpzyykcMsw8QajyvKZzn1ImS2DRNAVqEfuTKTUf16/f0q/mkqiq2M
         T8Cfl3So26ISloU9bVhreiOGMXSVqGxo76c8hO+6Pi3xbh1xJBuT888JtuF9FDsVsTi0
         /1DPvKltk00VTuWiqEPtT2VvGgxFIq1F8NMYbb/jRiqCqSPl9MQFrxjdKvxTGzxIv9/b
         8472qzp1rMLHwZVT3xFsF5tV5wG2Und5n5UIPDe1iWI1CLhm24wyRdv9FYstFBXK1n9d
         dyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076523; x=1780681323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YX4oF6pCObKTl0kBgsQiOjoOSc/kNJefAsPyHQO56tQ=;
        b=AMDAgi10Lgg7wYHYXHZ4cO0pucn471VYpX/ZYKxilM3d26eQOhqxSMWYJEv6ZlutoT
         HTrpqmOoiTKe0g0Un/9PRBSdPZifD/vcVvgbWhM0Dw3Pjs8QNfvBry1Mnlf3swOS7Fmw
         Ca+97OrQFC7qBlUuKztAu73NSsTwnoSPKZLl0Hxm6+SDPTk/QgfpwyoB3a2CzAlxJGXw
         B40Xe9C9CTSoE01MLMHJAzdZ6MDLSNRucdvEySlwdYn/F5tYlcDe98CQJbRGgDdpCuSH
         GOtrfkzpayL99ct2N2rNhHwpwW2VF4CohJZK8PUusnPInV1fmdAXvJI3k/2pX8gUdkaY
         oWkw==
X-Gm-Message-State: AOJu0YxKiD+4/boZi7HGW6fbOvnL9G16BPF5/Nj9MjB/p8vQp4zH6LT1
	G5G6da6MGwA6xJn9yRk0HA9W8Ga5StUCFz/1BKkge05PnNSxMA959Vsvkujjc4mh6jZ6vXAfGOD
	H7KTfUZ1gmXxcJMEHIftjc8wXgFguE5iT3KT2meReM1ddJfFJeWpeTxrnOgUjng==
X-Gm-Gg: Acq92OG86y77QqR8kFNWpSdEstDuOSvuUnQbT79X1lw2nBarGhXLm5Smh4xon4Rq9GF
	rJkUNA7bmm5ygyGt4fJmy5D6bjbp7a3fJjW5Ufue9ezexFoQ1nHp4zWzcMLLwEkKz+xuMgOwaQu
	xmB6CeDxxQxXC9148R8kH1ZRrk+oLiTkoZHAYp8RI+ooEbI2+MQihgjmmmIz0qHr7Hy2okSjUvH
	86YzMyToBnwEWgZ/r+czOWY6RSpwZQwrK1kD1+G2w2q2Z+zyHHfDmVWQzMRg4J+x1vgnL6LH5TL
	qOYER/+Ny7M4kyIcFnBMEVVTuU0z1/9iXkOV2KEqgfmfJ3dZ
X-Received: by 2002:a17:902:ce91:b0:2bf:1000:d3ac with SMTP id
 d9443c01a7336-2bfa9eeb1b6mr146515ad.11.1780076521979; Fri, 29 May 2026
 10:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529082451.591783-4-dapeng1.mi@linux.intel.com> <20260529104532.CE9D11F00893@smtp.kernel.org>
In-Reply-To: <20260529104532.CE9D11F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 29 May 2026 10:41:50 -0700
X-Gm-Features: AVHnY4KId2WIOWc59UNbxLiWYFjUfTHpQJ1A2Zgn0kOfsiHu3-A63PsEB_1ZH3I
Message-ID: <CAP-5=fV0wY_B22Zma06JjWaMSWnChwFwk28c1uMfEGBBWA5-Xg@mail.gmail.com>
Subject: Re: [Patch v8 3/5] perf regs: Support x86 SIMD registers sampling
To: sashiko-reviews@lists.linux.dev
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 3:51=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Parsing of `--intr-regs` and `--user-regs` with multiple optio=
ns is order-dependent, preventing intended combination of General Purpose (=
GP) and SIMD registers.
> - [Medium] Specifying only SIMD registers (e.g., `--intr-regs=3Dxmm` with=
out GP registers) leaves the general-purpose register mask as 0, causing th=
e kernel to reject the event configuration with `-EINVAL`.
> - [Low] The `sample_simd_regs_enabled` field is omitted from `perf_event_=
attr__fprintf()`.
> --
>
> commit 03a81994cf381ee1d67a41deb452833fc73a023e
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf regs: Support x86 SIMD registers sampling
>
> This patch adds support for the newly introduced SIMD register sampling
> format by adding functions to support parsing and sampling x86 SIMD/PRED
> registers.
>
> > diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> > index 1c856a2ecc6ec..cd62af14a4f54 100644
> > --- a/tools/perf/util/evsel.c
> > +++ b/tools/perf/util/evsel.c
>
> [ ... ]
>
> > @@ -1594,6 +1595,16 @@ void evsel__config(struct evsel *evsel, const st=
ruct record_opts *opts,
> >               evsel__set_sample_bit(evsel, REGS_INTR);
> >       }
> >
> > +     if ((opts->sample_intr_vec_regs || opts->sample_intr_pred_regs) &=
&
> > +         !evsel->no_aux_samples && !evsel__is_dummy_event(evsel)) {
> > +             attr->sample_simd_regs_enabled =3D !!opts->sample_simd_re=
gs_enabled;
> > +             attr->sample_simd_vec_reg_intr =3D opts->sample_intr_vec_=
regs;
> > +             attr->sample_simd_vec_reg_qwords =3D opts->sample_vec_reg=
_qwords;
> > +             attr->sample_simd_pred_reg_intr =3D opts->sample_intr_pre=
d_regs;
> > +             attr->sample_simd_pred_reg_qwords =3D opts->sample_pred_r=
eg_qwords;
> > +             evsel__set_sample_bit(evsel, REGS_INTR);
> > +     }
>
> [Severity: Medium]
> Will specifying only SIMD registers (e.g., perf record --intr-regs=3Dxmm)
> leave the general-purpose register mask as 0?
>
> If opts->sample_intr_regs is 0, attr->sample_regs_intr remains 0. However=
,
> setting the REGS_INTR bit here causes the kernel validation function
> (perf_reg_validate()) to unconditionally return -EINVAL because the sampl=
e
> type bit is set but the corresponding GP register mask is 0.

It is an interesting corner case, we could extend this test to cover it:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/shell/record.sh?h=3Dperf-tools-next#n106

> > diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/par=
se-regs-options.c
> > index 70a1cc90b2c13..26d560a486c85 100644
> > --- a/tools/perf/util/parse-regs-options.c
> > +++ b/tools/perf/util/parse-regs-options.c
>
> [ ... ]
>
> > @@ -53,22 +106,96 @@ name_to_perf_reg_mask(const char *to_match, uint64=
_t mask, int abi)
>
> [ ... ]
>
> >       /*
> > -      * cannot set it twice
> > +      * Non-SIMD registers cannot be set twice.
> > +      * SIMD registers can be set multiple times, but only the registe=
r
> > +      * class with largest length (qwords) is sampled.
> >        */
> >       if (*mode)
> >               return -1;
>
> [Severity: Medium]
> Does the order of options affect whether they are parsed successfully?
>
> If SIMD registers are parsed first (e.g., -I xmm), *mode is left as 0,
> which allows a subsequent GP register option like -I ax to be parsed
> successfully.
>
> However, if GP registers are parsed first (e.g., -I ax), *mode is set to
> a non-zero value, which triggers this failure check when -I xmm is
> evaluated. Does this prevent intended combinations of GP and SIMD registe=
rs
> from working consistently?

It's probably worth adding coverage for this too. In this case having
a C unit test may make most sense.

> > diff --git a/tools/perf/util/perf_event_attr_fprintf.c b/tools/perf/uti=
l/perf_event_attr_fprintf.c
> > index 741c3d657a8b6..c6b8e53e06fd1 100644
> > --- a/tools/perf/util/perf_event_attr_fprintf.c
> > +++ b/tools/perf/util/perf_event_attr_fprintf.c
> > @@ -362,6 +362,12 @@ int perf_event_attr__fprintf(FILE *fp, struct perf=
_event_attr *attr,
> >       PRINT_ATTRf(aux_start_paused, p_unsigned);
> >       PRINT_ATTRf(aux_pause, p_unsigned);
> >       PRINT_ATTRf(aux_resume, p_unsigned);
> > +     PRINT_ATTRf(sample_simd_pred_reg_qwords, p_unsigned);
> > +     PRINT_ATTRf(sample_simd_pred_reg_intr, p_hex);
> > +     PRINT_ATTRf(sample_simd_pred_reg_user, p_hex);
> > +     PRINT_ATTRf(sample_simd_vec_reg_qwords, p_unsigned);
> > +     PRINT_ATTRf(sample_simd_vec_reg_intr, p_hex);
> > +     PRINT_ATTRf(sample_simd_vec_reg_user, p_hex);
> >
> >       return ret;
> >  }
>
> [Severity: Low]
> Does this also need to print the sample_simd_regs_enabled field?
>
> This patch adds several new SIMD-related fields to struct perf_event_attr=
,
> but sample_simd_regs_enabled is missing here. Could this prevent develope=
rs
> from verifying whether the tool correctly enabled SIMD sampling when insp=
ecting
> configurations via debug commands like perf record -vvv?

It looks like this uncovers some technical debt. I don't see config3
or config4 being printed either :-( Could you help to address, if not
remind me :-)

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529082451.59=
1783-1-dapeng1.mi@linux.intel.com?part=3D3
>
