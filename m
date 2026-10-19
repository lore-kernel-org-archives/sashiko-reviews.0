Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303014F649B
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.148.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420098; cv=pass; b=YcAv8aKRy253vImsA0+vHra0hSq8OhiZ7Cb6RxPx2IYclVeyrFw7DZKajgUJqcrNegHJl0TOn9wEsWfIXD05a2eAF86HZSrRLb06Hw3ctjr6vcKNNkRqRivADBBiYDgEJLN+BraEFcC4+sqhg6DY1UNcntKcNq8/Syplh8r7/NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420098; c=relaxed/simple;
	bh=vRKtHhtnSiVocMKcHj2IeE7eoWduJufuBbjw8LUmvyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0lcXRzok8gB9uA7kRFDKNBiK/ngm3srfFzEMaG3bKNFUt2xuU48xscIB4OChY4tE3AslQ4oq9TMCf/fdtZlBdldECTylOtqX0jv+GcCvBSJJEkM82Dn3dgw74CS6KyY6mklAiJxhStJzda1X7yj24ONy/2AKEjVJwzyNJ8qVb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=dozKaF1m; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=IOgf5Q04; arc=pass smtp.client-ip=148.163.148.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="dozKaF1m";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="IOgf5Q04"
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JD8uMu3567309
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 13:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=W2Q5NbkXZFX2IYeB+rITdmJ46kQ40IR/VqtH2S5mst8=; b=dozK
	aF1m//QlqQfhqKEeZH7yccyiI3Zvo2avADGqUzkwKY4/b3qe0U2mMUsMnOgx3t9C
	w8/ahz50BQ20ArJo1kgmpCd4uRJ0qggtT0JMKsGptpIVzqYFp/U+iU5miAvY7zQ9
	fmbFCpCFANtC52fcr0zygGl1FFerSnMCqCQOQJykN38xQVkzRs+MqaXoA8bw0IR8
	DEDJGSGM8I95PEBAWrxYOdvt11dbnYpOO1/xl8C3GNyGT53cun7a4GPBeDGVUdH/
	VJjFFX8RryP4bKDpfZA0WJF4x7V+Ot6NkgIvAKB/8gXSRbPEphCmHFZe6MEH9Y9d
	RgDRrDGDHdZucZlcSA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hcpu1bjd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 13:59:16 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f81e0f96so38034d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 06:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792418356; cv=none;
        d=google.com; s=arc-20260327;
        b=fgS10wrsTdmN19RuBABAG0thuGZQoqcOyIm2pVR2oVvPWc/UG7y8QVxycQNZzargmZ
         BaQWzSiqNJrqnc/EU+dFdhV4KFl/7G7EPnuNBJYifRHTwoOvyMGOE5eBBHl9oyTw7Az7
         4HXAHI1qAHGl1u7FomXx0pyok+2JhPJTU4RZK1SNqyoDyqShmVkDOcFLp9lz0vURc9o+
         GhMOO6uM921LHIM8UiamXANBVGogDoYQ52uN7XKZDewkvcRYesWjv6M6MrL5Y4dqf5ad
         iCZHBaHAujWLLtR9SKCL1YxN6rr+JnANRMOBk4c++SV87Qbq8dCpI3sntiZfJtQfMxif
         ZDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2Q5NbkXZFX2IYeB+rITdmJ46kQ40IR/VqtH2S5mst8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=LnLwcMAqEaBm5g1XqBAaeml7ZZv6ju8AWWLOOEuGY7ml64vgnhvkr9WVohs/+AFz6e
         eGg6GVtBgzsB+ecLwwF0KdEIhFVaUFizZLPIB2qzvxJ1MwBIDYD6Q5qA1J9bb9SaWQuu
         PpQbxvUM33jm7OQAnkDE3eRUYbvkdhmoxjfnHhTwCZKi737o/VfpVR+5QnjrZk84iBL0
         mMWSR2OAIk7n43zkcSmreoAz+pL03ypicN51W5+WYcleMG8hTzodNt0HLDz8fPT3uxpd
         eQEGrGaARznWeaiNgO4uI9X3zx/9eutyRqaZw5FdPeQrNMFk3YLukmMK7Zurnz+nZa+j
         ITug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1792418356; x=1793023156; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2Q5NbkXZFX2IYeB+rITdmJ46kQ40IR/VqtH2S5mst8=;
        b=IOgf5Q04HTbfGN57oNtzSAI5uLy0ebxql8tWfAtqdDwTv0vfyX6WsEJ2BDqRSbAoM1
         /WkfheZAT6HL7TJ+f4alANkOGgcnRBOgUA24EQ1LRhvUGnMLlKE3QqpjNO4QQhOtNTOv
         1tkJ1ACor30ctlX3wl+O02S11An9ykhPAgUiMG8OEcnit2uYpSCWLr/VmNSV+YuEGyap
         wxK3RQYSo0wTr+Ps91nIcER6O1s8JDik958J3/vZ8ectuhfpNVpInGB3DlKaCzbcmuu2
         Et0YesE3xou27I7biStP8zAxnKB8KPS9LGCQXN/21lunJUmn9DqbypeEaYjRJwAxnSxq
         4H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418356; x=1793023156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2Q5NbkXZFX2IYeB+rITdmJ46kQ40IR/VqtH2S5mst8=;
        b=rbq4U+wm3uLyGm+Gofwo7A3gu0jB83QugxT+OlhnnPNZM0x4uQxdZYcMrLrX12odAL
         5jkazuAwvV1aqrsIGd0lDfJ8iJ4S64ELAevwlCUibmAhxgar7U8GlRVSyDOG2DzpVzGj
         g45oGKDjnLJiskiVywmC69S9CiBCZCvK04wJ7wW0y+2x4HOOmb6mZg/sy9TMxMk10aQy
         zL45bLhZEGkIKHk+CeUGc2j77NNc5cY72VN58M9aH8HlaWr+cS2T174MtD0E4ii9jf6F
         mhIXVZNjSVFLGby56F86gXn1iEm4r9J4ghWMTWkpwsG5x9VxXjzGaHnX0RG054F0qgg/
         5dbQ==
X-Gm-Message-State: AFq9FYJ3GYNaAddhYu1H1WpeTBohkH7IoOZvNjAEADTrsXu/acCaKrli
	GnGSfmafh4/B2Kum8IlP1KPwGjxQcau4uxCYswDeLLR4w0aneoixojMSA/y6cvPty8IPD7kxpp0
	lXUHt9ctY9L4n1R5FBzguUdG5RXxLhZMNKIG/Rbeoj8lpyhNlyHnuO7aPbDNWYmSwVoouusMkQ5
	7978AvKURtM1ihRsKtmu/re/8HfqicWSKbK7OGpVb+0l0aEvjWt3n9
X-Gm-Gg: AYBFou09PEuOD4B67aF0LH6aTE+mSE37R0qPIl5JEzggaR1kxOaNjv6zeizVeUb6bwR
	4q6kJqutP4jmdq+2aoRZxXEGML4NNI+uEuVtwJBzGB1KHLKGJebZK/8PDgApHO48fApp+reqd4D
	NrMPsj93YCcYbYxxnGG+1Qj5MUKZ7VXMhVbfuPw4q6GFGI4SRpJ8X7EJD+
X-Received: by 2002:a05:690e:1512:b0:679:15d0:9492 with SMTP id 956f58d0204a3-679ca8d61famr1806934d50.93.1792418355995;
        Mon, 19 Oct 2026 06:59:15 -0700 (PDT)
X-Received: by 2002:a05:690e:1512:b0:679:15d0:9492 with SMTP id
 956f58d0204a3-679ca8d61famr1806925d50.93.1792418355387; Mon, 19 Oct 2026
 06:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com>
 <20261010143156.379864-8-andrey.grodzovsky@crowdstrike.com> <sashiko-outbox-166685@kernel.org>
In-Reply-To: <sashiko-outbox-166685@kernel.org>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Mon, 19 Oct 2026 09:59:02 -0400
X-Gm-Features: AclHuK8-chbj1rVBMLedg9wJZt3mjYJm9zJvcXutim4nnDp5VmLVfhBvB6zqLxU
Message-ID: <CAOu3gNj7fYONFo2-UqcBVv5Uk2=d4Cw=0fvQvLPCwiDA6zc3Wg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 7/7] selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MANUAL
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XrNvqlF9 c=1 sm=1 tr=0 ts=6ad62234 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=2KvRFfd_T_-xjmS8C1aD:22 a=c92rfblmAAAA:8 a=pl6vuDidAAAA:8 a=VwQbUJbxAAAA:8
 a=BiacRjDT1vw9CRUp734A:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: PFTwENvFj_ZWBqgWzNJZyZFqq8Myzzun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX2hhQ0DYsDw5F
 +GXT4//rCOH9xSi6Ccm9E8yCJf0e5WKl3ga5unPLGdrXhjBx667ZsBlmvXz442KNBez58L4jz0O
 jZwXCbOYo0jQb15TlQR8Wl1oZftN0Ya1k7fRq3QUUE+oicFyjGj9thyOe64EoSj1+KGFpXYsenm
 gMCNKJuumFs7IAJtqopDf0X8VOo9HU2393eae0Y4cKgxfbdyWs2rzZc+Tm7rG7nlX9N2souGhcz
 OddGB8zzt2J++B1s79Ps+TnGbQCfRS8uIalN6gbkJO2syHGMs5z3H1M/F8Db3spihqtJQJ9oZxb
 cqjzMCbAvGGKJ0ZoCm/U+hqixRDbGUG2VIClX6mbybuLrWyE+JZKxGZAENZ+N22BO/h9IjgqMx9
 MaxbtfDGSih/FI7OeM2t1DIaSQJ1vEYISj1gr/Xma5I5vFgnhsKEmRmBEFuVsRkB2uuU4R2Ag8o
 dUaT4Z3hzVMU1xunUog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfXwndqRXIalvDe
 pxCJ1wdxz8SPh4/82xWVr9HC0o4tNjiG5yc5GDrJk8pFoo6qE2IMsH5mk20pJiHaJCMhJ1D3vqX
 ZsZHRTXn65Gr7gBJT2pmc60jD4SI39lvAA7qMi8NGQUMYAeyZ4CT
X-Proofpoint-ORIG-GUID: PFTwENvFj_ZWBqgWzNJZyZFqq8Myzzun
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11940
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190055

On Sat, Oct 10, 2026 at 11:08=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] bpf: veristat uninitialized memory read of log buffer on early=
 load failure
> - [Low] bpf: veristat skips cleanup and info retrieval when BPF program f=
d is 0
> --
>
> commit 9ac34aec88e7eee9b39c53e8055bc5989345ce5b
> Author: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
> Subject: selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MANUAL
>
> This commit updates the veristat utility to verify programs using
> BPF_PROG_LOAD_STRATEGY_MANUAL alongside bpf_program__load() and
> bpf_program__unload(). It replaces the previous use of bpf_program__clone=
(),
> ensuring RODATA maps are properly bound during verification and subsequen=
tly
> dropped upon unload.
>
> > diff --git a/tools/testing/selftests/bpf/veristat.c b/tools/testing/sel=
ftests/bpf/veristat.c
> > index 9cfc9b4b41c12..0cd19b59037f6 100644
> > --- a/tools/testing/selftests/bpf/veristat.c
> > +++ b/tools/testing/selftests/bpf/veristat.c
> [ ... ]
> > @@ -1726,18 +1725,15 @@ static int process_prog(const char *filename, s=
truct bpf_object *obj, struct bpf
> >       if (env.force_reg_invariants)
> >               bpf_program__add_flags(prog, BPF_F_TEST_REG_INVARIANTS);
> >
> > -     opts.log_buf =3D buf;
> > -     opts.log_size =3D buf_sz;
> > -     opts.log_level =3D log_level;
> > +     bpf_program__set_log_buf(prog, buf, buf_sz);
> > +     bpf_program__set_log_level(prog, log_level);
> >
> >       cgroup_err =3D reset_stat_cgroup();
> >       mem_peak_a =3D cgroup_memory_peak();
> > -     fd =3D bpf_program__clone(prog, &opts);
> > -     if (fd < 0) {
> > -             err =3D fd;
> > -             if (env.verbose)
> > -                     fprintf(stderr, "Failed to load program %s %d\n",=
 prog_name, err);
> > -     }
> > +     err =3D bpf_program__load(prog);
>
> [Severity: Medium]
> If bpf_program__load() returns an early error (e.g. from libbpf without
> calling the kernel), could the dynamically allocated buf remain
> uninitialized?
>
> When env.verbose or env.top_src_lines > 0 is set, buf is allocated
> via malloc() but the fallback initialization only null-terminates the
> static array:
>
>         if (env.verbose || env.top_src_lines > 0) {
>                 buf =3D malloc(buf_sz);
>         ...
>         verif_log_buf[0] =3D '\0';
>
> If bpf_program__load() returns early without modifying the buffer,
> parse_verif_log(buf, ...) will read this uninitialized memory. Could
> buf[0] =3D '\0' be set directly on buf before loading?
>

While this is a true observation, it seems to me this exact scenario
would also happen in the `clone` case, so it looks like a pre-existing
issue.

> > +     fd =3D err =3D=3D 0 ? bpf_program__fd(prog) : -1;
>
> [Severity: Low]
> If standard input is closed, can bpf_program__load() assign file descript=
or
> 0 to the loaded program?
>
> If fd 0 is assigned, later checks will explicitly skip handling it:
>
>         if (fd > 0 && bpf_prog_get_info_by_fd(fd, &info, &info_len) =3D=
=3D 0)
>
> This causes the program's JIT statistics to be skipped. Should this check
> test for fd >=3D 0 instead of fd > 0?

Same as above , I thiink the issue was pre-existing.

>
> > +     if (err && env.verbose)
> > +             fprintf(stderr, "Failed to load program %s %d\n", prog_na=
me, err);
> >       mem_peak_b =3D cgroup_memory_peak();
> >       if (!cgroup_err && mem_peak_a >=3D 0 && mem_peak_b >=3D 0)
> >               mem_peak =3D mem_peak_b - mem_peak_a;
> [ ... ]
> > @@ -1774,7 +1770,7 @@ static int process_prog(const char *filename, str=
uct bpf_object *obj, struct bpf
> >       if (verif_log_buf !=3D buf)
> >               free(buf);
> >       if (fd > 0)
> > -             close(fd);
> > +             bpf_program__unload(prog);
>
> [Severity: Low]
> Similar to the issue above, if fd is 0, will this prevent the program fro=
m
> being immediately unloaded and leave it in the kernel until the entire
> BPF object is closed?
>
> Should this check also use if (fd >=3D 0) to ensure cleanup occurs?
>
> >       return 0;
> >  }

To summarize, I agree all the 3 issues definitely need to be addressed
and I am happy to fix it. I just don't know if it should be as a part
of this patch-set or a standalone fix?


Andrey

>
> --
> Sashiko AI review =C2=B7 https://urldefense.com/v3/__https://sashiko.dev/=
*/patchset/20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com?part=
=3D7__;Iw!!BmdzS3_lV9HdKG8!3il3wicS8Eiw2ogONUagDMIrsqcvvmLZ1xXNrquJMEVXEJr8=
5kqsNp4CNFasNUc417QJ6t73GShkLS7-x-efgKPJp1HzLOdaJg$
